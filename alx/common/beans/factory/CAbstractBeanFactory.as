package alx.common.beans.factory
{
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import alx.common.util.CClassUtils;
  import alx.common.util.CClassLoader;
  import alx.common.beans.CBeanUtils;
  import alx.common.beans.CProperty;
  import alx.common.beans.factory.IBeanFactory;
  import alx.common.beans.factory.IConfigurableBeanFactory;
  import alx.common.beans.factory.IBeanDefinitionRegistry;
  import alx.common.beans.factory.ISingletonBeanRegistry;
  import alx.common.beans.factory.IBeanDefinition;

  /**
   * Abstract bean factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractBeanFactory
  implements IConfigurableBeanFactory
  {
    /** internal event dispatcher*/
    private var m_eventDispatcher:EventDispatcher;
    /** factory ready status falg*/
    private var m_bReady:Boolean;
    /** parent bean factory*/
    private var m_parentBeanFactory:IBeanFactory;
    /** class loader*/
    private var m_classLoader:CClassLoader;
    /** bean definition registry*/
    private var m_beanDefinitionRegistry:IBeanDefinitionRegistry;
    /** singleton bean registry*/
    private var m_singletonBeanRegistry:ISingletonBeanRegistry;

    /**
     * Creates abstract bean factory.
     * @param parentBeanFactory {@link alx.common.beans.factory.IBeanFactory}
     */
    public function CAbstractBeanFactory( parentBeanFactory:IBeanFactory = null):void
    {
      this.setFactoryReady( true);
      this.m_eventDispatcher = new EventDispatcher();
      this.setParentBeanFactory( parentBeanFactory)
          .setBeanDefinitionRegistry( new CDefaultBeanDefinitionRegistry())
          .setSingletonBeanRegistry( new CDefaultSingletonBeanRegistry())
          .setClassLoader( CClassUtils.getDefaultClassLoader())
          ;
    }

    public function setParentBeanFactory( parentBeanFactory:IBeanFactory):IConfigurableBeanFactory
    {
      this.m_parentBeanFactory = parentBeanFactory;
      return this;
    }
    public function setBeanDefinitionRegistry( beanDefinitionRegistry:IBeanDefinitionRegistry):IConfigurableBeanFactory
    {
      this.m_beanDefinitionRegistry = beanDefinitionRegistry;
      return this;
    }
    public function setSingletonBeanRegistry( singletonBeanRegistry:ISingletonBeanRegistry):IConfigurableBeanFactory
    {
      this.m_singletonBeanRegistry = singletonBeanRegistry;
      return this;
    }
    public function setClassLoader( classLoader:CClassLoader):IConfigurableBeanFactory
    {
      this.m_classLoader = classLoader;
      return this;
    }
    /**
     * Gets class loader.
     * @return {@link alx.common.util.CClassLoader}
     */
    public function getClassLoader():CClassLoader
    {
      return this.m_classLoader;
    }
    /**
     * Gets bean definition registry.
     * @return {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     */
    public function getBeanDefinitionRegistry():IBeanDefinitionRegistry
    {
      return this.m_beanDefinitionRegistry;
    }
    public function getParentBeanFactory():IBeanFactory
    {
      return this.m_parentBeanFactory;
    }
    public function getBeanDefinition( strBeanName:String):IBeanDefinition
    {
      var beanDefinition:IBeanDefinition = this.m_beanDefinitionRegistry.getBeanDefinition( strBeanName);
      if ( !beanDefinition)
      {
        if ( this.getParentBeanFactory())
          beanDefinition = this.getParentBeanFactory().getBeanDefinition( strBeanName);
      }
      return beanDefinition;
    }
    public function containsBean( strBeanName:String):Boolean
    {
      var bIs:Boolean = this.containsLocalBean( strBeanName);
      if ( !bIs)
      if ( this.getParentBeanFactory())
        bIs = this.getParentBeanFactory().containsBean( strBeanName);
      return bIs;
    }
    public function containsLocalBean( strBeanName:String):Boolean
    {
      return this.m_beanDefinitionRegistry.containsBeanDefinition( strBeanName);
    }
    public function isSingleton( strBeanName:String):Boolean
    {
      var beanDefinition:IBeanDefinition = this.getBeanDefinition( strBeanName);
      return beanDefinition.isSingleton();
    }
    public function isPrototype( strBeanName:String):Boolean
    {
      var beanDefinition:IBeanDefinition = this.getBeanDefinition( strBeanName);
      return beanDefinition.isPrototype();
    }
    public function isTypeMatch( strBeanName:String, beanType:Class):Boolean
    {
      return ( this.getBeanType( strBeanName) is beanType);
    }
    public function getBeanType( strBeanName:String):Class
    {
      var beanDefinition:IBeanDefinition = this.getBeanDefinition( strBeanName);
      return this.getClassLoader().loadClass( beanDefinition.getBeanClassName());
    }
    public function getAliases( strBeanName:String):Array
    {
      var arResult:Array = this.m_beanDefinitionRegistry.getAliases( strBeanName);
      if ( this.getParentBeanFactory())
        arResult.concat( this.getParentBeanFactory().getAliases( strBeanName));
      return arResult;
    }
    /**
     * Runs bean initializing methods.
     * @param bean Object
     * @param beanDefinition {@link alx.common.beans.factory.IBeanDefinition}
     */
    protected function beanInitializing( bean:Object, beanDefinition:IBeanDefinition):void
    {
      if ( bean is IInitializingBean)
        ( bean as IInitializingBean).afterPropertiesSet();
      if ( beanDefinition.getInitMethodName())
        bean[ beanDefinition.getInitMethodName()].apply( bean, null);
    }
    /**
     * Runs bean aware methods.
     * @param bean Object
     * @param beanDefinition {@link alx.common.beans.factory.IBeanDefinition}
     */
    protected function beanAwares( bean:Object, beanDefinition:IBeanDefinition):void
    {
      if ( bean is IBeanNameAware)
        ( bean as IBeanNameAware).setBeanName( beanDefinition.getId());
      if ( bean is IBeanFactoryAware)
        ( bean as IBeanFactoryAware).setBeanFactory( this);
    }
    public function getBean( strBeanName:String, beanType:Class = null):Object
    {
      var bean:Object = null;
      var strName:String = this.m_beanDefinitionRegistry.canonicalName( strBeanName);
      if ( this.m_beanDefinitionRegistry.containsBeanDefinition( strName))
      {
        var beanDefinition:IBeanDefinition = this.m_beanDefinitionRegistry.getBeanDefinition( strName);
        if ( this.m_singletonBeanRegistry.containsSingleton( strName))
          bean = this.m_singletonBeanRegistry.getSingleton( strName);
        else
        {
          if ( beanDefinition.isAbstract())
            throw Error( 'bean '+strBeanName+' is abstract and can\'t be instantiated');
          var arConstructorArgument:Array = beanDefinition.getBeanConstructorArguments();
          var arArgument:Array = new Array();
          var i:int;
          var property:CProperty;
          for ( i = 0; i < arConstructorArgument.length; i++)
          {
            property = arConstructorArgument[ i];
            if ( property.isReference())
            {
              if ( property.isTypeReference())
                arArgument.push( this.getBeanType( property.getReference()));
              else
                arArgument.push( this.getBean( property.getReference()));
            }
            else
              arArgument.push( property.getValue());
          }
          bean = CBeanUtils.instanceClass( this.getClassLoader().loadClass( beanDefinition.getBeanClassName())
                                          , arArgument
                                          );
          var arProperty:Array = beanDefinition.getBeanProperties();
          for ( i = 0; i < arProperty.length; i++)
          {
            property = arProperty[ i];
            var value:*;
            if ( property.isReference())
            {
              if ( property.isTypeReference())
                value = this.getBeanType( property.getReference());
              else
                value = this.getBean( property.getReference());
            }
            else
              value = property.getValue();
            bean[ property.getName()].apply( bean, new Array( value));
          }

          this.beanAwares( bean, beanDefinition);
          this.beanInitializing( bean, beanDefinition);

          if ( beanDefinition.isSingleton())
            this.m_singletonBeanRegistry.registerSingleton( strName, bean);
        }
      }
      else
      if ( this.getParentBeanFactory())
        bean = this.getParentBeanFactory().getBean( strBeanName, beanType);
      else
        throw Error( 'bean '+strBeanName+' not found');
      if ( beanType != null)
      if ( !( bean is beanType))
        throw Error( 'bean '+strBeanName+' type '+beanDefinition.getBeanClassName()+' is not requested '+beanType);
      return bean;
    }
    /**
     * Sets factory ready status flag.
     * @param bFlag Boolean
     */
    protected function setFactoryReady( bFlag:Boolean):void
    {
      this.m_bReady = bFlag;
    }
    public function isFactoryReady():Boolean
    {
      return this.m_bReady;
    }
    /**
     * Gets event dispatcher.
     * @return {@link flash.events.EventDispatcher}
     */
    protected function getEventDispatcher():EventDispatcher
    {
      return this.m_eventDispatcher;
    }
    public function addFactoryReadyListener( callback:Function):void
    {
      if ( this.isFactoryReady())
        callback( new Event( Event.COMPLETE, true, true));
      else
        this.m_eventDispatcher.addEventListener( Event.COMPLETE, callback);
    }
  }
}
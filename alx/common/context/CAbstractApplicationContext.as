package alx.common.context
{
  import alx.common.beans.factory.IBeanFactory;
  import alx.common.beans.factory.IBeanDefinition;

  /**
   * Abstract application context.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractApplicationContext
  implements IApplicationContext
  {
    /** internal bean factory*/
    private var m_beanFactory:IBeanFactory;

    /** Creates abstract application context.*/
    public function CAbstractApplicationContext():void
    {
      this.setBeanFactory( null);
    }

    /**
     * Sets internal bean factory.
     * @param beanFactory {@link alx.common.beans.factory.IBeanFactory}
     * @return {@link alx.common.context.CAbstractApplicationContext this}
     */
    public function setBeanFactory( beanFactory:IBeanFactory):CAbstractApplicationContext
    {
      this.m_beanFactory = beanFactory;
      return this;
    }
    public function getBean( strBeanName:String, beanType:Class = null):Object
    {
      return this.m_beanFactory.getBean( strBeanName, beanType);
    }
    public function containsBean( strBeanName:String):Boolean
    {
      return this.m_beanFactory.containsBean( strBeanName);
    }
    public function isSingleton( strBeanName:String):Boolean
    {
      return this.m_beanFactory.isSingleton( strBeanName);
    }
    public function isPrototype( strBeanName:String):Boolean
    {
      return this.m_beanFactory.isPrototype( strBeanName);
    }
    public function isTypeMatch( strBeanName:String, beanType:Class):Boolean
    {
      return this.m_beanFactory.isTypeMatch( strBeanName, beanType);
    }
    public function getBeanType( strBeanName:String):Class
    {
      return this.m_beanFactory.getBeanType( strBeanName);
    }
    public function getAliases( strBeanName:String):Array
    {
      return this.m_beanFactory.getAliases( strBeanName);
    }
    public function getBeanDefinition( strBeanName:String):IBeanDefinition
    {
      return this.m_beanFactory.getBeanDefinition( strBeanName);
    }
    public function isFactoryReady():Boolean
    {
      return this.m_beanFactory.isFactoryReady();
    }
    public function addFactoryReadyListener( callback:Function):void
    {
      return this.m_beanFactory.addFactoryReadyListener( callback);
    }
  }
}
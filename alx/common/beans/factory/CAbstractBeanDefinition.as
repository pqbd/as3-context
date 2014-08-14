package alx.common.beans.factory
{
  import alx.common.IClonable;
  import alx.common.beans.CProperty;

  /**
   * Abstract bean definition.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractBeanDefinition
  implements IBeanDefinition, IClonable
  {
    /** bean id*/
    private var m_strId:String;
    /** bean resource path*/
    private var m_strBeanResourcePath:String;
    /** bean class name*/
    private var m_strBeanClassName:String;
    /** bean scope*/
    private var m_strScope:String;
    /** bean properties*/
    private var m_arProperty:Array;
    /** bean constructor arguments*/
    private var m_arConstructorArgument:Array;
    /** bean init method name*/
    private var m_strInitMethodName;
    /** bean destroy method name*/
    private var m_strDestroyMethodName;

    /**
     * Creates abstract bean definition.
     * @param original {@link alx.common.beans.factory.IBeanDefinition}
     */
    public function CAbstractBeanDefinition( original:IBeanDefinition = null):void
    {
      if ( original)
      {
        this.setId( original.getId())
            .setBeanResourcePath( original.getBeanResourcePath())
            .setBeanClassName( original.getBeanClassName())
            .setBeanProperties( original.getBeanProperties())
            .setBeanConstructorArguments( original.getBeanConstructorArguments())
            .setScope( original.getScope())
            .setInitMethodName( original.getInitMethodName())
            .setDestroyMethodName( original.getDestroyMethodName())
            ;
      }
      else
      {
        this.setId( null)
            .setBeanResourcePath( null)
            .setBeanClassName( 'Object')
            .setBeanProperties( new Array())
            .setBeanConstructorArguments( new Array())
            .setScope( CScope.SINGLETON)
            .setInitMethodName( null)
            .setDestroyMethodName( null)
            ;
      }
    }

    /**
     * Sets bean id.
     * @param strId String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setId( strId:String):CAbstractBeanDefinition
    {
      this.m_strId = strId;
      return this;
    }
    /**
     * Sets bean resource path.
     * @param strPath String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setBeanResourcePath( strPath:String):CAbstractBeanDefinition
    {
      this.m_strBeanResourcePath = strPath;
      return this;
    }
    /**
     * Sets bean class name.
     * @param strClassName String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setBeanClassName( strClassName:String):CAbstractBeanDefinition
    {
      this.m_strBeanClassName = strClassName;
      return this;
    }
    /**
     * Sets bean properties.
     * @param arProperty Array
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setBeanProperties( arProperty:Array):CAbstractBeanDefinition
    {
      this.m_arProperty = arProperty;
      return this;
    }
    /**
     * Adds bean properties.
     * @param arProperty Array
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function addBeanProperties( arProperty:Array):CAbstractBeanDefinition
    {
      this.m_arProperty = this.m_arProperty.concat( arProperty);
      return this;
    }
    /**
     * Adds bean property.
     * @param property {@link alx.common.beans.CProperty}
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function addBeanProperty( property:CProperty):CAbstractBeanDefinition
    {
      this.m_arProperty.push( property);
      return this;
    }
    /**
     * Sets bean constructor arguments.
     * @param arProperty Array
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setBeanConstructorArguments( arProperty:Array):CAbstractBeanDefinition
    {
      this.m_arConstructorArgument = arProperty;
      return this;
    }
    /**
     * Adds bean constructor arguments.
     * @param arProperty Array
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function addBeanConstructorArguments( arProperty:Array):CAbstractBeanDefinition
    {
      this.m_arConstructorArgument = this.m_arConstructorArgument.concat( arProperty);
      return this;
    }
    /**
     * Adds bean constructor argument.
     * @param property {@link alx.common.beans.CProperty}
     * @param nIndex int
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function addBeanConstructorArgument( property:CProperty, nIndex:int = -1):CAbstractBeanDefinition
    {
      this.m_arConstructorArgument.push( property);
      return this;
    }
    /**
     * Sets bean scope.
     * @param strScope String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setScope( strScope:String):CAbstractBeanDefinition
    {
      this.m_strScope = strScope;
      return this;
    }
    /**
     * Sets bean init method name.
     * @param strMethodName String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setInitMethodName( strMethodName:String):CAbstractBeanDefinition
    {
      this.m_strInitMethodName = strMethodName;
      return this;
    }
    /**
     * Sets bean destroy method name.
     * @param strMethodName String
     * @return {@link alx.common.beans.factory.CAbstractBeanDefinition this}
     */
    public function setDestroyMethodName( strMethodName:String):CAbstractBeanDefinition
    {
      this.m_strDestroyMethodName = strMethodName;
      return this;
    }
    public function getId():String
    {
      return this.m_strId;
    }
    public function getBeanResourcePath():String
    {
      return this.m_strBeanResourcePath;
    }
    public function getBeanClassName():String
    {
      return this.m_strBeanClassName;
    }
    public function getBeanProperties():Array
    {
      return this.m_arProperty;
    }
    public function getBeanConstructorArguments():Array
    {
      return this.m_arConstructorArgument;
    }
    public function getScope():String
    {
      return this.m_strScope;
    }
    public function isPrototype():Boolean
    {
      return ( this.getScope() == CScope.PROTOTYPE);
    }
    public function isSingleton():Boolean
    {
      return ( this.getScope() == CScope.SINGLETON);
    }
    public function isAbstract():Boolean
    {
      return ( this.getScope() == CScope.ABSTRACT);
    }
    public function clone():Object
    {
      return new CAbstractBeanDefinition( this);
    }
    public function getInitMethodName():String
    {
      return this.m_strInitMethodName;
    }
    public function getDestroyMethodName():String
    {
      return this.m_strDestroyMethodName;
    }
  }
}
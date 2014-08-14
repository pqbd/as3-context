package alx.common.beans.factory
{
  /**
   * Common interface for bean factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanFactory
  {
    /**
     * Gets bean by name and type.
     * @param strBeanName String
     * @param beanType Class
     * @return Object
     */
    function getBean( strBeanName:String, beanType:Class = null):Object;
    /**
     * Checks if bean is defined.
     * @param strBeanName String
     * @return Boolean
     */
    function containsBean( strBeanName:String):Boolean;
    /**
     * Checks if bean is singleton.
     * @param strBeanName String
     * @return Boolean
     */
    function isSingleton( strBeanName:String):Boolean;
    /**
     * Checks if bean is prototype.
     * @param strBeanName String
     * @return Boolean
     */
    function isPrototype( strBeanName:String):Boolean;
    /**
     * Checks if bean is matching to specified type.
     * @param strBeanName String
     * @param beanType Class
     * @return Boolean
     */
    function isTypeMatch( strBeanName:String, beanType:Class):Boolean;
    /**
     * Gets bean type.
     * @param strBeanName String
     * @return Class
     */
    function getBeanType( strBeanName:String):Class;
    /**
     * Gets bean aliases.
     * @param strBeanName String
     * @return Array
     */
    function getAliases( strBeanName:String):Array;
    /**
     * Gets bean definition.
     * @param strBeanName String
     * @return {@link alx.common.beans.factory.IBeanDefinition}
     */
    function getBeanDefinition( strBeanName:String):IBeanDefinition;
    /**
     * Checks if bean factory is ready for use.
     * @return Boolean
     */
    function isFactoryReady():Boolean;
    /**
     * Registers on factory ready event handler.
     * @param callback Function
     */
    function addFactoryReadyListener( callback:Function):void;
  }
}
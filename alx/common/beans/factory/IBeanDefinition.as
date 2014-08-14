package alx.common.beans.factory
{
  /**
   * Common interface for bean definitions.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanDefinition
  {
    /**
     * Gets bean id.
     * @return String
     */
    function getId():String;
    /**
     * Gets bean resource path.
     * @return String
     */
    function getBeanResourcePath():String;
    /**
     * Gets bean class name.
     * @return String
     */
    function getBeanClassName():String;
    /**
     * Gets bean properties.
     * @return Array
     */
    function getBeanProperties():Array;
    /**
     * Gets bean constructor arguments.
     * @return Array
     */
    function getBeanConstructorArguments():Array;
    /**
     * Gets bean scope.
     * @return String
     */
    function getScope():String;
    /**
     * Checks if bean is prototype.
     * @return Boolean
     */
    function isPrototype():Boolean;
    /**
     * Checks if bean is singleton.
     * @return Boolean
     */
    function isSingleton():Boolean;
    /**
     * Checks if bean is abstract.
     * @return Boolean
     */
    function isAbstract():Boolean;
    /**
     * Gets init method name.
     * @return String
     */
    function getInitMethodName():String;
    /**
     * Gets destroy method name.
     * @return String
     */
    function getDestroyMethodName():String;
  }
}
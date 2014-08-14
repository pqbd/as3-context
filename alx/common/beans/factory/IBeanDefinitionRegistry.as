package alx.common.beans.factory
{
  import alx.common.IAliasRegistry;

  /**
   * Common interface for bean definition registry.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanDefinitionRegistry extends IAliasRegistry
  {
    /**
     * Registers new bean definition.
     * @param strBeanName String
     * @param beanDefinition {@link alx.common.beans.factory.IBeanDefinition}
     * @return {@link alx.common.beans.factory.IBeanDefinitionRegistry this}
     */
    function registerBeanDefinition( strBeanName:String, beanDefinition:IBeanDefinition):IBeanDefinitionRegistry;
    /**
     * REmoves bean definition.
     * @param strBeanName String
     * @return {@link alx.common.beans.factory.IBeanDefinitionRegistry this}
     */
    function removeBeanDefinition( strBeanName:String):IBeanDefinitionRegistry;
    /**
     * Gets bean definition.
     * @param strBeanName String
     * @return {@link alx.common.beans.factory.IBeanDefinition}
     */
    function getBeanDefinition( strBeanName:String):IBeanDefinition;
    /**
     * Checkes if bean definition is in registry.
     * @param strBeanName String
     * @return Boolean
     */
    function containsBeanDefinition( strBeanName:String):Boolean;
    /**
     * Gets registered bean definition names.
     * @return Array
     */
    function getBeanDefinitionNames():Array;
    /**
     * Gets count of registered bean definitions.
     * @return uint
     */
    function getBeanDefinitionCount():uint;
    /**
     * Checkes if the bean name is already in use.
     * @param strBeanName String
     * @return Boolean
     */
    function isBeanNameInUse( strBeanName:String):Boolean;
  }
}
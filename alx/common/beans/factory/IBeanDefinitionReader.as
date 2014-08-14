package alx.common.beans.factory
{
  /**
   * Common interface for bean definition readers.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanDefinitionReader
  {
    /**
     * Gets bean definition registry.
     * @return {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     */
    function getBeanDefinitionRegistry():IBeanDefinitionRegistry;
    /**
     * Loads bean definitions from the resource.
     * @param strUrl String
     * @param callback Function
     */
    function loadBeanDefinitions( strUrl:String, callback:Function = null):void;
  }
}
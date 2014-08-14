package alx.common.beans.factory
{
  /**
   * Abstract bean definition reader.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractBeanDefinitionReader
  implements IBeanDefinitionReader
  {
    /** related bean definition registry*/
    private var m_beanDefinitionRegistry:IBeanDefinitionRegistry;

    /**
     * Creates abstract bean definition reader.
     * @param beanDefinitionRegistry {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     */
    public function CAbstractBeanDefinitionReader( beanDefinitionRegistry:IBeanDefinitionRegistry):void
    {
      this.setBeanDefinitionRegistry( beanDefinitionRegistry);
    }

    /**
     * Sets related bean definition registry.
     * @param beanDefinitionRegistry {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     * @return {@link alx.common.beans.factory.IBeanDefinitionReader this}
     */
    public function setBeanDefinitionRegistry( beanDefinitionRegistry:IBeanDefinitionRegistry):IBeanDefinitionReader
    {
      this.m_beanDefinitionRegistry = beanDefinitionRegistry;
      return this;
    }
    /**
     * Gets related bean definition registry.
     * @return {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     */
    public function getBeanDefinitionRegistry():IBeanDefinitionRegistry
    {
      return this.m_beanDefinitionRegistry;
    }
    public function loadBeanDefinitions( strUrl:String, callback:Function = null):void
    {
      throw Error( 'loadBeanDefinitions must be implemented');
    }
  }
}
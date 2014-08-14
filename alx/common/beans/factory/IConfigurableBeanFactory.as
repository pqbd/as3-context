package alx.common.beans.factory
{
  import alx.common.util.CClassLoader;

  /**
   * Common interface for configurable bean factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IConfigurableBeanFactory
  extends IHierarchicalBeanFactory
  {
    /**
     * Sets parent bean factory.
     * @param parentBeanFactory {@link alx.common.beans.factory.IBeanFactory}
     * @return {@link alx.common.beans.factory.IConfigurableBeanFactory}
     */
    function setParentBeanFactory( parentBeanFactory:IBeanFactory):IConfigurableBeanFactory;
    /**
     * Sets parent bean definition registry.
     * @param beanDefinitionRegistry {@link alx.common.beans.factory.IBeanDefinitionRegistry}
     * @return {@link alx.common.beans.factory.IConfigurableBeanFactory}
     */
    function setBeanDefinitionRegistry( beanDefinitionRegistry:IBeanDefinitionRegistry):IConfigurableBeanFactory;
    /**
     * Sets parent singleton registry.
     * @param singletonBeanRegistry {@link alx.common.beans.factory.ISingletonBeanRegistry}
     * @return {@link alx.common.beans.factory.IConfigurableBeanFactory}
     */
    function setSingletonBeanRegistry( singletonBeanRegistry:ISingletonBeanRegistry):IConfigurableBeanFactory;
    /**
     * Sets class loader.
     * @param classLoader {@link alx.common.util.CClassLoader}
     * @return {@link alx.common.beans.factory.IConfigurableBeanFactory}
     */
    function setClassLoader( classLoader:CClassLoader):IConfigurableBeanFactory;
  }
}
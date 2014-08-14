package alx.common.beans.factory
{
  /**
   * Common interface for heirarchical bean factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IHierarchicalBeanFactory extends IBeanFactory
  {
    /**
     * Gets parent bean factory.
     * @return {@link alx.common.beans.factory.IBeanFactory}
     */
    function getParentBeanFactory():IBeanFactory;
    /**
     * Checks if the bean is registered locally.
     * @return strBeanName String
     * @return Boolean
     */
    function containsLocalBean( strBeanName:String):Boolean;
  }
}
package alx.common.beans.factory
{
  /**
   * Common interface for bean factory aware beans.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanFactoryAware
  {
    /**
     * Sets bean factory.
     * @param beanFactory {@link alx.common.beans.factory.IBeanFactory}
     */
    function setBeanFactory( beanFactory:IBeanFactory):void;
  }
}
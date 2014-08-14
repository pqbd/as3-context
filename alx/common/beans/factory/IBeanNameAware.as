package alx.common.beans.factory
{
  /**
   * Common interface for bean name aware beans.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IBeanNameAware
  {
    /**
     * Sets bean name.
     * @param strBeanName String
     */
    function setBeanName( strBeanName:String):void;
  }
}
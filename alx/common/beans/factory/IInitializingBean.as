package alx.common.beans.factory
{
  /**
   * Common interface for bean needed initializing call.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IInitializingBean
  {
    /** Initializing method.*/
    function afterPropertiesSet():void;
  }
}
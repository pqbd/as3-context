package alx.common.beans.factory
{
  /**
   * Common interface for bean needs a destroy method call.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IDisposableBean
  {
    /** Destroy method.*/
    function destroy():void;
  }
}
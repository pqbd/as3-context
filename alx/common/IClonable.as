package alx.common
{
  /**
   * Common interface for clonable objects.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IClonable
  {
    /**
     * Clones the objedct.
     * @return Object
     */
    function clone():Object;
  }
}
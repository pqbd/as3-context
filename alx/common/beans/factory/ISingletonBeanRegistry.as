package alx.common.beans.factory
{
  /**
   * Common interface for singleton bean registry.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface ISingletonBeanRegistry
  {
    /**
     * Registers singleton.
     * @param strBeanName String
     * @param singletonObject Object
     * @return {@link alx.common.beans.factory.ISingletonBeanRegistry  this}
     */
    function registerSingleton( strBeanName:String, singletonObject:Object):ISingletonBeanRegistry;
    /**
     * Gets singleton by name.
     * @param strBeanName String
     * @return {@link alx.common.test.CTestSuite this}
     */
    function getSingleton( strBeanName:String):Object;
    /**
     * Checks if singleton is registered in registry.
     * @param strBeanName String
     * @return Boolean
     */
    function containsSingleton( strBeanName:String):Boolean;
    /**
     * Gets all available singleton bean names.
     * @return Array
     */
    function getSingletonNames():Array;
    /**
     * Gets available singleton object count.
     * @return uint
     */
    function getSingletonCount():uint;
  }
}
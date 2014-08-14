package alx.common
{
  /**
   * Common interface for managing aliases.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IAliasRegistry
  {
    /**
     * Registers an alias for the given name.
     * @param strName String
     * @param strAlias String
     * @return {@link alx.common.IAliasRegistry this}
     */
    function registerAlias( strName:String, strAlias:String):IAliasRegistry;
    /**
     * Removes alias from this registry.
     * @param strAlias String
     * @return {@link alx.common.IAliasRegistry this}
     */
    function removeAlias( strAlias:String):IAliasRegistry;
    /**
     * Checks if the given name is an alias.
     * @param strName String
     * @return Boolean
     */
    function isAlias( strName:String):Boolean;
    /**
     * Returns the canonical for the given name.
     * @param strName String
     * @return String
     */
    function canonicalName( strName:String):String;
    /**
     * Returns the aliases for the given name.
     * @param strName String
     * @return Array
     */
    function getAliases( strName:String):Array;

  }
}
package alx.common
{
  import alx.common.util.CHashMap;
  import alx.common.util.IMap;
  import alx.common.util.IIterator;
  import alx.common.util.IMapEntry;

  /**
   * Simple alias registry.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CSimpleAliasRegistry
  implements IAliasRegistry
  {
    /** alias storage*/
    private var m_hashAlias:IMap;

    /** Creates simple alias registry.*/
    public function CSimpleAliasRegistry():void
    {
      this.m_hashAlias = new CHashMap();
    }

    /**
     * Checks if alias overriding is allowed.
     * @return Boolean
     */
    protected function isAllowToOverrideAlias():Boolean
    {
      return true;
    }
    /**
     * Checks if alias creating a circular reference.
     * @param strName String
     * @param strAlias String
     */
    protected function checkCircularReference( strName:String, strAlias:String):void
    {
      if ( strAlias == this.canonicalName( strName))
      {
        throw Error( 'Can\'t register alias='+strAlias
                    +' for name='+strName
                    +' : Circular reference'
                    );
      }
    }
    public function registerAlias( strName:String, strAlias:String):IAliasRegistry
    {
      if (  strName == strAlias)
        this.removeAlias( strAlias);
      else
      {
        if ( !this.isAllowToOverrideAlias())
        {
          if ( this.isAlias( strAlias))
          {
            var strRegisteredName:String = this.m_hashAlias.get( strAlias) as String;
            if ( strRegisteredName != strName)
            {
              throw Error( 'Can\'t register alias='+strAlias
                         +' for name='+strName
                         +' : already set fro name='+strRegisteredName
                         );
            }
          }
        }
        this.checkCircularReference( strName, strAlias);
        this.m_hashAlias.put( strAlias, strName);
      }
      return this;
    }
    public function removeAlias( strAlias:String):IAliasRegistry
    {
      if ( this.isAlias( strAlias))
        this.m_hashAlias.remove( strAlias);
      return this;
    }
    public function isAlias( strName:String):Boolean
    {
      return this.m_hashAlias.containsKey( strName);
    }
    public function getAliases( strName:String):Array
    {
      var arAlias:Array = new Array();
      var iterator:IIterator = this.m_hashAlias.entrySet().iterator();
      while ( iterator.hasNext())
      {
        var entry:IMapEntry = iterator.next() as IMapEntry;
        if ( entry.getValue() == strName)
          arAlias.push( entry.getKey());
      }
      return arAlias;
    }
    public function canonicalName( strName:String):String
    {
      var strCanonicalName:String = strName;
      var bNext:Boolean = true;
      do
      {
        if ( this.isAlias( strCanonicalName))
          strCanonicalName = this.m_hashAlias.get( strCanonicalName) as String;
        else
          bNext = false;
      }
      while ( bNext);
      return strCanonicalName;
    }
  }
}
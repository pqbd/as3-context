package alx.common.beans.factory
{
  import alx.common.CSimpleAliasRegistry;
  import alx.common.util.IMap;
  import alx.common.util.CHashMap;

  /**
   * Default singleton registry.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CDefaultSingletonBeanRegistry extends CSimpleAliasRegistry
  implements ISingletonBeanRegistry
  {
    /** internal storage.*/
    private var m_mapSingletonBean:IMap;

    /** Creates default singleton registry.*/
    public function CDefaultSingletonBeanRegistry():void
    {
      super();
      this.m_mapSingletonBean = new CHashMap();
    }

    public function registerSingleton( strBeanName:String, singletonObject:Object):ISingletonBeanRegistry
    {
      var strName:String = this.canonicalName( strBeanName);
      if ( this.containsSingleton( strName))
        throw Error( 'sigleton for bean '+strBeanName+' is already registered');
      this.m_mapSingletonBean.put( strName, singletonObject);
      return this;
    }
    public function getSingleton( strBeanName:String):Object
    {
      var strName:String = this.canonicalName( strBeanName);
      return this.m_mapSingletonBean.get( strName);
    }
    public function containsSingleton( strBeanName:String):Boolean
    {
      var strName:String = this.canonicalName( strBeanName);
      return this.m_mapSingletonBean.containsKey( strName);
    }
    public function getSingletonNames():Array
    {
      return this.m_mapSingletonBean.keySet().toArray();
    }
    public function getSingletonCount():uint
    {
      return this.m_mapSingletonBean.size();
    }
  }
}
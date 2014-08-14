package alx.common.beans.factory
{
  import alx.common.CSimpleAliasRegistry;
  import alx.common.util.IMap;
  import alx.common.util.CHashMap;

  /**
   * Default bean definition registry.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CDefaultBeanDefinitionRegistry extends CSimpleAliasRegistry
  implements IBeanDefinitionRegistry
  {
    /** internal storage*/
    private var m_mapBeanDefinition:IMap;

    /** Creates default bean definition registry.*/
    public function CDefaultBeanDefinitionRegistry():void
    {
      super();
      this.m_mapBeanDefinition = new CHashMap();
    }

    public function registerBeanDefinition( strBeanName:String, beanDefinition:IBeanDefinition):IBeanDefinitionRegistry
    {
      if ( this.isBeanNameInUse( strBeanName))
        throw Error( strBeanName+' name is already in use');
      this.m_mapBeanDefinition.put( strBeanName, beanDefinition);
      return this;
    }
    public function removeBeanDefinition( strBeanName:String):IBeanDefinitionRegistry
    {
      var strName:String = this.canonicalName( strBeanName);
      var arAlias:Array = this.getAliases( strBeanName);
      for ( var i:int = 0; i < arAlias.length; i++)
        this.removeAlias( arAlias[ i]);
      this.m_mapBeanDefinition.remove( strName);
      return this;
    }
    public function getBeanDefinition( strBeanName:String):IBeanDefinition
    {
      if ( !this.containsBeanDefinition( strBeanName))
        throw Error( strBeanName+' is not registered');
      var strName:String = this.canonicalName( strBeanName);
      return this.m_mapBeanDefinition.get( strName) as IBeanDefinition;
    }
    public function containsBeanDefinition( strBeanName:String):Boolean
    {
      var strName:String = this.canonicalName( strBeanName);
      return this.m_mapBeanDefinition.containsKey( strName);
    }
    public function getBeanDefinitionNames():Array
    {
      return this.m_mapBeanDefinition.keySet().toArray();
    }
    public function getBeanDefinitionCount():uint
    {
      return this.m_mapBeanDefinition.size();
    }
    public function isBeanNameInUse( strBeanName:String):Boolean
    {
      return ( this.containsBeanDefinition( strBeanName) || this.isAlias( strBeanName));
    }
  }
}
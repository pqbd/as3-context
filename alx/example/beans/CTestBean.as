package alx.example.beans
{
  import alx.common.util.IRandom;
  import alx.common.beans.factory.IBeanNameAware;
  import alx.common.beans.factory.IInitializingBean;

  public class CTestBean
  implements IBeanNameAware, IInitializingBean
  {
    private var m_class:Class;
    private var m_random:IRandom;

    public function CTestBean( clazz:Class = null, random:IRandom = null):void
    {
      this.setClass( clazz);
      this.setRandom( random);
    }

    public function setClass( clazz:Class):void
    {
      this.m_class = clazz;
    }
    public function setRandom( random:IRandom):void
    {
      this.m_random = random;
    }
    public function myinit():void
    {
      trace( 'myinit call');
    }
    public function afterPropertiesSet():void
    {
      trace( 'afterPropertiesSet call');
    }
    public function setBeanName( strBeanName:String):void
    {
      trace( 'setBeanName call '+strBeanName);
    }
    public function run():void
    {
      trace( this.m_class);
      trace( this.m_random);
    }
  }
}
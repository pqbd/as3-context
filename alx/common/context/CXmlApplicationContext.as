package alx.common.context
{
  import alx.common.beans.factory.xml.CXmlBeanFactory;

  /**
   * XML application context.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CXmlApplicationContext
  extends CAbstractApplicationContext
  {
    /** 
     * Creates XML application context.
     * @param strUrlString
     */
    public function CXmlApplicationContext( strUrl:String):void
    {
      this.setBeanFactory( new CXmlBeanFactory( strUrl));
    }
  }
}
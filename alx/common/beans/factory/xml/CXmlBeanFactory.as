package alx.common.beans.factory.xml
{
  import flash.events.Event;
  import alx.common.beans.factory.IBeanFactory;
  import alx.common.beans.factory.CAbstractBeanFactory;

  /**
   * XML bean factory.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CXmlBeanFactory
  extends CAbstractBeanFactory
  {
    /** number of XML resources not finished loading process*/
    private var m_nXmlResourcesInLoading:uint;

    /**
     * Creates XML bean factory.
     * @param strUrl String
     * @param parentBeanFactory {@link alx.common.beans.factory.IBeanFactory}
     */
    public function CXmlBeanFactory( strUrl:String, parentBeanFactory:IBeanFactory = null):void
    {
      super( parentBeanFactory);
      this.m_nXmlResourcesInLoading = 0;
      this.addXmlUrl( strUrl);
    }
    /**
     * Adds XML URL class to be parsed.
     * @param strUrl String
     * @return {@link alx.common.beans.factory.xml.CXmlBeanFactory this}
     */
    public function addXmlUrl( strUrl:String):CXmlBeanFactory
    {
      this.setFactoryReady( false);
      this.m_nXmlResourcesInLoading++;
      var reader:CXmlBeanDefinitionReader = new CXmlBeanDefinitionReader( this);
      reader.loadBeanDefinitions( strUrl, this.onXmlUrlCompleteHandler);
      return this;
    }
    /**
     * XML URL load complete handler.
     * @param event Event
     */
    protected function onXmlUrlCompleteHandler( event:Event):void
    {
      this.m_nXmlResourcesInLoading--;
      this.checkReadyHandler();
    }
    /**
     * Adds XML content to be parsed.
     * @param xml XML
     * @return {@link alx.common.beans.factory.xml.CXmlBeanFactory this}
     */
    public function addXml( xml:XML):CXmlBeanFactory
    {
      this.setFactoryReady( false);
      var parser:CXmlBeanDefinitionParser = new CXmlBeanDefinitionParser( this);
      parser.parse( xml);
      this.checkReadyHandler();
      return this;
    }
    /** Checkes if factory is ready.*/
    protected function checkReadyHandler():void
    {
      if ( this.m_nXmlResourcesInLoading == 0)
      {
        var self:CXmlBeanFactory = this;
        if ( this.getClassLoader().isReady())
        {
          self.setFactoryReady( true);
          self.getEventDispatcher().dispatchEvent( new Event( Event.COMPLETE, true, true));
        }
        else
        {
          this.getClassLoader().addEventListener( Event.COMPLETE
                                                , function( event:Event):void
                                                  {
                                                    self.setFactoryReady( true);
                                                    self.getEventDispatcher().dispatchEvent( new Event( Event.COMPLETE, true, true));
                                                  }
                                                );
        }
      }
    }
  }
}
package alx.common.beans
{
  /**
   * Property.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CProperty
  {
    /** property name*/
    private var m_strName:String;
    /** property value*/
    private var m_strValue:String;
    /** property value if it is reference*/
    private var m_strReference:String;
    /** flag if this is type reference*/
    private var m_bType:Boolean;

    /**
     * Creates property.
     * @param strName String
     * @param strValue String
     * @param bReference Boolean
     * @param bType Boolean
     */
    public function CProperty( strName:String, strValue:String, bReference:Boolean, bType:Boolean = false):void
    {
      this.m_strName = strName;
      this.m_strValue = null;
      this.m_strReference = null;
      if ( bReference)
      {
        this.m_strReference = strValue;
        this.m_bType = bType;
      }
      else
        this.m_strValue = strValue;
    }

    /**
     * Gets property name.
     * @return String
     */
    public function getName():String
    {
      return this.m_strName;
    }
    /**
     * Checkes if property is reference.
     * @return Boolean
     */
    public function isReference():Boolean
    {
      return ( this.m_strReference != null);
    }
    /**
     * Checkes if property reference is type reference.
     * @return Boolean
     */
    public function isTypeReference():Boolean
    {
      return this.m_bType;
    }
    /**
     * Gets property reference value.
     * @return String
     */
    public function getReference():String
    {
      return this.m_strReference;
    }
    /**
     * Gets property value.
     * @return String
     */
    public function getValue():String
    {
      return this.m_strValue;
    }
  }
}
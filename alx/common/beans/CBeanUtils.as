package alx.common.beans
{
  import flash.utils.*;

  /**
   * Bean utility functions.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CBeanUtils
  {
    /**
     * Constructs the object using it's class definition and constructor arguments (up to 16 arguments supported).
     * @param classDefinition Class
     * @param arConstructorArgument Array
     * @return *
     */
    public static function instanceClass( classDefinition:Class
                                        , arConstructorArgument:Array = null
                                        ):*
    {
      var bean:*;
      if (( arConstructorArgument != null) && ( arConstructorArgument.length > 0))
      {
        var a:Array = arConstructorArgument;
        switch ( a.length)
        {
          case 1:
          {
            bean = new classDefinition( a[ 0]);
            break;
          }
          case 2:
          {
            bean = new classDefinition( a[ 0], a[ 1]);
            break;
          }
          case 3:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2]);
            break;
          }
          case 4:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3]);
            break;
          }
          case 5:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4]);
            break;
          }
          case 6:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5]);
            break;
          }
          case 7:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6]);
            break;
          }
          case 8:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]);
            break;
          }
          case 9:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8]
                                      );
            break;
          }
          case 10:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9]
                                      );
            break;
          }
          case 11:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10]
                                      );
            break;
          }
          case 12:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10], a[ 11]
                                      );
            break;
          }
          case 13:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10], a[ 11], a[ 12]
                                      );
            break;
          }
          case 14:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10], a[ 11], a[ 12], a[ 13]
                                      );
            break;
          }
          case 15:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10], a[ 11], a[ 12], a[ 13], a[ 14]
                                      );
            break;
          }
          case 16:
          {
            bean = new classDefinition( a[ 0], a[ 1], a[ 2], a[ 3], a[ 4], a[ 5], a[ 6], a[ 7]
                                      , a[ 8], a[ 9], a[ 10], a[ 11], a[ 12], a[ 13], a[ 14], a[ 15]
                                      );
            break;
          }
          default:
          {
            throw Error( 'unsupported number of arguments max 16, '+a.length+' given');
            break;
          }
        }
      }
      else
        bean = new classDefinition();
      return bean;
    }
  }
}
import alx.common.util.IRandom;
import alx.common.context.IApplicationContext;
import alx.common.context.CXmlApplicationContext;
import alx.example.beans.CTestBean;

var context:IApplicationContext = new CXmlApplicationContext( 'example.xml');
context.addFactoryReadyListener( onBeanFactoryAvaliable);

function onBeanFactoryAvaliable( event:Event):void
{
  var mc1:MovieClip = context.getBean( 'mc1') as MovieClip;
  var mc2:MovieClip = context.getBean( 'mc2') as MovieClip;
  var mc3:MovieClip = context.getBean( 'mc3') as MovieClip;
  var random1:IRandom = context.getBean( 'random', IRandom) as IRandom;
  var random2:IRandom = context.getBean( 'random') as IRandom;

  trace( random1.nextInt());
  trace( random2.nextInt());

  root.stage.addChild( mc1);
  root.stage.addChild( mc2);
  root.stage.addChild( mc3);

  mc1.x = 100;
  mc1.y = 100;
  mc2.x = 200;
  mc2.y = 200;
  mc3.x = 300;
  mc3.y = 300;

  var test1:CTestBean = context.getBean( 'test1') as CTestBean;
  test1.run();

  var test2:CTestBean = context.getBean( 'test2') as CTestBean;
  test2.run();

  var test3:CTestBean = context.getBean( 'test3') as CTestBean;
  test3.run();
}
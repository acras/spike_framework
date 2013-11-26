package spike.form {
  
  import flash.events.IEventDispatcher;

  public interface IFormModule extends IEventDispatcher {

    function setModel(clazz:Class, object:Object):void;
  }
}

package spike.events {

  import flash.events.Event;
  import org.restfulx.models.RxModel;

  public class AfterFormSaveEvent extends Event {

    public static const AFTER_FORM_SAVE:String = "afterFormSave";

    public var model:RxModel;

    public function AfterFormSaveEvent( type:String, model:RxModel,
                                        bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.model = model;
    }

    override public function clone():Event {
      return new AfterFormSaveEvent(type, model, bubbles, cancelable);
    }
  }
}

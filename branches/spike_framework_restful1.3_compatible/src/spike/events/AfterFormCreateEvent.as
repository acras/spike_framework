package spike.events {

  import flash.events.Event;
  import org.restfulx.models.RxModel;

  public class AfterFormCreateEvent extends Event {

    public static const AFTER_FORM_CREATE:String = "afterFormCreate";

    public var model:RxModel;

    public function AfterFormCreateEvent( type:String, model:RxModel,
                                          bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.model = model;
    }

    override public function clone():Event {
      return new AfterFormCreateEvent(type, model, bubbles, cancelable);
    }
  }
}

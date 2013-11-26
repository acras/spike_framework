package spike.events {

  import flash.events.Event;
  import org.restfulx.models.RxModel;

  public class AfterFormCloseEvent extends Event {

    public static const AFTER_FORM_CLOSE:String = "afterFormClose";

    public var model:RxModel;

    public function AfterFormCloseEvent( type:String, model:RxModel,
                                          bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.model = model;
    }

    override public function clone():Event {
      return new AfterFormCloseEvent(type, model, bubbles, cancelable);
    }
  }
}

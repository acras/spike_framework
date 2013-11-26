package spike.events {

  import flash.events.Event;
  import org.restfulx.models.RxModel;

  public class AfterFormCloseClickEvent extends Event {

    public static const AFTER_FORM_CLOSE_CLICK:String = "afterFormCloseClick";

    public var model:RxModel;

    public function AfterFormCloseClickEvent( type:String, model:RxModel,
                                          bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.model = model;
    }

    override public function clone():Event {
      return new AfterFormCloseClickEvent(type, model, bubbles, cancelable);
    }
  }
}

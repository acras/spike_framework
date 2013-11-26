package spike.events {

  import flash.events.Event;
  import org.restfulx.models.RxModel;

  public class AfterFormUpdateEvent extends Event {

    public static const AFTER_FORM_UPDATE:String = "afterFormUpdate";

    public var model:RxModel;

    public function AfterFormUpdateEvent( type:String, model:RxModel,
                                          bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.model = model;
    }

    override public function clone():Event {
      return new AfterFormUpdateEvent(type, model, bubbles, cancelable);
    }
  }
}

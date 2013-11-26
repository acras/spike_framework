package spike.events {

  import flash.display.DisplayObject;
  import flash.events.Event;

  public class ChildReadyEvent extends Event {

    public static const CHILD_READY:String = "childReady";

    public var child:DisplayObject;

    public function ChildReadyEvent(type:String, child: DisplayObject,
                                    bubbles:Boolean = false, cancelable:Boolean = false) {
      super(type, bubbles, cancelable);
      this.child = child;
    }

    override public function clone():Event {
      return new ChildReadyEvent(type, child, bubbles, cancelable);
    }
  }
}

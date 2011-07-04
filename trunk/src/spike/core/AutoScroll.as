package spike.core {

  import flash.display.DisplayObject;
  import flash.events.Event;
  import flash.geom.Point;
  import mx.core.Container;

  public class AutoScroll {

    public static function autoScroll(event:Event):void {
      var container:Container = Container(event.currentTarget);
      if (container != null) {
        var focusItem:DisplayObject;
        if (container.focusManager != null)
          focusItem = DisplayObject(container.focusManager.getFocus());

        // if no focused item or scrollbar, nothing to do
        if (focusItem && container.verticalScrollBar) {
          // is the current focus item inside our container?
          if (focusItem == container || !container.contains(focusItem))
            return;

          // find the focusItem's y coordinate relative to the scrolled container
          var focusItemPoint:Point = focusItem.localToGlobal(new Point(0,0));
          var containerPoint:Point = container.contentToGlobal(new Point(0,0));
          var focusTopEdge:int = focusItemPoint.y - containerPoint.y;

          var focusBottomEdge:int = focusTopEdge + focusItem.height;
          var scrollbarRange:int = container.verticalScrollBar.maxScrollPosition;
          var visibleWindowHeight:int = container.height;
          var lastVisibleY:int = visibleWindowHeight + container.verticalScrollPosition;

          if (container.horizontalScrollBar)
            lastVisibleY -= container.horizontalScrollBar.height;

          var newPos:int = -1;
          if ((focusTopEdge - 10) < container.verticalScrollPosition)
            newPos = Math.max(0, focusTopEdge - 10);
          else if ((focusBottomEdge - lastVisibleY) > 0)
            newPos = Math.min(scrollbarRange, container.verticalScrollPosition + (focusBottomEdge - lastVisibleY) + 10);

          if (newPos >= 0)
            container.verticalScrollPosition = newPos;
        }
      }
    }
  }
}

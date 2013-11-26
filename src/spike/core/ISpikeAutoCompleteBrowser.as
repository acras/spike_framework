package spike.core {
  import com.hillelcoren.components.autoComplete.interfaces.IBrowser;
  
  public interface ISpikeAutoCompleteBrowser extends IBrowser {

    function set resource(value:Class):void;
    function set searchCategory(value:String):void;
    function set searchFieldsDescription(value:String):void;
    function set searchAdditionalParams(value:Object):void;    
  }
}
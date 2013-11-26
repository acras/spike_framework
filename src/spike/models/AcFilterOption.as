package spike.models
{
  import org.restfulx.models.RxModel;
  
  [Resource(name="ac_filter_options", singularName="ac_filter_option")]
  [Bindable]
  public class AcFilterOption extends RxModel {
    
     public var label:String;
     public var value:String;
     
  }
  
}
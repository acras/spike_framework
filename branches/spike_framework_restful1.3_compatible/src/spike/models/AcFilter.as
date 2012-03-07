package spike.models
{
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="ac_filters", singularName="ac_filter")]
  [Bindable]
  public class AcFilter extends RxModel {
    
     public var queryUser:Boolean;
     public var dataType:String;
     public var label:String;
     public var filledCriteria:String;
     public var unfilledCriteria:String;
     public var targetModel:String;
     public var targetField:String;
     
     [HasMany]
     public var acFilterOptions: ModelsCollection;
     
  }
  
}
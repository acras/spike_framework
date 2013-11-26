package spike.models
{
  import org.restfulx.collections.ModelsCollection;
  import org.restfulx.models.RxModel;
  
  [Resource(name="ac_filter_defs", singularName="ac_filter_def")]
  [Bindable]
  public class AcFilterDef extends RxModel {
    
     public var name:String;
     public var description:String;
     public var modelClass:String;
     
     [HasMany]
     public var acFilters: ModelsCollection;
     
  }
  
}
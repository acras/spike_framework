package spike.models
{
  import org.restfulx.models.RxModel;
  
  [Resource(name="report_templates", singularName="report_template")]
  [Bindable]
  public class ReportTemplate extends RxModel {
    
     public var name:String;
     public var reportType:String;
     public var controllerName:String;
     
  }
  
}
package spike.components
{
  import spike.models.AcFilter;
  
  public interface IRenderedFilter
  {
    function set filter(value: AcFilter): void;
    function get filter(): AcFilter;
    
    function isFilled(): Boolean;
    function getFillingValues(): Object;
  }
}
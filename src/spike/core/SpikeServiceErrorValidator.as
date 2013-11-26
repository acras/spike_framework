package spike.core {

  import mx.validators.ValidationResult;
  import org.restfulx.validators.ServiceErrorValidator;

  public class SpikeServiceErrorValidator extends ServiceErrorValidator {

    public function SpikeServiceErrorValidator() {
      super();
    }

    override protected function doValidation(value:Object):Array {
      var baseErrors:Array = super.doValidation(value);

      var allMsgs:Array = new Array();
      baseErrors.forEach(function(item:ValidationResult, index:int, array:Array):void {
        allMsgs.push(item.errorMessage);
      });

      var vr:ValidationResult = new ValidationResult(true, null,
        'SERVICE_VALIDATION_ERROR', allMsgs.join("\n"));

      var baseError:Array = new Array();;
      baseError.push(vr);

      return baseError;
    }
  }
}

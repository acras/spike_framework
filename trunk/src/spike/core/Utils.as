package spike.core {

  import mx.controls.CheckBox;
  import mx.controls.ComboBox;
  import mx.controls.TextArea;
  import mx.controls.TextInput;
  import mx.core.UIComponent;
  import mx.formatters.CurrencyFormatter;
  import mx.formatters.DateFormatter;
  import mx.formatters.NumberBaseRoundType;
  import mx.rpc.events.FaultEvent;
  import mx.validators.ValidationResult;
  
  import org.restfulx.Rx;
  import org.restfulx.services.XMLServiceErrors;

  public class Utils {

    public function Utils() {
    }

    public static function getValueFrom(component:*):* {
      var value:*;

      if (component is SpikeAutoComplete)
        value = SpikeAutoComplete(component).selectedItem;

      else if (component is SpikeComboBox)
        value = SpikeComboBox(component).selectedValue;

      else if (component is SpikeDecimalInput)
        value = SpikeDecimalInput(component).value;

      else if (component is SpikeDateField)
        value = SpikeDateField(component).selectedDate;

      else if (component is SpikeTimeField)
        value = SpikeTimeField(component).value;

      else if (component is DocumentoInput)
        value = DocumentoInput(component).text;

      else if (component is CheckBox)
        value = CheckBox(component).selected;

      else if (component is ComboBox)
        value = ComboBox(component).selectedItem;

      else if (component is TextArea)
        value = TextArea(component).text;

      else if (component is TextInput)
        value = TextInput(component).text;

      else
        value = null;

      return value;
    }

    public static function validFormComponent(component:UIComponent):Boolean {
      return  (component is SpikeAutoComplete)
      ||  (component is SpikeComboBox)
      ||  (component is SpikeDecimalInput)
      ||   (component is SpikeDateField)
      ||   (component is DocumentoInput)
      ||   (component is CheckBox)
      ||   (component is ComboBox)
      ||   (component is TextArea)
      ||   (component is TextInput);
    }


    public static function getErrors(info:Object):Array {
      if (info is XMLServiceErrors) {
        var validationResults:Array = info.getFieldErrors(Rx.DEFAULT_ERROR_FIELD);
        return  validationResults.map(function(item:ValidationResult, index:int, array:Array):String {
                  return item.errorMessage;
                });
      } else {
        var error:Array = new Array();
        if (info is FaultEvent)
          error.push(FaultEvent(info).fault.faultString);
        else
          error.push(info.toString());
        return error;
      }
    }

    public static function formatadoComoCNPJ(cnpj:String):String {
      if (cnpj && cnpj != '')
        return  cnpj.substr(0, 2) + '.' + cnpj.substr(2, 3) + '.' +
                cnpj.substr(5, 3) + '/' + cnpj.substr(8, 4) + '-' +
                cnpj.substr(12, 2);
      else
        return '';
    }

    public static function formatadoComoCPF(cpf:String):String {
      if (cpf && cpf != '')
        return  cpf.substr(0, 3) + '.' + cpf.substr(3, 3) + '.' +
                cpf.substr(6, 3) + '-' + cpf.substr(9, 2);
      else
        return '';
    }

    public static function formatadaComoData(date:Date):String {
      if (date) {
        var dateFormatter:DateFormatter = new DateFormatter();
        dateFormatter.formatString = "DD/MM/YYYY";
        return dateFormatter.format(date);
      } else
        return '';
    }

    public static function formatadaComoHora(date:Date):String {
      if (date) {
        var dateFormatter:DateFormatter = new DateFormatter();
        dateFormatter.formatString = "J:NN:SS";
        return dateFormatter.format(date);
      } else
        return '';
    }

    public static function formatadaComoDbData(date:Date):String {
      if (date) {
        var dateFormatter:DateFormatter = new DateFormatter();
        dateFormatter.formatString = "YYYY-MM-DD";
        return dateFormatter.format(date);
      } else
        return '';
    }

    public static function formatadoComoDecimal(n:Number, precision:int = 2,
                                                showCurrencySymbol:Boolean = false,
                                                unit:String = ''):String {
      if (!isNaN(n)) {
        var decimalFormatter:CurrencyFormatter = new CurrencyFormatter();
        decimalFormatter.precision = precision;
        if (showCurrencySymbol)
          decimalFormatter.currencySymbol = "R$ ";
        else
          decimalFormatter.currencySymbol = '';
        decimalFormatter.decimalSeparatorFrom = ',';
        decimalFormatter.decimalSeparatorTo = ',';
        decimalFormatter.thousandsSeparatorFrom = '.';
        decimalFormatter.thousandsSeparatorTo = '.';
        decimalFormatter.rounding = NumberBaseRoundType.NEAREST;
        decimalFormatter.useNegativeSign = true;
        decimalFormatter.useThousandsSeparator = true;
        var d:String = decimalFormatter.format(n);
        if (d != '' && unit != '')
          d = d + ' ' + unit;
        return d;
      } else
        return '';
    }
    
    public static function downloadReport(reportPath: String, id: int): void{
      var path: String = reportPath;
      if (path.charAt(path.length-1) != '/')
        path = path + '/';
      
      var pdfDownloader: SpikeFileDownloader = new SpikeFileDownloader();
      pdfDownloader.url = path + '?id=' + id.toString();
      pdfDownloader.fileName = 'report.pdf';
      pdfDownloader.download();
    }
  }
}

package spike.formatters
{
  import mx.formatters.CurrencyFormatter;

  public class BRLFormatter extends CurrencyFormatter
  {
    public function BRLFormatter()
    {
      super();
      precision = 2;
      decimalSeparatorFrom = ',';
      decimalSeparatorTo = ',';
      thousandsSeparatorFrom = '.';
      thousandsSeparatorTo = '.';
      currencySymbol = 'R$';
      rounding = "nearest";
    }
    
  }
}
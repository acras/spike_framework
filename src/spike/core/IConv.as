package spike.core {

  public class IConv {

    protected var pattern:Array;
    protected var converted:Array;

    public function convert(str:String):String {
      if (str == "")
        return "";
      var s:String = str;
      for (var i:int = 0; i<16; i++)
        s = s.replace(pattern[i], converted[i]);
      return s;
    }

    public function IConv() {
      pattern = new Array(15);
      pattern[0] = new RegExp("ç","g");
      pattern[1] = new RegExp("Ç","g");
      pattern[2] = new RegExp("[áâäàåã]","g");
      pattern[3] = new RegExp("[ÁÂÄÀÅÃ]","g");
      pattern[4]=new RegExp("[éêëè]","g");
      pattern[5]=new RegExp("[ÉÊËÈ]","g");
      pattern[6]=new RegExp("[íîïì]","g");
      pattern[7]=new RegExp("[ÍÎÏÌ]","g");
      pattern[8]=new RegExp("[óôöòõ]","g");
      pattern[9]=new RegExp("[ÓÔÖÒÕ]","g");
      pattern[10]=new RegExp("[úûüù]","g");
      pattern[11]=new RegExp("[ÚÛÜÙ]","g");
      pattern[12]=new RegExp("ÿ","g");
      pattern[13]=new RegExp("ñ","g");
      pattern[14]=new RegExp("Ñ","g");

      converted=["c", "C", "a", "A", "e", "E", "i", "I", "o", "O", "u", "U", "y", "n", "N"];
    }
  }
}

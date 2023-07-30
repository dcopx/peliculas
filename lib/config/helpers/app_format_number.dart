class AppFormatData {
  AppFormatData();

  String numeroResumido(double nNumero) {
    nNumero = nNumero * 1000;
    String sNumero = '';

    if (nNumero >= 1000 && nNumero < 999999) {
      sNumero = '${(nNumero / 1000).toStringAsFixed(1)}K';
    } else {
      if (nNumero >= 1000000) {
        sNumero = '${(nNumero / 1000000).toStringAsFixed(1)}M';
      } else {
        sNumero = nNumero.toString();
      }
    }
    return sNumero;
  }
}

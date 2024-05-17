bool isNum(String num) {
  double? res = double.tryParse(num);
  return res != null;
}

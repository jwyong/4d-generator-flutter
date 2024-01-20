extension ImagePathUtil on String {
  String toIconPath() => "asset/icon/$this.png";
  String toImgPath() => "asset/img/$this.png";
}
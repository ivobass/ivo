class Ivo {
  final int reg;
  final String tipoVenda;
  final String vendaSAP;
  final int quantidade;

  Ivo({this.reg, this.tipoVenda, this.vendaSAP, this.quantidade});

  //transforma o json em dados
  Ivo.fromJson(Map json)
      : reg = int.parse(json['Reg']),
        tipoVenda = json['TipoVenda'],
        vendaSAP = json['VendaSAP'],
        quantidade = int.parse(json['Quantidade']);
}

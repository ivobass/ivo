import 'package:flutter/material.dart';
import 'package:ivo/model/ivo.dart';
import 'package:ivo/service/ivo_service.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //aqui apresenta a tela inicial do app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ivo'),
      ),
      body: FutureBuilder<List<Ivo>>(
        future: IvoService.getIvo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? IvoList(
                  ivo: snapshot.data,
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class IvoList extends StatelessWidget {
  final List<Ivo> ivo;

  IvoList({Key key, this.ivo}) : super(key: key);

  @override
  //Aqui cria a lista com os dados
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ivo.length,
      itemBuilder: (BuildContext context, int index) {
        //envia os dados da lista para montar o card
        return _cardList(
            context: context,
            reg: ivo[index].reg.toString(),
            tipoVenda: ivo[index].tipoVenda,
            vendaSAP: ivo[index].vendaSAP,
            quantidade: ivo[index].quantidade.toString());
      },
    );
  }

  Widget _cardList(
      {BuildContext context,
      String reg,
      String tipoVenda,
      String vendaSAP,
      String quantidade}) {
    return Container(
        height: 150,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Registro:',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        reg,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('Tipo de Venda:'), Text(tipoVenda)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('Vendas SAP:'), Text(vendaSAP)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Quantidade:',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(quantidade,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

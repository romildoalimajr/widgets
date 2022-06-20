import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["Romildo", "Alves", "de", "lima", "Junior"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index){

                  final item = _lista[index];

                  return Dismissible(
                    background: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction){
                      if(direction == DismissDirection.endToStart){
                        print("direcao: endToStart");
                      }else if(direction == DismissDirection.startToEnd){
                        print("direcao: startToStart");
                      }
                      setState((){
                        _lista.removeAt(index);
                        print(_lista[index].toString());
                      });
                      print("direcao: " + direction.toString());
                    },
                      key: Key(item),
                      child: ListTile(
                        title: Text(item),
                      )
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}

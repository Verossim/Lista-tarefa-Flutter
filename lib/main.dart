import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(new ListaTarefa());
}

class ListaTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ListaScreen(),
    );
  }
}

class ListaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return new Row(
      children: <Widget>[
        IconButton(
            icon: new Icon(
              tarefa.concluida
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.black,
            ),
            iconSize: 42.0,
            onPressed: () => setState(() {
                  tarefa.concluida = true;
                })),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tarefa.nome,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(tarefa.data.toIso8601String())
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Lista de tarefas'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18.0),
            child:
                TextField(controller: controller, onSubmitted: adicionaTarefa),
          ),
          ButtonBar(),
          Expanded(
              child: ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (_, index) {
              return getItem(tarefas[index]);
            },
          ))
        ],
      ),
    );
  }
}

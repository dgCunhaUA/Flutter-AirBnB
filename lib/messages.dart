import 'package:flutter/material.dart';
import 'chat.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  int _selected = 0;

  final List _messages = [
    ["João", "owner.png", "Porto", "Viagem em curso", "04/10/2022"],
    [
      "Catarina",
      "owner.png",
      "Vigo",
      "Viagem concluída • 27-29 de set. de 2021",
      "27/09/2022"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const Padding(
          padding: EdgeInsets.only(top: 50, left: 30),
          child: Text(
            "Caixa de Entrada",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            TextButton(
              child: Text("Mensagens",
                  style: _selected == 0
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)
                      : const TextStyle(fontWeight: FontWeight.normal)),
              onPressed: () {
                setState(() {
                  _selected = 0;
                });
              },
            ),
            TextButton(
              child: Text("Notificações",
                  style: _selected == 1
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)
                      : const TextStyle(fontWeight: FontWeight.normal)),
              onPressed: () {
                setState(() {
                  _selected = 1;
                });
              },
            ),
          ],
        ),
      ),
      Expanded(
          child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              LayoutBuilder(builder: (context, constraints) {
                if (_selected == 0) {
                  return Column(
                      children: _messages
                          .map((msg) => _displayMessages(msg))
                          .toList());
                } else {
                  return const Center(
                    child: Text("Não tem notificações"),
                  );
                }
              })
            ]),
          ),
        ],
      ))
    ]));
  }

  Widget _displayMessages(msg) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Chat(
                    name: msg[0],
                    date: msg[4],
                    image: msg[1],
                  ))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('images/${msg[1]}')),
              ),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: msg[0],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: ' • ${msg[2]}'),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            msg[3],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

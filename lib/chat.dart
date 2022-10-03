import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String name;
  final String date;
  final String image;
  final String myname = "Diogo";

  const Chat(
      {Key? key, required this.name, required this.date, required this.image})
      : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<String> _sentMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(widget.date,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'images/${widget.image}',
                              height: 120,
                              width: 100,
                            )),
                      ),
                      const Flexible(
                          flex: 4,
                          child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")))
                    ],
                  ),
                  Column(
                      children: _sentMessages
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          'images/me.jpeg',
                                        )),
                                  ),
                                  Flexible(
                                      flex: 4,
                                      child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(e))),
                                ],
                              ),
                            ),
                          )
                          .toList())
                ]))
              ],
            ),
          ),
          TextField(
            onSubmitted: (value) {
              setState(() {
                _sentMessages.add(value);
              });
            },
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none),
              hintText: "Escrever uma mensagem",
              hintStyle: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(
                Icons.photo,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page ####'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _selected = "Praias";

  final List _cardList = [
    ["Nazaré, Portugal", "casa1.jpeg", 4.7, "Praia da Nazaré", "13-21 Oct", 93],
    ["Nazaré, Portugal", "casa1.jpeg", 4.8, "Praia da Nazaré", "13-21 Oct", 93]
  ];

  final List _cardListPraias = [
    ["Vigo, Espanha", "casa2.jpeg", 4.81, "Praia das Ratas", "1-6 Nov", 53],
    ["Porto, Portugal", "casa3.jpeg", 4.62, "Praia do Ourigo", "6-11 Nov", 128]
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*Widget _createCard(String title, String img, double rank, String local,
      String date, int price) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage('images/$img')),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: rank.toString(),
                                  style: const TextStyle(color: Colors.black)),
                              const WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                size: 14,
                              ))
                            ]),
                          ),
                        )
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          local,
                          style: const TextStyle(color: Colors.grey),
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          date,
                          style: const TextStyle(color: Colors.grey),
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '€ $price',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const TextSpan(text: ' noite'),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  Widget _createCard(List cardInfo) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage('images/${cardInfo[1]}')),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cardInfo[0],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          alignment: Alignment.centerRight,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: cardInfo[2].toString(),
                                  style: const TextStyle(color: Colors.black)),
                              const WidgetSpan(
                                  child: Icon(
                                Icons.star,
                                size: 14,
                              ))
                            ]),
                          ),
                        )
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardInfo[3],
                          style: const TextStyle(color: Colors.grey),
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardInfo[4],
                          style: const TextStyle(color: Colors.grey),
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '€ ${cardInfo[5]}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const TextSpan(text: ' noite'),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createFilterCard(String title, IconData icon) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(title == _selected
            ? Colors.black
            : const Color.fromARGB(255, 138, 138, 138)),
      ),
      onPressed: () => {
        setState(() {
          _selected = title;
        }),
      },
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 14,
          ),
          Text(
            title,
            style: title == _selected
                ? const TextStyle(color: Colors.black)
                : const TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Text("Pesquisar"),
          SizedBox(
            height: 65,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _createFilterCard("Praias", Icons.beach_access),
                    _createFilterCard("Piscinas Incríveis", Icons.pool),
                    _createFilterCard("Deserto", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                    _createFilterCard("Ilhas", Icons.deselect_rounded),
                  ]),
                ),
              ],
            ),
          ),
          //const Divider(),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  //_createCard("Nazaré, Portugal", "casa1.jpeg", 4.7,
                  //    "Praia da Nazaré", "13-21 Oct", 93),
                  //_createCardList(),
                  LayoutBuilder(builder: (context, constraints) {
                    if (_selected == "") {
                      return Column(
                          children: _cardList
                              .map((cardInfo) => _createCard(cardInfo))
                              .toList());
                    } else if (_selected == "Praias") {
                      return Column(
                          children: _cardListPraias
                              .map((cardInfo) => _createCard(cardInfo))
                              .toList());
                    } else {
                      return Text("Erro");
                    }
                  })
                ]),
              ),
            ],
          ))
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: 'Viagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

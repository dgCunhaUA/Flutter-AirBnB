import 'package:flutter/material.dart';

import 'airbnb_details.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExplorePage();
}

class _ExplorePage extends State<Explore> {
  String _selected = "Praias";
  String _searchString = "";

  final List _cardList = [
    ["Braga, Portugal", "casa4.jpeg", 5.0, "Surribes", "13-21 Oct", 270],
  ];

  final List _cardListPraias = [
    ["Vigo, Espanha", "casa2.jpeg", 4.81, "Praia das Ratas", "1-6 Nov", 53],
    ["Porto, Portugal", "casa3.jpeg", 4.62, "Praia do Ourigo", "6-11 Nov", 128],
    ["Nazaré, Portugal", "casa1.jpeg", 4.7, "Praia da Nazaré", "13-21 Oct", 93],
  ];

  static const List<String> _searchOptions = <String>[
    'Viseu',
    'Aveiro',
    'Porto',
  ];

  Widget _createCard(List cardInfo) {
    return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AirbnbDetailsScreen(
                      title: cardInfo[0],
                      image: cardInfo[1],
                      location: cardInfo[3],
                    ))),
        child: Container(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              alignment: Alignment.centerRight,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: cardInfo[2].toString(),
                                      style:
                                          const TextStyle(color: Colors.black)),
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
        ));
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
          Padding(
            //padding: const EdgeInsets.all(20),
            padding:
                const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 10),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _searchOptions.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                setState(() {
                  _searchString = selection;
                });
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 50,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    onChanged: (String selection) {
                      setState(() {
                        _searchString = selection;
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
                      hintText: "Para onde?",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 65,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _createFilterCard("Praias", Icons.beach_access),
                    _createFilterCard("Piscinas Incríveis", Icons.pool),
                    _createFilterCard("Surf", Icons.surfing),
                    _createFilterCard("Arquitetura", Icons.architecture),
                    _createFilterCard("Ártico", Icons.ac_unit),
                    _createFilterCard("Quintas", Icons.agriculture),
                    _createFilterCard("Pousadas", Icons.coffee),
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
                  LayoutBuilder(builder: (context, constraints) {
                    if (_selected == "Praias") {
                      return Column(
                          children: _cardListPraias
                              .map((cardInfo) => cardInfo[0]
                                      .toString()
                                      .toLowerCase()
                                      .contains(_searchString.toLowerCase())
                                  ? _createCard(cardInfo)
                                  : const SizedBox.shrink())
                              .toList());
                    } else if (_selected == "Piscinas Incríveis") {
                      return Column(
                          children: _cardList
                              .map((cardInfo) => _createCard(cardInfo))
                              .toList());
                    } else {
                      return const Text("Erro");
                    }
                  })
                ]),
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

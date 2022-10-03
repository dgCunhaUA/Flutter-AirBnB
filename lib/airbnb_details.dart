import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AirbnbDetailsScreen extends StatelessWidget {
  final String title;
  final String image;

  const AirbnbDetailsScreen(
      {super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.file_upload,
                    size: 26.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.favorite),
                )),
          ],
        ),
        body: Expanded(
            child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(children: [
                  Image.asset('images/$image'),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 20, right: 30, bottom: 10),
                    child: Row(
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 5, right: 30, bottom: 20),
                    child: Row(
                      children: [Text(title)],
                    ),
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 15, right: 30, bottom: 20),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 3,
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Casa de férias inteiro hospedado por Sergio\n\n',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          '2 hóspedes • 1 quarto • 2 camas • 1 casa de banho',
                                      style: TextStyle()),
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset('images/owner.png')),
                            )) //Container(child: Image.asset('images/$image')),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, top: 20, right: 30, bottom: 30),
                    child: ReadMoreText(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      trimLines: 4,
                      style: TextStyle(color: Colors.black),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Mostrar mais',
                      trimExpandedText: ' Mostrar menos',
                      moreStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      lessStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 20, right: 30, bottom: 10),
                      child: Column(children: [
                        Row(children: const [
                          Text(
                            "O que este espaço oferece",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, right: 30, bottom: 0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.kitchen,
                                size: 30.0,
                              ),
                              Text("Cozinha")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, right: 30, bottom: 0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.tv,
                                size: 30.0,
                              ),
                              Text("HDTV")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, right: 30, bottom: 0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.pool,
                                size: 30.0,
                              ),
                              Text("Piscina")
                            ],
                          ),
                        )
                      ]))
                ])
              ]),
            ),
          ],
        )));
  }
}

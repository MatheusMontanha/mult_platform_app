import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  //debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Primeiro App Desktop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Text textAppBar(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: color,
      ),
    );
  }

  Color primaryColor = Color(0xFF8A05BE);
  Color secundaryColor = Color(0xFF767676);

  Scaffold scanffoldMinSize(
      AppBar appBar, Drawer drawer, bool size, double value) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      drawer: drawer,
      body: SingleChildScrollView(
        child: centralContent(size, value),
      ),
    );
  }

  Scaffold scaffoldDefault(AppBar appBar, bool size, double value) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: centralContent(size, value),
      ),
    );
  }

  FlatButton flatButtonAppBar() {
    return FlatButton(
      color: primaryColor,
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 135,
        child: Text(
          "Quero ser Nubank",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Drawer drawerMinSize() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: textAppBar("Início", primaryColor),
          ),
          ListTile(
            title: textAppBar("Conta Digital", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Cartão de Crédito", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Rewards", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Empréstimos", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Sobre Nós", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Carreiras", secundaryColor),
          ),
          ListTile(
            title: textAppBar("Login", primaryColor),
          ),
          flatButtonAppBar(),
        ],
      ),
    );
  }

  AppBar appBarRow() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    textAppBar("Início", primaryColor),
                    textAppBar("Conta Digital", secundaryColor),
                    textAppBar("Cartão de Crédito", secundaryColor),
                    textAppBar("Rewards", secundaryColor),
                    textAppBar("Empréstimos", secundaryColor),
                    textAppBar("Sobre Nós", secundaryColor),
                    textAppBar("Carreiras", secundaryColor),
                    textAppBar("Login", primaryColor),
                    flatButtonAppBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container centralContent(bool size, double value) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
          ),
          content(
              "Conta do Nubank",
              "Nossa conta\ndigital. Tudo que\numa conta tem,\nmenos o que não\nprecisa.",
              size,
              value,
              "assets/phone_down.png",
              Colors.grey,
              primaryColor,
              secundaryColor),
          content(
              "Cartão de Crédito",
              "Moderno, simples\ne gratuito. Tudo\npara deixar o\ncontrole nas suas\nmãos.",
              size,
              value,
              "assets/hand_card_nubank.png",
              Colors.white,
              primaryColor,
              secundaryColor),
          content(
              "Rewards",
              "Um programa de\npontos justo\ne com\nrecompensas que\nvocê vai querer.",
              size,
              value,
              "assets/phone_nubank.png",
              primaryColor,
              Colors.white,
              Color(0xFFCA8EE2)),
          content(
              "Rewards",
              "Reinventando a\nrelação das pessoas\ncom o dinheiro",
              size,
              value,
              "assets/people.jpg",
              Colors.white,
              Colors.white,
              secundaryColor),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }

  Container content(
      String texts,
      String secondTexts,
      bool size,
      double value,
      String path,
      Color colorContainer,
      Color colorFirtsText,
      Color colorsSecondText) {
    final firtText = Text(
      texts,
      style: TextStyle(fontSize: 35, color: colorFirtsText),
    );

    final secondText = Text(
      secondTexts,
      style: TextStyle(fontSize: 32, color: colorsSecondText),
    );

    final image = Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * value,
      child: Image.asset(path),
    );
    return Container(
      color: colorContainer,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: size
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: firtText,
                        top: 10,
                      ),
                      Positioned(
                        child: secondText,
                        top: 50,
                      ),
                    ],
                  ),
                ),
                image,
              ],
            )
          : Column(
              children: <Widget>[
                firtText,
                secondText,
                Container(
                  height: 50,
                  width: 50,
                ),
                image,
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          final appBar = AppBar(
            title: Text(
              "Menu",
              style: TextStyle(color: Colors.black),
            ),
            leading: new IconButton(
                icon: new Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
            backgroundColor: Colors.white,
          );
          if (constraints.maxWidth < 550) {
            return scanffoldMinSize(appBar, drawerMinSize(), false, 0.7);
          } else {
            return scanffoldMinSize(appBar, drawerMinSize(), true, 0.5);
          }
        } else {
          return scaffoldDefault(appBarRow(), true, 0.3);
        }
      },
    );
  }
}

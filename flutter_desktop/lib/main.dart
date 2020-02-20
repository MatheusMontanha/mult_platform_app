import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
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

  Text textAppBarBottom(String text, Color color) {
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
            title: textAppBarBottom("Início", primaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Conta Digital", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Cartão de Crédito", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Rewards", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Empréstimos", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Sobre Nós", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Carreiras", secundaryColor),
          ),
          ListTile(
            title: textAppBarBottom("Login", primaryColor),
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
                    textAppBarBottom("Início", primaryColor),
                    textAppBarBottom("Conta Digital", secundaryColor),
                    textAppBarBottom("Cartão de Crédito", secundaryColor),
                    textAppBarBottom("Rewards", secundaryColor),
                    textAppBarBottom("Empréstimos", secundaryColor),
                    textAppBarBottom("Sobre Nós", secundaryColor),
                    textAppBarBottom("Carreiras", secundaryColor),
                    textAppBarBottom("Login", primaryColor),
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
          bottomPage(size, value),
        ],
      ),
    );
  }

  Container bottomPage(bool size, double value) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      alignment: Alignment.topLeft,
      child: Container(
        width: size
            ? MediaQuery.of(context).size.width * 0.6
            : MediaQuery.of(context).size.width,
        child: size ? contentBottomPageDefault() : contentBottomPageMinSize(),
      ),
    );
  }

  Column contentBottomPageMinSize() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        textAppBarBottom("NUBANK", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Sobre Nós", Colors.white),
        textAppBarBottom("Carreira", Colors.white),
        textAppBarBottom("Perguntas Frequentes", Colors.white),
        textAppBarBottom("Contato", Colors.white),
        textAppBarBottom("Imprensa", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Produtos", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Conta Digital", Colors.white),
        textAppBarBottom("Cartão de Crédito", Colors.white),
        textAppBarBottom("Rewards", Colors.white),
        textAppBarBottom("Emprestimos", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Explore", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Comunidade", Colors.white),
        textAppBarBottom("Newsletter", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("Pelo Mundo", Colors.white),
        SizedBox(
          height: 30,
        ),
        textAppBarBottom("México", Colors.white),
        textAppBarBottom("Argentina", Colors.white),
      ],
    );
  }

  Row contentBottomPageDefault() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("NUBANK", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Sobre Nós", Colors.white),
            textAppBarBottom("Carreira", Colors.white),
            textAppBarBottom("Perguntas Frequentes", Colors.white),
            textAppBarBottom("Contato", Colors.white),
            textAppBarBottom("Imprensa", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Explore", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Comunidade", Colors.white),
            textAppBarBottom("Newsletter", Colors.white),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Produtos", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Conta Digital", Colors.white),
            textAppBarBottom("Cartão de Crédito", Colors.white),
            textAppBarBottom("Rewards", Colors.white),
            textAppBarBottom("Emprestimos", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("Pelo Mundo", Colors.white),
            SizedBox(
              height: 30,
            ),
            textAppBarBottom("México", Colors.white),
            textAppBarBottom("Argentina", Colors.white),
          ],
        )
      ],
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

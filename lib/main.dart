import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toast/toast.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _x = GlobalKey<ScaffoldState>();
  String str = 'Flutter Demo';
  int _radioValue=0;
  int _currentIndex;
  String result ;
  Color resultColor ;

  List imageList = [
    'images/s1.jpg',
    'images/s2.jpg',
    'images/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _x,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 1),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.deepOrangeAccent[100],
              Colors.pink[100],
              Colors.deepOrangeAccent[100],
            ],
          )),
        ),
        title: Text(
          str,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: null,
    );
  }

  Padding buildPaddingmanychoiseMother() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Guess The Ans : 2 + 2 = ?',
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ) ,
          buildRowTobuildAns(3,'Wrong Ans!',Colors.red),
          buildRowTobuildAns(4,'Correct Ans!',Colors.green),
          buildRowTobuildAns(5,'Wrong Ans!',Colors.red),
        ],
      ),
    );
  }
  MyDiolfge(){
    var alert = AlertDialog();

  }
  Row buildRowTobuildAns(int value,String res , Color resColor) {
    return Row(
            children: [
              Radio(
                value:value,
                groupValue: _radioValue ,
                onChanged: (value){
                  setState(() {
                    value=_radioValue;
                    result=res;
                    resultColor = resColor;
                    bulidDialog(context,'ooooh doilg');
                  });
                },
              ),
              Text('$value')
            ],
          );
  }

  Center motherBuildCarouselSlider() {
    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'This is my simple app',
            textAlign: TextAlign.center,
          ),
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (int index, _) {
                setState(() {
                  _currentIndex = index;
                });
              },
              enlargeCenterPage: true,
              height: 190,
              initialPage: 0,
              autoPlay: true,
              pauseAutoPlayInFiniteScroll: false,
              autoPlayAnimationDuration: Duration(
                seconds: 2,
              ),
            ),
            items: imageList.map((e) {
              return Container(
                width: double.infinity,
                //  margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  e,
                  fit: BoxFit.fill,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainerToBuildSmallCircule(0),
              buildContainerToBuildSmallCircule(1),
              buildContainerToBuildSmallCircule(2),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CarouselSlider.builder(
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            options: CarouselOptions(
              height: 190,
              initialPage: 0,
            ),
            itemCount: imageList.length,
          )
        ],
      ),
    );
  }

  Container buildContainerToBuildSmallCircule(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.redAccent : Colors.green,
      ),
    );
  }

  RaisedButton buildRaisedButtontoBuildSnackBar() {
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {
        setState(() {
          str = "";
        });
        final sBar = SnackBar(
          action: SnackBarAction(
            textColor: Colors.white,
            label: "UNDO!",
            onPressed: () {
              setState(() {
                str = 'Flutter Demo';
              });
            },
          ),
          content: Text('Snack Bar Text'),
        );
        _x.currentState.showSnackBar(sBar);
      },
    );
  }

  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
      child: Text('Clic Here To Show Dialog'),
      onPressed: () {
        bulidDialog(context , 'Ans is 4');
      },
    );
  }

  void bulidDialog(BuildContext context , String str ) {
    final AlertDialog alert = AlertDialog(
        title: Text("Notification"),
        content: Container(
          height: 120,
          child: Column(
            children: [
              Text('$result'),
              Divider(
                color: Colors.black,
              ),
              Text(str),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  color: Colors.red,
                  child: Text('Enter to colse'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
      barrierDismissible: false,
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Pink',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.pink)),
            TextSpan(
                text: '/',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black)),
            TextSpan(
                text: 'Amber',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.amber)),
          ],
        ),
      ),
      onPressed: () {
        Toast.show('Pink/Amber', context, duration: Toast.LENGTH_LONG);
      },
    );
  } //to build flat button and text span
}

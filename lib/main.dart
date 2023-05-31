import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomo/global.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: ColorsPalette.black,
            ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Homepage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsPalette.yellow,
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 90,
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 96, horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                      child: RippleAnimation(
                    repeat: true,
                    color: Colors.grey.shade300,
                    minRadius: 90,
                    ripplesCount: 8,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 166,
                        height: 166,
                        child: Image.asset(
                          'images/car.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text('Tidak terhubung ke mobil',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(
                                    'periksa apakah daya perangkat menyala dan sambungkan perangkat melalui bluetooth',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16)))
                          ])),
                  Button(
                    buttonText: 'SAMBUNGKAN',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Result()),
                      );
                    },
                  )
                ])));
  }
}

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          ListTile(
              minVerticalPadding: 0,
              horizontalTitleGap: 8,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  'images/car-small.png',
                  fit: BoxFit.contain,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Honda Brio Satya',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'tersambung',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              )),
          RecentTransaction()
        ],
      ),
    ));
  }
}

class RecentTransaction extends StatelessWidget {
  RecentTransaction({super.key});

  final List<Transaction> _elements = [
    Transaction('Kondisi Aki', '11 volt', 'null'),
    Transaction('Temperatur standar', 'mesin dingin coolant temperatur selisih 10C dengan ect dan limit panas 98 c', 'gagal'),
    Transaction('Radiator Fan', 'radiator fan status error apabila tidak nyala dan radiator fan status error apabila fan tinggi tidak nyala di 98 c', 'berhasil'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _elements.length,
        itemBuilder: (context, index) {
          var item = _elements[index];
          return ListTile(
              shape: Border(
        top: BorderSide(color: Colors.grey.shade200, width: 1),
    ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 4, right: 32),
                  child:  Text(
                    item.result,
                    style: const TextStyle(
                        fontSize: 13.0, color: Colors.grey),
                  ))
                 
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  item.status == 'berhasil'
                    ? const Icon(
                        CupertinoIcons.checkmark_alt_circle_fill,
                        color: Colors.green,
                        size: 40,
                      )
                    : item.status == 'gagal' 
                      ? const Icon(
                          CupertinoIcons.exclamationmark_triangle_fill,
                          color: Colors.red,
                          size: 40,
                        )
                    : Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text('N/A', style: TextStyle(
                        fontSize: 13.0, color: Colors.grey, fontWeight: FontWeight.w700)),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300)
                        )
                      )
                
                ],
              ),
            
          );
        });
  }
}

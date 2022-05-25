import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_world/blockchain/blockchain.dart';
import 'package:hello_world/machinelearning/predModel.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double h = 0.0, w = 0.0;
  double kh = 1 / 759.2727272727273;
  double kw = 1 / 392.72727272727275;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    h = size.height;
    w = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              'Flutter/Block Chain',
            )),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    

                    Container(
                      color: Colors.brown.shade300,
                      height: 50 * kh * h,
                      width: 250 * kw * w,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlockChain()));
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.cube,
                          color: Colors.white,
                          //size: 90,
                        ),
                        label: Text('BlockChain',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50 * kh * h,
                    ),
                    Container(
                      color: Colors.brown.shade400,
                      height: 50 * kh * h,
                      width: 250 * kw * w,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PredModel()));
                        },
                        icon: FaIcon(
                              FontAwesomeIcons.robot,
                              color: Colors.white,
                              //size: 90,
                            ),
                        label: Text('Machine Learning',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

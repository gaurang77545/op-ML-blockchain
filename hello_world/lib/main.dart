import 'package:flutter/material.dart';
import 'package:hello_world/blockchain/contract_linking.dart';
import 'package:hello_world/menuscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeData _buildAppTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContractLinking(),
      child: MaterialApp(
          title: 'Hello World Dapp',
          debugShowCheckedModeBanner: false,
          theme: _buildAppTheme(),
          home: const MenuScreen()),
    );
  }
}

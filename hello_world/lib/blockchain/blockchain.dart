import 'package:flutter/material.dart';
import 'package:hello_world/blockchain/contract_linking.dart';
import 'package:provider/provider.dart';

class BlockChain extends StatefulWidget {
  const BlockChain({Key? key}) : super(key: key);

  @override
  State<BlockChain> createState() => _BlockChainState();
}

class _BlockChainState extends State<BlockChain> {
  TextEditingController yourNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Getting the value and object or contract_linking
    var contractLink = Provider.of<ContractLinking>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Block Chain "),
          centerTitle: true,
            backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
         
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: contractLink.isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Hello ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 52),
                              ),
                              Text(
                                contractLink.deployedName!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 52,
                                    color: Colors.tealAccent),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: TextFormField(
                              controller: yourNameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Your Name",
                                  hintText: "What is your name ?",
                                  icon: Icon(Icons.drive_file_rename_outline)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              child: const Text(
                                'Set Name',
                                style: TextStyle(fontSize: 30),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () async {
                                await contractLink
                                    .setName(yourNameController.text);
                                yourNameController.clear();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

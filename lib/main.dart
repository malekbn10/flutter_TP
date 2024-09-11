import 'package:flutter/material.dart';

void main() {
  runApp( ConvertisseurApp());
}
class ConvertisseurApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home:ConvertisseurHome() ,
      debugShowCheckedModeBanner: false,
    );
  }
  }
class ConvertisseurHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _ConvertisseurHomeState();
 
}
class _ConvertisseurHomeState extends State<ConvertisseurHome>{
  String _selectedConversion = "EuroToDinar";
  TextEditingController _controller = TextEditingController();
  double _resultat = 0.0;
  String devise = "Euro";

  void _convertir(){
    setState(() {
      double montant =double.tryParse(_controller.text) ?? 0;
      if (_selectedConversion =="EuroToDinar") {
        _resultat = montant * 3.4;
      } else {
        _resultat = montant / 3.4;
        
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TP1 App"),
          backgroundColor: Colors.purple,

        ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(16.0),
                  child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      TextField(controller: _controller, keyboardType: TextInputType.number,decoration: InputDecoration(labelText: "Montant")),
                      SizedBox(height: 20),
                      RadioListTile(value: "EuroToDinar", title: Text("Euro -> dinar"),groupValue: _selectedConversion, onChanged: (value){
                        setState(() {
                          _selectedConversion = value.toString();
                          devise = "Dinar";
                        });
                      }),
                      RadioListTile(value: "DinarToEuro", title: Text("dinar -> Euro"),groupValue: _selectedConversion, onChanged: (value){
                        setState(() {
                          _selectedConversion = value.toString();
                          devise = "Euro";

                        });
                      }),
                      SizedBox(height: 20),
                      Text("Le résultat est ${_resultat.toStringAsFixed(3)}  $devise !",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
              ),
                      SizedBox(height: 20),
                ElevatedButton(
                onPressed: _convertir,
                child: Text("CONVERTIR"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 206, 148, 216),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),

                    ],
                  ),
                  
          ),
        ),
        );
    
    
  }
}

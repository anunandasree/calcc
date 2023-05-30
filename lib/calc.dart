import 'package:flutter/material.dart';
class calc extends StatefulWidget {

  const calc({Key? key}) : super(key: key);

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  buttonPressed(
      String buttonText
      ) {
    if (buttonText == "CLR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    if (buttonText == "DEL") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }

    else if (
    buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "*"||buttonText=="%"
    ) {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if (
    buttonText == "."
    ) {
      if (
      _output.contains(".")
      ) {
        print('Already contains a decimals');
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if (
    buttonText == "="
    ) {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand =="%") {
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton(String buttonText){
    return Expanded(child: OutlinedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),),
      ),
      onPressed: ()=>
          buttonPressed(buttonText),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CALCULATOR',style: TextStyle(color: Colors.white
        ),),
        leading: IconButton(
          onPressed: (){},
          icon:Icon(Icons.calculate),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body:Container(
          child: Column(
            children: [
              Container(alignment:Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: Text(output,style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
              Expanded(child: Divider(),),
              Column(children: [
                Row(
                  children: [
                    buildButton("CLR"),
                    buildButton("DEL"),
                    buildButton("%"),
                    buildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("*"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("<=>"),
                    buildButton("0"),
                    buildButton("."),
                    buildButton("="),
                  ],
                ),
              ],
              ),
            ],
          )
      ),
    );
  }
}

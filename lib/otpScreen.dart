import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  var pinTwoController = TextEditingController();
  var pinThreeController = TextEditingController();
  var pinFourController = TextEditingController();

  var outLineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.transparent));

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildExitButton(),
          Expanded(
              child: Container(
            alignment: Alignment(0, 0.5),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildSecurityText(),
                    SizedBox(height: 40.0),
                    buildPinRow(),

                  ],
                ),
          )),
          buildNumberPad()
        ],
      ),
    );
  }


  buildNumberPad() {
    return Expanded(child: Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                  n:1,
                  callback:(){
                    pinIndexSetUp("1");
                  }
                ),
                KeyBoardNumber(
                    n:2,
                    callback:(){pinIndexSetUp("2");}
                ),
                KeyBoardNumber(
                    n:3,
                    callback:(){pinIndexSetUp("3");}
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                    n:4,
                    callback:(){pinIndexSetUp("4");}
                ),
                KeyBoardNumber(
                    n:5,
                    callback:(){pinIndexSetUp("5");}
                ),
                KeyBoardNumber(
                    n:6,
                    callback:(){pinIndexSetUp("6");}
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyBoardNumber(
                    n:7,
                    callback:(){pinIndexSetUp("7");}
                ),
                KeyBoardNumber(
                    n:8,
                    callback:(){pinIndexSetUp("8");}
                ),
                KeyBoardNumber(
                    n:9,
                    callback:(){pinIndexSetUp("9");}
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  child: MaterialButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                ),
                KeyBoardNumber(
                    n:0,
                    callback:(){pinIndexSetUp("0");}
                ),
                Container(
                  width: 60,
                  child: MaterialButton(
                    height: 60.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                    ),
                    onPressed: (){
                      clearPin();
                    },
                    child: Icon(Icons.cancel,color: Colors.white.withOpacity(0.5),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  clearPin(){
    if(pinIndex==0)
      pinIndex=0;
    else if(pinIndex==4){
      setPin(pinIndex, "");
      currentPin[pinIndex-1]="";
      pinIndex--;
    }else{
      setPin(pinIndex, "");
      currentPin[pinIndex-1]="";
      pinIndex--;
    }
  }

  pinIndexSetUp(String text){
    if(pinIndex==0)
      pinIndex=1;
    else if(pinIndex<4)
      pinIndex++;

    setPin(pinIndex,text);
    currentPin[pinIndex-1]=text;
    String strPin="";
    currentPin.forEach((element) {
      strPin+=element;
    });
    if(pinIndex==4)print(strPin);
  }

  setPin(int n,String text){
    switch(n){
      case 1:
        pinOneController.text=text;
        break;
      case 2:
        pinTwoController.text=text;
        break;
      case 3:
        pinThreeController.text=text;
        break;
      case 4:
        pinFourController.text=text;
        break;
    }
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50,
            minWidth: 50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  buildSecurityText() {
    return Text("Security Pin",style: TextStyle(
      color: Colors.white70,
      fontSize: 21.0,
      fontWeight: FontWeight.bold
    ),);
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinNumber(
            outlineInputBorder:outLineInputBorder,
            textEditingController:pinOneController
        ),
        PinNumber(
            outlineInputBorder:outLineInputBorder,
            textEditingController:pinTwoController
        ),
        PinNumber(
            outlineInputBorder:outLineInputBorder,
            textEditingController:pinThreeController
        ),
        PinNumber(
            outlineInputBorder:outLineInputBorder,
            textEditingController:pinFourController
        )

      ],
    );
  }


}

class KeyBoardNumber extends StatelessWidget {

  final int n;
  final VoidCallback callback;

  KeyBoardNumber({required this.n,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purpleAccent.withOpacity(0.1 )
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed:callback,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0)
        ),
        height: 90.0,
        child: Text("$n",textAlign: TextAlign.center,style: TextStyle(
          fontSize: 24.0 * MediaQuery.of(context).textScaleFactor,
          color: Colors.white,
          fontWeight: FontWeight.bold

        ),),

      ),
    );
  }
}


class PinNumber extends StatelessWidget {

  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  PinNumber({required this.textEditingController,required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          filled: true,
          fillColor: Colors.white,
          border: outlineInputBorder
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: Colors.black
        ),
      ),
    );
  }
}


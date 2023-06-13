import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiCalculater extends StatefulWidget {
  const BmiCalculater({super.key});

  @override
  State<BmiCalculater> createState() => _BmiCalculater();
}

class _BmiCalculater extends State<BmiCalculater> {
  double _height = 170;
  double _weight = 50;
  double _bmi = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    Widget messageBox ;
    if (_bmi == 0) {
      messageBox =  Text("");

    }
    else {
      messageBox =  Text("BMI is ${_bmi.toStringAsFixed(2)} and $_message",style: TextStyle(fontSize: 25),);
    }
    return Scaffold(
      appBar: AppBar(
          title: Text('BMI Calcultator'),
          backgroundColor:Colors.red
      ),
      body: SingleChildScrollView(
          child:Container(
              width: double.infinity,
              padding: EdgeInsets.all(32),
              child:Column(
                  children: [
                    Image.network("https://nutrition.health.gov.lk/wp-content/uploads/2020/12/BMI-1024x569.png"),
                    Text("BMI Calculator", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
                    Text("We care about your health", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                    SizedBox(
                      height: 32,
                    ),

                    Text("Height ${_height.toStringAsFixed(2)} (cm)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),
                    Container(
                        padding:EdgeInsets.only(left:16,right:16),
                        child:Slider(
                            min: 30.0,
                            max: 250.0,
                            onChanged: (height){
                              setState((){
                                _height = height;
                              });
                            },
                            value:_height
                        )
                    ),
                    Text("Weight ${_weight.toStringAsFixed(2)} (kg)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),
                    Container(
                        padding:EdgeInsets.only(left:16,right:16),
                        child:Slider(
                            min: 50,
                            max: 200,
                            onChanged: (weight){
                              setState((){
                                _weight = weight;
                              });
                            },
                            value:_weight
                        )
                    ),
                    SizedBox(height: 16,),
                    messageBox,
                    Container(
                        child: ElevatedButton.icon(
                          onPressed: (){
                            double bmi = _weight/((_height/100)*(_height/100));
                            String message = "";
                            if(bmi < 18.5){
                              message = "You are underweight";
                            }else if(bmi < 25){
                              message ="Normal";
                            }
                            else if(bmi <= 30){
                              message =  "You are Overweighted";
                            }
                            else{
                              message = "Obesed";
                            }
                            setState(() {
                              _message = message;
                              _bmi = bmi;
                            });
                          },label:Text("Calculate"),
                          icon:Icon(Icons.favorite, color: Colors.white),

                        )
                    )

                  ]
              )

          )
      )
      ,
    );

  }
}

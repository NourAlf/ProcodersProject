import 'package:flutter/material.dart';

import '../costum_widget/borderListTile.dart';
import '../costum_widget/switchWidget.dart';

class SettingPage extends StatefulWidget {


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  bool isSwitchedPin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('Settings',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),onPressed: (){},),
      ),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Security Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ,),
                Padding(
                 padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.9 ,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SwitchWidget(
                          value: isSwitched,
                         label: "Face Id",

                        onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },),
                        SizedBox( height:MediaQuery.of(context).size.height * 0.01),
                        SwitchWidget(label: "pin ", value: isSwitchedPin, onChanged:  (value) {
                          setState(() {
                            isSwitchedPin = value;
                          });
                        },),



                        SizedBox( height:MediaQuery.of(context).size.height * 0.01),

                        Row(
                          children: [
                            Text("change Pin ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)
                            ),
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                          ],
                        )
                      ],
                    ),
                  ),

                ),
                SizedBox(height:MediaQuery.of(context).size.height * 0.03 ,),
                Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ,),
                BorderedListTile(title: "Change Password",trailIcon:  Icon(Icons.arrow_forward_ios),onTap: (){},),

                SizedBox(height:MediaQuery.of(context).size.height * 0.03 ,),

                Text("Approved addresses",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ,),
                BorderedListTile(title: "Manage", onTap: (){},trailIcon:Icon(Icons.arrow_forward_ios) ,),
                SizedBox(height:MediaQuery.of(context).size.height * 0.03 ,),
                Text("Security Keys",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                SizedBox(height:MediaQuery.of(context).size.height * 0.01 ,),
                BorderedListTile(title: 'add Security Keys', onTap: (){},trailIcon: Icon(Icons.arrow_forward_ios),icon:Icon(Icons.add,color: Colors.blue,) ,)

              ],
            ),
          )
      ),
    );
  }
}
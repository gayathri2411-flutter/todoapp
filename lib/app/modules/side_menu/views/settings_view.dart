import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';
import 'package:newuser/app/routes/app_pages.dart';

class SettingsView extends GetView <SideMenuController>{
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/bg_blur.png",
                    ),
                    fit: BoxFit.cover)
                    ),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back,color: Colors.white,))
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 16, right: 16),
                        height: 80,
                        width: Get.width,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 90, left: 32, right: 32),
                            height: Get.height / 1.4,
                            width: Get.width,
                            color: Colors.black.withOpacity(0.6),
                            child: Column(
                              children: [
                                SizedBox(
                                  // height: 40,
                                  width: Get.width,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          // margin: const EdgeInsets.only(left: 20, top: 15),
                                          height: 2,
                                          width: 80,
                                          color: Colors.amber,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, left: 10, right: 10),
                                          child: Text(
                                            "settings",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        Container(
                                          // margin: const EdgeInsets.only(left: 14, top: 15),
                                          height: 2,
                                          width: 80,
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // const Divider(
                                //   color: Colors.white,thickness: 0.5,
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.FORGOT_PASSWORD);
                                  },
                                  child: const SizedBox(
                                    height: 50,
                                    child: Padding(
                                      padding: EdgeInsets.only(top:20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Icon(Icons.key,color: Colors.white,),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text("Change password",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                                        )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(top:10.0),
                                   child: const Divider(
                                    color: Colors.white,thickness: 0.5,
                                                                   ),
                                 ),
                                GestureDetector(
                                  onTap: () {
                                     Fluttertoast.showToast(
          msg: 'Coming soon..',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 14.0);
                                  },
                                  child: const SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Icon(Icons.payment,color: Colors.white,),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text("GooglePay",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                                      )
                                      ],
                                    ),
                                  ),
                                ),
                                 const Divider(
                                  color: Colors.white,thickness: 0.5,
                                ),
                                
                              ],
                            ),
                          ),
                          Positioned(
                              top:70,
                              left: 180,
                              child: Container(
                                
                                height: 70,
                                width: 70,
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.amber,),
                              
                                //   borderRadius: BorderRadius.circular(10)
                                // ),
                                child: Image.asset(
                                  "assets/setting.png",
                                  
                                  fit: BoxFit.fill,
                                  color: Colors.amber,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )),
      );
  }
}

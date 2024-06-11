import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:newuser/app/modules/side_menu/controllers/side_menu_controller.dart';

class MytripView extends GetView <SideMenuController>{
  const MytripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/bg_blur.png",
                    ),
                    fit: BoxFit.cover)),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.only(left:130),
                  child: Icon(Icons.history,size: 30,color: Colors.white,),
                )
              ],
            ),
            
          Obx(
             () => 
             controller.tripLoading.value==false?  SizedBox(
                height: Get.height,
                width: Get.width,
                child: 
                   controller.tripData!.data!.isNotEmpty? ListView.builder(
                    itemCount: controller.tripData!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (c,i){
                    return Container(
                      
                    );
                  }):Center(child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  
                          Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 15),
                                height: 2,
                                width: 70,
                                color: Colors.amber,
                              ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Trip History",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300)),
                          ),
                          Container(
                                margin:
                                    const EdgeInsets.only(left: 10, top: 15),
                                height: 2,
                                width: 70,
                                color: Colors.amber,
                              ),
                        ],
                      ),
                    ],
                  )),
                
              ):const SpinKitSpinningLines(
                      color: Colors.white,
                      size: 70.0,
                    ),
          ),
          ],
        ),
      )
    );
  }
}

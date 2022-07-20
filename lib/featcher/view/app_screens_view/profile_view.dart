import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view_model/get_data_user_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static DataUser getDataViewModel =
      Get.put(DataUser(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DataUser>(
        init: DataUser(),
        builder: (controller) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorSelect.scaffoldBackgroundColorCatagories,
            child: Column(
              children: [
                SizedBox(height: 100,),
                OutlinedButton(onPressed: (){
                      controller.signOut();
                    }, child: Text('Sign Out')),
              ],
            ),
          );
        }
      ),
    );
  }
}
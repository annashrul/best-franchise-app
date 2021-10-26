import 'package:bestfranchise/Configs/colorConfig.dart';
import 'package:bestfranchise/Configs/formConfig.dart';
import 'package:bestfranchise/Configs/stringConfig.dart';
import 'package:bestfranchise/Controllers/profile/profileEditController.dart';
import 'package:bestfranchise/Controllers/user/userController.dart';
import 'package:bestfranchise/Databases/tableDatabase.dart';
import 'package:bestfranchise/Helpers/general/generalHelper.dart';
import 'package:bestfranchise/Views/component/general/buttonComponent.dart';
import 'package:bestfranchise/Views/component/general/fieldComponent.dart';
import 'package:bestfranchise/Views/component/profile/modalImagesProfileComponent.dart';
import 'package:bestfranchise/Views/component/profile/modalPinEditComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';

class ProfileEditWidget extends StatefulWidget {
  final Map<dynamic, dynamic> obj;
  ProfileEditWidget({this.obj});

  @override
  _ProfileEditWidgetState createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final profileEdit =
        Provider.of<ProfileEditController>(context, listen: false);
    final userStorage = Provider.of<UserController>(context, listen: false);
    profileEdit.addressController.text = "";
    profileEdit.fullname.text = userStorage.dataUser[UserTable.fullname];
    profileEdit.emailController.text = userStorage.dataUser[UserTable.email];
    // print(info.infoModel.data.toJson());
  }

  String countryCode = "62";
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    // TextEditingController fullname = new TextEditingController();
    final profileEdit = Provider.of<ProfileEditController>(context);
    final userStorage = Provider.of<UserController>(context, listen: false);

    var id = userStorage.dataUser[UserTable.idUser];
    return Scaffold(
      appBar:
          GeneralHelper.appBarGeneral(context: context, title: "Edit Profile"),
      body: ListView(
        children: [
          Container(
            padding: scale.getPadding(1, 2),
            child: Stack(
              overflow: Overflow.visible,
              alignment: AlignmentDirectional.topCenter,
              fit: StackFit.loose,
              children: [
                Image.network(
                  userStorage.dataUser[UserTable.cover],
                  scale: 0.5,
                  height: scale.getHeight(20),
                  width: scale.getWidth(100),
                  fit: BoxFit.cover,
                ),
                // Image.asset(StringConfig.imgLocal + "icUser.png", scale: 1.5,),
                Positioned(
                  top: scale.getHeight(10),
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image.network(
                          userStorage.dataUser[UserTable.photo],
                          fit: BoxFit.cover,
                          width: scale.getWidth(100),
                          height: scale.getHeight(100),
                        ),
                      ),
                    ),
                    onTap: () => {
                      GeneralHelper.modal(
                          context: context,
                          child: ModalImagesProfileComponent())
                      // print("klik")
                    },
                  ),
                ),
                Positioned(
                    top: scale.getHeight(20),
                    right: scale.getWidth(35),
                    child: GestureDetector(
                      child: Image.asset(
                        StringConfig.imgLocal + "icCamera2.png",
                        scale: 1.5,
                      ),
                      onTap: () => {
                        // GeneralHelper.modal(
                        //     context: context,
                        //     child: ModalImagesProfileComponent())
                        print("klik")
                      },
                    ))
              ],
            ),
          ),
          SizedBox(height: scale.getHeight(5)),
          Container(
            padding: scale.getPadding(1, 2),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1, // 20%
                        child: Image.asset(
                          StringConfig.imgLocal + "icKey.png",
                          scale: 1.5,
                        ),
                      ),
                      Expanded(
                          flex: 9, // 20%
                          child: InkWell(
                              child: new Text(
                                'Ubah PIN',
                                style: TextStyle(
                                  color: ColorConfig.bluePrimary,
                                  fontSize: 20,
                                ),
                              ),
                              onTap: () => {
                                    GeneralHelper.modal(
                                        context: context,
                                        child: ModalPinEditComponent())
                                  })),
                      SizedBox(height: scale.getHeight(2)),
                    ]),
              ),
              // SizedBox(height: scale.getHeight(2)),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "ID Referral : " + userStorage.dataUser[UserTable.referral],
              //     style: TextStyle(
              //       color: ColorConfig.blackPrimary,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              // SizedBox(height: scale.getHeight(1)),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Telpon : " + userStorage.dataUser[UserTable.mobile_no],
              //     style: TextStyle(
              //       color: ColorConfig.blackPrimary,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              // FieldComponent(
              //   controller: profileEdit.idReferralController,
              //   labelText: "ID Referral",
              // ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: profileEdit.fullname,
                labelText: "Nama Lengkap",
                maxLength: 50,
              ),
              SizedBox(height: scale.getHeight(1)),
              // FieldComponent(
              //   controller: profileEdit.noHpController,
              //   labelText: "Nomor Handphone",
              //   maxLength: FormConfig.maxLengthPhone,
              //   isPhone: true,
              //   keyboardType: TextInputType.number,
              //   onTapCountry: (code) {
              //     countryCode = code;
              //   },
              // ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: profileEdit.emailController,
                labelText: "Alamat Email",
                maxLength: 50,
              ),
              SizedBox(height: scale.getHeight(1)),
              FieldComponent(
                controller: profileEdit.addressController,
                labelText: "Alamat Tinggal",
                maxLength: 150,
                maxLines: 3,
              ),
              SizedBox(height: scale.getHeight(1)),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: scale.getPadding(1, 2),
        child: ButtonComponent(
          label: "Simpan",
          labelColor: Colors.white,
          backgroundColor: ColorConfig.redPrimary,
          callback: () => profileEdit.store(context: context, field: {
            "fullname": profileEdit.fullname.text,
            // "mobile_no": profileEdit.noHpController.text,
            "email": profileEdit.emailController.text,
            "address": profileEdit.addressController.text,
            "id": id,
          }),
        ),
      ),
    );
  }
}

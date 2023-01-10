// import 'package:admin_panel_amiyan/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../constants/controllers.dart';
// import '../../helpers/responsiveness.dart';
//
// class AuthenticationPage extends StatelessWidget {
//   const AuthenticationPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Obx(() => Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                   top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
//               child: CustomText(
//                 text: menuController.activeItem.value,
//                 color: Colors.black,
//                 size: 24,
//                 weight: FontWeight.bold,
//               ),
//             )
//           ],
//         ))
//       ],
//     );
//
//     //   Center(
//     //   child: CustomText(text: "Authentication", size: 18, weight: FontWeight.normal, color: Colors.black,),
//     // );
//   }
// }

import 'package:admin_panel_amiyan/layout.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel_amiyan/constants/style.dart';
import 'package:admin_panel_amiyan/routing/routes.dart';
import 'package:admin_panel_amiyan/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    // Expanded(child: Container()),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Вход",
                          style: GoogleFonts.roboto(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Добро пожаловать!",
                      color: lightGrey,
                      size: 18,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _emailController,
                  validator:
                  // _validateEmail,
                  MultiValidator([
                    RequiredValidator(errorText: "*Обязательно"),
                    EmailValidator(
                        errorText: "Не правильный"),
                  ]),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "*Обязательно"),
                    MinLengthValidator(6,
                        errorText: "Больше 6 символов"),
                    MaxLengthValidator(15,
                        errorText: "Меньше 15 символов"),
                  ]),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Пароль",
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        CustomText(
                          text: "Запомнить меня",
                          color: lightGrey,
                          size: 18,
                          weight: FontWeight.normal,
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: "Забыли пароль?",
                        color: active,
                        size: 18,
                        weight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.offAllNamed(RootRoute);
                    }
                    // Get.offAll(() => SiteLayout());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: active, borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CustomText(
                      text: "Вход",
                      color: Colors.white,
                      size: 18,
                      weight: FontWeight.normal,
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // RichText(text: TextSpan(
                //     children: [
                //       TextSpan(text: "Do not have admin credentials? "),
                //       TextSpan(text: "Request Credentials! ", style: TextStyle(color: active))
                //     ]
                // ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

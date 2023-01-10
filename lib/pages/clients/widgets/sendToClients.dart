import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class SendToClients extends StatefulWidget {
  const SendToClients({Key? key}) : super(key: key);

  @override
  State<SendToClients> createState() => _SendToClientsState();
}

class _SendToClientsState extends State<SendToClients> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Обращение клиентам",
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  // Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Проверяйте текст обращения!",
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
                controller: _textController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Обязательно"),
                  MinLengthValidator(50, errorText: "Больше 50 символов"),
                ]),
                maxLines: 100,
                minLines: 10,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Ваше обрашение",
                  hintText:
                      "Здравсвуйте! В нашем магазине идет скидка акция! Покупайте обуви со скидкой 20%! ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  // Get.offAllNamed(rootRoute);
                  // Get.offAll(() => SiteLayout());

                  if (_formKey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'Успешно!',
                          textAlign: TextAlign.center,
                        ),
                        content: const Text(
                            'Ваше обращение клиентам успешно отправлено!'),
                        actions: <Widget>[
                          // TextButton(
                          //   onPressed: () => Navigator.pop(context, 'Cancel'),
                          //   child: const Text('Cancel'),
                          // ),
                          TextButton(
                            onPressed: () {
                              _textController.clear();
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Отправить",
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
    );
  }
}

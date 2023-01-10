import 'package:admin_panel_amiyan/helpers/local_navigator.dart';
import 'package:admin_panel_amiyan/pages/overview/overview.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class GivingBonus extends StatefulWidget {
  const GivingBonus({Key? key}) : super(key: key);

  @override
  State<GivingBonus> createState() => _GivingBonusState();
}

class _GivingBonusState extends State<GivingBonus> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  Pattern num = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  Pattern cost = r'(^(0|[1-9][0-9]*)$)';

  bool isNewUser = false;
  bool checkUser = false;
  bool cutBonus = false;
  final List<String> genderItems = [
    'Мужчина',
    'Женщина',
  ];

  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    isNewUser = false;
    super.initState();
  }

  void pressButton() {
    setState(() {
      isNewUser = !isNewUser;
    });
  }

  void checkUserBonus() {
    setState(() {
      checkUser = true;
    });
  }

  void cutBonusUser() {
    setState(() {
      cutBonus = !cutBonus;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _width = MediaQuery.of(context).size.width < 360;
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
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
                    "Начисление бонуса",
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
              // Row(
              //   children: [
              //     Text("Login",
              //         style: GoogleFonts.roboto(
              //             fontSize: 30, fontWeight: FontWeight.bold)),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Проверяйте личность клиента!",
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
                controller: _phoneController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Обязательно"),
                  MinLengthValidator(11, errorText: "Введите правильный номер"),
                  MaxLengthValidator(12, errorText: "Введите правильный номер"),
                ]),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Номер клиента",
                  hintText: "87771234567",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              if (!isNewUser)
                SizedBox(
                  height: 15,
                ),
              if (!isNewUser)
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: checkUser
                          ? Container(
                              child: Text(
                                "Arman Armanov, 210тг",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            )
                          : Container(),
                    ),
                    if (!checkUser)
                      TextButton(
                        onPressed: () {
                          checkUserBonus();
                        },
                        child: CustomText(
                          text: "Проверить",
                          color: active,
                          size: 16,
                          weight: FontWeight.normal,
                        ),
                      ),
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _costController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Обязательно"),
                  PatternValidator(cost, errorText: "Введите правильный номер"),
                ]),
                keyboardType: TextInputType.number,
                // obscureText: true,
                decoration: InputDecoration(
                    labelText: "Сумма покупки",
                    hintText: "3000",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),

              // if client is new user
              if (isNewUser)
                Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: RequiredValidator(errorText: "*Обязательно"),
                      decoration: InputDecoration(
                          labelText: "Имя клиента",
                          hintText: "Арман",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _surnameController,
                      validator: RequiredValidator(errorText: "*Обязательно"),
                      decoration: InputDecoration(
                          labelText: "Фамилия клиента",
                          hintText: "Арманов",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField2(
                      decoration: InputDecoration(
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Выбирайте пол',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 60,
                      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Пожалуйста выбирайте пол!';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                    DateTimePicker(
                      type: DateTimePickerType.date,
                      controller: _dateController,
                      dateMask: 'd MMM, yyyy',
                      // initialValue: DateTime.now().toString(),
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2023),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Дата рождения',
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        if (date.year > DateTime(2022).year) {
                          return false;
                        }

                        return true;
                      },
                      onChanged: (val) => print(val),
                      validator: (val) {
                        if (_dateController.text.isEmpty) {
                          return 'Пожалуйста выбирайте день рождения!';
                        }
                        return null;
                      },
                      onSaved: (val) => print(val),
                    ),
                    // TextFormField(
                    //   keyboardType: TextInputType.datetime,
                    //   decoration: InputDecoration(
                    //     labelText: "Дата рождения",
                    //   ),
                    // )
                  ],
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isNewUser)
                    _width
                        ? Column(
                            children: [
                              Checkbox(
                                  value: cutBonus,
                                  onChanged: (value) {
                                    cutBonusUser();
                                  }),
                              CustomText(
                                text: "Списать бонусов с бонус карты",
                                color: lightGrey,
                                size: 18,
                                weight: FontWeight.normal,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Checkbox(
                                  value: cutBonus,
                                  onChanged: (value) {
                                    cutBonusUser();
                                  }),
                              CustomText(
                                text: "Списать бонусов с бонус карты",
                                color: lightGrey,
                                size: 18,
                                weight: FontWeight.normal,
                              ),
                            ],
                          ),
                  SizedBox(
                    height: 15,
                  ),
                  if (!isNewUser)
                    TextButton(
                      onPressed: () {
                        pressButton();
                      },
                      child: CustomText(
                        text: "Клиент не зарегистрирован?",
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
                            'Клиенту, Арман Арманов, списано 0тг зачислено 200тг бонусов'),
                        actions: <Widget>[
                          // TextButton(
                          //   onPressed: () => Navigator.pop(context, 'Cancel'),
                          //   child: const Text('Cancel'),
                          // ),
                          TextButton(
                            // onPressed: () => Navigator.pop(context, 'OK'),
                            onPressed: () {
                              _phoneController.clear();
                              _costController.clear();
                              if (isNewUser){
                                pressButton();
                                _dateController.clear();
                                _surnameController.clear();
                                _nameController.clear();
                              }
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
                    text: "Начислять бонус",
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

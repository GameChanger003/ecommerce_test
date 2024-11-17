import 'package:ecommerce_test/features/Auth/controllers/login_number_controller.dart';
import 'package:ecommerce_test/features/Auth/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // TextEditingController number = new TextEditingController();
  final signinController _loginController=Get.put(signinController());

  @override
  Widget build(BuildContext context) {
      void chnagebool(){
   _loginController.isPhone.value=!_loginController.isPhone.value;
    }

    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0,right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //brand
                  const Center(child: Image(image: AssetImage("Assets/logo/company_logo.png"),height: 250,width: 250,)),
                  const SizedBox(height: 16),
                  LoginToogleWidget(loginController: _loginController),
                  const SizedBox(height: 16),
                  const Text("Glad to see you!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16),
                  const Text("Please provide your phone number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
                  const SizedBox(height: 16),
      
                Obx(()=> _loginController.isPhone.value ? numberInputWidget(loginController: _loginController): EmailInputWidget(loginController: _loginController)),
                  
                  const SizedBox(height: 16),
                  OtpButtonWidget(loginController: _loginController),
                  ElevatedButton(onPressed: ()=>Get.to(const SignupPage()), child: const Text("check"))
                ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    super.key,
    required signinController loginController,
  }) : _loginController = loginController;

  final signinController _loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _loginController.number_controller,
        onChanged: (value) => _loginController.email.value=value,
        keyboardType: TextInputType.emailAddress, 
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Email",
          
        ),
      );
  }
}

class LoginToogleWidget extends StatelessWidget {
  const LoginToogleWidget({
    super.key,
    required signinController loginController,
  }) : _loginController = loginController;

  final signinController _loginController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 230,
        decoration: BoxDecoration(
          color:Colors.grey,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            Obx(()=> GestureDetector(
        onTap: () {
          _loginController.changePhone();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 33, vertical: 12),
          decoration: BoxDecoration(
            color: _loginController.isPhone.value ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "Phone",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      ),
      Obx(()=> GestureDetector(
        onTap: () {
          _loginController.changePhone();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
            color: !_loginController.isPhone.value ? Colors.red : Colors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "Email",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      )
          ],
        )
      ),
    );
  }
}

class OtpButtonWidget extends StatelessWidget {
  const OtpButtonWidget({
    super.key,
    required signinController loginController,
  }) : _loginController = loginController;

  final signinController _loginController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _loginController.optsending,
      child: Obx(()=>  Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: _loginController.number.value.length>=10?Colors.red:Colors.red[200],
        ),
        child: const Center(child:  Padding(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Text("Send Code",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
        )),
      ),
      )
    );
  }
}

class numberInputWidget extends StatelessWidget {
  const numberInputWidget({
    super.key,
    required signinController loginController,
  }) : _loginController = loginController;

  final signinController _loginController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _loginController.number_controller,
      onChanged: (value) => _loginController.number.value=value,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), ],
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: "Phone",
      ) ,
    );
  }
}

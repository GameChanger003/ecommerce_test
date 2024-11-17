import 'package:ecommerce_test/features/Auth/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  // TextEditingController number = new TextEditingController();
  final SignupController _signupController=Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _signupController.signup,
        child: Icon(Icons.arrow_forward_outlined,color: Colors.white),
        backgroundColor: Colors.red,),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0,right: 50,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //brand
                  Center(child: const Image(image: AssetImage("Assets/logo/company_logo.png"),height: 250,width: 250,)),
                  const SizedBox(height: 16),
                  const Text("Let's Begin!"),
                  const SizedBox(height: 16),
                  const Text("Please enter your credentials to proceed"),
                  const SizedBox(height: 16),
      
                  TextFormField(
                    controller: _signupController.mailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Email",
                      
                    ),
                  ),
                  const SizedBox(height: 16),

                Obx(()=>  TextFormField(
                    controller: _signupController.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _signupController.isVisible.value,
                    decoration:  InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Password",
                      suffixIcon: IconButton(onPressed: _signupController.visibility, icon: Icon(_signupController.isVisible.value? Icons.visibility_off_sharp: Icons.visibility))
                      
                    ),
                )
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _signupController.referalController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Referal Code (Optional)",
                      
                    ),
                  ),
                  const SizedBox(height: 16),
    
                ],
            ),
          ),
        ),
      ),
    );
  }
}
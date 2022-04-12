import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:task_local_2/pages/reg_page.dart';
import 'package:task_local_2/pages/user_class.dart';
class LoginPage extends StatefulWidget {
  static final String id = 'login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  void _doLogin(){
    String email = _userNameController.text.toString();
    String password = _passwordController.text.toString();

    var user1 = new User(email: email, phone: null, adres: null, password: password);

    var box = Hive.box('task_base');
    box.put('user1', user1.toJson());
    print(user1.toJson());

    var user2 = new User.fromJson(box.get('user1'));

    String get_ema = user2.email;
    String get_pw = user2.password;
    print(get_ema);
    print(get_pw);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFF117864),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                // #login, #welcome
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          image: DecorationImage(
                            image: AssetImage('assets/images/user.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text("Welcome",style: TextStyle(color: Color(0xFFA3E4D7),fontSize: 20),),
                      SizedBox(height: 10,),
                      Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),


                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 60,),
                            Text("Email",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                            TextField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                hintText: "Urmail@gmail.com",
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300))
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Password",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 20),),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade500),
                                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300))
                              ),
                            ),
                            SizedBox(height: 40,),
                            Center(
                              child: Column(
                                children: [
                                  Text('Forgot Password?',
                                    style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 30),
                                  Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF117864),
                                    ),
                                    child: FlatButton(
                                      onPressed: _doLogin,
                                      child: Text("Sign In",style: TextStyle(color: Colors.grey.shade200,fontSize: 16,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  SizedBox(height: 40,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          height: 1,
                                          
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Text("OR",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.bold),),
                                      SizedBox(width: 30,),
                                      Expanded(
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          height: 1,

                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 40,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesome.facebook,color: Colors.indigo,),
                                        SizedBox(width: 20,),
                                        Icon(FontAwesome.twitter,color: Colors.blue,),
                                        SizedBox(width: 20,),
                                        Icon(FontAwesome.instagram,color: Colors.black,),
                                      ],
                                    ),
                                  SizedBox(height: 50,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Don`t have an account?",style: TextStyle(fontSize: 18,color: Colors.grey.shade500),),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.pushReplacementNamed(context, RegPage.id);
                                          },
                                          child: Text("Sign up",style: TextStyle(color: Color(0xFF117864),fontWeight: FontWeight.bold,fontSize: 18),),
                                        )
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

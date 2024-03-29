import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vapsindia/utils/texts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isSubmit = false;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _msgController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

    bool isEmail(String input) => RegExp(
          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
      .hasMatch(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  bool isName(String input) => RegExp(r'[a-zA-Z]').hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 28,)),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          title: const Text(
            "Contact & Support",
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          
        ),
        body: ScrollConfiguration(behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false), child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      launchUrl(Uri.parse("tel:+914522538641"));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: Icon(Icons.phone, color: Colors.redAccent, size: MediaQuery.of(context).size.width * 0.1,)
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      launchUrl(Uri.parse("mailto:vapsinfo@gmail.com"));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            child: Icon(Icons.mail, color: Colors.redAccent, size: MediaQuery.of(context).size.width * 0.1,)
                    
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      launchUrl(Uri.parse("https://www.google.com/maps/place/Besant+Rd,+Madurai,+Tamil+Nadu+625002,+India/@9.940127,78.131695,16z/data=!4m6!3m5!1s0x3b00c5ea3ae611af:0x86c0138dbc686007!8m2!3d9.9401275!4d78.1316945!16s%2Fg%2F11h0jtfdm?hl=en-US&entry=ttu"));
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                      child: Icon(Icons.location_on, color: Colors.redAccent, size: MediaQuery.of(context).size.width * 0.1,)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                                        "CONTACT US",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              readOnly: isSubmit,
                              textInputAction: TextInputAction.done,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please enter your first name";
                                } else if (!isName(val)) {
                                  return "Please enter a valid name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: _fnameController,
                              decoration: const InputDecoration(
                                labelText: "First Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                prefixIcon: Icon(Icons.align_horizontal_left),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              readOnly: isSubmit,
                              textInputAction: TextInputAction.done,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please enter your last name";
                                } else if (!isName(val)) {
                                  return "Please enter a valid name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: _lnameController,
                              decoration: const InputDecoration(
                                labelText: "Last Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                prefixIcon: Icon(Icons.align_horizontal_right),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              readOnly: isSubmit,
                              textInputAction: TextInputAction.next,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please enter your email";
                                } else if (!isEmail(val)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              readOnly: isSubmit,
                              textInputAction: TextInputAction.next,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please enter your phone number";
                                } else if (!isPhone(val)) {
                                  return "Please enter a valid phone number";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                labelText: "Phone",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TextFormField(
                              readOnly: isSubmit,
                              textInputAction: TextInputAction.next,
                              maxLines: null,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Please enter your message";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: _msgController,
                              decoration: const InputDecoration(
                                labelText: "Message",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                prefixIcon: Icon(Icons.signpost),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          isSubmit
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: const LinearProgressIndicator())
                              : InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
              context: context,
              elevation: 20,
              showDragHandle: true,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight:Radius.circular(25.0), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
              ),
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: const SingleChildScrollView(
                      child: SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(Icons.currency_rupee, color: Colors.redAccent,),
                                  SizedBox(width: 5,),
                                  Text("BANK DETAILS", style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),),
                                ],
                              ),
                            SizedBox(height: 12),
                              Text(bankDetails, textAlign: TextAlign.start, style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
                        );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Donate",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){

                      }, icon: Icon(FontAwesomeIcons.facebook, color: Color.fromARGB(255, 31, 112, 179),size: 30,)),
                      IconButton(onPressed: (){

                      }, icon: Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 30,)),
                      IconButton(onPressed: (){

                      }, icon: Icon(FontAwesomeIcons.linkedin, color: Color.fromARGB(255, 32, 128, 207),size:30)),
                      IconButton(onPressed: (){

                      }, icon: Icon(FontAwesomeIcons.youtube, color: Colors.red,size:30)),
                       IconButton(onPressed: (){

                      }, icon: Icon(FontAwesomeIcons.instagram, color: Colors.pinkAccent,size:30)),
                                                 
                    ],
                  ),
                  const SizedBox(height: 30,)
            ],
          ),
        ),),
    );
  }
}
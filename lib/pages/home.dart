import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vapsindia/model.dart/teamMember.dart';
import 'package:vapsindia/pages/contact_page.dart';
import 'package:vapsindia/pages/gallery_page.dart';
import 'package:vapsindia/utils/route.dart';
import 'package:vapsindia/utils/texts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin{
  List<String> images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.png',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
  ];

  List<TeamMember> members = [
    TeamMember(name: "N.D. Sambath Kumar", designation: "Technical Consultant", imageUrl: "https://www.vapsindia.co.in/img/team/big/um1ti30i.jpg"),
    TeamMember(name: "S. Sooriya dharshan", designation: "Project Coordinator, Micro Skillpreneurship Development Programme (MSDP) & Entrepreneurship Skill Development Program", imageUrl: "https://www.vapsindia.co.in/img/team/big/jy64w7ia.jpg"),TeamMember(name: "S.A Arul", designation: "Secretary", imageUrl: "https://www.vapsindia.co.in/img/team/big/3qmhp3sz.jpg")

  ];

  late AnimationController _transcontroller;

  @override
  void initState(){
    super.initState();
    _transcontroller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))..repeat(reverse: true);
  }

  @override
  void dispose(){
    _transcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
                Navigator.push(context, fallingPageRoute(child: const GalleryPage()));
            
          }, icon: IconButton(
            onPressed: (){
                Navigator.push(context, fallingPageRoute(child: const GalleryPage()));
            
          }, icon: const Icon(Icons.photo_library_rounded, size: 28,)),),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          title: const Text(
            "VAPSINDIA",
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
                Navigator.push(context, fallingPageRoute(child: const ContactPage()));
            }, icon: const Icon(Icons.contact_support_rounded, size: 30)),
            const SizedBox(width: 15,)
          ],
        ),
        body: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      //height: 200,
                      enlargeCenterPage: true,
                      onScrolled: (_) {},
                      onPageChanged: (position, reason) {
                        debugPrint(reason.toString());
                        debugPrint(
                            CarouselPageChangedReason.controller.toString());
                      },
                      enableInfiniteScroll: true,
                    ),
                    items: images.map<Widget>((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              i,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                          Row(
                            children: [
                              FadeTransition(opacity: _transcontroller,child: const Icon(FontAwesomeIcons.circleInfo, color: Colors.redAccent,)),
                                const SizedBox(width: 15,),
                              const Text("ABOUT US", style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: (){
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
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.circleInfo, color: Colors.redAccent,),
                                  SizedBox(width: 15,),
                                  Text("ABOUT US", style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                                ],
                              ),
                            SizedBox(height: 10),
                              Text(about, textAlign: TextAlign.justify, style: TextStyle(
                                fontSize: 15,
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
                            child: const Column(
                              children: [
                                Text(aboutSample, overflow: TextOverflow.fade, softWrap: true,textAlign: TextAlign.justify, maxLines: 7,style: TextStyle(
                                  fontSize: 15,
                                      fontWeight: FontWeight.w500
                                    )),
                                    Icon(Icons.arrow_drop_down_outlined, size: 60, color: Colors.redAccent,),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FadeTransition(opacity: _transcontroller,child: const Icon(FontAwesomeIcons.bullseye, color: Colors.redAccent,)),
                              const SizedBox(width: 15,),
                              const Text("OUR VISION", style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(vision,overflow: TextOverflow.fade, softWrap: true,textAlign: TextAlign.justify, maxLines: 7,style: TextStyle(
                            fontSize: 15,
                                fontWeight: FontWeight.w500
                              )),
                          const SizedBox(height: 40,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              FadeTransition(opacity: _transcontroller,child: const Icon(FontAwesomeIcons.solidStar, color: Colors.redAccent,)),
                                const SizedBox(width: 15,),
                              const Text("OUR MISSION", style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(mission,overflow: TextOverflow.fade, softWrap: true,textAlign: TextAlign.justify, maxLines: 7,style: TextStyle(
                            fontSize: 15,
                                fontWeight: FontWeight.w500
                              )),
                              const SizedBox(height: 40,),
                          Row(
                            children: [
                            FadeTransition(opacity: _transcontroller,child: const Icon(FontAwesomeIcons.peopleGroup, color: Colors.redAccent,)),
                              const SizedBox(width: 15,),
                              const Text("OUR TEAM", style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      //height: 200,
                      enlargeCenterPage: true,
                      onScrolled: (_) {},
                      onPageChanged: (position, reason) {
                        debugPrint(reason.toString());
                        debugPrint(
                            CarouselPageChangedReason.controller.toString());
                      },
                      enableInfiniteScroll: true,
                    ),
                    items: members.map<Widget>((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,

                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54
                                )
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: 200,
                                    child: Image.network(
                                      i.imageUrl,
                                      alignment: Alignment.topCenter,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ScrollConfiguration(
                                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                                        child: SingleChildScrollView(
                                        
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 10,),
                                              Text(i.name, style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold
                                              ),),
                                              const SizedBox(height: 5,),
                                              Text(i.designation, 
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500
                                              ),
                                              textAlign: TextAlign.center),
                                              const SizedBox(height: 20,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(onPressed: (){
                                                                        
                                                  }, icon: const Icon(FontAwesomeIcons.facebook, color: Color.fromARGB(255, 48, 117, 173),)),
                                                  IconButton(onPressed: (){
                                                                        
                                                  }, icon: const Icon(FontAwesomeIcons.twitter, color: Colors.blue,)),
                                                  IconButton(onPressed: (){
                                                                        
                                                  }, icon: const Icon(FontAwesomeIcons.linkedin, color: Color.fromARGB(255, 17, 110, 187))),
                                                  
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                          const SizedBox(height: 10,),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

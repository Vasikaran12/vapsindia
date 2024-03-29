import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vapsindia/model.dart/trainingData.dart';
import 'package:vapsindia/pages/contact_page.dart';
import 'package:vapsindia/pages/gallery_page.dart';

import '../utils/route.dart';

class TrainingTab extends StatefulWidget {
  const TrainingTab({super.key});

  @override
  State<TrainingTab> createState() => _TrainingTabState();
}

class _TrainingTabState extends State<TrainingTab> {
  List<TrainingData> trainingData = [
    TrainingData(title: "Diploma In Agricultural Extension Services For Input Dealers -DAESI", date: "20 June 2023", place: "Madurai", description: "அனைவருக்கும் வணக்கம்!! வருகின்ற 1 ஜூலை 2023 முதல் இடுபொருள் விற்பனையாளருக்கான   DAESI பட்டய படிப்பு வாப்ஸ் | மதுரையில் தொடங்க உள்ளது. சேரவிருப்பம் உள்ளவர்கள் நேரில் வந்து பதிவு செய்துகொள்ளலாம். விண்ணப்பத்துடன் தர வேண்டிய நகல்கள்\n1. 10ம் வகுப்பு சான்றிதழ்\n2. TC\n3. ஆதார்\n4.pass port size photos - 5 No\n5. Fees Rs.20000/-\nDAESI : Diploma in Agricultural Extension Services for Input Dealers (DAESI) தேசிய வேளாண் விரிவாக்க மேலாண்மை நிறுவனம் (MANAGE, Ministryof Agriculture, Government of India)  “ஒரு வருட வேளாண்மை விரிவாக்க டிப்ளமோ  இடுபொருள் விற்பனையாளர்களுக்கான  டிப்ளமோ படிப்பில் சேர  முன் பதிவு செய்யவும்.\nமுன்பதிவிற்கு :97874 09195 , 93606 58837\nஈ மெயில் : vapsinfo@gmail.com", 
    imageUrl: "https://www.vapsindia.co.in/img/event/big/i38ecdw3.jpg"),
    TrainingData(title: "Diploma In Agricultural Extension Services For Input Dealers - DAESI", date: "20 June 2023", place: "Madurai", description: "அனைவருக்கும் வணக்கம்!! வருகின்ற 1 ஜூலை 2023 முதல் இடுபொருள் விற்பனையாளருக்கான   DAESI பட்டய படிப்பு வாப்ஸ் | மதுரையில் தொடங்க உள்ளது. சேரவிருப்பம் உள்ளவர்கள் நேரில் வந்து பதிவு செய்துகொள்ளலாம். விண்ணப்பத்துடன் தர வேண்டிய நகல்கள்\n1. 10ம் வகுப்பு சான்றிதழ்\n2. TC\n3. ஆதார்\n4.pass port size photos - 5 No\n5. Fees Rs.20000/-\nDAESI : Diploma in Agricultural Extension Services for Input Dealers (DAESI) தேசிய வேளாண் விரிவாக்க மேலாண்மை நிறுவனம் (MANAGE, Ministryof Agriculture, Government of India)  “ஒரு வருட வேளாண்மை விரிவாக்க டிப்ளமோ  இடுபொருள் விற்பனையாளர்களுக்கான  டிப்ளமோ படிப்பில் சேர  முன் பதிவு செய்யவும்.\nமுன்பதிவிற்கு :97874 09195 , 93606 58837\nஈ மெயில் : vapsinfo@gmail.com", 
    imageUrl: "https://www.vapsindia.co.in/img/event/big/32tajz0f.jpg")
  ];

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(children: trainingData.map<Widget>((i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        debugPrint(i.imageUrl);
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
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(width: 15,),
                              Text(i.title, maxLines: null, style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                            const SizedBox(height: 10),
                              Text(i.description, textAlign: TextAlign.justify, style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              ),),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                      },);},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.redAccent
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Container(
                            //width: MediaQuery.of(context).size.width  * 0.8,
                              height: 250,
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(i.imageUrl),fit: BoxFit.cover,)),
                              
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month, color: Colors.redAccent,),
                                  const SizedBox(width: 10,),
                                  Text(i.date),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_rounded, color: Colors.redAccent,),
                                  const SizedBox(width: 10,),
                                  Text(i.place),
                                ],
                              )     
                          ],)
                          ]),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        ));
  }
}
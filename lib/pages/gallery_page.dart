import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 28,)),
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            title: const Text(
              "Gallery",
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)
            ,
            unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold)
            ,
            indicatorColor: Colors.black87,
            tabs: [
              Tab(text: 
            "Photos", icon: Icon(Icons.photo,),),
              Tab(text: 
            "Videos", icon: Icon(Icons.video_collection),)
            ]),
          ),
          body: const TabBarView(
            children: [
            PhotoTab(),
            VideoTab()
          ]),
      ),
    );
  }
}

class PhotoTab extends StatefulWidget {
  const PhotoTab({super.key});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  List<String> images = [
    "https://www.vapsindia.co.in/img/gallery/big/dyng8hbp.jpg",
    "https://www.vapsindia.co.in/img/gallery/big/qeho8lmb.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(children: images.map<Widget>((i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    //width: MediaQuery.of(context).size.width  * 0.8,
                      height: 250,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),image: DecorationImage(image: NetworkImage(i),fit: BoxFit.contain,)),
                    ),
                  )
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
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(i),fit: BoxFit.cover,)),
                              
                            ),
                            const SizedBox(height: 10,),
                            const SizedBox(width: 10,),
                            Text(i, overflow: TextOverflow.ellipsis,)
                          ]),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        );
  }
}

class VideoTab extends StatefulWidget {
  const VideoTab({super.key});

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  late VideoPlayerController _controller = _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        "",
      ),
    );
  late ChewieController _chewieController = _chewieController = ChewieController(
              videoPlayerController: _controller,
              aspectRatio: 16 / 9,
            );
  late Future<void> _initializeVideoPlayerFuture;
    List<List> videos = [
    ["https://www.vapsindia.co.in/img/gallery/big/qh2bz6aw.jpg", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"],
    ["https://www.vapsindia.co.in/img/gallery/big/zg6iw6d6.jpg", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"]
  ];



  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    
  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(children: videos.map<Widget>((i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        i[1],
      ),
    );
  
    _initializeVideoPlayerFuture = _controller.initialize()..then(
          (_) => setState(
            () => _chewieController = ChewieController(
              videoPlayerController: _controller,
              aspectRatio: 16 / 9,
            ),
          ),
        );
                        showDialog(

              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
                          ],
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(i[0]),fit: BoxFit.cover,)),
                              
                            ),
                            const SizedBox(height: 10,),
                            const SizedBox(width: 10,),
                            Text(i[1], overflow: TextOverflow.ellipsis,)
                          ]),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
        );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  var items = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/logo.png',
          height: 20,
          fit: BoxFit.cover,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.download), label: 'Downloads'),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          selectedFontSize: 15,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (p0, p1) {
              if (currentIndex == 0) {
                return const Page1();
              } else {
                return const Page2();
              }
            },
          ),
        ));
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double progress = 0;
  InAppWebViewController? ucontroller;

  bool downloadbuttonshow = false;
  checkURL() async {
    if ("${await ucontroller?.getUrl()}" == "https://m.youtube.com/") {
      setState(() {
        downloadbuttonshow = false;
      });
    } else {
      setState(() {
        downloadbuttonshow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkURL();
    return WillPopScope(
      onWillPop: () async {
        if (await ucontroller!.canGoBack()) {
          ucontroller!.goBack();
        }
        return false;
      },
      child: Scaffold(
        body: Stack(children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.https("www.youtube.com")),
            onProgressChanged: (controller, progres) {
              setState(() {
                progress = progres / 100;
              });
            },
            onWebViewCreated: (controller) {
              setState(() {
                ucontroller = controller;
              });
            },
          ),
          progress < 1
              ? SizedBox(
                  height: 5,
                  child: LinearProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    value: progress,
                  ))
              : Container()
        ]),
        floatingActionButton: downloadbuttonshow == false
            ? Container():offsetPopup(ucontroller),
            // : FloatingActionButton(
            //     onPressed: ()  {
            //       
            //       // download(ucontroller);
            //     },
            //     backgroundColor: Colors.red.shade500,
            //     child: const Icon(
            //       Icons.file_download_sharp,
            //       color: Colors.white,
            //     ),
            //   ),
      ),
    );
  }
}

download(InAppWebViewController? cntrolr,int itag) async {

 var youtubelink= await cntrolr!.getUrl();
 var title= await cntrolr.getTitle();
 
await FlutterYoutubeDownloader.downloadVideo(
            '$youtubelink', "$title", itag);

}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurple.shade200,
        
        ),
    );
  }
}

Widget offsetPopup(InAppWebViewController? ucontroller) => PopupMenuButton<int>(
    itemBuilder: (context) => const[
          PopupMenuItem(
            value: 399,
            child: Text(
              "1080p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 398,
            child: Text(
              "720p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 83,
            child: Text(
              "480p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 18,
            child: Text(
              "360p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 395,
            child: Text(
              "240p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 394,
            child: Text(
              "144p",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 140,
            child: Text(
              "128k audio",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        onSelected: (value) {
          download(ucontroller,value);
        },
    icon: Container(
      height: 80,
      width: 80,
      decoration:const ShapeDecoration(
        color: Color.fromARGB(255, 246, 19, 2),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.black, width: 2),
        )
      ),
      child:const Center(child:  Icon(Icons.download,color: Colors.black,size: 30,)),
    ),iconSize: 60,
  );
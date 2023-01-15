import 'package:class10/more.dart';
import 'package:class10/party.dart';
// import 'package:class10/party.dart';
import 'package:flutter/material.dart';

class LstVBuilder extends StatefulWidget {
  const LstVBuilder({super.key});

  @override
  State<LstVBuilder> createState() => _LstVBuilderState();
}

class _LstVBuilderState extends State<LstVBuilder> {
  var imglst = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnOzVnnQ5Z1lYJmX_iMygSLLfbZJvnUEhLk6RM82EHPFZRweALx9wE_OkFSI9ZeVDT5NM&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6GMRJGvpWmI1FoOiIVw89DXw2ZhTfH1MnHA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgXarsJ0VtCHQhn_oSfaQCBzQ8Y7On7WR_mw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMKF4KjKhAxT-MaGd_YAqI1xggQhUVJBWxfsJmdZ1_B_EZd55-DEiUDWvRScZQHSdV-oI&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU"
  ];
//
  var namlst = [
    "Allama Khadam Hussain Rizvi",
    "Hafiz Saad Hussain Rizvi",
    "Hafiz Anas Hussain Rizvi",
    "Dr Shafiq Ameeni",
    "Dr Zaheer-ul-Hassan"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Center(
              child: Text(
                "تحریک لبیک پاکستان",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),      body: ListView.builder(
          itemCount: namlst.length,
          itemBuilder: (context, index) {
            return tlp(imglst[index], namlst[index]);
          }),
    );
  }
}

Widget tlp(String img, String name) {
  return Container(
    padding: const EdgeInsets.all(1),
    child: Container(
      color: Colors.blueGrey,
      height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90,
              width: 90,
              color: Colors.blueGrey,
              child: Stack(children: [
                CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(img)),
                const Positioned(
                  bottom: 15,
                  right: 15,
                  child: Image(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZAiX13NGujEPdvLQOK8JBN-M3tdYjDrENng&usqp=CAU'),
                    fit: BoxFit.fill,
                    height: 20,
                    width: 30,
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Party(
                                img: img,
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "ChairPerson Of TLP",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              );
            }),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("12:00 AM"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green,
                  child: Text("12"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Builder(builder: (context) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const More()));
                  },
                  child: const Icon(Icons.more_vert));
            }),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}

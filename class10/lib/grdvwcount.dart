import 'package:flutter/material.dart';

class GrdVwCount extends StatefulWidget {
  const GrdVwCount({super.key});

  @override
  State<GrdVwCount> createState() => _GrdVwCountState();
}

class _GrdVwCountState extends State<GrdVwCount> {
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
    "Dr Zaheer-ul-Hassan",
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
            ),),      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(
            imglst.length, (index) => grd(imglst[index], namlst[index])),
      ),
    );
  }
}

Widget grd(String img, String name) {
  return Stack(
    children: [
      Image(
        image: NetworkImage(img),
        width: 400,
        height: 500,
        fit: BoxFit.fill,
      ),
      Text(name),
    ],
  );
}

import 'package:flutter/material.dart';

class GrdVw extends StatefulWidget {
  const GrdVw({super.key});

  @override
  State<GrdVw> createState() => _GrdVwState();
}

class _GrdVwState extends State<GrdVw> {
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
            ),),      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12,),
            children:const [
              
              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

              Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlEkx5Bm9mEhSWH_aBLIGQwaVEFxq6hfd4pfd68EuJCJ29nfRA-nnhJowi4Q2kJGuh-Y8&usqp=CAU')),

            ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'get_post.dart';

class beatTile extends StatefulWidget {

  late final String Uid;

  beatTile({required String this.Uid});

  @override
  State<beatTile> createState() => _beatTileState();
}

class _beatTileState extends State<beatTile> {
  API obj = new API();

  int val=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: ()async{
          dynamic x = await obj.bpm(uid: "1234");
          print(x);

          int i=0;
          while(true){
            try {
              // setState((){
              //   val = x["status"][i];
              // });
              print(x["status"][i]);

              i++;

              if(i==3){
                break;
              }

            }catch(e){
              await Future.delayed(Duration(seconds: 10));
            }
          }

          print("done");

        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width*0.5,
          decoration: BoxDecoration(
            color: Color(0xFFFBDED5),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset("images/vector.png"),
              Text("$val",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30.0),),
              Text("BPM",style: TextStyle(fontSize: 20.0),)
            ],
          ),
        ),
      ),
      // child: Image.asset("images/vector.png")
    );
  }
}

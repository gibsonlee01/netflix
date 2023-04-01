import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _DetailScreenState createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    super.initState();
    like= widget.movie.like;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: 'soeasy',
          child: Container(
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(width:double.maxFinite ,
                      decoration: BoxDecoration(image: DecorationImage(
                          image: NetworkImage(widget.movie.poster),
                        fit: BoxFit.cover,
                      )),
                        child: ClipRect(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX:10,sigmaY: 10 ),
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.black.withOpacity(0.1),
                              child: Container(
                                child: Column(
                                  children:<Widget> [
                                    Container(
                                      height: 300,
                                      padding: EdgeInsets.fromLTRB(0, 45, 0, 10 ),
                                      child: Image.network(widget.movie.poster),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      child: Text('99% 일치 2019 15+ 시즌 1개',
                                        textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      child: Text(widget.movie.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      child: TextButton(
                                        onPressed: () {  },
                                        style: TextButton.styleFrom(
                                          primary: Colors.white,
                                          backgroundColor: Colors.red
                                        ),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.play_arrow),
                                            Text('재생')
                                          ],
                                        ) ,
                                      )
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text(widget.movie.toString()),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.centerLeft,
                                      child: Text('출연: 현빈, 손예진, 서지혜 \n 제작자: 이정효, 박지은'
                                      ,style: TextStyle(color: Colors.white60,fontSize: 12),
                                      ),
                                    ),



                                  ],
                                ),
                              ),

                            ),
                          ),),
                      ),
                      Positioned(child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ))
                    ],
                  ),
                  makeMenuButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeMenuButton(){
    return Container(
      color: Colors.black26,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(onTap: (){
        setState(() {
          like=!like;
          widget.movie.reference.update({'like':like});
        });
      },
          child: Column(
              children: <Widget>[
                like ? Icon(Icons.check)
              : Icon(Icons.add),
                Padding(padding: EdgeInsets.all(5),),
                Text('내가 찜한 콘텐츠',style:TextStyle(fontSize: 11, color: Colors.white60) ,)
              ]

      )
    ),),
            Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              child: Column(
                children: [
                  Icon(Icons.thumb_up),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('평가',
                  style: TextStyle(
                    fontSize: 11, color: Colors.white60),
                  ),

                ],
            ),),

            ),
           Container(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
             child: Column(
             children: [
               Icon(Icons.send),
                 Padding(padding: EdgeInsets.all(5),),
                 Text('공유',
                style: TextStyle(
               fontSize: 11, color: Colors.white60),
                  ),

              ],
            ),),

           )


      ]
    )
    );
    }

}// 맨끝



//
// padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
// child: Column(
// children: <Widget>[
// Icon(Icons.thumb_up),
// Padding(padding: EdgeInsets.all(5)),
// Text('평가',style: TextStyle(fontSize: 11, color: Colors.white60),)
// ],
// ),
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/model_movie.dart';
import 'detail_screen.dart';

class LikeScreen extends StatefulWidget {
  LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeScreenState createState() {
    return _LikeScreenState();
  }
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  void initState() {
    super.initState();
  }


  Widget _buildbBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movie').where('like',isEqualTo: true).snapshots(),
      builder: (context,snapshot){
          if(!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context,snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return Expanded(child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1/1.5,
      padding: EdgeInsets.all(3),
      children: snapshot.map((data) => _buildListItem(context ,data)).toList(),

    ));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final movie = Movie.fromsnapshot(data);
    return InkWell(
      child: Image.network(movie.poster),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute<Null>(
            fullscreenDialog: true,
            builder: (BuildContext context){
              return DetailScreen(movie: movie);
            })
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 27, 20, 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text('내가 찜한 콘텐츠',
                  style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ) ,
          _buildbBody(context)
        ],
      ),

    );
  }
}
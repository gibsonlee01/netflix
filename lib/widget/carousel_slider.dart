import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  CarouselImage({Key? key,required this.movies}) : super(key: key);
  final List<Movie> movies;

  @override
  _CarouselImageState createState() {
    return _CarouselImageState();
  }
}

class _CarouselImageState extends State<CarouselImage> {
late List<Movie> movies;
late List <Widget> images;
late List <String> keywords;
late List<bool> likes;
int _currentPage=0;
late String _currentKeyword;



  @override
  void initState() {
    super.initState();
    movies=widget.movies;
    images= movies.map((m)=> Image.network(m.poster)).toList();
    keywords= movies.map((m)=> m.keyword).toList();
    likes = movies.map((m)=> m.like).toList();
    _currentKeyword = keywords[0];
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(items: images,
            options: CarouselOptions(
                onPageChanged: (index,reasen){
              setState(() {
                _currentPage=index;
                _currentKeyword= keywords[_currentPage];
              });
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(child: Column(
                  children:<Widget> [
                    likes[_currentPage]
                    ? IconButton(icon:Icon(Icons.check), onPressed: ()
                    {
                      setState(() {
                        likes[_currentPage] =!likes[_currentPage];
                        movies[_currentPage].reference.update({'like': likes[_currentPage]});
                      });
                    },)
                        :IconButton(icon:Icon(Icons.add), onPressed:() {
                      setState(() {
                        likes[_currentPage] =!likes[_currentPage];
                        movies[_currentPage].reference.update({'like': likes[_currentPage]});
                      });
                    },),
                    Text('내가 찜한 콘텐츠',style: TextStyle(fontSize: 11),),
                  ],
                ),),

                Container(
                  padding: EdgeInsets.only(right:10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(100, 40),
                          ),
                        ),
                        onPressed: () {} ,
                        child: Row(
                          children: [
                            Icon(Icons.play_arrow,color: Colors.black,),
                            Padding(padding: EdgeInsets.all(3)),
                            Text('재생', style: TextStyle(color: Colors.black),)
                          ],
                        ),
                      ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10) ,
                  child: Column(
                    children: [
                      IconButton(

                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute <Null>(fullscreenDialog: true,builder: (BuildContext context){
                              return DetailScreen(movie:movies[_currentPage]);
                            } ));

                          },
                          icon: Icon(Icons.info)
                      ),
                      Text('정보', style: TextStyle(fontSize: 11),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage)

            ),
          )

        ],
      ),
    ) ;
  }
}

List <Widget>makeIndicator(List list,int _currentPage){
  List <Widget>result=[];
  for(var i=0; i<list.length; i++){
    result.add(
      Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(shape: BoxShape.circle,
          color: _currentPage==i
              ? Colors.white
              : Colors.grey
      ),
      )
    );
  }
  return result;
}
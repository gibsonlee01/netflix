import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:50),
              child: CircleAvatar(radius: 100, backgroundImage: AssetImage('images/netflix_logo.png'),),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text('@gibson_Lee',style: TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),

            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch((link.url));
                  }
                },
              text: 'https://soundcloud.com/xv7bwlxfq6bw',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                linkStyle: TextStyle(color: Colors.white),

              )
            ),




          ],
        ),
      ),
    );
  }
}

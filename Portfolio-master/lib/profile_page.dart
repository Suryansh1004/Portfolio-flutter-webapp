import 'package:flutter/material.dart';
import 'package:myweb/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
       largeScreen: Scaffold(
         backgroundColor: Colors.black,
         appBar: AppBar(
           elevation: 0.0,
           backgroundColor: Colors.black,
           ),
           drawer: ResponsiveWidget.isSmallScreen(context)?Drawer(
             child: ListView(padding: const EdgeInsets.all(20),
             children: <Widget>[
                NavButton(
                  text: "about",
                  onPressed: () {},
                ),
                NavButton(
                  text: "work",
                  onPressed: () {},
                ),
                NavButton(
                  text: "contact",
                  onPressed: () {},
                ),
             ],),
           )
           : null,
        
        body: SingleChildScrollView(
          child: AnimatedPadding(
             duration: Duration(seconds: 1),
             padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
             child: ResponsiveWidget(
               largeScreen: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     NavHeader(),
                     SizedBox(
                       height: MediaQuery.of(context).size.height * 0.1, 
                       ),
                      ProfileInfo(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      SocialInfo(),
                   ],
             ),
             ),
          )
        ),


       ),
    );
  }
}

class NavHeader extends StatelessWidget {
  const NavHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
         largeScreen: Row(
           mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             STDot(),
            //  Spacer(),
            if(!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: <Widget>[
                NavButton(
                  text: "about",
                  onPressed: () {},
                ),
                NavButton(
                  text: "work",
                  onPressed: () {},
                ),
                NavButton(
                  text: "contact",
                  onPressed: () {},
                ),
              ],
            ),
           ], 
         ),
    );
  }
}

class STDot extends StatelessWidget {
  const STDot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       children: <Widget>[
         Text(
           "Portfolio",
           textScaleFactor: 2,
           style: TextStyle(
             fontWeight: FontWeight.bold,
           ),
         ),
         SizedBox(width: 5,),
         AnimatedContainer(duration: Duration(seconds: 1),
         height: 8,
         width: 8,
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.orange,
         ),
         ),
       ],
    );
  }
}


class NavButton extends StatelessWidget {

   final text;
   final onPressed;
   final Color color;

  const NavButton(
    {Key key,
    @required this.text,
    @required this.onPressed,
    this.color = Colors.orange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
     child: Text(text),
     borderSide: BorderSide(color: color,),
     onPressed: onPressed,
     highlightedBorderColor: color,
    );
  }
}


class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("pic.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Suryansh\nTripathi",
        textScaleFactor: 4,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Student\n"
        "Computer Science and Engineering\n"
        "Pranveer Singh Institute of Technology\n"
        "I am a full stack web and app(flutter) developer",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () => _showRes,
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () =>  _showLinkedIn,
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: "Github",
        onPressed: () =>  _showGit,
        color: Colors.blue,
      ),
      NavButton(
        text: "Twitter",
        onPressed: () =>  _showTwitter,
        color: Colors.blue,
      ),
      NavButton(
        text: "Facebook",
        onPressed: () =>  _showFacebook,
        color: Colors.blue,
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Suryansh Tripathi @2020",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}


// open all the URL
_showRes() async {
  const url = 'https://drive.google.com/open?id=1Q2rOSOz2NQEW8I8Gpc9GKpM1MDb8ro6z';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_showLinkedIn() async{
const url = 'https://www.linkedin.com/in/suryansh-tripathi';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_showFacebook() async{
const url = 'https://www.facebook.com/profile.php?id=100008135256459';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_showGit() async{
const url = 'https://github.com/Suryansh1004';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_showTwitter() async{
const url = 'https://twitter.com/Suryans20675407';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
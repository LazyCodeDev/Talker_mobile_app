import 'package:flutter/material.dart';
import 'package:talker_mobile_app/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talker Mobile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPage(),
    );
  }
}
class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin{
  PageController _pageController;
  AnimationController _animationController;
  int _currentPage = 0;
  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync:this);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          child: PageView.builder(
            itemCount: pageList.length,
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context,index){
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _pageController,
                    builder: (context,child){
                      child : return _buildPage(context,pageList[index]);
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _buildPage(BuildContext context, PageModel page){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("assets/images/logo.png"),
        Image.asset(page.imageUrl),
        SizedBox(height: 40.0,),
        Text(
          page.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          page.body,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFFCCCCCC),
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
          child: _buildIndicator(),
        ),
        _buildGetStartedButton(context),
        _buildLoginButton(context),
      ],
    );
  }
  Widget _buildIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for(int i= 0; i < pageList.length; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: _currentPage == i ? Color(0xFFFCC75D) : Colors.grey[400],
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ],
    );
  }
  Widget _buildGetStartedButton(BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFFFCC75D),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text("Get Started",style:TextStyle(color: Colors.white,fontSize:20.0)),
        ),
      ),
    );
  }
  Widget _buildLoginButton(BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFFCC75D)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text("Login",style:TextStyle(color:  Color(0xFFFCC75D),fontSize:20.0)),
        ),
      ),
    );
  }
}
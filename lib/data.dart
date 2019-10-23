class PageModel{
  String imageUrl;
  String title;
  String body;
  PageModel({this.imageUrl,this.title,this.body});
}

var pageList = [
  PageModel(
    imageUrl: "assets/images/talk_to_a_listener.jpg",
    title: "Talk to a Listener",
    body: "Share what's on your mind in a",
  ),
  PageModel(
    imageUrl: "assets/images/available.jpg",
    title: "Available 24/7",
    body: "Hapi isn't sleeping in case you're",
  ),
  PageModel(
    imageUrl: "assets/images/anonymous_and_secure.jpg",
    title: "Anonymous and Secure",
    body: "Your communication is private",
  ),
];
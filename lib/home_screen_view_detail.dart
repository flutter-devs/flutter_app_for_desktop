import 'package:e_learning_app/constants/constants.dart';
import 'package:e_learning_app/model/Courses_items_model.dart';
import 'package:e_learning_app/model/read_blog_model.dart';
import 'package:e_learning_app/read_screen_view.dart';
import 'package:flutter/material.dart';

class HomeScreenViewDetail extends StatefulWidget {
  const HomeScreenViewDetail({Key? key}) : super(key: key);

  @override
  _HomeScreenViewDetailState createState() => _HomeScreenViewDetailState();
}

class _HomeScreenViewDetailState extends State<HomeScreenViewDetail> {
  List nightImagesList = [
    "https://thumbs.dreamstime.com/b/tender-image-girl-female-magic-beautiful-attractive-night-beach-sand-hugs-moon-art-photo-dark-background-space-158228910.jpg",
    "https://png.pngtree.com/illustration/20190226/ourlarge/pngtree-girl-boy-night-moon-image_2236.jpg",
    "https://png.pngtree.com/illustrations/20190320/ourlarge/pngtree-embrace-boy-girl-break-up-png-image_23090.jpg",
    "https://png.pngtree.com/thumb_back/fh260/background/20191026/pngtree-man-starring-at-night-sky-alone-image_320424.jpg",
    "https://png.pngtree.com/thumb_back/fh260/background/20191026/pngtree-beautiful-night-scene-at-river-image_320425.jpg",
    "https://mocah.org/uploads/posts/586616-Rooftop-Cyberpunk.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildCardSection(),
            _buildBlogTitle(),
            _buildReadCardSection(),
            _buildButtonSection()
          ],
        ),
      ),
    );
  }

  _buildHeaderSection() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 270,
          color: Color(0xffffb643),
        ),
        Positioned(
          top: 120,
          left: 20,
          right: 20,
          child: Stack(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 200, right: 20, top: 20, bottom: 20),
                // margin: EdgeInsets.o(20),
                height: 140,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.network(
                  "https://thumbs.dreamstime.com/b/girl-drinking-coffee-headphones-using-laptop-relaxing-concept-isolated-female-cartoon-character-flat-girl-drinking-coffee-132894196.jpg",
                ),
              ),
              Positioned(
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Over 1600+",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "available courses.",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Get certified.",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffdc4651)),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.white)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Container(
                  //margin: EdgeInsets.only(right: 25,top: 10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffffe1a2),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(right: 25,top: 10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffffe1a2),
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          child: Container(
            child: Text(
              "Explore",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardSection() {
    return Container(
        height: 120,
        padding: EdgeInsets.only(left: 15, right: 10),
        // width: MediaQuery.of(context).size.width,
        //color: Colors.orange,
        child: ListView.builder(
            itemCount: readBlogList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildCardItems(readBlogList[index], index);
            }));
  }

  Widget _buildCardItems(ReadBlogModel readBlogList, int index) {
    return Container(
      height: 80,
      width: 100,
      //color: Colors.green,
      child: Card(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  child: Image.network(
                    readBlogList.image!,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                readBlogList.title!,
                style: TextStyle(fontSize: 12),
              ),
              Text(readBlogList.subTitle!, style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlogTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
        //color: Colors.yellow,
        child: Text(
          "Read our blog",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildReadCardSection() {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: 160,
        // color: Colors.blue,
        child: ListView.builder(
            itemCount: readBlogList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _buildReadCardItemSection(readBlogList[index]);
            }));
  }

  Widget _buildReadCardItemSection(ReadBlogModel readBlogList) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext contex) => ReadScreenView()));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: 130,
            width: 140,
            // color: Colors.pinkAccent,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.network(
                  readBlogList.image!,
                  fit: BoxFit.fill,
                  scale: 1,
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            // left: 1,
            right: 5,
            child: Container(
              height: 50,
              width: 140,
              padding: EdgeInsets.only(left: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  //padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        readBlogList.title!,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                      Text(
                        readBlogList.subTitle!,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonSection() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xfffcba46),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Text(
        "Over available curses get certified",
        style: TextStyle(color: Colors.white, fontSize: 14),
      )),
    );
  }
}

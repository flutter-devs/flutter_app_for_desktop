import 'package:e_learning_app/constants/constants.dart';
import 'package:e_learning_app/model/Courses_items_model.dart';
import 'package:e_learning_app/model/read_blog_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ReadScreenView extends StatefulWidget {
  const ReadScreenView({Key? key}) : super(key: key);

  @override
  _ReadScreenViewState createState() => _ReadScreenViewState();
}

class _ReadScreenViewState extends State<ReadScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            //color: Colors.cyan,
            child: Container(
              margin: EdgeInsets.only(bottom: 350),
              height: 250,
              decoration: BoxDecoration(
                  color: Color(0xffff9b57),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 30),
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
                                  color: Color(0xfff3ac7c),
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
                                color: Color(0xfff3ac7c),
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ])),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Purchase Courses",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 16),
                    height: 140,
                    alignment: Alignment.center,
                    //color: Colors.orange,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: readBlogList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCategorySection(readBlogList[index]);
                        }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 260,
              width: MediaQuery.of(context).size.width,
              child: Container(
                //color: Colors.yellow,
                padding: EdgeInsets.only(left: 4, right: 4),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    //physics:  NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: readBlogList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPurchaseCourses(readBlogList[index]);
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Purchase Courses",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 130,
                    margin: EdgeInsets.only(bottom: 10),
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
    );
  }

  Widget _buildCategorySection(ReadBlogModel readBlogList) {
    return Container(
      height: 50,
      width: 110,
      child: Card(
        color: Colors.white,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                  child: Image.network(
                    readBlogList.image!,
                    fit: BoxFit.fill,
                    height: 50,
                    width: 110,
                  ),
                )),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseCourses(ReadBlogModel readBlogList) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        //padding: EdgeInsets.only(left: 10,right: 20),
        height: 80,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                //SizedBox(width: 20,),
                Container(
                  padding: EdgeInsets.only(right: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        readBlogList.title!,
                        style: TextStyle(
                          fontSize: 12,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        readBlogList.subTitle!,
                        style: TextStyle(
                          fontSize: 12,
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 130,),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfffee8db),
                  ),
                  child: Icon(
                    Icons.done,
                    color: Color(0xffdd8e8d),
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ));
  }
//
// Widget _buildBottomButtom() {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       color: Colors.white,
//     ),
//   );
// }
}

import 'package:e_learning_app/constants/constants.dart';
import 'package:e_learning_app/home_screen_view_detail.dart';
import 'package:e_learning_app/model/Courses_items_model.dart';
import 'package:e_learning_app/model/read_blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          _buildCoursesTitle(),
          _buildCoursesCardSection()
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Stack(
      children: [
        Container(
          height: 350,
        //  color: Colors.blue,
          child: Container(
           margin: EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
                color: Color(0xffdc4651),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)
                )
            ),
          ),
        ),
        Positioned(
            top: 165,
            left: 20,
            right: 20,
            child:  Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("you can search here according to choice ")),
                  SizedBox(width: 20,),
                  Icon(Icons.search,
                  )
                ],
              ),
            )),
        Positioned(
          top: 220,
          left: 20,
          right: 20,
          child: Container(
            height: 120,
            width: 100,
            padding: EdgeInsets.only(left: 30,right: 30,top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("100+ courses added everyday. "),
                Text("Explore them now"),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffdc4651)
                  ),
                 child: Container(
                   padding: EdgeInsets.only(left: 20,right: 20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Category",
                       style: TextStyle(
                         color: Colors.white
                       ),),
                       Icon(
                         Icons.arrow_drop_down,
                           color: Colors.white
                       )
                     ],
                   ),
                 ),
                )
              ],
            ),

          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(50)
                  )
              ),
              child: Container(
                padding: EdgeInsets.only(left: 15,right: 30,top: 8),
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc5bQAYdWiMafrNBfhdRuPcPX29OYY5jmlJw&usqp=CAU",
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 25,top: 10),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe77e85),
              ),
              child: Icon(Icons.menu,
              color: Colors.white,
              size: 20,),

            ),
          ],
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Welcome back,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),),
              ),
              SizedBox(height: 5,),
              Container(
                child: Text("Shakira!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold

                  ),),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoursesTitle() {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Text("Courses in progress",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),),
    );
  }

   Widget _buildCoursesCardSection() {
    return Expanded(
      child: Container(
        child:  ListView.builder(
          itemCount: readBlogList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              return  _buildCardItemSection(readBlogList[index],index);
            }),
      ),
    );
   }

  Widget _buildCardItemSection(ReadBlogModel readBlogList,int index) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex)=> HomeScreenViewDetail()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 20),
        height: 80,
          child:Card(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      child: Image.network(readBlogList.image!,
                        fit: BoxFit.fill,),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  //SizedBox(width: 20,),
                  Container(
                    padding: EdgeInsets.only(right: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(readBlogList.title!,
                          style: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(readBlogList.subTitle!,
                          style: TextStyle(
                            fontSize: 12,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(readBlogList.price!,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.red
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 130,),
                  CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 4.0,
                    percent: 0.30,
                    center: new Text(readBlogList.progressValue!,
                      style: TextStyle(
                        fontSize: 10,
                      ),),
                    progressColor: Colors.green,
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

}

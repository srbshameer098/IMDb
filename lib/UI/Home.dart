import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


List<String> name = [
  'All Shows',
  'Movies',
  'TV Shows',
  'Streamings',
];
int selectedIndex = -1;



class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Color(0xffF5C418),
        leading: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Image.asset("assets/imdb.png",
            width: 48.w,
            height: 40.h,),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right:20.w),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Container(
        width: 370.w,
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Image.asset("assets/img-1.jpg",
        width: 55.w,
          height: 50.h,
        ),
      ),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),



                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.asset("assets/img-3.jpg",

                        ),
                      ),
                        Positioned(
                          left: 25,top: 35,
                            child: Icon(Icons.play_arrow,color: Colors.white,size: 50,))

                    ]),
SizedBox(width: 10.w,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color:Color(0xffF5C418)
                          ),

                          child: const Padding(
                            padding:  EdgeInsets.all(5.0),
                            child: Row(
                              children: [

                                Text('2023',
                                  style:
                                  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),),
                              ],
                            ),
                          ),
                        ),

                        Text('Oppenheimer ',
                          style:
                          TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            fontSize: 20.sp
                          ),),
                         Text("Biography,Drama,History" ,
                          style:
                          TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            fontSize: 14.sp
                          ),),
                         Row(
                          children: [
                            Text('Director : ',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                              ),),
                            Text('Christopher Nolan ',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 10.sp
                              ),),
                          ],
                        ),
                         Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Writers : ',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                              ),),
                            Container(width: 130,margin: EdgeInsets.only(top: 4),
                              child: Text('Kai Bird,Martin Sherwin ',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 10.sp
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),




                SizedBox(height: 10.h,),
                Row(
                  children: [
                     Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Row(
                        children: [

                          Icon(Icons.star,color: Color(0xffF5C418),),

                          SizedBox(width: 10.sp,),

                          Text('7.8',
                            style:
                            TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              fontSize: 20.sp,
                            ),),

                          Text('/10',
                            style:
                            TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 20.sp
                            ),),
                          SizedBox(width: 10.sp,),
                          Padding(
                            padding:  EdgeInsets.only(bottom: 3),
                            child: Text('3K',
                              style:
                              TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                fontSize: 12.sp
                              ),),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(width: 10.w,),


                  ],
                ),

                SizedBox(height: 10.h,),
                Text('The gripping saga of a police officer and his team, their challenging journey to nab a criminal gang across the country. Further, it shows how he leads his team towards triumph, amidst professional uncertainties in this gripping drama.',
                  style:
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,

                  ),),


              ],
            ),
          ),






        ],
      ),

    );
  }

@override
void dispose() {
  selectedIndex = -1;
  // TODO: implement dispose
  super.dispose();
}
}

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
      appBar: AppBar(
        backgroundColor: Color(0xffF5C418),
        leading: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Image.asset("assets/imdb.png",width: 48.w,height: 40.h,),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right:20.w),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 42.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: name.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: 105.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: selectedIndex == index
                                ? Color(0xffF5C418)
                                : Color(0xfff6f0de)),
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(name[index],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: selectedIndex == index
                                        ? Color(0xffffffff)
                                        : Color(0xffF5C418),
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 14.w,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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

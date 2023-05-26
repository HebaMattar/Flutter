import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'addTack.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'ProviderViewModel.dart';


class MTabBar extends StatefulWidget {
  MTabBar({Key? key}) : super(key: key);
 late TabController tabController;

  @override
  State<MTabBar> createState() => _TabBarState();
}

class _TabBarState extends State<MTabBar> {
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
        length: 3,
        child: Consumer<ProviderViewModel>(
            builder:(a,b,c){
              b.getData();
              return Scaffold(
                appBar: AppBar(title: Text("To Do List"),
                  bottom: TabBar(
                    tabs: [
                      Tab(child: Text("All task"),), Tab(child: Text("Complete task"),), Tab(child: Text("In complete task"),),
                    ],
                  ),),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddTask();
                    }));
                  },
                  child: Icon(Icons.add,color: Colors.white,),
                  backgroundColor: Colors.blue,
                ),

              );}
        ));;
  }
}

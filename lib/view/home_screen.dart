import 'package:flutter/material.dart';
import 'package:neuro_hub/view/tabs/device_tab.dart';
import 'package:neuro_hub/view/tabs/search_pair_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Neuro Hub', style: TextStyle(color: Colors.white)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.085),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white),
                  ),
                  color: Colors.grey),
              child: TabBar(
                padding: EdgeInsets.only(top: 6),
                labelPadding: EdgeInsets.only(bottom: 6),
                labelStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.black,
                indicatorWeight: 5,
                tabs: [
                  Tab(text: 'Devices'),
                  Tab(text: 'Search/Pair'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            DevicesTab(),
            SearchPairTab(),
          ],
        ),
      ),
    );
  }
}

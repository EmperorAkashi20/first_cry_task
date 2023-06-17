library home;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_first_cry/Views/home/photo_view.dart';

import '../../Providers/home_provider.dart';

part 'home_tab.dart';

part 'product_screen.dart';

List<String> images = [
  "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/1266810/pexels-photo-1266810.jpeg?cs=srgb&dl=pexels-simon-berger-1266810.jpg&fm=jpg",
  "https://images.unsplash.com/photo-1495344517868-8ebaf0a2044a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
  "https://www.whoa.in/download/photoshoot-love-heart-created-by-young-couple-hand-hd-images-photos-fb-images-free-download",
  "https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif",
  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
  "https://1.bp.blogspot.com/-kK7Fxm7U9o0/YN0bSIwSLvI/AAAAAAAACFk/aF4EI7XU_ashruTzTIpifBfNzb4thUivACLcBGAsYHQ/s1280/222.jpg",
  "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_640.jpg",
  "https://imgd.aeplcdn.com/1056x594/n/cw/ec/46749/tvs-jupiter-front-three-quarter25.jpeg?q=75",
  "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
  "https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/1266810/pexels-photo-1266810.jpeg?cs=srgb&dl=pexels-simon-berger-1266810.jpg&fm=jpg",
];

class Home extends ConsumerWidget {
  static const ROUTE_NAME = "/home";
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<Widget> widgetOptions = <Widget>[
      HomeTab(),
      Text('data1'),
      Text('data2'),
      Text('data3'),
      Text('data4'),
    ];
    final homePvd = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/boy-girl-with-happy-face_1308-98776.jpg?w=2000"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Shop for",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        Icon(Icons.arrow_drop_down_sharp, color: Colors.black)
                      ],
                    ),
                    Text(
                      "All",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0XFFEEBD3E),
        unselectedItemColor: Colors.black,
        currentIndex: homePvd.currentTabIndex,
        onTap: (value) => homePvd.onItemTapped(value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Parenting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(homePvd.currentTabIndex),
      ),
    );
  }
}

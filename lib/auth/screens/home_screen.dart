import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:super_food/Provider/firebase_auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//Slider Image list

  List imageList = [
    {"id": 1, "Image_path": "assets/slide1.jpg"},
    {"id": 2, "Image_path": "assets/slide2.jpg"},
    {"id": 3, "Image_path": "assets/slide3.jpg"},
    {"id": 4, "Image_path": "assets/slide4.jpg"},
  ];

  Widget ListileBox(IconData icon, String title, void Function()? onpress) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
          ),
        ),
        onTap: onpress);
  }

  Widget ItemBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(137, 167, 166, 166),
          borderRadius: BorderRadius.circular(18)),
      width: 190,
      height: 260,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            child: Image.network(
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/211209-delish-quarterly-pasta-chicken-parm-pasta-vertical-utensils-071-eb-1640015465.jpg",
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New Product",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 85,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                      borderRadius: BorderRadius.circular(19)),
                  child: const Center(
                      child: Text(
                    "#Sell",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  width: 85,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.8, color: Colors.grey),
                      borderRadius: BorderRadius.circular(19)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.remove,
                        color: Color.fromARGB(255, 255, 191, 1),
                      ),
                      Text(
                        " 1 ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 191, 1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 98, 95, 95),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(user.photoURL.toString()),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              user.displayName.toString(),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(
                                  fontSize: 19,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          InkWell(
                            onTap: () {
                              final provider =
                                  Provider.of<FirebaseAuthProvider>(context,
                                      listen: false);
                              provider.logOut();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(color: Colors.white)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 4),
                                child: Center(
                                    child: Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  ///
                  ///
                  ///
                  ///
                  Column(
                    children: [
                      ListileBox(
                        Icons.home_outlined,
                        "Home",
                        () {},
                      ),
                      ListileBox(
                        Icons.person_outline,
                        "My Profile",
                        () {},
                      ),
                      ListileBox(
                        Icons.shopping_bag_outlined,
                        "My Order",
                        () {},
                      ),
                      ListileBox(
                        Icons.favorite_border,
                        "Whishlist",
                        () {},
                      ),
                      ListileBox(
                        Icons.star_border,
                        "Rating",
                        () {},
                      ),
                      ListileBox(
                        Icons.language_outlined,
                        "Change Language",
                        () {},
                      ),
                      ListileBox(
                        Icons.shopping_cart_checkout,
                        "My Cart",
                        () {},
                      ),
                      ListileBox(
                        Icons.logout_outlined,
                        "Logout",
                        () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(user.photoURL.toString()),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Welcome"),
                        Text(
                          user.displayName.toString(),
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Stack(
                  children: [
                    InkWell(
                      child: CarouselSlider(
                        items: imageList
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      e['Image_path'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map((e) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: currentIndex == e.key ? 17 : 7,
                                  height: 7.0,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: currentIndex == e.key
                                          ? Colors.grey
                                          : Colors.white),
                                ),
                              );
                            }).toList()))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Favourite",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Favourite",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                      ItemBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

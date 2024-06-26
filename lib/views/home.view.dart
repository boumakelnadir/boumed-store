import 'package:boumedstore/helper/custom_drawer.dart';
import 'package:boumedstore/models/product_model.dart';
import 'package:boumedstore/services/get_categories.dart';
import 'package:boumedstore/widgets/custom_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'home view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int correntIndex = 0;

  List categoryName = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  Future<List<ProductModel>> categories() {
    return GetAllCategories()
        .getAllCategories(categoryName: categoryName[correntIndex]);
  }

  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _key,
        index: correntIndex,
        height: 50,
        items: const [
          Icon(
            Icons.laptop,
            color: Colors.white,
          ),
          Icon(
            Icons.diamond,
            color: Colors.white,
          ),
          Icon(
            Icons.face_6,
            color: Colors.white,
          ),
          Icon(
            Icons.face_3,
            color: Colors.white,
          ),
        ],
        color: Colors.black,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black,
        onTap: (value) {
          correntIndex = value;
          setState(() {});
        },
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Image.asset(
              'assets/logo/boumed02.png',
              height: 32,
              width: 32,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/logo/boumed03.png',
              width: 90,
              height: 90,
            ),
          ],
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: categories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> product = snapshot.data!;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 80,
                childAspectRatio: 1.5,
              ),
              itemCount: product.length,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 10,
                top: 60,
                right: 10,
                bottom: 10,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  product: product[index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

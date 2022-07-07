import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../model/offers_model.dart';
import '../model/supplement_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  TextEditingController textEditingController = TextEditingController();
  bool iconVisible = true;
  List<CategoryModel> categoryList = [
    CategoryModel('assets/icons/ayurveda_cat.png', 'Ayurveda'),
    CategoryModel('assets/icons/glucometer_cat.png', 'Diabetes'),
    CategoryModel('assets/icons/pill_cat.png', 'Suplements'),
    CategoryModel('assets/icons/vitamins_cat.png', 'Vitamins'),
    CategoryModel('assets/icons/ayurveda_cat.png', 'Ayurveda'),
    CategoryModel('assets/icons/glucometer_cat.png', 'Diabetes'),
    CategoryModel('assets/icons/pill_cat.png', 'Suplements'),
    CategoryModel('assets/icons/vitamins_cat.png', 'Vitamins'),
  ];
  List<OffersModel> offerList = [
    OffersModel(
        'assets/icons/vitamins_offer.png', 'Vitamin', r'$56.00', r'$80.00'),
    OffersModel(
        'assets/icons/ayurveda_offer.png', 'Ayurveda', r'$89.00', r'$90.00'),
    OffersModel(
        'assets/icons/vitamins_offer.png', 'Vitamin', r'$56.00', r'$80.00'),
    OffersModel(
        'assets/icons/ayurveda_offer.png', 'Ayurveda', r'$89.00', r'$90.00'),
  ];

  List<SupplementModel> supplementList = [
    SupplementModel('assets/icons/vet_vit.png', 'Drug Store', '4.5'),
    SupplementModel('assets/icons/pills_vit.png', 'Pharmacy', '4.5'),
    SupplementModel('assets/icons/smart_pharma.png', 'Smart Pharma', '4.5'),
    SupplementModel('assets/icons/vet_vit.png', 'Drug Store', '4.5'),
    SupplementModel('assets/icons/pills_vit.png', 'Pharmacy', '4.5'),
    SupplementModel('assets/icons/smart_pharma.png', 'Smart Pharma', '4.5'),
  ];

  @override
  void initState() {
    textEditingController.addListener(() {
      if (textEditingController.text != '') {
        setState(() {
          iconVisible = false;
        });
      } else {
        setState(() {
          iconVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/menu.png',
            width: 15,
            height: 15,
            color: Colors.pink,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0)),
        ),
        actions: [
          Image.asset(
            'assets/icons/notification.png',
            width: 25,
            height: 25,
            color: Colors.pink,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.pink.shade50,
              child: Image.asset(
                'assets/icons/person.png',
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      ),
      body: _bodyWidget(context),
      bottomNavigationBar: _bottomBarWidget(context),
    );
  }

  ///body widget
  Widget _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _searchWidget(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Shop By Category',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20))),
                Expanded(
                    flex: 0,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all...',
                          style: TextStyle(color: Colors.black),
                        ))),
              ],
            ),
          ),
          _categoryWidget(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Deals & Offers',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20))),
                Expanded(
                    flex: 0,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('See all...',
                            style: TextStyle(color: Colors.black)))),
              ],
            ),
          ),
          _offersWidget(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                    flex: 1,
                    child: Text('Vitamin Supplements',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20))),
                Expanded(
                    flex: 0,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('See all...',
                            style: TextStyle(color: Colors.black)))),
              ],
            ),
          ),
          _vitaminWidget(context),
        ],
      ),
    );
  }

  ///bottom navigation bar widget
  Widget _bottomBarWidget(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() => selectedIndex = index);
              },
              selectedItemColor: Colors.pink,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
              unselectedLabelStyle: const TextStyle(
                  color: Colors.transparent,
                  fontSize: 26,
                  fontWeight: FontWeight.w900),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      size: 25,
                    ),
                    label: '-'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_rounded), label: '-'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_rounded), label: '-'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_rounded), label: '-'),
              ],
            )));
  }

  ///search widget
  Widget _searchWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: 45,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search',
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                'assets/icons/filter.png',
                color: Colors.pink,
                height: 10,
                width: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///category widget
  Widget _categoryWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _categoryCardWidget(
                context, categoryList[index].title, categoryList[index].image);
          }),
    );
  }

  ///offers and deals widget
  Widget _offersWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.builder(
          itemCount: offerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: _offersCardWidget(
                  context,
                  offerList[index].image,
                  offerList[index].title,
                  offerList[index].offerPrice,
                  offerList[index].price),
            );
          }),
    );
  }

  ///vitamin supplements widget
  Widget _vitaminWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
          itemCount: supplementList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: _vitaminsCardWidget(context, supplementList[index].image,
                  supplementList[index].title, supplementList[index].rating),
            );
          }),
    );
  }

  ///category item card widget
  Widget _categoryCardWidget(BuildContext context, String title, String image) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Card(
              color: Colors.pink.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.pink.shade100,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  image,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///offers and deals item card widget
  Widget _offersCardWidget(BuildContext context, String image, String title,
      String offerPrice, String price) {
    return SizedBox(
      height: 70,
      width: 180,
      child: Stack(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [Colors.pink.shade100, Colors.pink.shade300],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      image,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        offerPrice,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 20,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(8.0))),
                child: const Text(
                  '45% OFF',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  ///vitamin supplements item card widget
  Widget _vitaminsCardWidget(
      BuildContext context, String image, String title, String rating) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: Card(
              color: Colors.pink.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.pink.shade100,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      image,
                      height: 40,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 13,
                    width: 27,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          rating,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

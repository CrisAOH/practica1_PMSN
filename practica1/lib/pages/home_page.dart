import 'package:flutter/material.dart';
import 'package:practica1/models/data.dart';
import 'package:practica1/pages/details_protagonist.dart';
import 'package:practica1/widgets/custom_app_bar.dart';
import 'package:practica1/widgets/custom_bottom_bar.dart';

class HomePageProtagonists extends StatefulWidget {
  const HomePageProtagonists({Key? key}) : super(key: key);

  @override
  State<HomePageProtagonists> createState() => _HomePageProtagonistsState();
}

class _HomePageProtagonistsState extends State<HomePageProtagonists> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      // if (_currentPage >= 0 && _currentPage < 0.7) {
      //   indexPage = 0;
      // } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      //   indexPage = 1;
      // } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      //   indexPage = 2;
      // } else if (_currentPage > 2.7 && _currentPage < 3.7) {
      //   indexPage = 3;
      // }
    });
  }

  Color getColor(int index) {
    late final Color color;
    color = listProtagonist[index].listImage[0].color;
    // if (_currentPage >= 0 && _currentPage < 0.7) {
    //   color = listProtagonist[0].listImage[0].color;
    // } else if (_currentPage > 0.7 && _currentPage < 1.7) {
    //   color = listProtagonist[1].listImage[0].color;
    // } else if (_currentPage > 1.7 && _currentPage < 2.7) {
    //   color = listProtagonist[2].listImage[0].color;
    // }

    return color;
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 25,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                  listGame.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                        right: index == listGame.length - 1 ? 0.0 : 57.0),
                    child: Text(
                      listGame[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: index == _currentPage.round()
                            ? getColor(index)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listProtagonist.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                final protagonists = listProtagonist[index];
                //final listTitle = protagonists.videogame.split(' ');
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, _) {
                          return DetailsProtagonistPage(
                            protagonist: protagonists,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: _currentPage.round() == index ? 30 : 60),
                    child: Transform.translate(
                      offset: Offset(_currentPage.round() == index ? 0 : 20, 0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.only(
                            top: _currentPage.round() == index ? 30 : 50,
                            bottom: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 40,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      protagonists.videogame,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      protagonists.name,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // Text(
                                    //   protagonists.price,
                                    //   style: const TextStyle(
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.w600,
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 4),
                                    // FittedBox(
                                    //   child: Text(
                                    //     '${listTitle[0]} \n ${listTitle[1]}',
                                    //     style: const TextStyle(
                                    //       color: Colors.grey,
                                    //       fontWeight: FontWeight.bold,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: constraints.maxHeight * 0.2,
                                left: constraints.maxWidth * 0.1,
                                right: constraints.maxWidth * 0.1,
                                bottom: constraints.maxHeight * 0.15,
                                child: Hero(
                                  tag: protagonists.name,
                                  child: Image(
                                    image: AssetImage(
                                      protagonists.listImage[0].image,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Material(
                                  color: protagonists.listImage[0].color,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(color: getColor(_currentPage.round())),
          ),
        ],
      ),
    );
  }
}

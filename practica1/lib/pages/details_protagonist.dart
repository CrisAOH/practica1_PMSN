import 'package:flutter/material.dart';
import 'package:practica1/models/protagonists.dart';
import 'package:practica1/widgets/custom_button.dart';
import 'package:practica1/widgets/transition.dart';

class DetailsProtagonistPage extends StatefulWidget {
  const DetailsProtagonistPage({Key? key, required this.protagonist})
      : super(key: key);

  final Protagonist protagonist;

  @override
  State<DetailsProtagonistPage> createState() => _DetailsProtagonistPageState();
}

class _DetailsProtagonistPageState extends State<DetailsProtagonistPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double sizeProtagonist(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.17);
      case 1:
        return (size.height * 0.15);
      case 2:
        return (size.height * 0.13);
      case 3:
        return (size.height * 0.11);
      default:
        return (size.height * 0.01);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                tween: Tween(
                  begin: 0,
                  end: 1,
                ),
                builder: (context, value, __) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: value * (size.height * 0.5),
                    width: value * (size.height * 0.5),
                    decoration: BoxDecoration(
                      color:
                          widget.protagonist.listImage[valueIndexColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.20,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              // child: FittedBox(
              //   child: Text(
              //     widget.protagonist.category,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey[100],
              //     ),
              //   ),
              // ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: size.height * 0.22,
            right: sizeProtagonist(valueIndexSize, size),
            left: sizeProtagonist(valueIndexSize, size),
            child: Hero(
              tag: widget.protagonist.name,
              child: Image(
                image: AssetImage(
                  widget.protagonist.listImage[valueIndexColor].image,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.protagonist.videogame,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.protagonist.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ShakeTransition(
                    //   left: false,
                    //   child: Text(
                    //     widget.protagonist.status,
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   children: List.generate(
                      //     5,
                      //     (index) => Icon(
                      //       Icons.star,
                      //       color: widget.protagonist.punctuation > index
                      //           ? widget.protagonist.listImage[valueIndexColor]
                      //               .color
                      //           : Colors.white,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'ZOOM',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: CustomButton(
                              onTap: () {
                                valueIndexSize = index;
                                setState(() {});
                              },
                              color: index == valueIndexSize
                                  ? widget.protagonist
                                      .listImage[valueIndexColor].color
                                  : Colors.white,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: index == valueIndexSize
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'RENDERS',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                          widget.protagonist.listImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              valueIndexColor = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color:
                                    widget.protagonist.listImage[index].color,
                                shape: BoxShape.circle,
                                border: index == valueIndexColor
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ShakeTransition(
                  left: false,
                  child: CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('About'),
                            content: Text(
                                '${widget.protagonist.description}\n\nAllies: ${widget.protagonist.allies}\nEnemies: ${widget.protagonist.enemies}'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    width: 115,
                    color: widget.protagonist.listImage[valueIndexColor].color,
                    child: const Text(
                      'Show more',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

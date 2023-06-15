import 'package:flutter/material.dart';
import 'package:healtyapps/content_start.dart';
import 'package:healtyapps/page_one.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: Image.asset(
                          contents[i].image,
                          height: 350,
                        ),
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff7F78D2),
                          shadows: <Shadow>[
                            Shadow(
                                color: Color.fromARGB(64, 0, 0, 0),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          contents[i].description,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                contents.length, (index) => buildDot(index, context)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100, top: 50),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff7F78D2)),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PageOne()));
                  }
                  _controller.nextPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                },
                child: Center(
                  child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next",
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      // ignore: use_full_hex_values_for_flutter_colors
                      color: Color(0xfffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff7F78D2)),
    );
  }
}

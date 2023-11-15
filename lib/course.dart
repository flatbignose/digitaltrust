import 'package:flutter/material.dart';

class ScreenSubject extends StatelessWidget {
  const ScreenSubject({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 64, 124),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    color: const Color.fromARGB(255, 3, 64, 124),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'asset/images/4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    color: Colors.white,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(size: size)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 200,
              left: 20,
              right: 20,
              child: Center(
                child: Container(
                  width: size.width * 0.95,
                  height: 100,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 241, 236, 236)),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Matematika',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Kelas XII MIPA',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Teacher : Hartati, S.Pd',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Gasal 2020/2021')],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: size.width * 0.95,
        height: 40,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 3, 64, 124),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: const Center(
            child: Text(
          'Enroll',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}

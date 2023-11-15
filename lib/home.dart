import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:machine/course.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('asset/images/1.png'),
                    ),
                    title: Text('Salsabila'),
                    subtitle: Text('XII Grade Student'),
                  ),
                ),
                const DrawerListTile(
                  icon: Icons.menu_book_rounded,
                  title: 'Course',
                ),
                const DrawerListTile(
                  icon: Icons.menu_book_rounded,
                  title: 'Course',
                ),
                const DrawerListTile(
                  icon: Icons.menu_book_rounded,
                  title: 'Course',
                ),
                const DrawerListTile(
                  icon: Icons.menu_book_rounded,
                  title: 'Course',
                ),
                const DrawerListTile(
                  icon: Icons.menu_book_rounded,
                  title: 'Course',
                ),
                const Spacer(),
                const DrawerListTile(title: 'Log Out', icon: Icons.logout)
              ],
            ),
          ),
        ),
      ),
      controller: _advancedDrawerController,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 3, 64, 124)),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 236, 236),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
          actions: const [Icon(Icons.notifications_active_rounded)],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListView(
            children: [
              const Text(
                'Good Morning,',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Sahil Saleem',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your Achievement',
                style: TextStyle(fontSize: 23),
              ),
              Container(
                  height: 200,
                  width: double.infinity,
                  child: const HorizontalScroll()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Material This Week',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const CustomTile(
                image: 'asset/images/2.png',
                title: 'Human Digesting System',
                subTitle: 'Biology',
              ),
              const CustomTile(
                image: 'asset/images/3.png',
                title: 'Mathematics Logics',
                subTitle: 'Mathematics',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text('Your Course'),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black54),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        width: 70,
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const SubSingleHorizontal(color: Colors.white),
                      const SubSingleHorizontal(color: Colors.white),
                      const SubSingleHorizontal(color: Colors.white),
                      const SubSingleHorizontal(color: Colors.white),
                      const SubSingleHorizontal(color: Colors.white),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
      title: Text(title),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 3, 64, 124),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            subTitle,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SingleHorizontal(
          color: Color.fromARGB(255, 3, 64, 124),
          int: '8',
          name: 'Materi Selasai',
        ),
        SingleHorizontal(
          color: Colors.amber.shade500,
          int: '8',
          name: 'Rathore',
        ),
        SingleHorizontal(
          color: Colors.blue.shade900,
          int: '7',
          name: 'Selasai',
        ),
      ],
    );
  }
}

class SingleHorizontal extends StatelessWidget {
  const SingleHorizontal({
    super.key,
    required this.color,
    required this.int,
    required this.name,
  });
  final Color color;
  final String int;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ScreenSubject();
              },
            ));
          },
          child: Container(
            height: 250,
            width: 280,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              int,
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            )),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('asset/images/1.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      name,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}

class SubSingleHorizontal extends StatelessWidget {
  const SubSingleHorizontal({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/2.png'))),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: const Center(child: Text("data")),
                  ),
                )
              ],
            )),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}

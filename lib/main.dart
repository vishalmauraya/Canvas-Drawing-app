import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:draw_canvas/Pages/UserPage.dart';
import 'package:draw_canvas/Pages/AdminPage.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData( scaffoldBackgroundColor: const Color(0xffe7e5e5)),
      home: const MyHomePage(),
    );

  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _isDrawerOpen;

  @override
  void initState() {
    super.initState();
    _isDrawerOpen = false;
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff3f5caa),
        title: Text(
          "DRAW CANVAS",
          style: GoogleFonts.lato(textStyle:TextStyle(letterSpacing:3,fontSize: 24,fontWeight:FontWeight.w700,foreground: Paint()
          ..style=PaintingStyle.stroke
          ..strokeWidth=1.5
          ..color=const Color(0xffe7e5e5))),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu,
          size:30,color: Color(0xff6fc7c4),),

          onPressed: _toggleDrawer,
        ),
      ),
      body: Stack(
        children: [
          // Main content
          SizedBox(
            width: MediaQuery.of(context).size.width, // Adjust width as needed
            height: MediaQuery.of(context).size.height, // Adjust height as needed
            child: const User(),
          ),
          // Drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: _isDrawerOpen ? 0 : -200, // Adjust as needed
            child: SizedBox(
              width: 210, // Width of the drawer
              height: MediaQuery.of(context).size.height, // Adjust height as needed
              child: Container(
                color: Colors.white, // Color of the drawer
                child: ListView(
                  children: [
                    ListTile(
                      leading:const Icon(Icons.person,size: 30,),
                      iconColor: const Color(0xff72cbd8),
                      title: Text('Admin Login',style: GoogleFonts.inter(),),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Admin(),
                          ),
                        );
                      },
                    ),
                    // Other menu options...
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}

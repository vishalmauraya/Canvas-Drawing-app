  import 'dart:ui';
  import 'dart:io';
  import 'dart:core';
  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'dart:math';
  import 'package:draw_canvas/Pages/Canvas/drawableArea.dart';
  import 'package:flutter_colorpicker/flutter_colorpicker.dart';

  List<Map<String, dynamic>> points = [];
  Color penColor = Colors.blue;



  class User extends StatefulWidget {
    const User({Key? key}) : super(key: key);

    @override
    State<User> createState() => _UserState();
  }

  class _UserState extends State<User> {
    final Random rnd = Random(); // Initialize rnd
    dynamic imageList = [
      "Images/cid1.png",
      "Images/cid2.png",
      "Images/cid3.png",
      "Images/cid4.png",
      "Images/cid5.png",
      "Images/cid6.png",
      "Images/cid7.png",
      "Images/cid8.png",
      "Images/cid9.png"
    ];
    void clearPoints() {
      setState(() {
        points = [];
      });
    }
    void handleDrawingSubmit(List<double> points) {
      // Add your logic here to handle the drawing submission
      print('Drawing submitted with points: $points');
    }

    String buildImage(BuildContext context) {
      int min = 0;
      int max = imageList.length - 1;
      int r = min + rnd.nextInt(max - min);
      String imageName = imageList[r].toString();
      return imageName; // Return image path as String
    }

    @override
    Widget build(BuildContext context) {
      String imageName = buildImage(context);

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: GestureDetector(
                child: Image.asset(imageName),
                onDoubleTap: () {
                  setState(() {
                    imageName = buildImage(context);
                  });
                },
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.grey[200],
              child: DynamicCanvas(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print("image  pressed");
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff003652)),
                  ),
                  child: TextButton(
                    onPressed:clearPoints,
                      child: Text("RESET",
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white, // Text color
                      ),
                    ),)
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 5),
                TextButton(
                  onPressed: () {
                    print("Submit button pressed");
                    setState(() {
                      imageName = buildImage(context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff003652)),
                  ),
                  child: Text(
                    "SUBMIT",
                    style: GoogleFonts.mukta(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  // class DrawingArea extends StatelessWidget {
  //   final Function(List<double>) onSubmit;
  //
  //   DrawingArea({required this.onSubmit});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     // Your drawing area implementation
  //     return Container();
  //   }
  // }



  class DynamicCanvas extends StatefulWidget {
    @override
    _DynamicCanvasState createState() => _DynamicCanvasState();
  }

  class _DynamicCanvasState extends State<DynamicCanvas> {
    void clearPoints() {
      setState(() {
        points = [];
      });
    }

    void selectColor() async {
      Color? pickedColor = await showDialog(
        context: context,
        builder: (context) => ColorPickerDialog(currentColor: penColor),
      );

      if (pickedColor != null) {
        setState(() {
          penColor = pickedColor;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    RenderBox renderBox = context.findRenderObject() as RenderBox;
                    points.add({
                      'point': renderBox.globalToLocal(details.globalPosition),
                      'color': penColor
                    });
                  });
                },
                onPanEnd: (details) {
                  points.add({'point': Offset.zero, 'color': penColor});
                },
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: DynamicCanvasPainter(points: points),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: clearPoints,
                      child: Icon(Icons.clear),
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: selectColor,
                      child: Icon(Icons.color_lens),
                      backgroundColor: penColor,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  class DynamicCanvasPainter extends CustomPainter {
    final List<Map<String, dynamic>> points;

    DynamicCanvasPainter({required this.points});

    @override
    void paint(Canvas canvas, Size size) {
      Paint paint = Paint()
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;

      for (int i = 0; i < points.length - 1; i++) {
        if (points[i]['point'] != Offset.zero && points[i + 1]['point'] != Offset.zero) {
          paint.color = points[i]['color'];
          canvas.drawLine(points[i]['point'], points[i + 1]['point'], paint);
        }
      }
    }

    @override
    bool shouldRepaint(DynamicCanvasPainter oldDelegate) {
      return oldDelegate.points != points;
    }
  }

  class ColorPickerDialog extends StatefulWidget {
    final Color currentColor;

    ColorPickerDialog({required this.currentColor});

    @override
    _ColorPickerDialogState createState() => _ColorPickerDialogState();
  }

  class _ColorPickerDialogState extends State<ColorPickerDialog> {
    Color selectedColor;

    _ColorPickerDialogState() : selectedColor = Colors.blue;

    @override
    void initState() {
      super.initState();
      selectedColor = widget.currentColor;
    }

    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: Text('Select Pen Color'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(selectedColor);
            },
            child: Text('Select'),
          ),
        ],
      );
    }
  }

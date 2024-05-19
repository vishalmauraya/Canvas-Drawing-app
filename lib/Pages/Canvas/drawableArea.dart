import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//
// class DynamicCanvas extends StatefulWidget {
//   @override
//   _DynamicCanvasState createState() => _DynamicCanvasState();
// }
//
// class _DynamicCanvasState extends State<DynamicCanvas> {
//   List<Map<String, dynamic>> points = [];
//   Color penColor = Colors.blue;
//
//   void clearPoints() {
//     setState(() {
//       points = [];
//     });
//   }
//
//   void selectColor() async {
//     Color? pickedColor = await showDialog(
//       context: context,
//       builder: (context) => ColorPickerDialog(currentColor: penColor),
//     );
//
//     if (pickedColor != null) {
//       setState(() {
//         penColor = pickedColor;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Stack(
//           children: [
//             GestureDetector(
//               onPanUpdate: (details) {
//                 setState(() {
//                   RenderBox renderBox = context.findRenderObject() as RenderBox;
//                   points.add({
//                     'point': renderBox.globalToLocal(details.globalPosition),
//                     'color': penColor
//                   });
//                 });
//               },
//               onPanEnd: (details) {
//                 points.add({'point': Offset.zero, 'color': penColor});
//               },
//               child: Container(
//                 width: constraints.maxWidth,
//                 height: constraints.maxHeight,
//                 child: CustomPaint(
//                   size: Size(constraints.maxWidth, constraints.maxHeight),
//                   painter: DynamicCanvasPainter(points: points),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 20,
//               right: 20,
//               child: Column(
//                 children: [
//                   FloatingActionButton(
//                     onPressed: clearPoints,
//                     child: Icon(Icons.clear),
//                   ),
//                   SizedBox(height: 10),
//                   FloatingActionButton(
//                     onPressed: selectColor,
//                     child: Icon(Icons.color_lens),
//                     backgroundColor: penColor,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class DynamicCanvasPainter extends CustomPainter {
//   final List<Map<String, dynamic>> points;
//
//   DynamicCanvasPainter({required this.points});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 5.0;
//
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i]['point'] != Offset.zero && points[i + 1]['point'] != Offset.zero) {
//         paint.color = points[i]['color'];
//         canvas.drawLine(points[i]['point'], points[i + 1]['point'], paint);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(DynamicCanvasPainter oldDelegate) {
//     return oldDelegate.points != points;
//   }
// }
//
// class ColorPickerDialog extends StatefulWidget {
//   final Color currentColor;
//
//   ColorPickerDialog({required this.currentColor});
//
//   @override
//   _ColorPickerDialogState createState() => _ColorPickerDialogState();
// }
//
// class _ColorPickerDialogState extends State<ColorPickerDialog> {
//   Color selectedColor;
//
//   _ColorPickerDialogState() : selectedColor = Colors.blue;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedColor = widget.currentColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Select Pen Color'),
//       content: SingleChildScrollView(
//         child: BlockPicker(
//           pickerColor: selectedColor,
//           onColorChanged: (color) {
//             setState(() {
//               selectedColor = color;
//             });
//           },
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(selectedColor);
//           },
//           child: Text('Select'),
//         ),
//       ],
//     );
//   }
// }

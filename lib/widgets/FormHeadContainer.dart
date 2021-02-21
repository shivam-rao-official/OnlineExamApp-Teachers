// Module Imports
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomFormHeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Rect,
      strokeWidth: 2,
      dashPattern: [5, 5],
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height / 5,
        // child: Padding(
        //   padding: const EdgeInsets.only(
        //       left: 20.0, top: 20, bottom: 20.0, right: 20.0),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         children: [
        //           labelField("Name"),
        //           // labelField("ID"),
        //         ],
        //       ),
        //       labelField("Subject Name"),
        //       labelField("Subject Code"),
        //       // Row(
        //       //   children: [
        //       //     labelField("Exam Type"),
        //       //     labelField("Total Marks"),
        //       //   ],
        //       // ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget labelField(String label) {
    return Expanded(
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

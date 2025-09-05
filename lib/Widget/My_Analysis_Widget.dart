// import 'package:flutter/material.dart';
// import 'package:ptow/Models/My_Records_Model.dart';

// class My_Analysis_Widget extends StatelessWidget {
//   final Analysis_Model analysis;
//   final String token;

//   My_Analysis_Widget({Key? key, required this.analysis, required this.token})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         child: Card(
//           color: const Color.fromARGB(255, 233, 229, 229),
//           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 4,
//           child: Padding(
//             padding: const EdgeInsets.all(60),

//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 4),
//                 Text("Disease: ${analysis.disease}."),
//                 Text("model_confidence: ${analysis.model_confidence}"),
//                 Text("Date Of Analysis: ${analysis.analyzed_at}"),
//                 Text("Urgency: ${analysis.urgency}"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ptow/Models/My_Records_Model.dart';
import 'package:ptow/Pages/Analysis_Details.dart';

class My_Analysis_Widget extends StatelessWidget {
  final Analysis_Model analysis;

  const My_Analysis_Widget({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(Icons.analytics, color: Colors.red),
        ),
        title: Text('CBC', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Disease: ${analysis.disease}."),
            Text("model_confidence: ${analysis.model_confidence}"),
            Text("Date Of Analysis: ${analysis.analyzed_at}"),
            Text("Urgency: ${analysis.urgency}"),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => Analysis_Details(
                id: analysis.id,
                disease: analysis.disease,
                diagnosis: analysis.diagnosis,
                suggested_doctor: analysis.suggested_doctor,
                urgency: analysis.urgency,
                model_confidence: analysis.model_confidence,
                analyzed_at: analysis.analyzed_at,
              ),
            ),
          );
        },
      ),
    );
  }
}

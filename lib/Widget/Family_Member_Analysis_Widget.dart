import 'package:flutter/material.dart';
import 'package:ptow/Models/Famely_Members_Records_Model.dart';
import 'package:ptow/Pages/Analysis_Details.dart';

class Family_Member_Analysis_Widget extends StatelessWidget {
  final Family_Member_Analysis_Model analysis;

  Family_Member_Analysis_Widget({Key? key, required this.analysis})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
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
      ),
    );
  }
}

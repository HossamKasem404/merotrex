import 'package:flutter/material.dart';
import 'package:ptow/services/drugbank_service.dart';

class DrugScreen extends StatefulWidget {
  const DrugScreen({super.key});

  @override
  State<DrugScreen> createState() => _DrugScreenState();
}

class _DrugScreenState extends State<DrugScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final DrugService _service = DrugService();

  List<Map<String, String>> _drugs = [];
  Map<String, Map<String, String>> _details = {};
  bool _loading = false;

  Future<void> _searchDrug() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _loading = true;
      _drugs.clear();
      _details.clear();
    });

    final results = await _service.searchDrug(_controller.text.trim());

    for (var drug in results) {
      final detail = await _service.getDrugDetails(drug["name"]!);
      _details[drug["rxcui"]!] = detail;
    }

    setState(() {
      _drugs = results;
      _loading = false;
    });
  }

  Widget _buildInfoRow(IconData icon, String title, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrugCard(Map<String, String> drug, int index) {
    final detail = _details[drug["rxcui"]] ?? {};

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Card(
        elevation: 10,
        shadowColor: Colors.indigoAccent.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.medical_services,
                            size: 32,
                            color: Colors.indigo,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              drug["name"] ?? "Unknown",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "RXCUI: ${drug["rxcui"]}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                      const Divider(height: 24, thickness: 1),
                      _buildInfoRow(
                        Icons.playlist_add_check,
                        "Indications",
                        detail["indications"] ?? "N/A",
                        Colors.green,
                      ),
                      _buildInfoRow(
                        Icons.warning_amber_rounded,
                        "Warnings",
                        detail["warnings"] ?? "N/A",
                        Colors.redAccent,
                      ),
                      _buildInfoRow(
                        Icons.healing,
                        "Side Effects",
                        detail["sideEffects"] ?? "N/A",
                        Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: ListTile(
            leading: Hero(
              tag: "drug-${drug["rxcui"]}",
              child: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: const Icon(Icons.medication, color: Colors.indigo),
              ),
            ),
            title: Text(
              drug["name"] ?? "Unknown",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            subtitle: Text("RXCUI: ${drug["rxcui"]}"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2D6),
      appBar: AppBar(
        title: const Text("Drug Info Search"),
        centerTitle: true,
        backgroundColor: Color(0xFF244476),
        elevation: 6,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF244476), Color(0xFF244476)],
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Enter drug name (e.g. Aspirin)",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: _searchDrug,
                ),
              ],
            ),
          ),
          if (_loading)
            const LinearProgressIndicator(color: Colors.indigo, minHeight: 3),
          Expanded(
            child: _drugs.isEmpty && !_loading
                ? const Center(
                    child: Text(
                      "No results yet",
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _drugs.length,
                    itemBuilder: (context, index) =>
                        _buildDrugCard(_drugs[index], index),
                  ),
          ),
        ],
      ),
    );
  }
}

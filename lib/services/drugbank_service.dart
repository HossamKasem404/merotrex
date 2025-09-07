import 'dart:convert';
import 'package:http/http.dart' as http;

class DrugService {
  final String rxNormBase = "https://rxnav.nlm.nih.gov/REST";
  final String openFdaBase = "https://api.fda.gov/drug/label.json";

  Future<List<Map<String, String>>> getRxcuis(String drugName) async {
    final url = Uri.parse("$rxNormBase/rxcui.json?name=$drugName");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final ids = data["idGroup"]["rxnormId"];
      if (ids != null) {
        return List<String>.from(ids).map((rxcui) => {"rxcui": rxcui}).toList();
      }
    }
    return [];
  }

  Future<Map<String, String>?> getDrugName(String rxcui) async {
    final url = Uri.parse(
      "$rxNormBase/rxcui/$rxcui/property.json?propName=RxNorm%20Name",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final name = data["propConceptGroup"]["propConcept"]?[0]?["propValue"];
      if (name != null) {
        return {"rxcui": rxcui, "name": name};
      }
    }
    return null;
  }

  Future<List<Map<String, String>>> searchDrug(String drugName) async {
    final rxcuis = await getRxcuis(drugName);
    List<Map<String, String>> drugs = [];
    for (var item in rxcuis) {
      final details = await getDrugName(item["rxcui"]!);
      if (details != null) drugs.add(details);
    }
    return drugs;
  }

  Future<Map<String, String>> getDrugDetails(String drugName) async {
    final url = Uri.parse(
      "$openFdaBase?search=openfda.brand_name:$drugName&limit=1",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['results'] != null && data['results'].isNotEmpty) {
        final result = data['results'][0];
        return {
          "sideEffects": result['adverse_reactions']?.join("\n") ?? "No data",
          "indications":
              result['indications_and_usage']?.join("\n") ?? "No data",
          "warnings": result['warnings']?.join("\n") ?? "No data",
        };
      }
    }
    return {
      "sideEffects": "No data",
      "indications": "No data",
      "warnings": "No data",
    };
  }
}

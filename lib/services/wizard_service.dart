import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wizard.dart';

class WizardService {
  final String apiUrl = "https://wizard-world-api.herokuapp.com/api/v1/wizards";

  Future<List<Wizard>> fetchWizards() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((wizard) => Wizard.fromJson(wizard)).toList();
    } else {
      throw Exception("Failed to load wizards");
    }
  }
}
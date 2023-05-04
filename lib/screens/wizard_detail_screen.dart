import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/wizard.dart';
import '../services/wizard_service.dart';

class WizardDetailScreen extends StatelessWidget {
  final String wizardId;

  WizardDetailScreen({required this.wizardId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Élixirs du sorcier'),
      ),
      body: FutureBuilder<Wizard>(
        future: Provider.of<WizardService>(context, listen: false).fetchWizard(wizardId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur lors du chargement des données'));
          } else {
            final elixirs = snapshot.data!.elixirs;
            return ListView.builder(
              itemCount: elixirs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(elixirs[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/wizard.dart';
import '../services/wizard_service.dart';
import 'package:go_router/go_router.dart';

class WizardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorciers'),
      ),
      body: FutureBuilder<List<Wizard>>(
        future: Provider.of<WizardService>(context, listen: false).fetchWizards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur lors du chargement des données'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final wizard = snapshot.data![index];
                final displayName =
                    wizard.firstName.isNotEmpty ? '${wizard.firstName} ${wizard.lastName}' : wizard.lastName;
                return Card(
                  child: ListTile(
                    title: Text(displayName),
                    onTap: () {
                      final goRouter = GoRouter.of(context);
                      goRouter.go('/wizard/${index + 1}');
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
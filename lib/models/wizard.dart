class Wizard {
  final String firstName;
  final String lastName;
  final List<String> elixirs;

  Wizard({required this.firstName, required this.lastName, required this.elixirs});

  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'],
      elixirs: List<String>.from(json['elixirs']),
    );
  }
}
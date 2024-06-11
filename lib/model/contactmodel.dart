class ContactModel {
  final String name;
  final String status; // New property

  ContactModel({
    required this.name,
    required this.status, // Initialize the new property
  });

  ContactModel copyWith({
    String? name,
    String? status, // Include the new property in copyWith method
  }) {
    return ContactModel(
      name: name ?? this.name,
      status:
          status ?? this.status, // Include the new property value in the copy
    );
  }
}

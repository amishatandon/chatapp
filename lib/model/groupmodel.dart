class GroupModel {
  final String name;
  final String status;
  bool select = false; // New property

  GroupModel({
    required this.name,
    required this.status,
    this.select = false, // Initialize the new property
  });

  GroupModel copyWith({
    String? name,
    String? status,
    bool? select = false, // Include the new property in copyWith method
  }) {
    return GroupModel(
        name: name ?? this.name,
        status: status ?? this.status,
        select: select ?? false // Include the new property value in the copy
        );
  }
}

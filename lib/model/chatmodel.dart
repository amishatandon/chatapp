class ChatModel1 {
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;

  ChatModel1({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
  });

  ChatModel1 copyWith({
    String? name,
    String? icon,
    bool? isGroup,
    String? time,
    String? currentMessage,
  }) {
    return ChatModel1(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isGroup: isGroup ?? this.isGroup,
      time: time ?? this.time,
      currentMessage: currentMessage ?? this.currentMessage,
    );
  }
}

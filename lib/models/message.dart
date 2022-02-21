class Message {
  final String name, lastMessage, image, time;
  final bool isActive;

  Message({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.isActive,
  });
}

List chatsData = [
  Message(
    name: "Malcom Morel",
    lastMessage: "T TRO COOL POUR ME REPONDRE MEC",
    image: "https://i1.sndcdn.com/avatars-TxTlTnjuRCVM5loh-wkUE7A-t500x500.jpg",
    time: "2m ago",
    isActive: false,
  ),
  Message(
    name: "Bastien Métais",
    lastMessage: "PAUV CON RÉPOND VITE !!",
    image: "https://i1.sndcdn.com/avatars-TxTlTnjuRCVM5loh-wkUE7A-t500x500.jpg",
    time: "2m ago",
    isActive: false,
  ),
];

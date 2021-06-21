class Notice {
  final String text;
  final bool isRead;
  final DateTime date;

  Notice({required this.text, required this.isRead, required this.date});

  static List<Notice> notifications = [
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
    Notice(
        text:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
        isRead: false,
        date: DateTime.now()),
  ];
}

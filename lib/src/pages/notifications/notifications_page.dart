import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/notification.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/sliver_app.dart';

class NotificationsPage extends StatelessWidget {
  final List<Notice> notifications = Notice.notifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverApp(title: "Notificaciones", backButton: true),
          SliverList(
            delegate: SliverChildListDelegate(_mockNotifications()),
          ),
        ],
      ),
    );
  }

  List<Widget> _mockNotifications() {
    return List.generate(
        notifications.length,
        (i) => Container(
                child: Column(
              children: [
                ListTile(
                    leading: CircleAvatar(
                        radius: 5.0,
                        backgroundColor: notifications[i].isRead
                            ? Colors.transparent
                            : kPrimaryColor),
                    title: Text(notifications[i].text, style: TextStyle()),
                    onTap: () {},
                    subtitle: Text(
                      "${notifications[i].date.day}/${notifications[i].date.month}/${notifications[i].date.year}",
                      style: TextStyle(fontSize: 12.0),
                      textAlign: TextAlign.end,
                    )),
                Divider()
              ],
            )));
  }
}

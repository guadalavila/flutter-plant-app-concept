import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/notification.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class NotificationsPage extends StatelessWidget {
  final List<Notice> notifications = Notice.notifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                iconSize: 25.0,
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            backgroundColor: kBackgroundColor,
            expandedHeight: 140.0,
            elevation: 1,
            actions: [],
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Notificaciones",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                background: Container(
                    decoration: BoxDecoration(color: kBackgroundColor))),
          ),
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

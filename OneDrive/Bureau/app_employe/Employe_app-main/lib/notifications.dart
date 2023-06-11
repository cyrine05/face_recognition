import 'package:app_employe/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import 'controllers/notifcontroller.dart';
import 'home.dart';

class Notifis extends StatefulWidget {
  const Notifis({super.key});

  @override
  State<Notifis> createState() => _NotifisState();
}

final NotifController notifController = Get.put(NotifController());

class _NotifisState extends State<Notifis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(Home()),
        ),
        title: LabelTxt(text: 'Notifications', size: 20.0, fn: FontWeight.w600),
        backgroundColor: const Color(0xff3A1078),
        elevation: 0,
      ),
      body: Container(
        child: Obx(() {
          if (notifController.Notifs.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              children: [
                for (var n in notifController.Notifs)
                  NotificationCard(
                    title: n.title.toString(),
                    subtitle: n.message.toString(),
                    time: 'Il y a 2 heures',
                  ),
                SizedBox(height: 16),
              ],
            );
          }
        }),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const NotificationCard({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(subtitle),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: Colors.grey,
              ),
              SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentalhub/users/owner/pages/messages/ownerMessage.dart';
import 'package:rentalhub/pages/profile_page.dart';
class Message {
  final String tenantName;
  final DateTime dateTime;
  final String content;

  Message({
    required this.tenantName,
    required this.dateTime,
    required this.content,
  });
}

List<Message> sampleMessages = [
  Message(
    tenantName: "Ernest Ephraim",
    dateTime: DateTime.now(),
    content: "Can i see you this sunday for contract negotiations",
  ),
  Message(
    tenantName: "Mpangaji",
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    content: "I need some maintainance in my Apartment.",
  ),
  // Add more sample messages here
];

class OwnerListMessage extends StatefulWidget {
  const OwnerListMessage({super.key});

  @override
  State<OwnerListMessage> createState() => _OwnerListMessageState();
}

class _OwnerListMessageState extends State<OwnerListMessage> {
 final String ownerName = "Paschal Ephraim";
  final String email = "paschalephraim@gmail.com";
  final String location = "Arusha";

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));


if (date.isBefore(today)) {
      return 'Yesterday';
    } else if (date.isAfter(yesterday)) {
      return 'Today';
    } else {
      return DateFormat('yyyy-MM-dd').format(date);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        title: Text('Messages'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: sampleMessages.length,
        itemBuilder: (context, index) {
          final message = sampleMessages[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                    '${formatDate(message.dateTime)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.tenantName,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${message.content}',
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.brown,
                      ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Text(
                DateFormat('hh:mm a').format(message.dateTime),
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OwnerMessage(
                      tenantName: message.tenantName,
                      dateTime: message.dateTime,
                      content: message.content,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      drawer: ProfileDrawer(
        username: ownerName,
        email: email,
        location: location,
        role: "Owner",
        onLogout: () {
          // Implement logout functionality
        },
      ),
    );
  }
}
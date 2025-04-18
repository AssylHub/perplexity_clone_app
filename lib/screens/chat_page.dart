import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:perplexity_clone_app/widgets/side_bar.dart';
import 'package:perplexity_clone_app/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.question});

  final String question;

  //  StreamBuilder(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          SizedBox(width: 100),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 24),
                SourcesSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

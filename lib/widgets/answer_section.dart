import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_clone_app/services/chat_web_service.dart';
import 'package:perplexity_clone_app/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''

  Here is some regular text introducing the topic. It flows naturally and provides some context before we get to the key points.

This is the **highlighted text** that I want the skeletonizer to specifically recognize or process differently. It might be a key term, a summary statement, or something important.

And here is an unordered list related to the topic:
* This is the first item in the list.
* This is the second important item.
* A third point to consider in the list.
* Finally, the last item in this example list.

More regular text can follow the list, continuing the discussion or concluding the section.

''';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = '';
      }
      setState(() {
        fullResponse += data["data"];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        
        Text(
          "Perplexity",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(
              Theme.of(context),
            ).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

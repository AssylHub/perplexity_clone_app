import 'package:flutter/material.dart';
import 'package:perplexity_clone_app/theme/app_colors.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  List<Map<String, dynamic>> searchResults = [
    {
      "title": "India vs Australia 1st ODI: India wins by 5 wickets",
      "url": "https://sports.example.com/ind-vs-aus-1st-odi",
    },
    {
      "title": "India vs Australia 2nd ODI: Australia levels the series",
      "url": "https://sports.example.com/ind-vs-aus-2nd-odi",
    },
    {
      "title": "India vs Australia Final: Thrilling tie in the decider",
      "url": "https://sports.example.com/ind-vs-aus-final",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined, color: Colors.white70),
            SizedBox(width: 8),
            Text(
              "Sources",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              searchResults.map((res) {
                return Container(
                  padding: EdgeInsets.all(16),
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        res["title"],
                        style: TextStyle(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        res["url"],
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}

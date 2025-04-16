import 'package:flutter/material.dart';
import 'package:perplexity_clone_app/theme/app_colors.dart';
import 'package:perplexity_clone_app/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),

      width: isCollapsed ? 64 : 150,
      color: AppColors.sideNav,
      child: Column(
        children: [
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

            child: Icon(
              Icons.auto_awesome_mosaic,
              color: AppColors.whiteColor,
              size: isCollapsed ? 30 : 60,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isCollapsed
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),

                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.add,
                  text: "Home",
                ),

                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.search,
                  text: "Search",
                ),

                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.language,
                  text: "Language",
                ),

                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.auto_awesome,
                  text: "Discover",
                ),

                SideBarButton(
                  isCollapsed: isCollapsed,
                  icon: Icons.cloud_outlined,
                  text: "Library",
                ),

                Spacer(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              padding: EdgeInsets.all(2),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),

          SizedBox(height: 16),
        ],
      ),
    );
  }
}

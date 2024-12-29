import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customDrawer() {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade100,
            Colors.green.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(
                    0,
                    5,
                  ),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_balance_wallet,
                    size: 40,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PennyWise',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Manage your finances wisely',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              children: [
                buildDrawerItem(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    Get.back();
                  },
                ),
                buildDrawerItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    Get.back();
                  },
                ),
                buildDrawerItem(
                  icon: Icons.help,
                  title: 'Help',
                  onTap: () {
                    Get.back();
                  },
                ),
                buildDrawerItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white54,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.info_outline,
                  color: Colors.white.withOpacity(0.8),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDrawerItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isSelected = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 6.0,
    ),
    child: ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.green.shade900 : Colors.white,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.green.shade900 : Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      tileColor: isSelected
          ? Colors.green.shade100
          : Colors.green.shade800.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(
                color: Colors.green.shade900,
                width: 2,
              )
            : BorderSide.none,
      ),
    ),
  );
}

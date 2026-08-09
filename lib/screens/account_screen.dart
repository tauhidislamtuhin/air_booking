import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../utils/custom_colors.dart';
import '../widgets/common_header.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppTheme.themeModeNotifier,
      builder: (context, currentThemeMode, _) {
        final isDarkMode = currentThemeMode == ThemeMode.dark;
        final dividerColor = CustomColors.getBorderColor(context);

        return Scaffold(
          backgroundColor: CustomColors.getBackgroundColor(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Profile header section
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CommonHeader(height: 220),
                    SafeArea(
                      child: Column(
                        children: [
                          const Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(
                                  "assets/images/profile.png",
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: CustomColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Andrew Ainsley",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "andrew.ainsley@yourdomain.com",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Account settings menu list
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Dark Mode switcher tile
                      _buildMenuContainer(
                        child: ListTile(
                          leading: Icon(
                            isDarkMode ? Icons.dark_mode : Icons.light_mode,
                            color: isDarkMode
                                ? Colors.amber
                                : CustomColors.primaryColor,
                          ),
                          title: Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.getTextColor(context),
                            ),
                          ),
                          trailing: Switch.adaptive(
                            value: isDarkMode,
                            activeColor: CustomColors.primaryColor,
                            onChanged: (value) {
                              AppTheme.themeModeNotifier.value =
                              value ? ThemeMode.dark : ThemeMode.light;
                            },
                          ),
                        ),
                      ),

                      _buildMenuItem(
                        icon: Icons.person_outline,
                        title: "Edit Profile",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.confirmation_number_outlined,
                        title: "My Bookings",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.payment_outlined,
                        title: "Payment Methods",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.notifications_none_outlined,
                        title: "Notification Settings",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.security_outlined,
                        title: "Security & Privacy",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.help_outline,
                        title: "Help & Support",
                        onTap: () {},
                      ),

                      const SizedBox(height: 10),
                      Divider(color: dividerColor, thickness: 1),
                      const SizedBox(height: 10),

                      // Logout button tile
                      _buildMenuItem(
                        icon: Icons.logout,
                        title: "Logout",
                        iconColor: Colors.red,
                        textColor: Colors.red,
                        showArrow: false,
                        onTap: () => _showLogoutDialog(context),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper container card for menu item
  Widget _buildMenuContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CustomColors.getCardColor(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }

  // Reusable menu item list tile
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
    bool showArrow = true,
  }) {
    final defaultTextColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return _buildMenuContainer(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor ?? defaultTextColor),
        title: Text(
          title,
          style: TextStyle(
            color: textColor ?? defaultTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: showArrow
            ? Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: subTextColor,
        )
            : null,
      ),
    );
  }

  // Logout confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: CustomColors.getCardColor(ctx),
        title: Text(
          "Logout",
          style: TextStyle(color: CustomColors.getTextColor(ctx)),
        ),
        content: Text(
          "Are you sure you want to log out?",
          style: TextStyle(color: CustomColors.getSubTextColor(ctx)),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              "Cancel",
              style: TextStyle(color: CustomColors.getSubTextColor(ctx)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
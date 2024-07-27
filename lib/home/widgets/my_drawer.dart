import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:anwer_shop/address/screens/address_screen.dart';
import 'package:anwer_shop/authentication/screens/authentication_screen.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/providers/authentication_provider.dart';
import 'package:anwer_shop/register_shop/screens/register_shop_screen.dart';
import 'package:anwer_shop/widgets/my_alert_dialog.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final BuildContext parentContext;
  const MyDrawer({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    final ap = context.read<AuthenticationProvider>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Builder(builder: (c) {
            return DrawerHeader(
                decoration: BoxDecoration(
                  color: scheme.primary,
                  border: Border.all(color: scheme.primary),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          ap.name!.isNotEmpty ? ap.name!.substring(0, 1) : 'F',
                          style: TextStyle(
                            color: scheme.primary,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RegisterShopScreen.routeName);
                      },
                      child: Text(
                        ap.name!.isNotEmpty ? ap.name! : 'Foodpanda',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ));
          }),
          // listTile(
          //   context,
          //   'Orders History',
          //   Icons.my_library_books_outlined,
          //   () {
          //     // Navigator.pushNamed(context, OrderHistoryScreen.routeName);
          //   },
          // ),
          // listTile(
          //   context,
          //   'Addresses',
          //   Icons.location_on_outlined,
          //   () {
          //     Navigator.pushNamed(context, AddressScreen.routeName);
          //   },
          // ),
          listTile(
            context,
            'تحتاج للمساعدة'.tr(),
            Icons.help_outline_outlined,
            () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 1,
            color: MyColors.borderColor,
          ),
          // listTile(
          //   context,
          //   'Settings',
          //   null,
          //   () {
          //     Navigator.pop(context);
          //   },
          // ),
          listTile(
            context,
            "الشروط و الاحكام".tr(),
            null,
            () {
              Navigator.pop(context);
            },
          ),
          Builder(builder: (c) {
            return listTile(
              context,
              'تسجيل الخروج'.tr(),
              null,
              () {
                Scaffold.of(c).closeDrawer();
                showDialog(
                  context: c,
                  builder: (ctx) => MyAlertDialog(
                    title: 'تسجيل الخروج'.tr(),
                    subtitle: "شكرًا لتوقفك هنا. نراكم مرة أخرى قريبًا!".tr(),
                    action1Name: 'الغاء'.tr(),
                    action2Name: 'الخروج'.tr(),
                    action1Func: () {
                      Navigator.pop(ctx);
                    },
                    action2Func: () async {
                      await ap.userSignOut().then((value) =>
                          Navigator.pushNamedAndRemoveUntil(
                              ctx,
                              AuthenticationScreen.routeName,
                              (route) => false));
                    },
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }

  ListTile listTile(
      BuildContext context, String text, IconData? icon, VoidCallback onTap) {
    return icon == null
        ? ListTile(
            title: Text(
              text,
              style: const TextStyle(
                color: MyColors.textColor,
                fontSize: 14,
              ),
            ),
            onTap: onTap,
          )
        : ListTile(
            title: Text(
              text,
              style: const TextStyle(
                color: MyColors.textColor,
                fontSize: 14,
              ),
            ),
            leading: Icon(
              icon,
              color: scheme.primary,
            ),
            onTap: onTap,
          );
  }
}

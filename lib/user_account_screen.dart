import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_shop/constants/app_colors.dart';
import 'package:flutter_shop/screens/more_screen/contacts_screen.dart';
import 'package:flutter_shop/screens/more_screen/profile_screen.dart';
import 'package:flutter_shop/screens/more_screen/settings_screen.dart';
import 'package:flutter_shop/screens/notifications_list_screen.dart';
import 'package:flutter_shop/screens/orders/profile_orders_list_screen.dart';
import 'package:flutter_shop/screens/privacy_policy_screen.dart';
import 'package:flutter_shop/screens/tos_screen.dart';
import 'package:flutter_shop/services/auth/auth_service.dart';
import 'package:flutter_shop/services/notifications_service.dart';
import 'package:flutter_shop/widgets/product/cart_fab.dart';
import 'package:flutter_shop/widgets/user_account_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAccountScreen extends riverpod.ConsumerStatefulWidget {
  const UserAccountScreen({super.key});

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState
    extends riverpod.ConsumerState<UserAccountScreen> {
  void selectScreen(BuildContext ctx, String route) {
    Navigator.of(ctx).pushNamed(
      route,
      arguments: {},
    );
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final loggedUser = ref.watch(authProvider).loggedUser;
    return Scaffold(
      floatingActionButton: const CartFab(),
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
          title: const Text(
            "Аккаунт",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor:
        AppColor.greyLightBack, //Color(0xFFFAFAFA), AppColor.greyLight,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.bgBlueLight,
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Row(
                      children: [
                        loggedUser != null && loggedUser.avatarUrl!=null
                            ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            loggedUser.avatarUrl!,
                          ),
                          backgroundColor: const Color(0xFFE5EFFF),
                          radius: 30.0,
                        )
                            :
                         CircleAvatar(
                          backgroundColor: const Color(0xFFE5EFFF),
                          radius: 30.0,
                          child:
                 SvgPicture.asset('assets/images/user.svg',color: AppColor.mainColor,height: 32,width: 32,),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: riverpod.Consumer(
                            builder: (context, ref, child) {
                              final auth = ref.watch(authProvider);
                              return Text(
                                auth.loggedUser != null
                                    ? auth.loggedUser!.name
                                    : "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ); // Hello world
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset('assets/images/rightArrow.png',
                            color: AppColor.grey,
                            width: w * 0.02,
                            height: h * 0.02),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),

                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius:2,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Дебиторская задолженность:  ',
                        style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ref
                            .read(authProvider)
                            .loggedUser
                            ?.debtBalance
                            .toString() ??
                            "0",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                UserAccountMenu(
                    title: 'Уведомления',
                    imagePath: 'assets/images/notification_bold.svg',
                    onTap: () {
                      ref.read(notificationsProvider).fetchAndSetNotifications();
                      Navigator.of(context).pushNamed(
                        NotificationsListScreen.routeName,
                      );
                    }),
                UserAccountMenu(
                  title: 'История заказов',
                  imagePath: 'assets/images/clock.svg',
                  onTap: () => selectScreen(
                    context,
                    ProfileOrdersListScreen.routeName,
                  ),
                ),
                UserAccountMenu(
                  title: 'Настройки',
                  imagePath: 'assets/images/settings.svg',
                  onTap: () => selectScreen(
                    context,
                    SettingsScreen.routeName,
                  ),
                ),
                UserAccountMenu(
                  title: 'Контакты',
                  imagePath: 'assets/images/document.svg',
                  onTap: () => selectScreen(
                    context,
                    ContactsScreen.routeName,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                UserAccountMenu(
                  title: 'Политика Конфиденциальности',
                  imagePath: 'assets/images/shield.svg',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyScreen(),
                  )),
                ),
                UserAccountMenu(
                  title: 'Условие использования',
                  imagePath: 'assets/images/document.svg',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ToSScreen(),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}

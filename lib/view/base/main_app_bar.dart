import 'package:flutter/material.dart';
import 'package:flutter_grocery/helper/route_helper.dart';
import 'package:flutter_grocery/utill/app_constants.dart';
import 'package:flutter_grocery/utill/dimensions.dart';
import 'package:flutter_grocery/utill/images.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:flutter_grocery/view/base/menu_bar.dart' as menu;


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).cardColor,
        width: 1170.0,
        height: 45.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RouteHelper.menu),
                child: Row(
                children: [
                  Image.asset(Images.app_logo, color: Theme.of(context).primaryColor),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                  Text(AppConstants.APP_NAME, style: poppinsMedium.copyWith(color: Theme.of(context).primaryColor)),
                ],
              )),
            ),
            menu.MenuBar(),
          ],
        )
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}

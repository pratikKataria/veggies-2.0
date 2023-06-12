import 'package:flutter/material.dart';
import 'package:flutter_grocery/provider/auth_provider.dart';
import 'package:flutter_grocery/utill/styles.dart';
import 'package:provider/provider.dart';
import '../../../../utill/dimensions.dart';
import '../../../base/custom_button.dart';

class AccountDeleteDialog extends StatelessWidget {
  final bool isFailed;
  final double rotateAngle;
  final IconData icon;
  final String title;
  final String description;
  final Function onTapTrue;
  final String onTapTrueText;
  final Function onTapFalse;
  final String onTapFalseText;
  AccountDeleteDialog({this.isFailed = false, this.rotateAngle = 0, @required this.icon, @required this.title, @required this.description,@required this.onTapFalse,@required this.onTapTrue, this.onTapTrueText, this.onTapFalseText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return Container(
            width: 300,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Stack(clipBehavior: Clip.none, children: [

              Positioned(
                left: 0, right: 0, top: -55,
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: isFailed ? Theme.of(context).errorColor : Theme.of(context).primaryColor, shape: BoxShape.circle),
                  child: Transform.rotate(angle: rotateAngle, child: Icon(icon, size: 40, color: Colors.white)),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(title, style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text(description, textAlign: TextAlign.center, style: poppinsRegular),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [

                        Expanded(child: CustomButton(buttonText: onTapFalseText, onPressed: onTapFalse)),
                        SizedBox(width: 10,),

                        Expanded(child: authProvider.isLoading ? Center(child: CircularProgressIndicator()) :  CustomButton(buttonText: onTapTrueText, onPressed: onTapTrue)),
                      ],
                    ),
                  ),
                ]),
              ),

            ]),
          );
        }
      ),
    );
  }
}

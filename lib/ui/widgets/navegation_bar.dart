import 'package:flutter/material.dart';
import 'package:la_plaza_app/properties/own_colors.dart';
import 'package:la_plaza_app/ui/widgets/OwnIcons.dart';
import 'package:la_plaza_app/ui/widgets/navegation_bar_item.dart';



class NavegationBar extends StatefulWidget {
  VoidCallback onTapHome;
  VoidCallback onTapMyNotifications;
  VoidCallback onTapOrders;
  VoidCallback onTapConfig;
  int selectedOption;
  NavegationBar({Key key, this.onTapMyNotifications,this.onTapHome,this.onTapOrders,this.onTapConfig,this.selectedOption});
  @override
  _NavegationBarState createState() => _NavegationBarState();
}


class _NavegationBarState extends State<NavegationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: OwnColors.greyBackground,
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: OwnIcons.home,
                title: "Inicio",
                onTap: widget.onTapHome,
                navegationOption: 0,
                selectedOption: widget.selectedOption,
              ),
            ),
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: OwnIcons.th_large_outline,
                title: "Notificaciones",
                onTap: widget.onTapMyNotifications,
                navegationOption: 1,
                selectedOption: widget.selectedOption,
              ),
            ),
            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: OwnIcons.shopping_basket,
                title: "Mis pedidos",
                onTap: widget.onTapOrders,
                navegationOption: 2,
                selectedOption: widget.selectedOption,
              ),
            ),

            Expanded(
              flex: 1,
              child: NavegationBarItem(
                icon: Icons.account_circle,
                title: "Configuración",
                onTap: widget.onTapConfig,
                navegationOption: 3,
                selectedOption: widget.selectedOption,
              ),
            ),
          ],
        ),
      )
    );
  }
}

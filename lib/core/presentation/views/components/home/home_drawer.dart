import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).secondaryHeaderColor,
              Colors.blue[700],
              Colors.blue[800],
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            children: <Widget>[
              _getDrawerListTile(
                context,
                Icons.close,
              ),
              _getDrawerListTile(
                context,
                Icons.library_add_outlined,
                title: 'Adicionar',
              ),
              _getDrawerListTile(
                context,
                Icons.account_balance_wallet_outlined,
                title: 'Minhas contas',
              ),
              _getDrawerListTile(
                context,
                Icons.account_balance_outlined,
                title: 'Meus ativos manuais',
              ),
              _getDrawerListTile(
                context,
                Icons.person_outline,
                title: 'Meu perfil',
              ),
              _getDrawerListTile(
                context,
                Icons.help_outline,
                title: 'Ajuda',
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _getDrawerListTile(BuildContext context, IconData iconData,
          {String title = ''}) =>
      ListTile(
        leading: Icon(iconData),
        title: Text(title),
        onTap: () => Navigator.pop(context),
      );
}

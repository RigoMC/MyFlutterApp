import 'package:flutter/material.dart';
import 'package:primer_proyecto/firebase/facebook_auth.dart';
import 'package:primer_proyecto/models/user_model.dart';
import 'package:primer_proyecto/screens/list_favorites_cloud.dart';
import 'package:primer_proyecto/screens/list_post.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FacebookAuthentication facebookAuthentication = FacebookAuthentication();
  UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola'.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          const ListFavoritesCloud(),
          ListPost(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) {
            setState(() {});
          });
        },
        label: Text(
          'Add post',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        icon: Icon(Icons.add_comment, color: Theme.of(context).iconTheme.color),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(userModel?.photoURL ??
                      "https://img.freepik.com/fotos-premium/mono-vestido-traje-negocios-formal_847288-285.jpg"),
                ),
                accountName: Text(userModel?.name ?? 'Default Name'),
                accountEmail: Text(userModel?.email ?? 'Default Email')),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/events'),
              title: Text(
                'Mis eventos',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text('Registra eventos',
                  style: Theme.of(context).textTheme.bodyLarge),
              leading: Icon(Icons.access_alarm,
                  color: Theme.of(context).iconTheme.color),
              trailing: Icon(Icons.chevron_right,
                  color: Theme.of(context).iconTheme.color),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/popular'),
              title: Text(
                'API videos',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading:
                  Icon(Icons.movie, color: Theme.of(context).iconTheme.color),
              trailing: Icon(Icons.chevron_right,
                  color: Theme.of(context).iconTheme.color),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/pokemons'),
              title: Text(
                'Pokemons',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              leading:
                  Icon(Icons.book, color: Theme.of(context).iconTheme.color),
              trailing: Icon(Icons.chevron_right,
                  color: Theme.of(context).iconTheme.color),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/events');
              },
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}

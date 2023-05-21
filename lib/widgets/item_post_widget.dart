import 'package:flutter/material.dart';
import 'package:primer_proyecto/database/database_helper.dart';
import 'package:primer_proyecto/models/post_model.dart';
import 'package:primer_proyecto/provider/flags_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  PostModel? objPostModel;

  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      backgroundImage: AssetImage("assets/perfil_default.png"),
    );

    final txtUser = Text("  Fecha del POST:  ");

    DateTime fecha = DateTime.parse(objPostModel!.datePost!);
    final datePost = Text(DateFormat('yyyy-MM-dd').format(fecha));

    final imgPost = Image(
      image: NetworkImage(
          "https://img.freepik.com/fotos-premium/mono-vestido-traje-negocios-formal_847288-285.jpg"),
      height: 50,
    );

    final txtDesc = Text(objPostModel!.dscPost!);

    final iconRate = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 170,
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [avatar, txtUser, datePost],
          ),
          Row(
            children: [imgPost, txtDesc],
          ),
          Row(
            children: [
              iconRate,
              Expanded(child: Container()), //espacio vacio que se adapta
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add',
                        arguments: objPostModel);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                'Confirmar borrado',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              content: Text(
                                'Deseas borrar el post?',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      databaseHelper
                                          .DELETE('tblPost',
                                              objPostModel!.idPost!, 'idPost')
                                          .then((value) =>
                                              flag.setflagListPost());
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok')),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('No'),
                                )
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}

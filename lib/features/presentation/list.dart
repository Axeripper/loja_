/*import 'package:flutter/material.dart';
import 'package:loja/data/data_produtos_contants.dart';
import '../../data/users.dart';

class ProdutosListPage extends StatelessWidget {
  const ProdutosListPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Produtos Registrados'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: FutureBuilder(
            future: NotesDatabase.instance.readAllNotes(),
            builder: (BuildContext context,
                AsyncSnapshot<List<NoteFields>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow.shade400,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  //final NoteFields note = snapshot.data![index];
                  return const Padding(
                    padding: EdgeInsets.only(left: 8, right: 4),
                    /*child: Text(
                      nome = NoteFields.name,
                    ),*/
                  );
                },
              );
            },
          ),
        ),
      );
}*/

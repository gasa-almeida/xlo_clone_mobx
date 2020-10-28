import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_clone_mobx/.env.dart';
import 'package:xlo_clone_mobx/screens/base/base_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_clone_mobx/stores/page_store.dart';

void main() async {

  final chaveParse = new ChaveParse();

  WidgetsFlutterBinding.ensureInitialized();
  await chaveParse.initializeParse();
  setupLocators();
  runApp(MyApp());

  //Criação de uma classe(Tabela) e objeto(registro)
//  final category = ParseObject('Categories')..set<String>('Title', 'Blusas')..set<int>('Position', 3);
//  final response = await category.save();
//  print(response.success);

  //Modificação de um objeto, um registro
//  final category = ParseObject('Categories')..objectId = '81dccO26UO'..set<int>('Position', 1);
//  final response = await category.save();
//  print(response.success);

  //Removendo um objeto(regsitro)
//  final category = ParseObject('Categories')..objectId = 'LnR6FlZPMC';
//  final response = await category.delete();
//  print(response.success);

  //Como ler um objeto(registro) de uma classe(tabela)
//  final response = await ParseObject('Categories').getObject('qFWgmMiWXW');
//  response.success ? print(response.result): print('Erro');

  //Como ler todos os objetos(registros) de uma classe(tabela)
  final response = await ParseObject('Categories').getAll();
  //response.success ? print(response.results): print('erro'); //ou
  if(response.success) {
    for(final object in response.results) {
      print(object);
    }
  }

//  //Comofazer uma consulta de uma registro especifico
//  final query = QueryBuilder(ParseObject('Categories'));
//  query.whereEqualTo('Position', 3);
//  final response = await query.query();
//  if(response.success){
//    print(response.result);
//  }

  //Comofazer uma consulta de registros que contém o texto
//  final query = QueryBuilder(ParseObject('Categories'));
//  query.whereContains('Title', 'Blusas');
//  query.whereEqualTo('Position', 2); //Podemos combinar a busca com outros critérios adicionando linha de query na sequencia
//  final response = await query.query();
//  if(response.success){
//    print(response.result);
//  }

}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XLO',
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cursorColor: Colors.orange,
        appBarTheme: AppBarTheme(
          elevation: 0,
        )
      ),
      home: BaseScreen(),
    );
  }
}


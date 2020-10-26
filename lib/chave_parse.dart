import 'package:parse_server_sdk/parse_server_sdk.dart';

class ChaveParse {

  Future<void> initializeParse() async {
    //Inicialização do Parse Server
    await Parse().initialize(
      'CUZ8AO0QDlgEJtW1RbuHCAu125GUJLAyhyhc18aZ',
      'https://parseapi.back4app.com/',
      clientKey: 'BlT6bQlsTfBpOd38WexvUAGmrJs63JobN1ynoxpw',
      autoSendSessionId: true,
      debug: true,
    );
  }

}
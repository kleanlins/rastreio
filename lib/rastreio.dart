library rastreio;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:html/parser.dart';
import 'package:rastreio/models/evento.dart';

class Rastreio {
  Rastreio();

  /// Rastreio de encomendas dos correios.
  /// O [codigo] deve ter um formato válido: LL NNN NNN NNN LL, (L = letra, N = numero)
  Future<List<Evento>> correios(String codigo) async {
    final response = await http
        .get('https://www.websro.com.br/detalhes.php?P_COD_UNI=$codigo');

    final page = parse(utf8.decode(response.bodyBytes));
    final container = page.getElementsByClassName('table table-bordered');

    if (container.length == 0) return [];

    final eventosHTML = container[0].getElementsByTagName('tr');

    List<Evento> eventos = [];

    for (int i = eventosHTML.length - 1; i > 0; i--) {
      final eventsElement = eventosHTML[i].getElementsByTagName('td');

      /* data, hora, origem */
      final dhlRAW = eventsElement[0];
      final dhl = dhlRAW.innerHtml.split('<br>');

      String data = dhl[0];
      String hora = dhl[1];
      String origem = dhlRAW.getElementsByTagName('label')[0].innerHtml;
      origem = origem == "/" ? "" : origem;

      /* status */
      final slRAW = eventsElement[1];

      final rota = slRAW.innerHtml.split('<br>')[1].trim();
      String status = slRAW.getElementsByTagName('strong')[0].innerHtml;
      if (status.endsWith(' - por favor aguarde'))
        status = status.substring(0, status.length - 20);

      String destino = "";
      String localOrigem = "";
      String localDestino = "";

      if (rota.startsWith('de ')) {
        final origemDestino = rota.split(' para ');
        /* origem */
        final lo = origemDestino[0].substring(3).split(' - ');

        localOrigem = lo[0];

        /* destino */
        final ld = origemDestino[1].split(' - ');

        localDestino = ld[0];
        destino = ld[1];
      }

      if (rota.startsWith('Registrado por ')) {
        final lo = rota.substring(15).split(' - ');

        localOrigem = lo[0];
      }

      if (origem == "") {
        origem = localOrigem;
        localOrigem = "";
      }

      /* create an event */
      eventos.add(new Evento(
          data: data,
          hora: hora,
          origem: origem,
          status: status,
          destino: destino,
          localOrigem: localOrigem,
          localDestino: localDestino));
    }

    return eventos;
  }

  Future<List<int>> azul(String codigo) async {}
}

void main() async {
  final rastreador = Rastreio();

  // final list = await rastreador.correios('LB070562881HK');
  // final list = await rastreador.correios('LS772631677CH');
  // final list = await rastreador.correios('OL150608825BR');
  final list = await rastreador.correios('LB373734221SE');

  list.forEach((element) {
    print(element.toString() + "\n");
  });
}

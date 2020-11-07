import 'package:rastreio/enums/status.dart';
import 'package:rastreio/enums/transpordatora.dart';
import 'package:rastreio/models/evento.dart';

class Pacote {
  String codigo;
  StatusEncomenda status;
  Transportadora transportadora;
  List<Evento> eventos;

  Pacote({this.codigo, this.status, this.eventos}) {
    // TODO: criar logica para gerar o status baseado no ultimo evento do pacote
  }

  StatusEncomenda get statusAtual => status;
  String get codigoRastreio => codigo;
  Transportadora get metodo => transportadora;
}

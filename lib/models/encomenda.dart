import 'package:rastreio/enums/status.dart';
import 'package:rastreio/enums/transpordatora.dart';
import 'package:rastreio/models/evento.dart';

class Encomenda {
  String codigo;
  StatusEncomenda status;
  Transportadora transportadora;
  List<Evento> eventos;

  Encomenda(
      {this.codigo,
      this.status = StatusEncomenda.NaoEncontrado,
      this.transportadora,
      this.eventos});

  StatusEncomenda get statusAtual => status;
  String get codigoRastreio => codigo;
  Transportadora get metodo => transportadora;
}

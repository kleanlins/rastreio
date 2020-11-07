class Evento {
  String data;
  String hora;
  String origem;
  String destino;
  String localOrigem;
  String localDestino;
  String status;

  Evento(
      {this.data,
      this.hora,
      this.origem,
      this.destino,
      this.localOrigem,
      this.localDestino,
      this.status});

  @override
  String toString() {
    String repr;

    if (destino != "")
      repr = localOrigem == ""
          ? "$data - $hora - $status\nDe $origem para $localDestino em $destino"
          : "$data - $hora - $status\nDe $localOrigem em $origem para $localDestino em $destino";
    else
      repr = "$data - $hora - $status\nRegistrado por $origem";

    return repr;
  }
}

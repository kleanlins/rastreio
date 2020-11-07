# rastreio

Rastreio de encomendas de diferentes transportadoras.

## Sistemas suportados

- Correios Brasil - via [WEBSRO](https://www.websro.com.br/)
- Azul Cargo - `NÃO IMPLEMENTADO`

## Utilizando

```dart
final rastreador = Rastreio();

Encomenda encomenda = await rastreador.correios('CODIGO');
Encomenda encomenda = await rastreador.azul('CODIGO'); /// Futuramente
```

## Entidades

### Encomenda

```dart
/// Encapsula informações sobre uma encomenda direta
class Encomenda {
  String codigo;
  StatusEncomenda status;
  Transportadora transportadora;
  List<Evento> eventos;
}
```

### Evento

```dart
/// Evento abstrai as informações de cada evento de uma encomenda
class Evento {
  String data;
  String hora;
  String origem;
  String destino;
  String localOrigem;
  String localDestino;
  String status;
}
```

### Status

```dart
/// Status encomenda busca normalizar o status de cada evento
enum StatusEncomenda {
  NaoEncontrado,
  Postado,
  Encaminhado,
  FiscalizacaoAduaneira,
  RecebidoBrasil,
  RotaDeEntrega,
  Entregue,
  Extraviado,
  Ausente,
  Retirada,
  EntregaNaoEfetuada
}
```

### Transportadora

```dart
/// Transportadora encapsula os meios de envio compatíveis
enum Transportadora { Correios, Azul }

```

#

Sugestões? Abra uma issue!

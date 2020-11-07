# rastreio

Rastreio de encomendas de diferentes transportadoras.

## Sistemas suportados

- Correios Brasil - `WEBSRO`
- Azul Cargo- `Em desenvolvimento`

## Utilizando

```dart

final rastreador = Rastreio();

List<Evento> eventosCorreios = await rastreador.correios('CODIGO');
/// List<Evento> eventosAzul = await rastreador.azul('CODIGO');

```

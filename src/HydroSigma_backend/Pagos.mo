module {
  public type Pago = {
    id: Nat;
    clienteId: Nat;
    monto: Float;
    fecha: Text;
    metodo: Text; // e.g., "Tarjeta de crédito", "Transferencia bancaria"
  };
}

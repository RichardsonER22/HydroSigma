module {
  public type Factura = {
    id: Nat;
    clienteId: Nat;
    monto: Float;
    fechaEmision: Text;
    fechaVencimiento: Text;
    detalles: Text;
  };
}

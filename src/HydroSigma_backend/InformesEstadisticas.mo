module {
  public type InformeConsumo = {
    clienteId: Nat;
    fechaInicio: Text;
    fechaFin: Text;
    consumoTotal: Float;
  };

  public type InformePagos = {
    clienteId: Nat;
    fechaInicio: Text;
    fechaFin: Text;
    pagosRealizados: [Pago];
  };
}
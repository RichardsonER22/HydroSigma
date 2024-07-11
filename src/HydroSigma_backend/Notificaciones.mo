module {
  public type Notificacion = {
    id: Nat;
    clienteId: Nat;
    tipo: Text; // e.g., "Pago pendiente", "Corte de servicio"
    mensaje: Text;
    fechaEnvio: Text;
  };
}

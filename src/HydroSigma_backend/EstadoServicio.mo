module {
  public type EstadoServicio = {
    clienteId: Nat;
    estado: Text; // e.g., "Activo", "Suspendido"
    fecha: Text;
    motivo: ?Text; // Opcional, para detallar el motivo de la suspensión si aplica
  };
}

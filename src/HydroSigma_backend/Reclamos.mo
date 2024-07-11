module {
  public type Reclamo = {
    id: Nat;
    clienteId: Nat;
    fecha: Text;
    descripcion: Text;
    estado: Text; // e.g., "Abierto", "En proceso", "Cerrado"
  };
}
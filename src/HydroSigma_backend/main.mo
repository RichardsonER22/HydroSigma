import Cliente "Clientes";
import Pago "Pagos";
import EstadoServicio "EstadoServicio";
import Factura "Facturas";
import Consumo "Consumos";
import Reclamo "Reclamos";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Hash "mo:base/Hash";

actor {
  // Crear los HashMaps
  var clientes = HashMap.HashMap<Nat, Cliente.Cliente>(10, Nat.equal, Hash.hash);
  var pagos = HashMap.HashMap<Nat, Pago.Pago>(10, Nat.equal, Hash.hash);
  var estadosServicio = HashMap.HashMap<Nat, EstadoServicio.EstadoServicio>(10, Nat.equal, Hash.hash);
  var facturas = HashMap.HashMap<Nat, Factura.Factura>(10, Nat.equal, Hash.hash);
  var consumos = HashMap.HashMap<Nat, Consumo.Consumo>(10, Nat.equal, Hash.hash);
  var reclamos = HashMap.HashMap<Nat, Reclamo.Reclamo>(10, Nat.equal, Hash.hash);

  // Función para agregar un cliente
  public shared func agregarCliente(clienteN : Cliente.Cliente) : async () {
    clientes.put(clienteN.id, clienteN);
  };

  // Función para obtener todos los clientes
  public shared func obtenerClientes() : async [Cliente.Cliente] {
    return Iter.toArray(clientes.vals());
  };

  // Función para actualizar un cliente
  public shared func actualizarCliente(clienteAct : Cliente.Cliente) : async Bool {
    switch (clientes.get(clienteAct.id)) {
      case (null) {
        return false;
      };
      case (_) {
        clientes.put(clienteAct.id, clienteAct);
        return true;
      };
    }
  };

  // Función para eliminar un cliente
  public shared func eliminarCliente(idCliente : Nat) : async Text {
    switch (clientes.remove(idCliente)) {
      case (null) {
        return "El cliente con ID " # Nat.toText(idCliente) # " no fue encontrado.";
      };
      case (_) {
        return "El cliente con ID " # Nat.toText(idCliente) # " fue eliminado exitosamente.";
      };
    }
  };

  // Función para registrar consumo
  public shared func registrarConsumo(clienteId: Nat, kilovatiosHora: Float, fecha: Text) : async () {
    let consumo : Consumo.Consumo = { clienteId; fecha; kilovatiosHora };
    consumos.put(clienteId, consumo);
  };

  // Función para actualizar consumo
  public shared func actualizarConsumo(estadoConsumo : Consumo.Consumo) : async () {
    consumos.put(estadoConsumo.clienteId, estadoConsumo);
  };

  // Función para obtener consumos por cliente
  public shared func obtenerConsumos(clienteId: Nat) : async ?Consumo.Consumo {
    return consumos.get(clienteId);
  };

  // Función para eliminar un registro de consumo
  public shared func eliminarConsumo(clienteId : Nat) : async Text {
    switch (consumos.remove(clienteId)) {
      case (null) {
        return "El registro con ID " # Nat.toText(clienteId) # " no fue encontrado.";
      };
      case (_) {
        return "El registro con ID " # Nat.toText(clienteId) # " fue eliminado exitosamente.";
      };
    }
  };

  // Función para registrar estado servicio
  public shared func registrarEstadoServicio(clienteId: Nat, estado: Text, fecha: Text, motivo: ?Text) : async () {
    let estadoServiciosAct : EstadoServicio.EstadoServicio = { clienteId; estado; fecha; motivo; };
    estadosServicio.put(clienteId, estadoServiciosAct);
  };

  // Función para consultar el estado del servicio de un cliente
  public shared func consultarEstadoServicio(clienteId : Nat) : async ?EstadoServicio.EstadoServicio {
    return estadosServicio.get(clienteId);
  };

  // Función para actualizar un estado de servicio
  public shared func actualizarEstadoServicio(estadoN : EstadoServicio.EstadoServicio) : async () {
    estadosServicio.put(estadoN.clienteId, estadoN);
  };

  // Función para eliminar estado servicio
  public shared func eliminarEstadoServicio(clienteId : Nat) : async Text {
    switch (estadosServicio.remove(clienteId)) {
      case (null) {
        return "El registro con ID " # Nat.toText(clienteId) # " no fue encontrado.";
      };
      case (_) {
        return "El registro con ID " # Nat.toText(clienteId) # " fue eliminado exitosamente.";
      };
    }
  };

  // Función para registrar un pago
  public shared func registrarPago(pagoN : Pago.Pago) : async () {
    pagos.put(pagoN.id, pagoN);
  };

  // Función para obtener todos los pagos
  public shared func obtenerPagos() : async [Pago.Pago] {
    return Iter.toArray(pagos.vals());
  };

  // Función para registrar una factura
  public shared func registrarFactura(facturaN : Factura.Factura) : async () {
    facturas.put(facturaN.id, facturaN);
  };

  // Función para obtener todas las facturas
  public shared func obtenerFacturas() : async [Factura.Factura] {
    return Iter.toArray(facturas.vals());
  };


  // Función para registrar un reclamo
  public shared func registrarReclamo(reclamoN : Reclamo.Reclamo) : async () {
    reclamos.put(reclamoN.id, reclamoN);
  };

  // Función para obtener todos los reclamos
  public shared func obtenerReclamos() : async [Reclamo.Reclamo] {
    return Iter.toArray(reclamos.vals());
  };

 
}
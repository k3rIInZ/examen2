class Ticket {
  String id;
  String numeroVuelo;
  String aerolinea;
  String nombrePasajero;
  int edad;
  String origen;
  String destino;
  String asiento;
  String clase;

  Ticket({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
    required this.nombrePasajero,
    required this.edad,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  // Convierte un documento Firestore a Ticket
  factory Ticket.fromFirestore(Map<String, dynamic> json, String id) {
    return Ticket(
      id: id,
      numeroVuelo: json['numeroVuelo'],
      aerolinea: json['aerolinea'],
      nombrePasajero: json['nombrePasajero'],
      edad: json['edad'],
      origen: json['origen'],
      destino: json['destino'],
      asiento: json['asiento'],
      clase: json['clase'],
    );
  }

  // Convierte el Ticket a un mapa para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'nombrePasajero': nombrePasajero,
      'edad': edad,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }
}

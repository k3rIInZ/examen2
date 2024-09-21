import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen2/data/ticket_model.dart';
import 'package:examen2/providers/ticket_provider.dart';

class UpdateScreen extends StatefulWidget {
  final String ticketId;

  const UpdateScreen({super.key, required this.ticketId});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  late Ticket ticket;  // Ticket que se va a editar
  final _numeroVueloController = TextEditingController();
  final _aerolineaController = TextEditingController();
  final _nombrePasajeroController = TextEditingController();
  final _edadController = TextEditingController();
  final _origenController = TextEditingController();
  final _destinoController = TextEditingController();
  final _asientoController = TextEditingController();
  final _claseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = context.read<TicketProvider>();
    ticket = provider.tickets.firstWhere((t) => t.id == widget.ticketId);
    _numeroVueloController.text = ticket.numeroVuelo;
    _aerolineaController.text = ticket.aerolinea;
    _nombrePasajeroController.text = ticket.nombrePasajero;
    _edadController.text = ticket.edad.toString();
    _origenController.text = ticket.origen;
    _destinoController.text = ticket.destino;
    _asientoController.text = ticket.asiento;
    _claseController.text = ticket.clase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actualizar Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _numeroVueloController,
                decoration: InputDecoration(labelText: 'Número de vuelo'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _aerolineaController,
                decoration: InputDecoration(labelText: 'Aerolínea'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _nombrePasajeroController,
                decoration: InputDecoration(labelText: 'Nombre del pasajero'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _edadController,
                decoration: InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _origenController,
                decoration: InputDecoration(labelText: 'Origen'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _destinoController,
                decoration: InputDecoration(labelText: 'Destino'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _asientoController,
                decoration: InputDecoration(labelText: 'Asiento'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: _claseController,
                decoration: InputDecoration(labelText: 'Clase'),
                validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedTicket = Ticket(
                      id: ticket.id,  // Mantiene el mismo ID
                      numeroVuelo: _numeroVueloController.text,
                      aerolinea: _aerolineaController.text,
                      nombrePasajero: _nombrePasajeroController.text,
                      edad: int.parse(_edadController.text),
                      origen: _origenController.text,
                      destino: _destinoController.text,
                      asiento: _asientoController.text,
                      clase: _claseController.text,
                    );
                    context.read<TicketProvider>().updateTicket(updatedTicket);
                    Navigator.pop(context);
                  }
                },
                child: Text('Actualizar Ticket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

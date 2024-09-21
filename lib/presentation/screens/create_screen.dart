import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen2/data/ticket_model.dart';
import 'package:examen2/providers/ticket_provider.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numeroVueloController = TextEditingController();
  final _aerolineaController = TextEditingController();
  final _nombrePasajeroController = TextEditingController();
  final _edadController = TextEditingController();
  final _origenController = TextEditingController();
  final _destinoController = TextEditingController();
  final _asientoController = TextEditingController();
  final _claseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear Ticket')),
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
                    final newTicket = Ticket(
                      id: '', // ID generado por Firestore
                      numeroVuelo: _numeroVueloController.text,
                      aerolinea: _aerolineaController.text,
                      nombrePasajero: _nombrePasajeroController.text,
                      edad: int.parse(_edadController.text),
                      origen: _origenController.text,
                      destino: _destinoController.text,
                      asiento: _asientoController.text,
                      clase: _claseController.text,
                    );
                    context.read<TicketProvider>().addTicket(newTicket);
                    Navigator.pop(context);
                  }
                },
                child: Text('Crear Ticket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

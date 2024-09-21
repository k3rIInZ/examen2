import 'package:examen2/providers/ticket_provider.dart';
import 'package:flutter/material.dart';
import 'package:examen2/data/ticket_model.dart';
import 'package:provider/provider.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Vuelo: ${ticket.numeroVuelo}'),
                subtitle: Text('Pasajero: ${ticket.nombrePasajero}, Asiento: ${ticket.asiento}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  '/update/${ticket.id}',
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Confirmación antes de eliminar
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Eliminar Ticket'),
                    content: Text('¿Estás seguro de eliminar este ticket?'),
                    actions: [
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text('Eliminar'),
                        onPressed: () {
                          context.read<TicketProvider>().deleteTicket(ticket.id);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


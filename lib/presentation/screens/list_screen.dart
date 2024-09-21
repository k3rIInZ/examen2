import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen2/providers/ticket_provider.dart';
import 'package:examen2/presentation/widgets/ticket_card.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listado de Tickets')),
      body: Consumer<TicketProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = provider.tickets[index];
              return TicketCard(ticket: ticket);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

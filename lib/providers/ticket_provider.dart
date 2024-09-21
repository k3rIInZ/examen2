import 'package:flutter/material.dart';
import 'package:examen2/data/ticket_service.dart';
import 'package:examen2/data/ticket_model.dart';

class TicketProvider with ChangeNotifier {
  final TicketService _ticketService = TicketService();
  List<Ticket> _tickets = [];

  List<Ticket> get tickets => _tickets;

  void fetchTickets() {
    _ticketService.readTickets().listen((tickets) {
      _tickets = tickets;
      notifyListeners();
    });
  }

  Future<void> addTicket(Ticket ticket) async {
    await _ticketService.createTicket(ticket);
  }

  Future<void> updateTicket(Ticket ticket) async {
    await _ticketService.updateTicket(ticket);
  }

  Future<void> deleteTicket(String id) async {
    await _ticketService.deleteTicket(id);
  }
}

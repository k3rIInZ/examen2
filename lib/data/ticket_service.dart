import 'package:cloud_firestore/cloud_firestore.dart';
import 'ticket_model.dart';

class TicketService {
  final CollectionReference ticketsCollection =
      FirebaseFirestore.instance.collection('tickets');

  Future<void> createTicket(Ticket ticket) async {
    await ticketsCollection.add(ticket.toFirestore());
  }

  Stream<List<Ticket>> readTickets() {
    return ticketsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Ticket.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<void> updateTicket(Ticket ticket) async {
    await ticketsCollection.doc(ticket.id).update(ticket.toFirestore());
  }

  Future<void> deleteTicket(String id) async {
    await ticketsCollection.doc(id).delete();
  }
}

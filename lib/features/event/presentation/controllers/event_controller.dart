import 'package:flutter/material.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_all_events.dart';
import '../../domain/usecases/get_event_detail.dart';
import '../../domain/usecases/create_event.dart';
import '../../domain/usecases/update_event.dart';
import '../../domain/usecases/delete_event.dart';

class EventController extends ChangeNotifier {
  final GetAllEvents getAllEvents;
  final GetEventDetail getEventDetail;
  final CreateEvent createEvent;
  final UpdateEvent updateEvent;
  final DeleteEvent deleteEvent;

  List<EventEntity> events = [];
  bool isLoading = false;
  String? error;

  EventController({
    required this.getAllEvents,
    required this.getEventDetail,
    required this.createEvent,
    required this.updateEvent,
    required this.deleteEvent,
  });

  Future<void> loadEvents() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      events = await getAllEvents();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<EventEntity?> fetchDetail(String id) async {
    try {
      return await getEventDetail(id);
    } catch (_) {
      return null;
    }
  }

  Future<void> addEvent(EventEntity event) async {
    try {
      await createEvent(event);
      await loadEvents();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> editEvent(EventEntity event) async {
    try {
      await updateEvent(event);
      await loadEvents();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  Future<void> removeEvent(String id) async {
    try {
      await deleteEvent(id);
      await loadEvents();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}

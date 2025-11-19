import '../models/event_model.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> fetchAllEvents();
  Future<EventModel?> fetchEventById(String id);
  Future<EventModel> createEvent(EventModel event);
  Future<EventModel> updateEvent(EventModel event);
  Future<void> deleteEvent(String id);
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  // mock in-memory list
  final List<EventModel> _events = [
    EventModel(
      id: '1',
      title: 'Ujungmanik Bersholawat',
      date: DateTime.parse('2025-10-30'),
      orderedBy: 'Pak Sugeng',
      location: 'Masjid Raya',
      thumbnailUrl: '',
    ),
    EventModel(
      id: '2',
      title: 'Wedding Rani & Dimas',
      date: DateTime.parse('2025-10-08'),
      orderedBy: 'Rani',
      location: 'Gedung Serba Guna',
      thumbnailUrl: '',
    ),
    EventModel(
      id: '3',
      title: 'Company Profile Shoot',
      date: DateTime.now().add(Duration(days: 7)),
      orderedBy: 'PT. Contoh',
      location: 'Studio A',
      thumbnailUrl: '',
    ),
  ];

  @override
  Future<List<EventModel>> fetchAllEvents() async {
    // simulate delay
    await Future.delayed(const Duration(milliseconds: 300));
    return List<EventModel>.from(_events);
  }

  @override
  Future<EventModel?> fetchEventById(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    try {
      return _events.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<EventModel> createEvent(EventModel event) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _events.add(event);
    return event;
  }

  @override
  Future<EventModel> updateEvent(EventModel event) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final idx = _events.indexWhere((e) => e.id == event.id);
    if (idx >= 0) {
      _events[idx] = event;
      return event;
    } else {
      throw Exception('Event not found');
    }
  }

  @override
  Future<void> deleteEvent(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    _events.removeWhere((e) => e.id == id);
  }
}

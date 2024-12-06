import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioFragment extends StatefulWidget {
  const CalendarioFragment({super.key});

  @override
  State<CalendarioFragment> createState() => _CalendarioFragmentState();
}

class _CalendarioFragmentState extends State<CalendarioFragment> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _selectedEvents = ValueNotifier([]);
    _calendarFormat = CalendarFormat.month;
    _dateController.text = _selectedDay
        .toLocal()
        .toString()
        .split(' ')[0]; // Iniciar el TextField con la fecha actual
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    _dateController.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Aquí puedes agregar tu lógica para obtener los eventos por fecha
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Mascota'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _selectedEvents.value = _getEventsForDay(selectedDay);
                _dateController.text = _selectedDay
                    .toLocal()
                    .toString()
                    .split(' ')[0]; // Actualizar la fecha en el TextField
              });
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          const SizedBox(height: 16.0),
          // Mostrar la fecha seleccionada en un TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _dateController,
              enabled: false, // Deshabilitar la edición, solo visualización
              decoration: const InputDecoration(
                labelText: 'Fecha seleccionada',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Opciones para la fecha seleccionada
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Opciones para esta fecha:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción para agregar evento
                    _addEventForSelectedDay();
                  },
                  child: const Text('Agregar Evento'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción para ver eventos para esta fecha
                    _viewEventsForSelectedDay();
                  },
                  child: const Text('Ver Eventos'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addEventForSelectedDay() {
    // Lógica para agregar un evento
    // Por ejemplo, un diálogo o una nueva pantalla donde se pueda agregar el evento
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Agregar evento para ${_selectedDay.toLocal().toString().split(' ')[0]}'),
          content: const TextField(
            decoration: InputDecoration(labelText: 'Título del evento'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo
                // Aquí agregar lógica para guardar el evento
                // _saveEvent(...);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _viewEventsForSelectedDay() {
    // Lógica para ver los eventos para la fecha seleccionada
    // Aquí puedes hacer que se muestren eventos, por ejemplo, en un diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Eventos para ${_selectedDay.toLocal().toString().split(' ')[0]}'),
          content: const Text(
              'Aquí puedes ver los eventos programados para este día.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class Event {
  final String title;
  final DateTime date;

  Event({required this.title, required this.date});
}

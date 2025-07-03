import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedViewIndex = 0; // 0: Weekly, 1: Daily
  DateTime _selectedDate = DateTime.now();
  
  final List<String> _viewOptions = ['Weekly', 'Daily'];
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> _timeSlots = [
    '8:00 AM', '9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM',
    '1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM',
    '6:00 PM', '7:00 PM', '8:00 PM', '9:00 PM'
  ];

  final List<ScheduleEvent> _events = [
    ScheduleEvent(
      title: 'CS 101 Lecture',
      description: 'Introduction to Programming',
      startTime: DateTime.now().copyWith(hour: 9, minute: 0),
      endTime: DateTime.now().copyWith(hour: 10, minute: 30),
      location: 'Science Building, Room 205',
      type: EventType.lecture,
      color: Colors.blue,
      dayOfWeek: 1, // Monday
    ),
    ScheduleEvent(
      title: 'Mathematics Study Group',
      description: 'Calculus Review Session',
      startTime: DateTime.now().copyWith(hour: 14, minute: 0),
      endTime: DateTime.now().copyWith(hour: 15, minute: 30),
      location: 'Mathematics Building, Room 112',
      type: EventType.studyGroup,
      color: Colors.green,
      dayOfWeek: 1, // Monday
    ),
    ScheduleEvent(
      title: 'Physics Lab',
      description: 'Mechanics Experiment',
      startTime: DateTime.now().copyWith(hour: 10, minute: 0),
      endTime: DateTime.now().copyWith(hour: 12, minute: 0),
      location: 'Physics Lab, Room 301',
      type: EventType.lab,
      color: Colors.orange,
      dayOfWeek: 2, // Tuesday
    ),
    ScheduleEvent(
      title: 'Business Ethics Discussion',
      description: 'Leadership Principles',
      startTime: DateTime.now().copyWith(hour: 16, minute: 30),
      endTime: DateTime.now().copyWith(hour: 18, minute: 0),
      location: 'Business School, Room 150',
      type: EventType.studyGroup,
      color: Colors.purple,
      dayOfWeek: 2, // Tuesday
    ),
    ScheduleEvent(
      title: 'English Literature Seminar',
      description: 'African American Literature',
      startTime: DateTime.now().copyWith(hour: 13, minute: 0),
      endTime: DateTime.now().copyWith(hour: 14, minute: 30),
      location: 'Humanities Building, Room 203',
      type: EventType.lecture,
      color: Colors.brown,
      dayOfWeek: 3, // Wednesday
    ),
    ScheduleEvent(
      title: 'Chemistry Study Session',
      description: 'Organic Chemistry Review',
      startTime: DateTime.now().copyWith(hour: 15, minute: 30),
      endTime: DateTime.now().copyWith(hour: 17, minute: 0),
      location: 'Chemistry Building, Room 108',
      type: EventType.studyGroup,
      color: Colors.teal,
      dayOfWeek: 3, // Wednesday
    ),
    ScheduleEvent(
      title: 'Economics Lecture',
      description: 'Public Policy Analysis',
      startTime: DateTime.now().copyWith(hour: 18, minute: 0),
      endTime: DateTime.now().copyWith(hour: 19, minute: 30),
      location: 'Social Sciences Building, Room 225',
      type: EventType.lecture,
      color: Colors.indigo,
      dayOfWeek: 4, // Thursday
    ),
    ScheduleEvent(
      title: 'Psychology Research Meeting',
      description: 'Experimental Design',
      startTime: DateTime.now().copyWith(hour: 14, minute: 30),
      endTime: DateTime.now().copyWith(hour: 16, minute: 0),
      location: 'Psychology Department, Room 401',
      type: EventType.studyGroup,
      color: Colors.pink,
      dayOfWeek: 5, // Friday
    ),
    ScheduleEvent(
      title: 'History Discussion',
      description: 'Civil Rights Movement',
      startTime: DateTime.now().copyWith(hour: 17, minute: 30),
      endTime: DateTime.now().copyWith(hour: 19, minute: 0),
      location: 'History Department, Room 115',
      type: EventType.studyGroup,
      color: Colors.red,
      dayOfWeek: 5, // Friday
    ),
    ScheduleEvent(
      title: 'Pre-Med Study Group',
      description: 'MCAT Preparation',
      startTime: DateTime.now().copyWith(hour: 10, minute: 0),
      endTime: DateTime.now().copyWith(hour: 12, minute: 0),
      location: 'Health Sciences Building, Room 302',
      type: EventType.studyGroup,
      color: Colors.cyan,
      dayOfWeek: 6, // Saturday
    ),
    ScheduleEvent(
      title: 'Library Study Time',
      description: 'Individual Study Session',
      startTime: DateTime.now().copyWith(hour: 14, minute: 0),
      endTime: DateTime.now().copyWith(hour: 16, minute: 0),
      location: 'Robert W. Woodruff Library',
      type: EventType.study,
      color: Colors.grey,
      dayOfWeek: 7, // Sunday
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF8B0000),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Schedule',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF8B0000), Color(0xFFA52A2A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  // TODO: Add new event
                },
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () {
                  // TODO: Open calendar picker
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // View Toggle
                  _buildViewToggle(),
                  const SizedBox(height: 20),
                  
                  // Date Navigation
                  _buildDateNavigation(),
                  const SizedBox(height: 20),
                  
                  // Schedule Overview Stats
                  _buildScheduleStats(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _selectedViewIndex == 0 ? _buildWeeklyView() : _buildDailyView(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Add new event
        },
        backgroundColor: const Color(0xFF8B0000),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Event',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildViewToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _viewOptions.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          bool isSelected = _selectedViewIndex == index;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedViewIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF8B0000) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                option,
                style: GoogleFonts.poppins(
                  color: isSelected ? Colors.white : Colors.grey[600],
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildDateNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedDate = _selectedDate.subtract(const Duration(days: 7));
            });
          },
          icon: const Icon(Icons.chevron_left),
        ),
        Text(
          _getWeekRangeText(),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF8B0000),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _selectedDate = _selectedDate.add(const Duration(days: 7));
            });
          },
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildScheduleStats() {
    int totalEvents = _events.length;
    int lectures = _events.where((e) => e.type == EventType.lecture).length;
    int studyGroups = _events.where((e) => e.type == EventType.studyGroup).length;
    int labs = _events.where((e) => e.type == EventType.lab).length;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B0000), Color(0xFFA52A2A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Total Events', totalEvents.toString(), Icons.event),
          _buildStatItem('Lectures', lectures.toString(), Icons.school),
          _buildStatItem('Study Groups', studyGroups.toString(), Icons.group),
          _buildStatItem('Labs', labs.toString(), Icons.science),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.9),
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildWeeklyView() {
    return Column(
      children: [
        // Week day headers
        Row(
          children: [
            SizedBox(
              width: 60,
              child: Text(
                'Time',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF8B0000),
                ),
              ),
            ),
            ..._weekDays.map((day) => Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B0000),
                  ),
                ),
              ),
            )).toList(),
          ],
        ),
        
        // Time slots with events
        ..._timeSlots.map((timeSlot) => _buildTimeSlotRow(timeSlot)).toList(),
      ],
    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildTimeSlotRow(String timeSlot) {
    return Row(
      children: [
        // Time column
        SizedBox(
          width: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              timeSlot,
              style: GoogleFonts.poppins(
                fontSize: 10,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
        
        // Day columns
        ...List.generate(7, (dayIndex) {
          int dayOfWeek = dayIndex + 1;
          List<ScheduleEvent> dayEvents = _events.where((event) => 
            event.dayOfWeek == dayOfWeek && 
            _isEventInTimeSlot(event, timeSlot)
          ).toList();
          
          return Expanded(
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: dayEvents.isNotEmpty 
                ? _buildEventCard(dayEvents.first, true)
                : null,
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildDailyView() {
    int currentDayOfWeek = _selectedDate.weekday;
    List<ScheduleEvent> dayEvents = _events
        .where((event) => event.dayOfWeek == currentDayOfWeek)
        .toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _getDayName(currentDayOfWeek),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF8B0000),
          ),
        ),
        const SizedBox(height: 16),
        
        if (dayEvents.isEmpty)
          _buildEmptyDayCard()
        else
          ...dayEvents.map((event) => _buildEventCard(event, false)).toList(),
      ],
    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildEmptyDayCard() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_busy,
            size: 48,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Events Scheduled',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some events to your schedule',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(ScheduleEvent event, bool isCompact) {
    if (isCompact) {
      return Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: event.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: event.color.withOpacity(0.3)),
        ),
        child: Center(
          child: Text(
            event.title,
            style: GoogleFonts.poppins(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: event.color,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: event.color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: event.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getEventIcon(event.type),
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      Text(
                        event.description,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: event.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getEventTypeText(event.type),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildDetailRow(Icons.access_time, 'Time', 
                  '${_formatTime(event.startTime)} - ${_formatTime(event.endTime)}'),
                const SizedBox(height: 8),
                _buildDetailRow(Icons.location_on, 'Location', event.location),
                const SizedBox(height: 16),
                
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Edit event
                        },
                        icon: const Icon(Icons.edit, size: 16),
                        label: Text(
                          'Edit',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: event.color,
                          side: BorderSide(color: event.color),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Join/Attend event
                        },
                        icon: const Icon(Icons.check, size: 16),
                        label: Text(
                          'Attend',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: event.color,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  // Helper methods
  String _getWeekRangeText() {
    DateTime startOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return '${_formatDate(startOfWeek)} - ${_formatDate(endOfWeek)}';
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  String _formatTime(DateTime time) {
    int hour = time.hour;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour > 12 ? hour - 12 : hour == 0 ? 12 : hour;
    return '${hour}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  String _getDayName(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1: return 'Monday';
      case 2: return 'Tuesday';
      case 3: return 'Wednesday';
      case 4: return 'Thursday';
      case 5: return 'Friday';
      case 6: return 'Saturday';
      case 7: return 'Sunday';
      default: return '';
    }
  }

  bool _isEventInTimeSlot(ScheduleEvent event, String timeSlot) {
    // Simplified logic - in a real app, you'd have more sophisticated time matching
    int slotHour = int.parse(timeSlot.split(':')[0]);
    if (timeSlot.contains('PM') && slotHour != 12) slotHour += 12;
    if (timeSlot.contains('AM') && slotHour == 12) slotHour = 0;
    
    return event.startTime.hour == slotHour;
  }

  IconData _getEventIcon(EventType type) {
    switch (type) {
      case EventType.lecture: return Icons.school;
      case EventType.studyGroup: return Icons.group;
      case EventType.lab: return Icons.science;
      case EventType.study: return Icons.book;
      default: return Icons.event;
    }
  }

  String _getEventTypeText(EventType type) {
    switch (type) {
      case EventType.lecture: return 'Lecture';
      case EventType.studyGroup: return 'Study Group';
      case EventType.lab: return 'Lab';
      case EventType.study: return 'Study';
      default: return 'Event';
    }
  }
}

class ScheduleEvent {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final EventType type;
  final Color color;
  final int dayOfWeek;

  ScheduleEvent({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.type,
    required this.color,
    required this.dayOfWeek,
  });
}

enum EventType {
  lecture,
  studyGroup,
  lab,
  study,
}

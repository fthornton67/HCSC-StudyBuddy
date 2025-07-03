import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StudyGroupsScreen extends StatefulWidget {
  const StudyGroupsScreen({super.key});

  @override
  State<StudyGroupsScreen> createState() => _StudyGroupsScreenState();
}

class _StudyGroupsScreenState extends State<StudyGroupsScreen> {
  final List<StudyGroup> studyGroups = [
    StudyGroup(
      name: 'CS 101 - Introduction to Programming',
      subject: 'Computer Science',
      members: 24,
      maxMembers: 30,
      meetingTime: 'Mondays & Wednesdays, 3:00 PM',
      location: 'Science Building, Room 205',
      description:
          'Study group for CS 101 students focusing on Python programming fundamentals, algorithms, and problem-solving techniques.',
      instructor: 'Dr. Johnson',
      isActive: true,
      color: Colors.blue,
      icon: Icons.computer,
    ),
    StudyGroup(
      name: 'Mathematics for Engineers',
      subject: 'Mathematics',
      members: 18,
      maxMembers: 25,
      meetingTime: 'Tuesdays & Thursdays, 2:00 PM',
      location: 'Mathematics Building, Room 112',
      description:
          'Advanced mathematics study group covering calculus, linear algebra, and differential equations for engineering students.',
      instructor: 'Dr. Williams',
      isActive: true,
      color: Colors.green,
      icon: Icons.calculate,
    ),
    StudyGroup(
      name: 'Physics Lab Prep',
      subject: 'Physics',
      members: 15,
      maxMembers: 20,
      meetingTime: 'Fridays, 1:00 PM',
      location: 'Physics Lab, Room 301',
      description:
          'Preparation sessions for physics laboratory experiments, focusing on experimental design and data analysis.',
      instructor: 'Dr. Davis',
      isActive: true,
      color: Colors.orange,
      icon: Icons.science,
    ),
    StudyGroup(
      name: 'Business Ethics & Leadership',
      subject: 'Business Administration',
      members: 22,
      maxMembers: 28,
      meetingTime: 'Wednesdays, 4:30 PM',
      location: 'Business School, Room 150',
      description:
          'Discussion-based study group exploring ethical decision-making, leadership principles, and corporate social responsibility.',
      instructor: 'Prof. Thompson',
      isActive: true,
      color: Colors.purple,
      icon: Icons.business,
    ),
    StudyGroup(
      name: 'African American Literature',
      subject: 'English',
      members: 16,
      maxMembers: 22,
      meetingTime: 'Tuesdays, 5:00 PM',
      location: 'Humanities Building, Room 203',
      description:
          'Critical analysis of African American literature, exploring themes of identity, culture, and social justice.',
      instructor: 'Dr. Robinson',
      isActive: true,
      color: Colors.brown,
      icon: Icons.book,
    ),
    StudyGroup(
      name: 'Chemistry Study Circle',
      subject: 'Chemistry',
      members: 20,
      maxMembers: 25,
      meetingTime: 'Thursdays, 3:30 PM',
      location: 'Chemistry Building, Room 108',
      description:
          'Comprehensive chemistry study group covering organic chemistry, biochemistry, and laboratory techniques.',
      instructor: 'Dr. Mitchell',
      isActive: true,
      color: Colors.teal,
      icon: Icons.science,
    ),
    StudyGroup(
      name: 'Economics & Public Policy',
      subject: 'Economics',
      members: 19,
      maxMembers: 25,
      meetingTime: 'Mondays, 6:00 PM',
      location: 'Social Sciences Building, Room 225',
      description:
          'Analysis of economic theories and their application to current public policy issues and social problems.',
      instructor: 'Dr. Anderson',
      isActive: true,
      color: Colors.indigo,
      icon: Icons.trending_up,
    ),
    StudyGroup(
      name: 'Psychology Research Methods',
      subject: 'Psychology',
      members: 14,
      maxMembers: 18,
      meetingTime: 'Fridays, 2:30 PM',
      location: 'Psychology Department, Room 401',
      description:
          'Research methodology study group focusing on experimental design, statistical analysis, and research ethics.',
      instructor: 'Dr. Garcia',
      isActive: true,
      color: Colors.pink,
      icon: Icons.psychology,
    ),
    StudyGroup(
      name: 'History of Civil Rights',
      subject: 'History',
      members: 17,
      maxMembers: 20,
      meetingTime: 'Wednesdays, 5:30 PM',
      location: 'History Department, Room 115',
      description:
          'In-depth study of the Civil Rights Movement, focusing on key events, leaders, and their lasting impact.',
      instructor: 'Dr. Washington',
      isActive: true,
      color: Colors.red,
      icon: Icons.history_edu,
    ),
    StudyGroup(
      name: 'Pre-Med Study Group',
      subject: 'Pre-Medicine',
      members: 26,
      maxMembers: 30,
      meetingTime: 'Saturdays, 10:00 AM',
      location: 'Health Sciences Building, Room 302',
      description:
          'Comprehensive preparation for medical school applications, MCAT review, and healthcare career guidance.',
      instructor: 'Dr. Martinez',
      isActive: true,
      color: Colors.cyan,
      icon: Icons.medical_services,
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
                'Study Groups',
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
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  // TODO: Implement search functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.white),
                onPressed: () {
                  // TODO: Implement filter functionality
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Overview
                  _buildStatsOverview(),
                  const SizedBox(height: 24),

                  // Active Groups Section
                  Text(
                    'Active Study Groups',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8B0000),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: _buildStudyGroupCard(studyGroups[index], index),
              );
            }, childCount: studyGroups.length),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement create new study group
        },
        backgroundColor: const Color(0xFF8B0000),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Create Group',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildStatsOverview() {
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
          _buildStatItem('Total Groups', '10', Icons.group),
          _buildStatItem('Active Members', '191', Icons.people),
          _buildStatItem('Available Spots', '59', Icons.event_seat),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStudyGroupCard(StudyGroup group, int index) {
    return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
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
              // Header with subject and status
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: group.color.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: group.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(group.icon, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            group.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          Text(
                            group.subject,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: group.isActive ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        group.isActive ? 'Active' : 'Inactive',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.description,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Meeting details
                    _buildDetailRow(
                      Icons.access_time,
                      'Meeting Time',
                      group.meetingTime,
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      Icons.location_on,
                      'Location',
                      group.location,
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      Icons.person,
                      'Instructor',
                      group.instructor,
                    ),
                    const SizedBox(height: 16),

                    // Members progress
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Members',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${group.members}/${group.maxMembers}',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: group.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: group.members / group.maxMembers,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(group.color),
                      minHeight: 6,
                    ),
                    const SizedBox(height: 16),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // TODO: Join group functionality
                            },
                            icon: const Icon(Icons.group_add, size: 18),
                            label: Text(
                              'Join Group',
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: group.color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // TODO: View details functionality
                            },
                            icon: const Icon(Icons.info_outline, size: 18),
                            label: Text(
                              'Details',
                              style: GoogleFonts.poppins(fontSize: 12),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: group.color,
                              side: BorderSide(color: group.color),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
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
        )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 * index))
        .slideX(begin: 0.3, end: 0);
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
}

class StudyGroup {
  final String name;
  final String subject;
  final int members;
  final int maxMembers;
  final String meetingTime;
  final String location;
  final String description;
  final String instructor;
  final bool isActive;
  final Color color;
  final IconData icon;

  StudyGroup({
    required this.name,
    required this.subject,
    required this.members,
    required this.maxMembers,
    required this.meetingTime,
    required this.location,
    required this.description,
    required this.instructor,
    required this.isActive,
    required this.color,
    required this.icon,
  });
}

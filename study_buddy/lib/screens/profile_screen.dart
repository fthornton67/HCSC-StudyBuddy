import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabOptions = ['Overview', 'Achievements', 'Settings'];

  final UserProfile _userProfile = UserProfile(
    name: 'John Alexander',
    email: 'jalexander@morehouse.edu',
    studentId: '2024001234',
    major: 'Computer Science',
    minor: 'Mathematics',
    year: 'Junior',
    gpa: 3.85,
    totalStudyHours: 1247,
    studyStreak: 15,
    groupsJoined: 12,
    sessionsAttended: 89,
    notesShared: 45,
    achievements: [
      Achievement(
        title: 'Study Master',
        description: 'Completed 1000+ study hours',
        icon: Icons.school,
        color: Colors.blue,
        unlocked: true,
        date: '2024-01-15',
      ),
      Achievement(
        title: 'Group Leader',
        description: 'Led 10+ study sessions',
        icon: Icons.group,
        color: Colors.green,
        unlocked: true,
        date: '2024-02-20',
      ),
      Achievement(
        title: 'Perfect Attendance',
        description: 'Attended 50 consecutive sessions',
        icon: Icons.check_circle,
        color: Colors.orange,
        unlocked: true,
        date: '2024-03-10',
      ),
      Achievement(
        title: 'Knowledge Sharer',
        description: 'Shared 25+ study notes',
        icon: Icons.share,
        color: Colors.purple,
        unlocked: true,
        date: '2024-01-30',
      ),
      Achievement(
        title: 'Early Bird',
        description: 'Studied before 8 AM for 30 days',
        icon: Icons.wb_sunny,
        color: Colors.yellow,
        unlocked: false,
        date: null,
      ),
      Achievement(
        title: 'Night Owl',
        description: 'Studied after 10 PM for 30 days',
        icon: Icons.nightlight,
        color: Colors.indigo,
        unlocked: false,
        date: null,
      ),
    ],
    academicStats: [
      AcademicStat('Computer Science', 3.92, Colors.blue),
      AcademicStat('Mathematics', 3.78, Colors.green),
      AcademicStat('Physics', 3.85, Colors.orange),
      AcademicStat('English', 3.90, Colors.purple),
    ],
    recentActivity: [
      ActivityItem(
        'Joined CS 101 Study Group',
        '2 hours ago',
        Icons.group_add,
        Colors.green,
      ),
      ActivityItem(
        'Shared Physics Lab Notes',
        '1 day ago',
        Icons.note_add,
        Colors.blue,
      ),
      ActivityItem(
        'Attended Math Review Session',
        '2 days ago',
        Icons.check_circle,
        Colors.orange,
      ),
      ActivityItem(
        'Completed Programming Assignment',
        '3 days ago',
        Icons.assignment,
        Colors.purple,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFF8B0000),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Profile',
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
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // TODO: Edit profile
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // TODO: Share profile
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile Header
                  _buildProfileHeader(),
                  const SizedBox(height: 24),

                  // Tab Navigation
                  _buildTabNavigation(),
                  const SizedBox(height: 24),

                  // Tab Content
                  _buildTabContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
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
          // Profile Picture and Basic Info
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B0000),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userProfile.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _userProfile.email,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _userProfile.year,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8B0000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Academic Info
          Row(
            children: [
              Expanded(
                child: _buildInfoItem(
                  'Major',
                  _userProfile.major,
                  Icons.school,
                ),
              ),
              Expanded(
                child: _buildInfoItem('Minor', _userProfile.minor, Icons.book),
              ),
              Expanded(
                child: _buildInfoItem(
                  'GPA',
                  _userProfile.gpa.toString(),
                  Icons.grade,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF8B0000), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF333333),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children:
            _tabOptions.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              bool isSelected = _selectedTabIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? const Color(0xFF8B0000)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildOverviewTab();
      case 1:
        return _buildAchievementsTab();
      case 2:
        return _buildSettingsTab();
      default:
        return _buildOverviewTab();
    }
  }

  Widget _buildOverviewTab() {
    return Column(
      children: [
        // Study Stats
        _buildStudyStats(),
        const SizedBox(height: 24),

        // Academic Performance
        _buildAcademicPerformance(),
        const SizedBox(height: 24),

        // Recent Activity
        _buildRecentActivity(),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildStudyStats() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Study Statistics',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B0000),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Hours',
                  _userProfile.totalStudyHours.toString(),
                  Icons.access_time,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Study Streak',
                  '${_userProfile.studyStreak} days',
                  Icons.local_fire_department,
                  Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Groups Joined',
                  _userProfile.groupsJoined.toString(),
                  Icons.group,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Sessions',
                  _userProfile.sessionsAttended.toString(),
                  Icons.event,
                  Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicPerformance() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Academic Performance',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B0000),
            ),
          ),
          const SizedBox(height: 16),
          ..._userProfile.academicStats
              .map((stat) => _buildSubjectProgress(stat))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildSubjectProgress(AcademicStat stat) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.subject,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                stat.gpa.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: stat.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: stat.gpa / 4.0,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(stat.color),
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B0000),
            ),
          ),
          const SizedBox(height: 16),
          ..._userProfile.recentActivity
              .map((activity) => _buildActivityItem(activity))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildActivityItem(ActivityItem activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: activity.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(activity.icon, color: activity.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  activity.time,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsTab() {
    return Column(
      children: [
        // Achievement Stats
        Container(
          padding: const EdgeInsets.all(20),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAchievementStat('Unlocked', '4', Colors.green),
              _buildAchievementStat('Total', '6', Colors.blue),
              _buildAchievementStat('Progress', '67%', Colors.orange),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Achievements Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: _userProfile.achievements.length,
          itemBuilder: (context, index) {
            return _buildAchievementCard(_userProfile.achievements[index]);
          },
        ),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildAchievementStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(Achievement achievement) {
    return Container(
      decoration: BoxDecoration(
        color: achievement.unlocked ? Colors.white : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow:
            achievement.unlocked
                ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
                : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  achievement.unlocked
                      ? achievement.color.withOpacity(0.1)
                      : Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              achievement.icon,
              color:
                  achievement.unlocked ? achievement.color : Colors.grey[500],
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            achievement.title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color:
                  achievement.unlocked
                      ? const Color(0xFF333333)
                      : Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            achievement.description,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: achievement.unlocked ? Colors.grey[600] : Colors.grey[400],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (achievement.unlocked && achievement.date != null) ...[
            const SizedBox(height: 8),
            Text(
              'Unlocked ${achievement.date}',
              style: GoogleFonts.poppins(
                fontSize: 8,
                color: achievement.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return Column(
      children: [
        _buildSettingsSection('Account', [
          SettingsItem('Edit Profile', Icons.person, () {}),
          SettingsItem('Change Password', Icons.lock, () {}),
          SettingsItem('Privacy Settings', Icons.security, () {}),
        ]),
        const SizedBox(height: 16),
        _buildSettingsSection('Notifications', [
          SettingsItem('Study Reminders', Icons.notifications, () {}),
          SettingsItem('Group Updates', Icons.group, () {}),
          SettingsItem('Achievement Alerts', Icons.emoji_events, () {}),
        ]),
        const SizedBox(height: 16),
        _buildSettingsSection('App', [
          SettingsItem('About StudyBuddy', Icons.info, () {}),
          SettingsItem('Help & Support', Icons.help, () {}),
          SettingsItem('Logout', Icons.logout, () {}),
        ]),
      ],
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildSettingsSection(String title, List<SettingsItem> items) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8B0000),
              ),
            ),
          ),
          ...items.map((item) => _buildSettingsItem(item)).toList(),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(SettingsItem item) {
    return ListTile(
      leading: Icon(item.icon, color: const Color(0xFF8B0000)),
      title: Text(
        item.title,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: item.onTap,
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String studentId;
  final String major;
  final String minor;
  final String year;
  final double gpa;
  final int totalStudyHours;
  final int studyStreak;
  final int groupsJoined;
  final int sessionsAttended;
  final int notesShared;
  final List<Achievement> achievements;
  final List<AcademicStat> academicStats;
  final List<ActivityItem> recentActivity;

  UserProfile({
    required this.name,
    required this.email,
    required this.studentId,
    required this.major,
    required this.minor,
    required this.year,
    required this.gpa,
    required this.totalStudyHours,
    required this.studyStreak,
    required this.groupsJoined,
    required this.sessionsAttended,
    required this.notesShared,
    required this.achievements,
    required this.academicStats,
    required this.recentActivity,
  });
}

class Achievement {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool unlocked;
  final String? date;

  Achievement({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.unlocked,
    this.date,
  });
}

class AcademicStat {
  final String subject;
  final double gpa;
  final Color color;

  AcademicStat(this.subject, this.gpa, this.color);
}

class ActivityItem {
  final String title;
  final String time;
  final IconData icon;
  final Color color;

  ActivityItem(this.title, this.time, this.icon, this.color);
}

class SettingsItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SettingsItem(this.title, this.icon, this.onTap);
}

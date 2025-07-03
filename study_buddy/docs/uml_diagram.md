# StudyBuddy Flutter Application - UML Diagram

## Application Architecture Overview

The StudyBuddy Flutter application follows a modular architecture with separate screens for different functionalities, using StatefulWidget for state management and Google Fonts for consistent typography.

## Class Diagram

```mermaid
classDiagram
    %% Main Application Entry Point
    class main {
        +main()
        +MyApp()
    }

    %% Splash Screen
    class SplashScreen {
        -Timer _timer
        -VideoPlayerController _videoController
        +build(BuildContext context)
        -_initializeVideo()
        -_navigateToHome()
    }

    %% Home Screen (Main Navigation)
    class HomeScreen {
        -int _selectedIndex
        -List~Widget~ _screens
        +build(BuildContext context)
        -_onItemTapped(int index)
        -_buildDrawer()
        -_buildAppBar()
    }

    %% Dashboard Screen
    class DashboardScreen {
        +build(BuildContext context)
        -_buildWelcomeSection()
        -_buildQuickStatsSection()
        -_buildStudyProgressSection()
        -_buildRecentActivitySection()
        -_buildUpcomingSessionsSection()
        -_buildPerformanceMetricsSection()
        -_buildStatCard()
        -_buildProgressItem()
        -_buildActivityItem()
        -_buildSessionItem()
        -_buildMetricCard()
    }

    %% Study Groups Screen
    class StudyGroupsScreen {
        -List~StudyGroup~ studyGroups
        +build(BuildContext context)
        -_buildStatsOverview()
        -_buildStudyGroupCard(StudyGroup group, int index)
        -_buildStatItem()
        -_buildDetailRow()
    }

    %% Schedule Screen
    class ScheduleScreen {
        -int _selectedViewIndex
        -DateTime _selectedDate
        -List~String~ _viewOptions
        -List~String~ _weekDays
        -List~String~ _timeSlots
        -List~ScheduleEvent~ _events
        +build(BuildContext context)
        -_buildViewToggle()
        -_buildDateNavigation()
        -_buildScheduleStats()
        -_buildWeeklyView()
        -_buildDailyView()
        -_buildEventCard()
        -_buildTimeSlotRow()
        -_getWeekRangeText()
        -_formatTime()
        -_getDayName()
        -_isEventInTimeSlot()
        -_getEventIcon()
        -_getEventTypeText()
    }

    %% Profile Screen
    class ProfileScreen {
        -int _selectedTabIndex
        -List~String~ _tabOptions
        -UserProfile _userProfile
        +build(BuildContext context)
        -_buildProfileHeader()
        -_buildTabNavigation()
        -_buildTabContent()
        -_buildOverviewTab()
        -_buildAchievementsTab()
        -_buildSettingsTab()
        -_buildStudyStats()
        -_buildAcademicPerformance()
        -_buildRecentActivity()
        -_buildAchievementCard()
        -_buildSettingsSection()
    }

    %% Data Models
    class StudyGroup {
        +String name
        +String subject
        +int members
        +int maxMembers
        +String meetingTime
        +String location
        +String description
        +String instructor
        +bool isActive
        +Color color
        +IconData icon
        +StudyGroup()
    }

    class ScheduleEvent {
        +String title
        +String description
        +DateTime startTime
        +DateTime endTime
        +String location
        +EventType type
        +Color color
        +int dayOfWeek
        +ScheduleEvent()
    }

    class UserProfile {
        +String name
        +String email
        +String studentId
        +String major
        +String minor
        +String year
        +double gpa
        +int totalStudyHours
        +int studyStreak
        +int groupsJoined
        +int sessionsAttended
        +int notesShared
        +List~Achievement~ achievements
        +List~AcademicStat~ academicStats
        +List~ActivityItem~ recentActivity
        +UserProfile()
    }

    class Achievement {
        +String title
        +String description
        +IconData icon
        +Color color
        +bool unlocked
        +String? date
        +Achievement()
    }

    class AcademicStat {
        +String subject
        +double gpa
        +Color color
        +AcademicStat()
    }

    class ActivityItem {
        +String title
        +String time
        +IconData icon
        +Color color
        +ActivityItem()
    }

    class SettingsItem {
        +String title
        +IconData icon
        +VoidCallback onTap
        +SettingsItem()
    }

    %% Enums
    class EventType {
        <<enumeration>>
        lecture
        studyGroup
        lab
        study
    }

    %% Relationships
    main --> MyApp
    MyApp --> SplashScreen
    SplashScreen --> HomeScreen
    HomeScreen --> DashboardScreen
    HomeScreen --> StudyGroupsScreen
    HomeScreen --> ScheduleScreen
    HomeScreen --> ProfileScreen

    StudyGroupsScreen --> StudyGroup
    ScheduleScreen --> ScheduleEvent
    ScheduleScreen --> EventType
    ProfileScreen --> UserProfile
    UserProfile --> Achievement
    UserProfile --> AcademicStat
    UserProfile --> ActivityItem
    ProfileScreen --> SettingsItem
```

## Component Diagram

```mermaid
graph TB
    subgraph "StudyBuddy Flutter App"
        subgraph "UI Layer"
            A[main.dart] --> B[SplashScreen]
            B --> C[HomeScreen]
            C --> D[DashboardScreen]
            C --> E[StudyGroupsScreen]
            C --> F[ScheduleScreen]
            C --> G[ProfileScreen]
        end

        subgraph "Data Models"
            H[StudyGroup]
            I[ScheduleEvent]
            J[UserProfile]
            K[Achievement]
            L[AcademicStat]
            M[ActivityItem]
            N[SettingsItem]
            O[EventType]
        end

        subgraph "External Dependencies"
            P[flutter_animate]
            Q[google_fonts]
            R[flutter_svg]
            S[video_player]
            T[animated_text_kit]
        end

        D --> H
        E --> H
        F --> I
        F --> O
        G --> J
        G --> K
        G --> L
        G --> M
        G --> N

        B --> S
        B --> T
        D --> P
        E --> P
        F --> P
        G --> P
        D --> Q
        E --> Q
        F --> Q
        G --> Q
    end
```

## Navigation Flow Diagram

```mermaid
flowchart TD
    A[App Launch] --> B[SplashScreen]
    B --> C{Video Playing?}
    C -->|Yes| D[Show Morehouse Video Background]
    C -->|No| E[Show Static Background]
    D --> F[Animated Logo & Text]
    E --> F
    F --> G[Timer: 10 seconds]
    G --> H[HomeScreen]
    
    H --> I[Navigation Bar]
    I --> J[Dashboard Tab]
    I --> K[Study Groups Tab]
    I --> L[Schedule Tab]
    I --> M[Profile Tab]
    
    J --> N[DashboardScreen]
    K --> O[StudyGroupsScreen]
    L --> P[ScheduleScreen]
    M --> Q[ProfileScreen]
    
    N --> R[Quick Stats]
    N --> S[Study Progress]
    N --> T[Recent Activity]
    N --> U[Upcoming Sessions]
    N --> V[Performance Metrics]
    
    O --> W[Study Groups List]
    O --> X[Group Statistics]
    O --> Y[Create Group Button]
    
    P --> Z[Weekly View]
    P --> AA[Daily View]
    P --> BB[Event Management]
    
    Q --> CC[Overview Tab]
    Q --> DD[Achievements Tab]
    Q --> EE[Settings Tab]
    
    CC --> FF[Study Statistics]
    CC --> GG[Academic Performance]
    CC --> HH[Recent Activity]
    
    DD --> II[Achievement Grid]
    DD --> JJ[Achievement Stats]
    
    EE --> KK[Account Settings]
    EE --> LL[Notification Settings]
    EE --> MM[App Settings]
```

## State Management Diagram

```mermaid
stateDiagram-v2
    [*] --> AppLaunch
    AppLaunch --> SplashScreen
    SplashScreen --> HomeScreen
    
    HomeScreen --> DashboardView : Tab 0
    HomeScreen --> StudyGroupsView : Tab 1
    HomeScreen --> ScheduleView : Tab 2
    HomeScreen --> ProfileView : Tab 3
    
    DashboardView --> HomeScreen : Back Navigation
    StudyGroupsView --> HomeScreen : Back Navigation
    ScheduleView --> HomeScreen : Back Navigation
    ProfileView --> HomeScreen : Back Navigation
    
    ScheduleView --> WeeklyView : View Toggle
    ScheduleView --> DailyView : View Toggle
    WeeklyView --> ScheduleView : View Toggle
    DailyView --> ScheduleView : View Toggle
    
    ProfileView --> OverviewTab : Tab Selection
    ProfileView --> AchievementsTab : Tab Selection
    ProfileView --> SettingsTab : Tab Selection
    OverviewTab --> ProfileView : Tab Selection
    AchievementsTab --> ProfileView : Tab Selection
    SettingsTab --> ProfileView : Tab Selection
```

## Data Flow Diagram

```mermaid
flowchart LR
    subgraph "User Input"
        A[User Interactions]
        B[Tab Navigation]
        C[Button Clicks]
        D[Form Inputs]
    end
    
    subgraph "UI Components"
        E[StatefulWidget]
        F[setState() calls]
        G[Widget Rebuilds]
    end
    
    subgraph "Data Models"
        H[StudyGroup Data]
        I[ScheduleEvent Data]
        J[UserProfile Data]
        K[Achievement Data]
    end
    
    subgraph "External Services"
        L[Google Fonts]
        M[Flutter Animate]
        N[Video Player]
        O[SVG Rendering]
    end
    
    A --> E
    B --> E
    C --> E
    D --> E
    
    E --> F
    F --> G
    G --> E
    
    E --> H
    E --> I
    E --> J
    E --> K
    
    E --> L
    E --> M
    E --> N
    E --> O
```

## Key Design Patterns

### 1. **StatefulWidget Pattern**
- Each screen extends StatefulWidget for local state management
- setState() used for UI updates
- State preserved during navigation

### 2. **Composition Pattern**
- Widgets composed of smaller, reusable components
- Each screen builds its UI from multiple widget methods
- Consistent styling and behavior across components

### 3. **Data Model Pattern**
- Separate data classes for different entities
- Immutable data models with required parameters
- Clear separation between UI and data logic

### 4. **Navigation Pattern**
- Bottom navigation bar for main sections
- Drawer for additional navigation options
- Tab-based navigation within screens

### 5. **Animation Pattern**
- Consistent use of flutter_animate package
- Staggered animations for list items
- Smooth transitions between states

## Architecture Benefits

1. **Modularity**: Each screen is self-contained with its own state
2. **Maintainability**: Clear separation of concerns
3. **Scalability**: Easy to add new screens and features
4. **Consistency**: Unified design language and animations
5. **Performance**: Efficient widget rebuilding and state management

## Dependencies

- **flutter_animate**: For smooth animations and transitions
- **google_fonts**: For consistent typography
- **flutter_svg**: For SVG image rendering
- **video_player**: For video background in splash screen
- **animated_text_kit**: For text animations

This UML diagram provides a comprehensive overview of the StudyBuddy Flutter application's architecture, showing the relationships between components, data flow, and design patterns used throughout the application. 
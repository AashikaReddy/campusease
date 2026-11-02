import 'package:flutter/material.dart';

void main() => runApp(const CampusEaseApp());

const primary = Color(0xFF5267D9);
const bg = Color(0xFFF5F6FC);
const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

class CampusEaseApp extends StatelessWidget {
  const CampusEaseApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CampusEase',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          scaffoldBackgroundColor: bg,
        ),
        home: const CampusHome(),
      );
}

class CampusHome extends StatefulWidget {
  const CampusHome({super.key});

  @override
  State<CampusHome> createState() => _CampusHomeState();
}

class _CampusHomeState extends State<CampusHome> {
  int tab = 0;
  String name = 'Aashika Janga';
  String roll = '24WH1A05XX';
  String email = 'aashika@example.com';
  String phone = '9876543210';
  String selectedDay = 'Monday';
  final registered = <String>[];

  final timetable = <String, List<Map<String, String>>>{
    'Monday': [
      {'subject': 'Design and Analysis of Algorithms', 'time': '9:00 AM'},
      {'subject': 'Computer Networks', 'time': '10:00 AM'},
      {'subject': 'Data Analytics', 'time': '11:15 AM'},
      {'subject': 'DevOps', 'time': '1:15 PM'},
    ],
    'Tuesday': [
      {'subject': 'Data Mining', 'time': '9:00 AM'},
      {'subject': 'Computer Networks', 'time': '10:00 AM'},
      {'subject': 'DAA Lab', 'time': '11:15 AM'},
      {'subject': 'Data Analytics', 'time': '1:30 PM'},
    ],
    'Wednesday': [
      {'subject': 'DevOps', 'time': '9:00 AM'},
      {'subject': 'Data Mining', 'time': '10:00 AM'},
      {'subject': 'Computer Networks Lab', 'time': '11:15 AM'},
      {'subject': 'DAA', 'time': '1:30 PM'},
    ],
    'Thursday': [
      {'subject': 'Data Analytics', 'time': '9:00 AM'},
      {'subject': 'DAA', 'time': '10:00 AM'},
      {'subject': 'DevOps Lab', 'time': '11:15 AM'},
      {'subject': 'Data Mining', 'time': '1:30 PM'},
    ],
    'Friday': [
      {'subject': 'Computer Networks', 'time': '9:00 AM'},
      {'subject': 'Data Mining', 'time': '10:00 AM'},
      {'subject': 'Data Analytics', 'time': '11:15 AM'},
      {'subject': 'DAA', 'time': '1:15 PM'},
    ],
  };

  final events = [
    {
      'title': 'TechFest 2026',
      'date': 'November 12, 2026',
      'venue': 'Main Auditorium',
      'desc': 'Technical competitions, workshops and innovative projects.',
      'icon': '💻',
    },
    {
      'title': 'Creative Arts Day',
      'date': 'November 18, 2026',
      'venue': 'Student Activity Centre',
      'desc': 'Celebrate art, music, photography and student performances.',
      'icon': '🎨',
    },
    {
      'title': 'Career Connect',
      'date': 'November 24, 2026',
      'venue': 'Seminar Hall',
      'desc': 'Explore internships, placements and career opportunities.',
      'icon': '💼',
    },
  ];

  final notices = [
    {
      'title': 'Mid-Term Examination Schedule',
      'date': 'October 30, 2026',
      'desc': 'Check your examination schedule and prepare accordingly.',
    },
    {
      'title': 'Library Timings Update',
      'date': 'October 29, 2026',
      'desc': 'Carry your college ID card while visiting the library.',
    },
    {
      'title': 'Student Event Registrations',
      'date': 'October 28, 2026',
      'desc': 'Register for upcoming campus events through CampusEase.',
    },
    {
      'title': 'Department Project Review',
      'date': 'October 27, 2026',
      'desc': 'Keep your project documentation and presentation ready.',
    },
  ];

  @override
  void initState() {
    super.initState();
    final weekday = DateTime.now().weekday;
    if (weekday >= 1 && weekday <= 5) {
      selectedDay = days[weekday - 1];
    }
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Widget heading(String text, {String? subtitle}) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202849))),
            if (subtitle != null) ...[
              const SizedBox(height: 5),
              Text(subtitle,
                  style: const TextStyle(color: Colors.black54)),
            ],
          ],
        ),
      );

  Widget card({required Widget child}) => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.035),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      );

  Widget actionTile(
      IconData icon, String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: card(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primary.withOpacity(.1),
              foregroundColor: primary,
              child: Icon(icon),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  Widget classCard(Map<String, String> item) => card(
        child: Row(
          children: [
            Container(
              width: 5,
              height: 48,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['subject']!,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(item['time']!,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const Icon(Icons.menu_book_outlined, color: primary),
          ],
        ),
      );

  Widget homePage() {
    final now = DateTime.now();
    final today = now.weekday >= 1 && now.weekday <= 5
        ? days[now.weekday - 1]
        : now.weekday == DateTime.saturday
            ? 'Saturday'
            : 'Sunday';
    final todayClasses = timetable[today] ?? [];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: primary,
              child: Icon(Icons.school, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text('CampusEase',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),
            IconButton(
              onPressed: () => setState(() => tab = 4),
              icon: const Icon(Icons.account_circle_outlined, size: 30),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Hello, $name 👋',
            style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202849))),
        const SizedBox(height: 7),
        const Text('Your campus, all in one place.',
            style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [primary, Color(0xFF8492F0)],
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.auto_awesome, color: Colors.white, size: 30),
              SizedBox(height: 15),
              Text('Make campus life easier.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 7),
              Text('Manage classes, discover events and stay updated.',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 25),
        heading('Quick Access'),
        actionTile(Icons.calendar_month, 'Timetable',
            'View your weekly classes', () => setState(() => tab = 1)),
        actionTile(Icons.event, 'Campus Events',
            'Explore and register for events', () => setState(() => tab = 2)),
        actionTile(Icons.campaign, 'Notices',
            'Read campus announcements', () => setState(() => tab = 3)),
        const SizedBox(height: 12),
        heading("Today's Classes", subtitle: '$today • Your daily schedule'),
        if (todayClasses.isEmpty)
          card(
            child: const Column(
              children: [
                Icon(Icons.weekend_outlined, size: 38, color: primary),
                SizedBox(height: 8),
                Text('No classes scheduled today!',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Enjoy your day off.',
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
          )
        else
          ...todayClasses.take(3).map(classCard),
        const SizedBox(height: 12),
        heading('Upcoming Event'),
        actionTile(Icons.celebration, events[0]['title']!,
            '${events[0]['date']} • ${events[0]['venue']}', () {
          setState(() => tab = 2);
        }),
      ],
    );
  }

  Widget timetablePage() => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          heading('Timetable', subtitle: 'Your weekly class schedule'),
          Wrap(
            spacing: 7,
            children: days.map((day) {
              return ChoiceChip(
                label: Text(day.substring(0, 3)),
                selected: selectedDay == day,
                selectedColor: primary.withOpacity(.2),
                onSelected: (_) => setState(() => selectedDay = day),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(selectedDay,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...(timetable[selectedDay] ?? []).map(classCard),
        ],
      );

  void registerEvent(Map<String, String> event) {
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Register for ${event['title']}'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter your name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email address'),
                validator: (v) => v == null || !v.contains('@')
                    ? 'Enter a valid email'
                    : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              setState(() {
                name = nameController.text.trim();
                email = emailController.text.trim();
                if (!registered.contains(event['title'])) {
                  registered.add(event['title']!);
                }
              });
              Navigator.pop(dialogContext);
              message('Registration successful!');
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  Widget eventsPage() => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          heading('Campus Events',
              subtitle: 'Discover what is happening on campus'),
          ...events.map((event) {
            final isRegistered = registered.contains(event['title']);
            return card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: primary.withOpacity(.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(event['icon']!,
                            style: const TextStyle(fontSize: 25)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(event['title']!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text('📅  ${event['date']}'),
                  const SizedBox(height: 7),
                  Text('📍  ${event['venue']}'),
                  const SizedBox(height: 12),
                  Text(event['desc']!,
                      style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: isRegistered
                          ? null
                          : () => registerEvent(event),
                      child: Text(isRegistered ? 'Registered ✓' : 'Register'),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      );

  Widget noticesPage() => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          heading('Campus Notices',
              subtitle: 'Announcements and important updates'),
          ...notices.map((notice) => actionTile(
                Icons.notifications_active_outlined,
                notice['title']!,
                notice['date']!,
                () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(notice['title']!),
                    content: Text(
                        '${notice['date']}\n\n${notice['desc']}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      );

  void editProfile() {
    final nameController = TextEditingController(text: name);
    final rollController = TextEditingController(text: roll);
    final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phone);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: rollController,
                decoration: const InputDecoration(labelText: 'Roll number'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                message('Name cannot be empty');
                return;
              }
              setState(() {
                name = nameController.text.trim();
                roll = rollController.text.trim();
                email = emailController.text.trim();
                phone = phoneController.text.trim();
              });
              Navigator.pop(dialogContext);
              message('Profile updated successfully');
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget profilePage() => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          heading('My Profile', subtitle: 'Manage your student information'),
          card(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: primary,
                  child: Icon(Icons.person, size: 45, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const Text('B.Tech • Computer Science and Engineering',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.badge_outlined, color: primary),
                  title: const Text('Roll Number'),
                  subtitle: Text(roll),
                ),
                ListTile(
                  leading: const Icon(Icons.email_outlined, color: primary),
                  title: const Text('Email Address'),
                  subtitle: Text(email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone_outlined, color: primary),
                  title: const Text('Phone Number'),
                  subtitle: Text(phone),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: editProfile,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
          card(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About CampusEase',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(
                  'CampusEase brings your timetable, campus events, notices, '
                  'and student profile together in one convenient place.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      timetablePage(),
      eventsPage(),
      noticesPage(),
      profilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusEase',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Profile',
            onPressed: () => setState(() => tab = 4),
            icon: const Icon(Icons.account_circle_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) => setState(() => tab = index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Timetable'),
          NavigationDestination(
              icon: Icon(Icons.event_outlined),
              selectedIcon: Icon(Icons.event),
              label: 'Events'),
          NavigationDestination(
              icon: Icon(Icons.campaign_outlined),
              selectedIcon: Icon(Icons.campaign),
              label: 'Notices'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }
}
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:go_router/go_router.dart';

// Notifier for theme mode changes (Light/Dark mode)
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

// A simple class to represent a child's profile
class ChildProfile {
  final String name;
  final String id;
  final String notes;
  final String wearableId;
  final String batteryPercent;
  final String location;
  final String lastUpdated;

  ChildProfile({
    required this.name,
    required this.id,
    required this.notes,
    required this.wearableId,
    required this.batteryPercent,
    required this.location,
    required this.lastUpdated,
  });
}

// A simple class to represent an alert
class Alert {
  final String message;
  final String type; // 'critical', 'warning', 'info'
  final String time;

  Alert({required this.message, required this.type, required this.time});
}

// Global list of child profiles as the single source of truth
List<ChildProfile> allChildProfiles = [
  ChildProfile(
    name: 'John Doe',
    id: '000-3481-3333',
    notes: 'John is an active and curious child. He enjoys playing with building blocks and engaging in group activities. He sometimes needs gentle redirection when overly excited.',
    wearableId: 'XYZ-7890-ABC',
    batteryPercent: '85%',
    location: 'Classroom A - Safezone Area',
    lastUpdated: 'July 16, 2025, 7:45 AM',
  ),
  ChildProfile(
    name: 'Jane Smith',
    id: '000-1234-5678',
    notes: 'Jane is a quiet and observant child. She loves reading and drawing. She thrives in structured environments and enjoys one-on-one interactions.',
    wearableId: 'QWE-1029-RTY',
    batteryPercent: '92%',
    location: 'Library Section B',
    lastUpdated: 'July 16, 2025, 8:00 AM',
  ),
  ChildProfile(
    name: 'Mike Johnson',
    id: '000-9876-5432',
    notes: 'Mike is energetic and loves outdoor activities. He is friendly but can be easily distracted. Encouragement works best for him.',
    wearableId: 'ASD-4567-FGH',
    batteryPercent: '70%',
    location: 'Playground',
    lastUpdated: 'July 16, 2025, 8:10 AM',
  ),
  ChildProfile(
    name: 'Sarah Brown',
    id: '000-5555-1111',
    notes: 'Sarah is very creative and enjoys arts and crafts. She is generally independent but can be shy in new situations.',
    wearableId: 'ZXC-8765-VBN',
    batteryPercent: '60%',
    location: 'Art Room',
    lastUpdated: 'July 16, 2025, 7:30 AM',
  ),
  ChildProfile(
    name: 'David Lee',
    id: '000-2222-9999',
    notes: 'David is curious and enjoys solving puzzles. He is a quick learner and interacts well with peers. He prefers structured learning activities.',
    wearableId: 'JKL-1122-OUI',
    batteryPercent: '95%',
    location: 'Computer Lab',
    lastUpdated: 'July 16, 2025, 8:15 AM',
  ),
];

// Global notifier for the selected child's name
final ValueNotifier<String> selectedChildNotifier = ValueNotifier(allChildProfiles[0].name);

// Global notifier for dynamic alerts
final ValueNotifier<Alert?> alertNotifier = ValueNotifier<Alert?>(null);

// A simple class to represent the logged-in user's profile
class UserProfile {
  String name;
  String email;

  UserProfile({required this.name, required this.email});
}

// Global instance of the user profile
final UserProfile currentUser = UserProfile(name: 'Administrator', email: 'admin@example.com');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey.shade100,
            brightness: Brightness.light,
            cardColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            splashColor: Colors.pink.shade100,
            highlightColor: Colors.pink.shade50,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              buttonColor: Colors.blue,
              textTheme: ButtonTextTheme.primary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.pink.shade300,
              selectionHandleColor: Colors.pink.shade300,
              selectionColor: Colors.pink.shade100,
            ),
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: Colors.pink.shade300,
            ),
            chipTheme: ChipThemeData(
              backgroundColor: Colors.blue.shade100,
              labelStyle: const TextStyle(color: Colors.blue),
              shape: const StadiumBorder(side: BorderSide(color: Colors.blue)),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.blueGrey.shade900,
            cardColor: Colors.grey.shade900,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue.shade800,
              textTheme: ButtonTextTheme.primary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.white,
              ),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colors.pink.shade300,
              selectionHandleColor: Colors.pink.shade300,
              selectionColor: Colors.pink.shade100,
            ),
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: Colors.pink.shade300,
            ),
            chipTheme: ChipThemeData(
              backgroundColor: Colors.blue.shade900,
              labelStyle: const TextStyle(color: Colors.white),
              shape: const StadiumBorder(side: BorderSide(color: Colors.blueAccent)),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white70),
              bodyLarge: TextStyle(color: Colors.white),
              titleMedium: TextStyle(color: Colors.white),
            ),
          ),
          routerConfig: _router,
        );
      },
    );
  }
}

// GoRouter configuration
final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/alerts',
      builder: (context, state) => const AlertsPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/location',
      builder: (context, state) => const LocationPage(),
    ),
    GoRoute(
      path: '/activity-log',
      builder: (context, state) => const ActivityLogPage(),
    ),
    GoRoute(
      path: '/report',
      builder: (context, state) => const ReportPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
          path: 'account',
          builder: (context, state) => const AccountSettingsPage(),
        ),
        GoRoute(
          path: 'notifications',
          builder: (context, state) => const NotificationSettingsPage(),
        ),
        GoRoute(
          path: 'manage-profiles',
          builder: (context, state) => const ManageChildProfilesPage(),
        ),
        GoRoute(
          path: 'update-profile',
          builder: (context, state) => const UpdateProfilePage(),
        ),
        GoRoute(
          path: 'help',
          builder: (context, state) => const HelpSupportPage(),
        ),
      ],
    ),
  ],
);

// ---------------------- LOGIN PAGE --------------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _isPasswordVisible = false; // New state for password visibility

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isLoading = false;
      });
      context.go('/home');
    }
  }

  void _showNotImplementedSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Functionality not yet implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xFFE91E63), Colors.blue], // Pink to Blue
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const CircularProgressIndicator(
                  // Use a white or black color as the base for the gradient mask
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on, size: 80, color: Colors.pink.shade300),
                        const SizedBox(height: 20),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [Color(0xFFE91E63), Colors.blue], // Pink to Blue
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // This color is masked by the gradient
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible, // Controlled by state
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _showNotImplementedSnackBar, // Forgot Password
                            child: Text('Forgot Password?', style: TextStyle(color: Colors.pink.shade300)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade300,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: _login,
                          child: const Text('Login', style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: _showNotImplementedSnackBar, // Create Account
                          child: Text('Create Account', style: TextStyle(color: Colors.pink.shade300)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

// ----------------------- HOME PAGE ------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _heartRate = '80+/min';
  String _temperature = '36.5 ℃';
  Timer? _metricsTimer;
  Timer? _alertTimer;
  final Random _random = Random();

  final List<Alert> _possibleAlerts = [
    Alert(message: 'Critical Alert: Child exited safe zone!', type: 'critical', time: '10:35 AM'),
    Alert(message: 'Warning: Child is in the library for over 15 mins.', type: 'warning', time: '10:30 AM'),
    Alert(message: 'Low Battery Alert: Wearable battery is at 15%.', type: 'warning', time: '10:25 AM'),
    Alert(message: 'Child entered classroom A.', type: 'info', time: '10:20 AM'),
    Alert(message: 'Heart rate is stable.', type: 'info', time: '10:15 AM'),
    Alert(message: 'Temperature is within normal range.', type: 'info', time: '10:10 AM'),
  ];

  @override
  void initState() {
    super.initState();
    _metricsTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _updateMetrics();
    });
    _alertTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _updateAlert();
    });
    // Set an initial alert on start
    _updateAlert();
  }

  @override
  void dispose() {
    _metricsTimer?.cancel();
    _alertTimer?.cancel();
    super.dispose();
  }

  void _updateMetrics() {
    setState(() {
      _heartRate = '${70 + _random.nextInt(31)}+/min';
      double tempValue = 36.0 + _random.nextDouble() * 1.5;
      _temperature = '${tempValue.toStringAsFixed(1)} ℃';
    });
  }

  void _updateAlert() {
    final randomAlert = _possibleAlerts[_random.nextInt(_possibleAlerts.length)];
    // Update the global notifier with the new alert
    alertNotifier.value = randomAlert;
  }

  void _navigateToAlertsPage() {
    context.push('/alerts');
  }

  void _navigateToProfilePage() {
    context.push('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ValueListenableBuilder<Alert?>(
            valueListenable: alertNotifier,
            builder: (context, alert, child) {
              final hasAlert = alert != null;
              final color = (alert?.type == 'critical') ? Colors.red : Colors.yellow;
              return IconButton(
                icon: Icon(
                  hasAlert ? Icons.notifications_active : Icons.notifications,
                  color: hasAlert ? color : Colors.white,
                ),
                onPressed: _navigateToAlertsPage,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: _navigateToProfilePage,
          ),
        ],
      ),
      drawer: const AppDrawer(currentPage: 'Home'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ValueListenableBuilder<String>(
                          valueListenable: selectedChildNotifier,
                          builder: (context, name, child) {
                            return Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
                          },
                        ),
                        const SizedBox(width: 10),
                        const Chip(
                          label: Text('Safe Zone'),
                        ),
                      ],
                    ),
                    const Text('Student'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMetricCard(context, _heartRate, 'Heart Rate'),
                        _buildMetricCard(context, _temperature, 'Temperature'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMetricCard(context, 'Active', 'Activity'),
                        _buildMetricCard(context, '1 hr 30 m', 'Session Time'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<Alert?>(
              valueListenable: alertNotifier,
              builder: (context, alert, child) {
                if (alert != null) {
                  return _buildAlertCard(
                    context,
                    title: 'Latest Alert 🔔',
                    message: alert.message,
                    type: alert.type,
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('No new alerts at the moment.', style: Theme.of(context).textTheme.bodyMedium),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Further Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Stable'), Text('Needs Attention'), Text('Irregular Activity')],
                    ),
                    SizedBox(height: 10),
                    Text('Vital Signs'),
                    Text('Normal / Slightly Elevated'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildMetricCard(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  static Widget _buildAlertCard(BuildContext context, {required String title, required String message, required String type}) {
    Color cardColor;
    IconData icon;
    if (type == 'critical') {
      cardColor = Colors.red.shade100;
      icon = Icons.warning;
    } else if (type == 'warning') {
      cardColor = Colors.orange.shade100;
      icon = Icons.warning_amber;
    } else {
      cardColor = Colors.blue.shade100;
      icon = Icons.info;
    }

    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: cardColor.darken(0.8)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: cardColor.darken(0.8))),
                  Text(message, style: TextStyle(color: cardColor.darken(0.8))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ ALERTS PAGE ------------------
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
      ),
      body: ValueListenableBuilder<Alert?>(
        valueListenable: alertNotifier,
        builder: (context, currentAlert, child) {
          if (currentAlert == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.notifications_none, size: 80, color: Colors.grey),
                    const SizedBox(height: 20),
                    const Text(
                      'No new alerts at the moment!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'All clear. Check back later for important notifications.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Refreshing alerts...')),
                        );
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh Alerts'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildAlertCard(context, currentAlert),
              ],
            );
          }
        },
      ),
    );
  }

  static Widget _buildAlertCard(BuildContext context, Alert alert) {
    Color iconColor;
    IconData icon;
    if (alert.type == 'critical') {
      iconColor = Colors.red;
      icon = Icons.warning;
    } else if (alert.type == 'warning') {
      iconColor = Colors.orange;
      icon = Icons.warning_amber;
    } else {
      iconColor = Colors.blue;
      icon = Icons.info;
    }

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(
          alert.message,
          style: TextStyle(fontWeight: FontWeight.bold, color: iconColor),
        ),
        subtitle: Text(alert.time),
      ),
    );
  }
}

// ------------------ PROFILE PAGE ------------------
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int _selectedChildIndex;

  @override
  void initState() {
    super.initState();
    // Find the index of the globally selected child
    _selectedChildIndex = allChildProfiles.indexWhere((profile) => profile.name == selectedChildNotifier.value);
    if (_selectedChildIndex == -1) {
      _selectedChildIndex = 0; // Default to the first if not found
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the list is empty to prevent errors
    if (allChildProfiles.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Child Profile')),
        body: const Center(child: Text('No profiles available. Please add one in Settings.')),
      );
    }

    // FIX: Changed _selectedChildChild to _selectedChildIndex
    final currentChild = allChildProfiles[_selectedChildIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: DropdownButton<int>(
                value: _selectedChildIndex,
                items: List.generate(allChildProfiles.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(allChildProfiles[index].name),
                  );
                }).toList(),
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedChildIndex = newValue!;
                    selectedChildNotifier.value = allChildProfiles[_selectedChildIndex].name;
                  });
                },
                style: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.bodyLarge?.color),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(Icons.person, size: 80, color: Colors.blue),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentChild.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Student ID: ${currentChild.id}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildProfileInfoCard(
              context,
              title: 'Notes About the Child',
              content: currentChild.notes,
            ),
            const SizedBox(height: 20),
            _buildProfileInfoCard(
              context,
              title: 'Wearable Information',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Wearable ID:', currentChild.wearableId),
                  _buildInfoRow('Battery Percent:', currentChild.batteryPercent),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileInfoCard(
              context,
              title: 'Current Location',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Location:', currentChild.location),
                  _buildInfoRow('Last Updated:', currentChild.lastUpdated),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(BuildContext context, {required String title, required dynamic content}) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const Divider(height: 20, thickness: 1),
            content is String
                ? Text(
                    content,
                    style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color),
                  )
                : content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}

// ---------------- LOCATION PAGE WITH GEOFENCE SLIDER ----------------
class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Map<String, double> _classroomRadii = {
    'Classroom A': 25.0,
    'Classroom B': 40.0,
    'Classroom C': 30.0,
    'Classroom D': 50.0,
  };

  late double _currentRadius;
  late String _selectedClassroom;
  final List<String> _classrooms = ['Classroom A', 'Classroom B', 'Classroom C', 'Classroom D'];

  @override
  void initState() {
    super.initState();
    _selectedClassroom = _classrooms[0];
    _currentRadius = _classroomRadii[_selectedClassroom]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      drawer: const AppDrawer(currentPage: 'Location'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationDisplay(context),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Classroom Selection', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _selectedClassroom,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    items: _classrooms.map((String classroom) {
                      return DropdownMenuItem<String>(
                        value: classroom,
                        child: Text(classroom),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedClassroom = newValue!;
                        _currentRadius = _classroomRadii[_selectedClassroom]!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Geofence Setting', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Slider(
                    value: _currentRadius,
                    min: 10,
                    max: 100,
                    divisions: 9,
                    label: '${_currentRadius.toInt()} meters',
                    activeColor: Colors.orange,
                    inactiveColor: Colors.grey.shade400,
                    onChanged: (value) {
                      setState(() {
                        _currentRadius = value;
                      });
                    },
                  ),
                  Center(
                    child: Text(
                      'Safe Zone Radius: ${_currentRadius.toInt()} meters',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDisplay(BuildContext context) {
    final double containerSize = 50 + (_currentRadius - 10) * (100 / 90);
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue.shade600,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Dummy Map Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/map.webp',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Center(child: Text('Map Image Failed to Load', textAlign: TextAlign.center)),
                  );
                },
              ),
            ),
            // Animated Geofence Circle
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                color: Colors.blue.shade600.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange.shade300, width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.my_location, color: Colors.white, size: 30),
                  const SizedBox(height: 8),
                  const Text('Safe Zone', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------ ACTIVITY LOG PAGE ------------------
class ActivityLogPage extends StatefulWidget {
  const ActivityLogPage({super.key});

  @override
  State<ActivityLogPage> createState() => _ActivityLogPageState();
}

class _ActivityLogPageState extends State<ActivityLogPage> {
  String selectedTimeRange = 'Last Hour';

  final Map<String, List<Map<String, dynamic>>> allActivities = {
    'Last Hour': [
      {'color': Colors.orange, 'text': 'Child moved to Room B (10:55 AM)'},
      {'color': Colors.red, 'text': 'Child exited the Safe Zone (10:50 AM)'},
      {'color': Colors.green, 'text': 'Child Returns to the Safe Zone (10:45 AM)'},
      {'color': Colors.green, 'text': 'Child moved to Room A (10:30 AM)'},
      {'color': Colors.orange, 'text': 'Child has became Inactive (10:15 AM)'},
    ],
    'Today': [
      {'color': Colors.orange, 'text': 'Child moved to Room B (10:55 AM)'},
      {'color': Colors.red, 'text': 'Child exited the Safe Zone (10:50 AM)'},
      {'color': Colors.green, 'text': 'Child Returns to the Safe Zone (10:45 AM)'},
      {'color': Colors.green, 'text': 'Child moved to Room A (10:30 AM)'},
      {'color': Colors.green, 'text': 'Child arrived at school (07:45 AM)'},
      {'color': Colors.red, 'text': 'Temperature spike detected (09:10 AM)'},
      {'color': Colors.green, 'text': 'Heart rate stable (10:00 AM)'},
    ],
    'This Week': [
      {'color': Colors.orange, 'text': 'Child moved to Classroom C (Fri, Last Week)'},
      {'color': Colors.green, 'text': 'Normal vital signs (Wed, Last Week)'},
      {'color': Colors.orange, 'text': 'Child left Classroom A (Tue, Last Week)'},
      {'color': Colors.green, 'text': 'Arrival at School (Mon, Last Week)'},
    ],
  };

  final List<String> timeOptions = ['Last Hour', 'Today', 'This Week'];

  List<Map<String, dynamic>> _currentActivities = [];

  @override
  void initState() {
    super.initState();
    _currentActivities = allActivities[selectedTimeRange]!;
  }

  void _navigateToAlertsPage() {
    context.push('/alerts');
  }

  void _navigateToProfilePage() {
    context.push('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Log'),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: _navigateToAlertsPage),
          IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: _navigateToProfilePage),
        ],
      ),
      drawer: const AppDrawer(currentPage: 'Activity Log'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: selectedTimeRange,
                  items: timeOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTimeRange = value!;
                      _currentActivities = allActivities[selectedTimeRange]!;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                  icon: const Icon(Icons.arrow_drop_down),
                  dropdownColor: Theme.of(context).cardColor,
                  underline: Container(height: 0),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: _currentActivities.length,
                  itemBuilder: (context, index) {
                    final item = _currentActivities[index];
                    return ListTile(
                      leading: Icon(Icons.circle, size: 12, color: item['color'] as Color),
                      title: Text(
                        item['text'],
                        style: TextStyle(
                          color: item['color'] == Colors.red ? Colors.red : Theme.of(context).textTheme.bodyMedium?.color,
                          fontWeight: item['color'] == Colors.red ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -2, horizontal: -4),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- REPORT PAGE --------------------------
class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  // Helper method to add a new alert
  void _addAlert(String message, String type) {
    final newAlert = Alert(
      message: message,
      type: type,
      time: 'Just now',
    );
    alertNotifier.value = newAlert;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
      ),
      drawer: const AppDrawer(currentPage: 'Report'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Submitting report...')),
                      );
                      // Add a new 'info' type alert when the button is clicked
                      _addAlert('Report submitted successfully.', 'info');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Submit A Report',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle('Child Identification'),
                          ValueListenableBuilder<String>(
                            valueListenable: selectedChildNotifier,
                            builder: (context, name, child) {
                              return infoRow('Name:', name);
                            },
                          ),
                          infoRow('ID No.:', '000-3481-3333'),
                          infoRow('Report Date:', '07/14/2025'),
                          infoRow('Time Session Covered:', '10:30 AM - 12:00 PM'),
                          const SizedBox(height: 16),
                          const SectionTitle('Location and Movement'),
                          infoRow('Time of Arrival:', '10:25 AM'),
                          infoRow('Time of Departure:', '11:50 AM'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Left Safezone:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('Yes'),
                              Text('Count: 2'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          infoRow('Physical Activity Duration:', '30 mins'),
                          infoRow('Inactive Duration:', '30 mins'),
                          const SizedBox(height: 16),
                          const SectionTitle('Heart Rate Monitoring'),
                          infoRow('Average Heart Rate:', '80 bpm'),
                          infoRow('Highest Recorded:', '95 bpm'),
                          infoRow('Lowest Recorded:', '80 bpm'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Downloading report...')),
                );
                // Add a new 'info' type alert when the button is clicked
                _addAlert('Report downloaded successfully.', 'info');
              },
              icon: const Icon(Icons.download),
              label: const Text('Download Report', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}

// ---------------------- SETTINGS PAGE --------------------------
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = themeNotifier.value == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const AppDrawer(currentPage: 'Settings'),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Update Profile'),
            onTap: () => context.go('/settings/update-profile'),
          ),
          ListTile(
            leading: const Icon(Icons.child_care),
            title: const Text('Manage Child Profiles'),
            onTap: () => context.go('/settings/manage-profiles'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Notification Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Toggles'),
            onTap: () => context.go('/settings/notifications'),
          ),
          const Divider(),
          const ListTile(
            title: Text('App & Display', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() => isDarkMode = value);
              themeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
            },
            secondary: const Icon(Icons.brightness_6),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: const Text('Font Size'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Font size settings are not yet implemented.')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: () => context.go('/settings/help'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

// ------------------- NEW SETTINGS PAGES -------------------

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Update My Profile'),
            onTap: () => context.go('/settings/update-profile'),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Manage Child Profiles'),
            onTap: () => context.go('/settings/manage-profiles'),
          ),
        ],
      ),
    );
  }
}

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-populate text fields with current user data
    nameController.text = currentUser.name;
    emailController.text = currentUser.email;
  }

  void _saveChanges() {
    setState(() {
      currentUser.name = nameController.text;
      currentUser.email = emailController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
    // Pop back to the previous screen
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageChildProfilesPage extends StatefulWidget {
  const ManageChildProfilesPage({super.key});

  @override
  State<ManageChildProfilesPage> createState() => _ManageChildProfilesPageState();
}

class _ManageChildProfilesPageState extends State<ManageChildProfilesPage> {
  // Method to handle deleting a profile
  void _deleteProfile(int index) {
    final profileName = allChildProfiles[index].name;
    // Check if the profile being deleted is the currently selected one
    if (selectedChildNotifier.value == profileName) {
      if (allChildProfiles.length > 1) {
        // If there are other profiles, select the first one
        selectedChildNotifier.value = allChildProfiles[0].name;
      } else {
        // If it's the last profile, clear the selected name
        selectedChildNotifier.value = '';
      }
    }
    setState(() {
      allChildProfiles.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile for $profileName has been deleted.')),
    );
  }

  // Method to show a confirmation dialog for deletion
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete ${allChildProfiles[index].name}\'s profile? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                _deleteProfile(index); // Proceed with deletion
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Method to handle adding a new profile via a dialog
  void _addProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController nameController = TextEditingController();
        return AlertDialog(
          title: const Text('Add New Profile'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Enter child's name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    allChildProfiles.add(
                      ChildProfile(
                        name: nameController.text,
                        id: '000-new-${Random().nextInt(9999)}',
                        notes: 'New profile added.',
                        wearableId: 'NEW-${Random().nextInt(9999)}',
                        batteryPercent: '100%',
                        location: 'Not yet assigned',
                        lastUpdated: 'Just now',
                      ),
                    );
                    selectedChildNotifier.value = nameController.text;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${nameController.text} has been added.')),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Profiles'),
      ),
      body: allChildProfiles.isEmpty
          ? const Center(child: Text('No profiles available. Tap "+" to add one.'))
          : ListView.builder(
              itemCount: allChildProfiles.length,
              itemBuilder: (context, index) {
                final profile = allChildProfiles[index];
                return Dismissible(
                  key: Key(profile.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    _deleteProfile(index);
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(profile.name),
                    subtitle: Text('ID: ${profile.id}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProfile,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool geofenceEnabled = true;
  bool vitalsEnabled = true;
  bool activityEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Preferences')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Geofence Alerts'),
            subtitle: const Text('Notifies you when a child enters or exits a safe zone.'),
            value: geofenceEnabled,
            onChanged: (bool value) {
              setState(() {
                geofenceEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Geofence alerts ${value ? "enabled" : "disabled"}.')),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Vitals Alerts'),
            subtitle: const Text('Notifies you of abnormal heart rate or temperature readings.'),
            value: vitalsEnabled,
            onChanged: (bool value) {
              setState(() {
                vitalsEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Vitals alerts ${value ? "enabled" : "disabled"}.')),
              );
            },
          ),
          SwitchListTile(
            title: const Text('Activity Alerts'),
            subtitle: const Text('Notifies you of periods of inactivity or high activity.'),
            value: activityEnabled,
            onChanged: (bool value) {
              setState(() {
                activityEnabled = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Activity alerts ${value ? "enabled" : "disabled"}.')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  final List<Map<String, String>> faqs = const [
    {
      'question': 'How do I add a new child profile?',
      'answer': 'Go to Settings > Manage Child Profiles and tap the "+" button in the bottom right corner. Enter the child\'s name to create their profile.'
    },
    {
      'question': 'How do I track a child\'s real-time location?',
      'answer': 'The Location page provides a live map and geofence settings. Select a child from the dropdown on the Profile page, and then navigate to the Location page to view their real-time location.'
    },
    {
      'question': 'My child\'s location isn\'t updating. What should I do?',
      'answer': 'First, check if the wearable device is turned on and has sufficient battery. Ensure the device has a stable internet connection. If the issue persists, try restarting the app or the wearable device.'
    },
    {
      'question': 'What do the different colors in the activity log mean?',
      'answer': 'The colors provide a quick visual status:\n• Green: Normal activity (e.g., safe zone entry/exit, stable vitals).\n• Orange: Minor alert (e.g., inactivity detected, movement to a different room).\n• Red: Critical alert (e.g., child exited a safe zone, abnormal vitals detected).'
    },
    {
      'question': 'How can I change my profile information?',
      'answer': 'You can update your personal information by going to Settings > Update Profile. You can change your name and email address from this page.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Help & Support',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'For assistance, please contact our support team or refer to the frequently asked questions below.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              const Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...faqs.map((faq) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    title: Text(
                      faq['question']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          faq['answer']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------ DRAWER WIDGET ------------------
class AppDrawer extends StatelessWidget {
  final String currentPage;
  const AppDrawer({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String currentRoute = GoRouterState.of(context).matchedLocation;

    return Drawer(
      backgroundColor: Theme.of(context).cardColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(16), child: Text('Menu', style: TextStyle(fontSize: 24))),
            const Divider(),
            _drawerTile(context, 'Home', Icons.home, '/home'),
            _drawerTile(context, 'Location', Icons.location_on, '/location'),
            _drawerTile(context, 'Activity Log', Icons.view_list, '/activity-log'),
            _drawerTile(context, 'Report', Icons.insert_drive_file, '/report'),
            _drawerTile(context, 'Settings', Icons.settings, '/settings'),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile(BuildContext context, String title, IconData icon, String path) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final String currentRoute = GoRouterState.of(context).matchedLocation;

    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      selected: currentRoute == path,
      selectedTileColor: Colors.pink.shade100,
      selectedColor: isDarkMode ? Colors.black : null,
      onTap: () {
        context.go(path);
      },
    );
  }
}

// Helper extension to darken a color
extension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
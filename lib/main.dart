// ML Guide — Flutter starter (light mode) with Firebase (Firestore) skeleton // Files included below: pubspec.yaml, lib/main.dart, lib/screens/home.dart, lib/screens/heroes.dart, // lib/screens/guide.dart, lib/screens/stats.dart, lib/widgets/hero_card.dart, android/firebase_instructions.txt

// ---------- pubspec.yaml (excerpt) ---------- name: ml_guide description: ML Guide — Companion app for Mobile Legends (Guide, Tips, Stats) publish_to: 'none' version: 0.1.0+1 environment: sdk: '>=3.0.0 <4.0.0'

dependencies: flutter: sdk: flutter cupertino_icons: ^1.0.2

Core Firebase packages (use flutter pub add to fetch latest compatible versions)

firebase_core: ^1.24.0 cloud_firestore: ^3.4.0 provider: ^6.0.5

dev_dependencies: flutter_test: sdk: flutter

---------- lib/main.dart ----------

import 'package:flutter/material.dart'; import 'package:firebase_core/firebase_core.dart'; import 'screens/home.dart'; import 'screens/heroes.dart'; import 'screens/guide.dart'; import 'screens/stats.dart';

// NOTE: If you use flutterfire configure the CLI will generate firebase_options.dart // and you can import it and pass to Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)

void main() async { WidgetsFlutterBinding.ensureInitialized(); await Firebase.initializeApp(); // replace with options if using generated file runApp(const MLGuideApp()); }

class MLGuideApp extends StatelessWidget { const MLGuideApp({super.key});

@override Widget build(BuildContext context) { return MaterialApp( title: 'ML Guide', theme: ThemeData( brightness: Brightness.light, useMaterial3: true, primarySwatch: Colors.indigo, ), initialRoute: '/', routes: { '/': (context) => const HomeScreen(), '/heroes': (context) => const HeroesScreen(), '/guide': (context) => const GuideScreen(), '/stats': (context) => const StatsScreen(), }, ); } }

// ---------- lib/screens/home.dart ---------- import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget { const HomeScreen({super.key});

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: const Text('ML Guide')), body: Padding( padding: const EdgeInsets.all(16.0), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ const Text('Welcome to ML Guide', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 12), ElevatedButton.icon( onPressed: () => Navigator.pushNamed(context, '/heroes'), icon: const Icon(Icons.people), label: const Text('Heroes'), ), const SizedBox(height: 8), ElevatedButton.icon( onPressed: () => Navigator.pushNamed(context, '/guide'), icon: const Icon(Icons.menu_book), label: const Text('Guides'), ), const SizedBox(height: 8), ElevatedButton.icon( onPressed: () => Navigator.pushNamed(context, '/stats'), icon: const Icon(Icons.bar_chart), label: const Text('My Stats'), ), ], ), ), ); } }

// ---------- lib/screens/heroes.dart ---------- import 'package:flutter/material.dart';

class HeroesScreen extends StatelessWidget { const HeroesScreen({super.key});

@override Widget build(BuildContext context) { // Example static list; replace with Firestore fetch when ready final heroes = [ {'name': 'Aldous', 'role': 'Fighter'}, {'name': 'Eudora', 'role': 'Mage'}, {'name': 'Layla', 'role': 'Marksman'}, ];

return Scaffold(
  appBar: AppBar(title: const Text('Heroes')),
  body: ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: heroes.length,
    itemBuilder: (context, i) {
      final h = heroes[i];
      return Card(
        child: ListTile(
          title: Text(h['name']!),
          subtitle: Text(h['role']!),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // TODO: navigate to hero detail
          },
        ),
      );
    },
  ),
);

} }

// ---------- lib/screens/guide.dart ---------- import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget { const GuideScreen({super.key});

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(title: const Text('Guides')), body: const Padding( padding: EdgeInsets.all(16.0), child: Text('Role-based tips, combos and video links go here.'), ), ); } }

// ---------- lib/screens/stats.dart ---------- import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget { const StatsScreen({super.key});

@override Widget build(BuildContext context) { // Simple manual-entry UI placeholder return Scaffold( appBar: AppBar(title: const Text('My Stats')), body: Padding( padding: const EdgeInsets.all(16.0), child: Column( children: [ const Text('Enter matches played / wins to compute win rate.'), const SizedBox(height: 12), ElevatedButton( onPressed: () { // TODO: show input dialog and save to Firestore }, child: const Text('Add Match (manual)'), ) ], ), ), ); } }

// ---------- lib/widgets/hero_card.dart (example) ---------- import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget { final String name; final String role; const HeroCard({super.key, required this.name, required this.role});

@override Widget build(BuildContext context) { return Card( child: ListTile( title: Text(name), subtitle: Text(role), ), ); } }

// ---------- android/firebase_instructions.txt ---------- /* Quick Firebase setup (Android) — follow Firebase official guide.

1. Install FlutterFire CLI: dart pub global activate flutterfire_cli


2. From project root run: flutterfire configure

Choose or create a Firebase project

This generates firebase_options.dart and configures platforms



3. Add Android app in Firebase Console and download google-services.json


4. Place google-services.json into android/app/


5. In android/build.gradle add classpath 'com.google.gms:google-services:4.3.15' if needed


6. In android/app/build.gradle add apply plugin: 'com.google.gms.google-services'


7. In lib/main.dart, initialize Firebase using the generated DefaultFirebaseOptions import 'firebase_options.dart'; await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);



Official Firebase + Flutter docs: https://firebase.google.com/docs/flutter/setup */

// ---------- NOTES & NEXT STEPS ---------- // 1) This starter intentionally keeps no authentication (per your choice). If you later want optional login, //    Firebase Auth can be added. // 2) For Firestore usage, create collections such as 'heroes', 'guides', 'user_stats'. //    Use the cloud_firestore package to read/write. // 3) Use flutter pub add firebase_core and flutter pub add cloud_firestore to fetch the latest packages //    or run flutterfire configure to auto-generate proper configuration.

// ---------- End of starter code doc ----------

  

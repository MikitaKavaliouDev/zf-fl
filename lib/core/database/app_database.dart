import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'tables/bookings_table.dart';
import 'tables/calendar_events_table.dart';
import 'tables/client_assessments_table.dart';
import 'tables/client_exercise_logs_table.dart';
import 'tables/client_measurements_table.dart';
import 'tables/client_photos_table.dart';
import 'tables/clients_table.dart';
import 'tables/exercises_table.dart';
import 'tables/notifications_table.dart';
import 'tables/packages_table.dart';
import 'tables/profiles_table.dart';
import 'tables/programs_table.dart';
import 'tables/services_table.dart';
import 'tables/sync_metadata.dart';
import 'tables/testimonials_table.dart';
import 'tables/trainer_profiles_table.dart';
import 'tables/workout_sessions_table.dart';
import 'tables/workout_templates_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    SyncMetadata,
    ClientsTable,
    ProfilesTable,
    WorkoutSessionsTable,
    ExercisesTable,
    WorkoutTemplates,
    ClientMeasurements,
    ClientPhotos,
    Notifications,
    BookingTable,
    PackageTable,
    TestimonialTable,
    ClientExerciseLogs,
    Services,
    Programs,
    CalendarEvents,
    ClientAssessments,
    TrainerProfilesTable,
  ],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = p.join(dbFolder.path, 'zirofit.db');
    return NativeDatabase(File(file));
  });
}

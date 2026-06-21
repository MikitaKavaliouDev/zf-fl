/// Central registry of all sync table names matching the backend's
/// SYNC_TABLES list. Used by the sync engine to iterate over tables.
class SyncTables {
  static const List<String> all = [
    'clients',
    'profiles',
    'workout_sessions',
    'exercises',
    'workout_templates',
    'client_assessments',
    'client_measurements',
    'client_photos',
    'client_exercise_logs',
    'trainer_services',
    'trainer_packages',
    'trainer_testimonials',
    'trainer_programs',
    'notifications',
    'bookings',
    'trainer_profiles',
    'calendar_events',
  ];

  static const List<String> allLocal = [
    'clients',
    'profiles',
    'workoutSessions',
    'exercises',
    'workoutTemplates',
    'clientAssessments',
    'clientMeasurements',
    'clientPhotos',
    'clientExerciseLogs',
    'trainerServices',
    'trainerPackages',
    'trainerTestimonials',
    'trainerPrograms',
    'notifications',
    'bookings',
    'trainerProfiles',
    'calendarEvents',
  ];
}

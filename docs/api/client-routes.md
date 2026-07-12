# Client API Routes — Complete Reference

> **Source**: `~/pr/zirofit-next\src\app\api\client\` — Next.js App Router  
> **Auth**: All endpoints require authentication via `requireUserShort` or `withAuth`  
> **Response Envelope**: All successful responses wrapped in `{ data: ... }`, errors in `{ error: { message, code?, details? } }`  
> **Last Updated**: 2026-06-24

---

## Table of Contents

1. [Dashboard](#1-dashboard)
2. [Programs & Routines](#2-programs--routines)
3. [Templates & Exercises](#3-templates--exercises)
4. [AI Generation](#4-ai-generation)
5. [Check-Ins](#5-check-ins)
6. [Daily Targets](#6-daily-targets)
7. [Fitness Goals](#7-fitness-goals)
8. [Habits](#8-habits)
9. [Events](#9-events)
10. [Trainer Link](#10-trainer-link)
11. [Link Requests](#11-link-requests)
12. [Privacy](#12-privacy)
13. [Sharing](#13-sharing)
14. [Progress](#14-progress)
15. [Analytics](#15-analytics)
16. [Statistics](#16-statistics)
17. [Exercise Stats](#17-exercise-stats)
18. [Nutrition](#18-nutrition)
19. [Resource Vault](#19-resource-vault)
20. [Upload](#20-upload)
21. [Widget Config](#21-widget-config)

---

## 1. Dashboard

### `GET /api/client/dashboard`

**Auth**: `client` role  
**Response**: `200` with full dashboard data

```typescript
// Response: { data: Dto }
interface DashboardResponse {
  clientData: {
    id: string;                    // Client cuid
    userId: string;                // User UUID
    name: string;
    email: string;
    trainer: {
      id: string;
      name: string | null;
      username: string;
      email: string;
    } | null;
    workoutSessions: Array<{       // Recent 10 completed/in-progress
      id: string;
      startTime: string;           // ISO datetime
      endTime: string | null;
      status: string;              // "COMPLETED" | "IN_PROGRESS"
      name: string;
      isTrainerLed: boolean;
      exerciseLogs: Array<{ id: string }>;
    }>;
    measurements: Array<{           // Latest 5
      id: string;
      measurementDate: string;      // ISO datetime
      weightKg: number | null;
      bodyFatPercentage: number | null;
    }>;
  };
  privacySettings: {
    shareWorkoutHistory: boolean;
    shareBodyMeasurements: boolean;
    shareCheckinNotes: boolean;
    shareLocation: boolean;
    allowTrainerExport: boolean;
    dataRetentionDays: number | null;
  };
  weightUnit: string;               // Always "KG"
  upcomingClientSessions: Array<{   // Next 5 planned sessions
    id: string;
    title: string;
    date: string;                   // ISO datetime
    plannedDate: string;
    duration: number;
    isTrainerLed: boolean;
    trainerName: string | null;
    workoutTemplate: object | null;  // Full template with exercises
  }>;
  lastCheckIn: string | null;       // ISO datetime of latest check-in
}
```

---

## 2. Programs & Routines

### `GET /api/client/program/active`

**Auth**: `client` role  
**Returns `null` when no active program** (this is the "create a routine" trigger)

```typescript
// Response: { data: ActiveProgramResponse | null }
interface ActiveProgramResponse {
  program: {
    id: string;
    name: string;
    description: string | null;
  };
  progress: {
    completedCount: number;
    totalCount: number;
    progressPercentage: number;     // 0–100
    nextTemplateId: string | null;
  };
  templates: Array<{
    id: string;
    name: string;
    description: string | null;
    order: number;
    status: "COMPLETED" | "NEXT" | "PENDING";
    exerciseCount: number;
  }>;
}
```

### `PUT /api/client/program/active`

**Auth**: `client` role  
**Body**:
```typescript
{ "programId": string }
```
**Response**: `{ success: true }`  
Deactivates all other active assignments, activates this one. Creates assignment if none exists.

### `GET /api/client/programs`

**Auth**: `client` or `trainer` role  
**Query params**:
- `category?: string` — Filter by program category
- `source?: "self" | "assigned" | "system"` — Filter by source
- `type?: "program" | "template"` — Filter by entity type

```typescript
// Response: { data: ProgramLibraryResponse }
interface ProgramLibraryResponse {
  assignedPrograms: Array<{
    assignmentId: string;
    startDate: string;
    isActive: boolean;
    program: WorkoutProgram;        // Full program with templates
    source: "assigned";
  }>;
  personalPrograms: Array<{
    id: string;                     // Program fields...
    source: "self";
  }>;
  personalTemplates: Array<{
    id: string;                     // Template fields...
    program: { name: string; trainerId: string };
    source: "self";
  }>;
  systemTemplates: Array<{
    id: string;                     // Template fields...
    source: "system";
  }>;
  categories: string[];             // e.g. ["strength", "cardio", "hybrid"]
}
```

### `POST /api/client/programs`

**Auth**: `client` or `trainer` role  
**Two modes**:

**Manual** (name in body):
```typescript
// Request
{ "name": string, "description"?: string | null }

// Response: 201
{ "data": { "program": WorkoutProgram } }
```

**AI Generation** (duration in body):
```typescript
// Request
{ "duration": "week" | "month", "focus": string }

// Response: 201 — AI-generated program
```

### `GET /api/client/programs/{id}`

**Auth**: `client` or `trainer` role

```typescript
// Response: { data: { program, isActive } }
interface ProgramDetailResponse {
  program: {
    id: string;
    name: string;
    description: string | null;
    trainerId: string | null;
    category: string | null;
    createdAt: Date;
    updatedAt: Date;
    templates: Array<{
      id: string;
      name: string;
      description: string | null;
      programId: string;
      order: number;
      exercises: Array<{
        id: string;
        templateId: string;
        type: string | null;
        exerciseId: string | null;
        targetReps: string | null;
        targetSets: number | null;
        targetRIR: number | null;
        tempo: string | null;
        durationSeconds: number | null;
        notes: string | null;
        order: number;
        supersetGroupId: string | null;
        supersetOrder: number | null;
        exerciseCategory: string | null;
        exercise: {
          id: string;
          name: string;
          equipment: string | null;
          category: string | null;
          videoUrl: string | null;
          muscleGroup: string | null;
        } | null;
      }>;
    }>;
  };
  isActive: boolean;
}
```

---

## 3. Templates & Exercises

### `POST /api/client/programs/templates`

**Auth**: `client` or `trainer` role

```typescript
// Request
{
  "name": string,                        // Required
  "description"?: string | null,
  "programId": string,                    // Required — parent program ID
  "exercises"?: Array<{                   // Optional inline exercises
    "exerciseId": string,
    "targetReps"?: string | null,         // e.g. "8-12"
    "targetSets"?: number | null,
    "durationSeconds"?: number | null,
    "notes"?: string | null,
    "order"?: number | null
  }> | null
}

// Response: 201
{ "data": { "template": WorkoutTemplate } }
```

### `POST /api/client/programs/templates/{templateId}/exercises`

**Auth**: `client` or `trainer` role

```typescript
// Request
{
  "exerciseId": string,
  "targetReps"?: string | null,
  "targetSets"?: number | null,          // int, min 1
  "durationSeconds"?: number | null,     // int
  "tempo"?: string | null,              // e.g. "3010"
  "enableRpe"?: boolean | null,
  "notes"?: string | null,
  "supersetGroupId"?: string | null,
  "supersetOrder"?: number | null,      // int
  "exerciseCategory"?: "MAIN" | "ASSISTANCE" | "ACCESSORY" | "ADDITION" | "WARMUP" | null
}

// Response: 201
{ "data": { "templateExercise": TemplateExercise } }
```

### `POST /api/client/programs/templates/{templateId}/rest`

**Auth**: `client` or `trainer` role

```typescript
// Request
{ "durationSeconds": number }           // int, positive

// Response: 201
{ "data": { "restStep": RestStep } }
```

### `POST /api/client/programs/templates/{templateId}/copy`

**Auth**: `client` or `trainer` role  
Copies a system template (trainerId === null) to the user's library.

```typescript
// Response: 201
{ "data": { "newTemplate": WorkoutTemplate, "newProgram": WorkoutProgram | null } }
```

---

## 4. AI Generation

### `POST /api/client/ai/generate`

**Auth**: `client` role (implicit by route placement)

```typescript
// Request
{
  "clientId": string,
  "content"?: string,          // User's workout description
  "userIntent"?: string,       // Alias for content (supporting older clients)
  "trainerId"?: string,
  "senderId"?: string
}

// Response: 200
{
  "success": boolean,
  "data": any,                 // Generated workout plan
  "message": string | null,
  "error": string | null
}
```

### `POST /api/client/ai/program`

**Auth**: `client` or `trainer` role

```typescript
// Request
{ "clientId": string, "duration": "week" | "month", "focus": string }

// Response: Delegates to generateAndSaveProgram → AI-generated program
```

### `POST /api/client/ai/workout`

**Auth**: `client` or `trainer` role

```typescript
// Request
{ "clientId": string, "prompt": string }

// Response: Delegates to generateAndSaveWorkout → AI-generated workout
```

> **Note**: `ai/program/route.schema.ts` and `ai/workout/route.schema.ts` do not exist.

---

## 5. Check-Ins

### `POST /api/client/check-in`

**Auth**: `client` role  
Submits a weekly check-in. Transactionally creates CheckIn + ClientMeasurement + optionally ClientProgressPhoto.

```typescript
// Request
{
  "weight"?: number | null,
  "waistCm"?: number | null,
  "sleepHours"?: number | null,
  "energyLevel"?: number | null,        // 1–10
  "stressLevel"?: number | null,       // 1–10
  "hungerLevel"?: number | null,       // 1–10
  "digestionLevel"?: number | null,    // 1–10
  "nutritionCompliance"?: string | null,
  "clientNotes"?: string,
  "photos"?: Array<{
    "imagePath": string,
    "caption"?: string,
    "date"?: string
  }>
}

// Response: 200
{ "data": { "id": string, "status": string } }
```

### `GET /api/client/check-in/config`

**Auth**: `client` role

```typescript
// Response: 200
{
  "checkInDay": number,            // 0=Sunday, 6=Saturday
  "checkInHour": number,           // 0–23
  "nextCheckInDueAt": string       // ISO datetime
}
```

### `GET /api/client/check-ins`

**Auth**: `client` role  
List all past check-ins.

```typescript
// Response: 200
Array<{
  "id": string,
  "date": Date | string,
  "status": string,
  "hasFeedback": boolean,
  "photoCount": number,
  "reviewedAt": Date | string | null
}>
```

### `GET /api/client/check-ins/{id}`

**Auth**: `client` role  
Full check-in detail with photos and reviewer info.

```typescript
// Response: 200
{
  "id": string,
  "date": Date | string,
  "status": string,
  "weight": number | null,
  "waistCm": number | null,
  "sleepHours": number | null,
  "energyLevel": number | null,
  "stressLevel": number | null,
  "hungerLevel": number | null,
  "digestionLevel": number | null,
  "nutritionCompliance": string | null,
  "clientNotes": string | null,
  "trainerResponse": string | null,
  "reviewedAt": Date | string | null,
  "photos": Array<{
    "id": string,
    "imageUrl": string,          // Transformed via transformImagePath
    "caption": string | null,
    "photoDate": Date | string
  }>,
  "reviewedBy": {
    "name": string,
    "photoUrl": string | null
  } | null
}
```

Errors: `400` (missing ID), `403` (wrong client), `404` (not found)

---

## 6. Daily Targets

### `GET /api/client/daily-targets`

**Auth**: `client` role  
**Query**: `?date=` (optional ISO string)

```typescript
// Response: 200
{ "targets": DailyTarget[] }
```

### `POST /api/client/daily-targets`

**Auth**: `client` role

```typescript
// Request
{
  "title": string,
  "description"?: string | null,
  "type": string,
  "targetValue": number,
  "unit": string,
  "date": string           // ISO date
}

// Response: 201
{ "target": DailyTarget }
```

### `PUT /api/client/daily-targets/{id}`

**Auth**: `client` role

```typescript
// Request (partial)
{ "currentValue"?: number, "isCompleted"?: boolean }

// Response: 200
{ "target": DailyTarget }
```

### `DELETE /api/client/daily-targets/{id}`

**Auth**: `client` role  
Soft-delete (sets `deletedAt`).

```typescript
// Response: 200
{ "deleted": true }
```

### DailyTarget Model

```typescript
interface DailyTarget {
  id: string;
  clientId: string;
  title: string;
  description: string | null;
  type: string;
  targetValue: number;
  unit: string;
  date: Date;
  currentValue: number | null;
  isCompleted: boolean;
  order: number;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
}
```

---

## 7. Fitness Goals

### `GET /api/client/fitness-goals`

**Auth**: `client` role

```typescript
// Response: 200
{ "goals": FitnessGoal[] }     // Non-deleted, ordered by createdAt desc
```

### `POST /api/client/fitness-goals`

**Auth**: `client` role

```typescript
// Request
{
  "type": string,                  // Required, e.g. "STRENGTH", "WEIGHT"
  "targetValue": number,
  "startDate": string,             // ISO date
  "endDate"?: string | null,
  "exerciseName"?: string | null
}

// Response: 201
{ "goal": FitnessGoal }
```

### `PUT /api/client/fitness-goals/{id}`

**Auth**: `client` role

```typescript
// Request (partial)
{ "targetValue"?: number, "currentValue"?: number }

// Response: 200
{ "goal": FitnessGoal }
```

### `DELETE /api/client/fitness-goals/{id}`

**Auth**: `client` role  
Soft-delete (sets `deletedAt`).

```typescript
// Response: 200
{ "deleted": true }
```

### FitnessGoal Model

```typescript
interface FitnessGoal {
  id: string;
  clientId: string;
  type: string;
  targetValue: number;
  currentValue: number | null;
  startDate: Date;
  endDate: Date | null;
  exerciseName: string | null;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
}
```

---

## 8. Habits

### `GET /api/client/habits`

**Auth**: `client` role

```typescript
// Response: 200
{
  "habits": Array<{
    "id": string;
    "clientId": string;
    "trainerId": string;
    "title": string;
    "description": string | null;
    "frequency": "DAILY" | "WEEKLY";
    "isActive": boolean;
    "createdAt": Date;
    "updatedAt": Date;
    "deletedAt": Date | null;
  }>
}
```

### `POST /api/client/habits`

**Auth**: `client` role

```typescript
// Request
{
  "title": string,
  "description"?: string | null,
  "frequency"?: "DAILY" | "WEEKLY"   // Default: "DAILY"
}

// Response: 200
{ "habit": Habit }                    // Includes logs
```

### `POST /api/client/habits/{habitId}/log`

**Auth**: `client` role

```typescript
// Request
{
  "date": string,          // ISO date
  "isCompleted": boolean,
  "note"?: string | null
}

// Response: 201
{ "log": HabitLog }
```

### HabitLog Model

```typescript
interface HabitLog {
  id: string;
  habitId: string;
  clientId: string;
  date: Date;
  isCompleted: boolean;
  note: string | null;
  createdAt: Date;
  updatedAt: Date;
}
```

> **Note**: No `GET/PUT/DELETE /api/client/habits/{habitId}` exists.

---

## 9. Events

### `GET /api/client/events`

**Auth**: `client` role

```typescript
// Response: 200
{
  "bookings": Array<{
    "id": string;
    "userId": string;
    "eventId": string;
    "status": string;
    "createdAt": Date;
    "updatedAt": Date;
    "event": {
      "id": string;
      "title": string;
      "description": string | null;
      "startTime": Date;
      "endTime": Date;
      "trainerId": string;
      "enrolledCount": number;
      "maxParticipants": number | null;
      "trainer": {
        "name": string | null;
        "email": string | null;
      };
    };
  }>
}
```

### `PUT /api/client/events/{bookingId}/cancel`

**Auth**: `client` role  
Decrements `enrolledCount` in a transaction.

```typescript
// Response: 200
{ "booking": { "id", "userId", "eventId", "status", "createdAt", "updatedAt" } }
```

Errors: `400` (already cancelled / past event), `403` (unauthorized), `404` (not found)

> **Note**: No `events/{bookingId}` root route exists.

---

## 10. Trainer Link

### `POST /api/client/trainer/link`

**Auth**: `client` role  
Sends a link request via notification + email.

```typescript
// Request
{ "trainerUsername": string }

// Response: 200
{ "message": string }
```

### `DELETE /api/client/trainer/link`

**Auth**: `client` role  
Unlinks by setting `trainerId = null`.

```typescript
// Response: 200
{ "message": string }
```

### `GET /api/client/trainer/link`

**Auth**: `client` role  
**Query**: `?trainerId=` or `?trainerUsername=`

```typescript
// Response: 200
{ "isLinked": boolean }
```

---

## 11. Link Requests

> No root `link-requests/{notificationId}/route.ts` exists. Instead, two sub-routes:

### `POST /api/client/link-requests/{notificationId}/accept`

**Auth**: `client` role  
Transactionally links client to trainer, marks notification read, notifies trainer.

```typescript
// Response: 200
{ "message": string }
```

### `POST /api/client/link-requests/{notificationId}/decline`

**Auth**: `client` role

```typescript
// Response: 200
{ "message": string }
```

---

## 12. Privacy

### `GET /api/client/privacy`

**Auth**: `client` role

```typescript
// Response: 200
{
  "shareWorkoutHistory": boolean;
  "shareBodyMeasurements": boolean;
  "shareCheckinNotes": boolean;
  "shareLocation": boolean;
  "allowTrainerExport": boolean;
  "dataRetentionDays": number | null;
}
```

### `PUT /api/client/privacy`

**Auth**: `client` role  
Partial update.

```typescript
// Request (all optional)
{
  "shareWorkoutHistory"?: boolean;
  "shareBodyMeasurements"?: boolean;
  "shareCheckinNotes"?: boolean;
  "shareLocation"?: boolean;
  "allowTrainerExport"?: boolean;
  "dataRetentionDays"?: number | null;   // Must be ≥ 90 or null
}

// Response: 200 — Full privacy settings
```

---

## 13. Sharing

### `GET /api/client/sharing`

**Auth**: `client` role

```typescript
// Response: 200
{
  "expiresAt": Date | null;
  "duration": string;                      // "forever" | "30_days" | "90_days"
  "settings": {
    "workouts": boolean;
    "measurements": boolean;
    "photos": boolean;
    "checkins": boolean;
  }
}
```

### `PUT /api/client/sharing`

**Auth**: `client` role

```typescript
// Request (partial)
{
  "duration"?: "30_days" | "90_days" | "forever";
  "settings"?: Partial<{ workouts, measurements, photos, checkins }>;
}

// Response: 200
{ "success": true }
```

---

## 14. Progress

### `GET /api/client/progress`

**Auth**: `client` role

```typescript
// Response: 200
{
  "weight": Array<{ "date": Date | string, "value": number }>;
  "bodyFat": Array<{ "date": Date | string, "value": number }>;
  "volume": Array<{ "date": Date | string, "value": number }>;
  "exercisePerformance": Array<{
    "exerciseId": string;
    "exerciseName": string;
    "maxWeight": number;
    "maxReps": number;
    "maxVolume": number;
    "lastPerformed": string;          // ISO datetime
  }>;
  "favoriteExercises": Array<{
    "exerciseId": string;
    "exerciseName": string;
    "frequency": number;
  }>;
  "worstPerformingExercises": Array<{
    "exerciseId": string;
    "exerciseName": string;
    "issue": string;
  }>;
}
```

---

## 15. Analytics

### `GET /api/client/analytics`

**Auth**: `client` role  
Returns data for charts over the last 6 months.

```typescript
// Response: 200
{
  "heatmapDates": string[];                              // ISO date strings
  "volumeHistory": Array<{ "date": string, "volume": number }>;
  "muscleDistribution": Array<{ "muscle": string, "count": number }>;
  "recentPRs": Array<{
    "exercise": string;
    "value": number;
    "type": string;
    "date": string;
  }>;
  "consistency": number;                                  // 0–100
}
```

---

## 16. Statistics

### `GET /api/client/statistics`

**Auth**: `client` role  
Delegates to `getClientDashboardDataForClient()`. Schema is a placeholder.

```typescript
// Response: 200 — schema is z.object({}) (placeholder — real shape TBD)
```

---

## 17. Exercise Stats

### `GET /api/client/stats/exercise`

**Auth**: `client` role  
**Query params**:
- `exerciseId: string` — **Required**
- `metric: "e1rm" | "volume" | "bestSetVolume"` — Default: `"e1rm"`

```typescript
// Response: 200
{
  "exerciseId": string;
  "metric": string;
  "history": Array<{ "date": Date | string, "value": number }>;
}
```

---

## 18. Nutrition

### `GET /api/client/nutrition`

**Auth**: `client` role

```typescript
// Response: 200
{ "plan": TrainerNutritionPlan | null }
```

> No `route.schema.ts` exists.

---

## 19. Resource Vault

### `GET /api/client/resource-vault`

**Auth**: `client` role

```typescript
// Response: 200
{ "resources": any[] }
```

---

## 20. Upload

### `POST /api/client/upload`

**Auth**: `client` role  
**Content-Type**: `multipart/form-data`  
Uploads an image to Supabase storage. Max 10MB. Allowed: JPEG, PNG, WebP, HEIC.

```typescript
// Request: FormData with field "file"
// Response: 200
{
  "imagePath": string;          // "{userId}/uploads/{timestamp}_{uuid}.{ext}"
  "publicUrl": string;          // Transformed public URL
}
```

Errors: `400` (no file / over limit), `500` (upload failed)

---

## 21. Widget Config

### `GET /api/client/widget-config`

**Auth**: `client` role

```typescript
// Response: 200
{ "widgets": Record<string, any>[] }
```

### `PUT /api/client/widget-config`

**Auth**: `client` role

```typescript
// Request
{ "widgets": Record<string, any>[] }

// Response: 200
{ "widgets": Record<string, any>[] }
```

---

## Summary: Full Route Inventory

| # | Method | Path | Module | Has Schema | Notes |
|---|--------|------|--------|-----------|-------|
| 1 | GET | `/api/client/dashboard` | Dashboard | ✅ | |
| 2 | GET | `/api/client/program/active` | Programs | ✅ | Returns null when no active routine |
| 3 | PUT | `/api/client/program/active` | Programs | — | Activate a program |
| 4 | GET | `/api/client/programs` | Programs | ✅ | Library with filters |
| 5 | POST | `/api/client/programs` | Programs | ✅ | Manual or AI creation |
| 6 | GET | `/api/client/programs/{id}` | Programs | ✅ | Detail with templates |
| 7 | POST | `/api/client/programs/templates` | Templates | ✅ | Create template |
| 8 | POST | `/api/client/programs/templates/{id}/exercises` | Templates | ✅ | Add exercise to template |
| 9 | POST | `/api/client/programs/templates/{id}/rest` | Templates | ✅ | Add rest step |
| 10 | POST | `/api/client/programs/templates/{id}/copy` | Templates | ✅ | Copy system template |
| 11 | POST | `/api/client/ai/generate` | AI | ✅ | AI workout generation |
| 12 | POST | `/api/client/ai/program` | AI | ❌ | AI program generation |
| 13 | POST | `/api/client/ai/workout` | AI | ❌ | AI single workout |
| 14 | POST | `/api/client/check-in` | Check-ins | ✅ | Submit weekly check-in |
| 15 | GET | `/api/client/check-in/config` | Check-ins | ✅ | Config + next due date |
| 16 | GET | `/api/client/check-ins` | Check-ins | ✅ | List all check-ins |
| 17 | GET | `/api/client/check-ins/{id}` | Check-ins | ✅ | Check-in detail |
| 18 | GET | `/api/client/daily-targets` | Daily Targets | ✅ | List, optional ?date= |
| 19 | POST | `/api/client/daily-targets` | Daily Targets | ✅ | Create |
| 20 | PUT | `/api/client/daily-targets/{id}` | Daily Targets | ✅ | Update |
| 21 | DELETE | `/api/client/daily-targets/{id}` | Daily Targets | ✅ | Soft-delete |
| 22 | GET | `/api/client/fitness-goals` | Fitness Goals | ✅ | List all |
| 23 | POST | `/api/client/fitness-goals` | Fitness Goals | ✅ | Create |
| 24 | PUT | `/api/client/fitness-goals/{id}` | Fitness Goals | ✅ | Update |
| 25 | DELETE | `/api/client/fitness-goals/{id}` | Fitness Goals | ✅ | Soft-delete |
| 26 | GET | `/api/client/habits` | Habits | ✅ | List active |
| 27 | POST | `/api/client/habits` | Habits | ✅ | Create |
| 28 | POST | `/api/client/habits/{id}/log` | Habits | ✅ | Log completion |
| 29 | GET | `/api/client/events` | Events | ✅ | List bookings |
| 30 | PUT | `/api/client/events/{id}/cancel` | Events | ✅ | Cancel booking |
| 31 | POST | `/api/client/trainer/link` | Trainer Link | ✅ | Request link |
| 32 | DELETE | `/api/client/trainer/link` | Trainer Link | ✅ | Unlink |
| 33 | GET | `/api/client/trainer/link` | Trainer Link | ✅ | Check link status |
| 34 | POST | `.../link-requests/{id}/accept` | Link Requests | ✅ | Accept trainer |
| 35 | POST | `.../link-requests/{id}/decline` | Link Requests | ✅ | Decline trainer |
| 36 | GET | `/api/client/privacy` | Privacy | ✅ | Get settings |
| 37 | PUT | `/api/client/privacy` | Privacy | ✅ | Update settings |
| 38 | GET | `/api/client/sharing` | Sharing | ✅ | Get config |
| 39 | PUT | `/api/client/sharing` | Sharing | ✅ | Update config |
| 40 | GET | `/api/client/progress` | Progress | ✅ | Metrics |
| 41 | GET | `/api/client/analytics` | Analytics | ✅ | Chart data |
| 42 | GET | `/api/client/statistics` | Statistics | ✅ | Dashboard stats |
| 43 | GET | `/api/client/stats/exercise` | Exercise Stats | ✅ | Per-exercise history |
| 44 | GET | `/api/client/nutrition` | Nutrition | ❌ | Get nutrition plan |
| 45 | GET | `/api/client/resource-vault` | Resource Vault | ✅ | Assigned resources |
| 46 | POST | `/api/client/upload` | Upload | ✅ | Image upload |
| 47 | GET | `/api/client/widget-config` | Widget Config | ✅ | Dashboard widgets |
| 48 | PUT | `/api/client/widget-config` | Widget Config | ✅ | Update widgets |

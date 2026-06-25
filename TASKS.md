- [x] Fix back button on trainer profile screen by using `context.push` instead of `context.go` for trainer details and adding fallback pop routing in TrainerDetailScreen.
- [x] Fix navigation GoError crash on Check-In screen and other sub-sheets/sub-screens by switching from `context.go` to `context.push` and incorporating safe fallback routing on pop actions.
- [x] Fix status bar overlap / header layout UI on HomeScreen and other screens utilizing custom floating headers by dynamically calculating and adding top safe area padding.
      
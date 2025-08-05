# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is "Almacen Granja" - a Flutter application for managing farm warehouse operations for Granjas Orihuela. The project follows Clean Architecture principles with feature-based organization and uses BLoC for state management.

## Development Commands

### Running the Application
The project supports 3 flavors:
```sh
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging  
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

### Testing
```sh
# Run all tests with coverage
very_good test --coverage --test-randomize-ordering-seed random

# Generate and view coverage report
genhtml coverage/lcov.info -o coverage/
open coverage/index.html
```

### Localization
```sh
# Generate translations after modifying ARB files
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

## Architecture

### Project Structure
- **Clean Architecture**: Features organized in `data/`, `domain/`, and `presentation/` layers
- **BLoC Pattern**: State management using flutter_bloc with equatable for state comparison
- **Feature-based**: Each feature (e.g., `login/`) contains its complete architecture layers
- **Multi-flavor**: Separate entry points for development, staging, and production environments

### Key Directories
- `lib/features/`: Feature modules following Clean Architecture
  - `data/`: Data sources, models, repositories implementation
  - `domain/`: Entities, repository contracts, use cases  
  - `presentation/`: BLoC, pages, widgets
- `lib/app/`: Main app configuration and routing
- `lib/l10n/`: Internationalization (English and Spanish supported)
- `lib/bootstrap.dart`: App initialization with BLoC observer and error handling

### State Management
- Uses BLoC pattern with `flutter_bloc` package
- Global BLoC observer configured in bootstrap for logging state changes
- Events and states use `equatable` for proper comparison

### Localization
- Supports English (`en`) and Spanish (`es`)
- ARB files located in `lib/l10n/arb/`
- Auto-generated localizations in `lib/l10n/gen/`

### Testing Strategy  
- Uses `very_good_analysis` for linting
- Test helpers in `test/helpers/` for consistent test setup
- Coverage reporting with lcov integration
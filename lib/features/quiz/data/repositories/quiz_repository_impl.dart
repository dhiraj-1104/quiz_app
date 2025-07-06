import 'package:quiz_app/features/quiz/data/model/question_model.dart';
import 'package:quiz_app/features/quiz/domain/entities/question_entity.dart';
import 'package:quiz_app/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  @override
  Future<List<QuestionEntity>> getQuestions() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      QuestionModel(
        question: "Which programming language is used to build Flutter apps?",
        options: ["Kotlin", "Dart", "Java", "Swift"],
        correctIndex: 2,
        context: [
          "❌ Kotlin is used for native Android development.",
          "✅ Dart is the language used by Flutter to build cross-platform apps.",
          "❌ Java is also used in Android development, not Flutter.",
          "❌ Swift is used for native iOS development, not Flutter.",
        ],
      ),
      QuestionModel(
        question: "What does the build() method return?",
        options: ["State", "Widget", "Function", "Scaffold"],
        correctIndex: 2,
        context: [
          "❌ `State` is for managing state, not returned by build().",
          "✅ `Widget` is what the `build()` method must return.",
          "❌ Functions are not expected return types of build().",
          "❌ `Scaffold` is a widget, but not always returned by build().",
        ],
      ),
      QuestionModel(
        question: "What does the initState() method do?",
        options: [
          "Clean up memory",
          "Initialize data before UI builds",
          "Create UI",
        ],
        correctIndex: 2,
        context: [
          "❌ Memory cleanup is done in `dispose()`.",
          "✅ `initState()` sets up the state before the widget is built.",
          "❌ UI is created in the `build()` method, not `initState()`.",
        ],
      ),
      QuestionModel(
        question: "Which widget makes a list scrollable?",
        options: ["Column", "Stack", "ListView", "Container"],
        correctIndex: 3,
        context: [
          "❌ Column needs to be wrapped in a scroll view to be scrollable.",
          "❌ Stack is for overlapping widgets, not for scrolling.",
          "✅ ListView is a built-in widget for scrollable lists.",
          "❌ Container does not support scrolling.",
        ],
      ),
      QuestionModel(
        question: "What does setState() do in Flutter?",
        options: [
          "Rebuild UI",
          "Navigate to another page",
          "Dispose widgets",
          "Load assets",
        ],
        correctIndex: 1,
        context: [
          "✅ `setState()` triggers a rebuild to reflect UI changes.",
          "❌ Navigation is done with `Navigator.push()`.",
          "❌ Disposal is done using `dispose()`.",
          "❌ Assets are loaded with `pubspec.yaml` and `AssetBundle`.",
        ],
      ),
      QuestionModel(
        question: "Which widget detects gestures like taps?",
        options: ["Text", "GestureDetector", "AppBar"],
        correctIndex: 2,
        context: [
          "❌ Text is a display widget, not interactive.",
          "✅ GestureDetector is used to handle tap and drag gestures.",
          "❌ AppBar is for UI layout, not gesture handling.",
        ],
      ),
      QuestionModel(
        question: "What is the root widget for most Flutter apps?",
        options: ["MaterialApp", "Scaffold", "runApp", "Center"],
        correctIndex: 1,
        context: [
          "✅ `MaterialApp` sets up routes, themes, and app structure.",
          "❌ `Scaffold` is for material layout, not app root.",
          "❌ `runApp` is a function, not a widget.",
          "❌ `Center` is a layout widget, not the root widget.",
        ],
      ),
      QuestionModel(
        question: "What is Scaffold used for?",
        options: [
          "To create scrollable list",
          "To add state",
          "To create Material Design layout",
          "To define theme",
        ],
        correctIndex: 3,
        context: [
          "❌ Scrollable lists are made with `ListView`, not `Scaffold`.",
          "❌ State is handled in StatefulWidgets or with state management tools.",
          "✅ Scaffold provides the structure for Material Design layouts.",
          "❌ Themes are defined in `MaterialApp`, not `Scaffold`.",
        ],
      ),
      QuestionModel(
        question: "What does Navigator.push() do?",
        options: [
          "Opens a dialog",
          "Moves to another screen",
          "Closes the app",
        ],
        correctIndex: 2,
        context: [
          "❌ Dialogs are shown with `showDialog()`.",
          "✅ `Navigator.push()` adds a route to the navigation stack.",
          "❌ App closure is handled by system or platform code.",
        ],
      ),
      QuestionModel(
        question: "What is FutureBuilder used for?",
        options: [
          "To manage app state",
          "To create a delay",
          "To build UI based on async data",
          "To initialize widgets",
        ],
        correctIndex: 3,
        context: [
          "❌ App state is managed by StatefulWidgets or providers.",
          "❌ Delays are created using `Future.delayed`, not `FutureBuilder`.",
          "✅ `FutureBuilder` listens to async results and updates the UI.",
          "❌ Widget initialization is done in `initState()`.",
        ],
      ),
      QuestionModel(
        question: "Which widget stacks children on top of each other?",
        options: ["Row", "Column", "Stack", "Align"],
        correctIndex: 3,
        context: [
          "❌ Row arranges children horizontally.",
          "❌ Column arranges children vertically.",
          "✅ Stack places widgets on top of each other.",
          "❌ Align positions a single child, doesn’t stack widgets.",
        ],
      ),
      QuestionModel(
        question: "Which widget gives internal space to a widget?",
        options: ["Padding", "Margin", "Center"],
        correctIndex: 1,
        context: [
          "✅ `Padding` adds space inside the child widget.",
          "❌ Margin is a CSS concept; in Flutter, you'd use `Container` with `margin`.",
          "❌ Center aligns child but doesn't give spacing.",
        ],
      ),
      QuestionModel(
        question:
            "Which widget divides space proportionally in a row or column?",
        options: ["Expanded", "SizedBox", "ListView", "Spacer"],
        correctIndex: 1,
        context: [
          "✅ `Expanded` lets a widget fill available space proportionally.",
          "❌ `SizedBox` is for fixed dimensions, not flexible layout.",
          "❌ `ListView` is for scrolling, not spacing.",
          "❌ `Spacer` is used in layout but not as flexibly as `Expanded`.",
        ],
      ),
      QuestionModel(
        question: "What widget avoids system UI like notches and status bars?",
        options: ["SafeArea", "Container", "Padding", "Positioned"],
        correctIndex: 1,
        context: [
          "✅ `SafeArea` ensures content doesn’t overlap with system areas.",
          "❌ Container is a generic box without notch handling.",
          "❌ Padding adds space but doesn’t auto-detect safe areas.",
          "❌ Positioned is used in Stack layout, not for safe areas.",
        ],
      ),
      QuestionModel(
        question: "How can you handle null values safely in Dart?",
        options: ["Using !", "Using ?", "Using ??", "All of the above"],
        correctIndex: 4,
        context: [
          "✅ `!` tells Dart you are sure the value is not null.",
          "✅ `?` marks a variable as nullable.",
          "✅ `??` provides a fallback if the value is null.",
          "✅ All are null safety tools in Dart.",
        ],
      ),
    ];
  }
}

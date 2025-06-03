import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sopa_quiz_example/screens/victory_screen.dart';

class Question {
  final String text;
  final String answer;
  Question(this.text, this.answer);
}

class InsertedWord {
  final String word;
  final List<Point<int>> positions;
  InsertedWord({required this.word, required this.positions});
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final int gridSize = 13;
  List<List<String>> grid = [];
  List<List<bool>> selectedPositions = [];
  List<Point<int>> selectedPath = [];
  Set<Point<int>> hintPositions = {};
  final Random _random = Random();
  bool helpUsed = false;
  List<Question> questions = [
    Question("Capital de Francia", "PARIS"),
    Question("Planeta rojo", "MARTE"),
    Question("Lenguaje de Flutter", "DART"),
    Question("Elemento químico H2O", "AGUA"),
    Question("Capital de España", "MADRID"),
    Question("Nombre de Messi", "LIONEL"),
    Question("Barco De Guerra", "BUQUE"),
    Question("Cual es el continente Helado?", "ANTARTIDA"),
    Question("En que continente queda China ?", "ASIA"),
    Question("en que continente queda el rio Danuvio ?", "EUROPA"),
  ];
  List<InsertedWord> insertedWords = [];
  List<String> foundWords = [];
  int currentQuestionIndex = 0;

  // 🎧 Aquí lo colocás
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _backgroundPlayer = AudioPlayer();

  void _playSound(String sound) async {
    await _audioPlayer.play(AssetSource('sounds/$sound'));
  }

  void _playBackGroundMusic() async {
    await _backgroundPlayer.setReleaseMode(ReleaseMode.loop);
    await _backgroundPlayer.play(AssetSource('sounds/background.mp3'));
  }

  final List<Color> wordColors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.teal,
  ];

  // Temporizador
  Timer? timer;
  int timeRemaining = 40;
  final int maxTime = 40;

  @override
  void initState() {
    super.initState();
    _initializeGame();

    _playBackGroundMusic();
  }

  void _showHints() {
    setState(() {
      hintPositions.clear();

      for (var inserted in insertedWords) {
        if (!foundWords.contains(inserted.word)) {
          if (inserted.positions.isNotEmpty) {
            hintPositions.add(inserted.positions.first);
          }
          break;
        }
      }
      helpUsed = true;
    });
  }

  void _initializeGame() {
    // aqui aplicando modificaciones
    //_randomLetter()
    grid = List.generate(gridSize, (_) => List.generate(gridSize, (_) => ''));

    selectedPositions = List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => false),
    );

    selectedPath = [];
    insertedWords.clear();
    foundWords.clear();
    currentQuestionIndex = 0;
    // aqui modificar el insertword
    for (var question in questions) {
      _insertWord(question.answer.toUpperCase());
    }

    //Rellenar celdas vacías con letras aleatorias
    _fillEmptyCells();

    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    timeRemaining = maxTime;

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (timeRemaining > 0) {
        setState(() {
          timeRemaining--;
        });
      } else {
        _moveToNextQuestion();
      }
    });
  }

  void _moveToNextQuestion() {
    timer?.cancel();
    hintPositions.clear();
    helpUsed = false;
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedPath.clear();
        _clearSelection();
        _startTimer();
      });
    } else {
      // Fin del juego
      setState(() {
        timeRemaining = 0;
      });
      _backgroundPlayer.stop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => VictoryScreen(score: foundWords.length),
        ),
      );
    }
  }

  /*String _randomLetter() {
    const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return letters[Random().nextInt(letters.length)];
  }*/

  /*void _initializeGrid() {
    grid = List.generate(gridSize, (_) => List.filled(gridSize, ''));
  }*/

  void _insertWord(String word) {
    const directions = [
      Point(0, 1), // derecha
      Point(1, 0), // abajo
      Point(1, 1), // diagonal ↘
      Point(-1, 1), // diagonal ↗
      Point(0, -1), // izquierda
      Point(-1, 0), // arriba
      Point(-1, -1), // diagonal ↖
      Point(1, -1), // diagonal ↙
    ];

    int attempts = 0;
    const maxAttempts = 100;

    while (attempts < maxAttempts) {
      attempts++;

      Point<int> dir = directions[_random.nextInt(directions.length)];
      bool reversed = _random.nextBool();
      String actualWord = reversed ? word.split('').reversed.join() : word;

      int row = _random.nextInt(gridSize);
      int col = _random.nextInt(gridSize);

      List<Point<int>> positions = [];

      int endRow = row + dir.x * (actualWord.length - 1);
      int endCol = col + dir.y * (actualWord.length - 1);

      // Asegurarse de que la palabra encaje
      if (endRow < 0 ||
          endRow >= gridSize ||
          endCol < 0 ||
          endCol >= gridSize) {
        continue;
      }

      bool canPlace = true;

      for (int i = 0; i < actualWord.length; i++) {
        int newRow = row + dir.x * i;
        int newCol = col + dir.y * i;
        String currentLetter = grid[newRow][newCol];

        if (currentLetter != '' && currentLetter != actualWord[i]) {
          canPlace = false;
          break;
        }

        positions.add(Point(newRow, newCol));
      }

      if (canPlace) {
        for (int i = 0; i < actualWord.length; i++) {
          int newRow = row + dir.x * i;
          int newCol = col + dir.y * i;
          grid[newRow][newCol] = actualWord[i];
        }

        insertedWords.add(InsertedWord(word: word, positions: positions));
        return;
      }
    }

    debugPrint('❌ No se pudo insertar la palabra: $word');
  }

  void _fillEmptyCells() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (grid[row][col] == '') {
          grid[row][col] = letters[_random.nextInt(letters.length)];
        }
      }
    }
  }

  /*void generateFullGrid(List<String> words) {
    _initializeGrid(); // vacía la grilla
    insertedWords.clear(); // limpia las anteriores
    for (String word in words) {
      _insertWord(word.toUpperCase()); // Asegura mayúsculas
    }
    _fillEmptyCells(); // llena lo vacío con letras
  }*/

  void _onCellTap(int row, int col) {
    setState(() {
      selectedPath.add(Point(row, col));
      selectedPositions[row][col] = true;
    });

    String selectedWord = _buildWordFromPath();

    if (selectedWord == questions[currentQuestionIndex].answer.toUpperCase()) {
      _playSound('success.mp3');
      foundWords.add(selectedWord);
      selectedPath.clear();
      _clearSelection();
      _moveToNextQuestion();
    } else if (selectedWord.length >=
        questions[currentQuestionIndex].answer.length) {
      _playSound('wrong1.mp3');
      selectedPath.clear();
      _clearSelection();
    }
  }

  String _buildWordFromPath() {
    return selectedPath.map((p) => grid[p.x][p.y]).join();
  }

  void _clearSelection() {
    selectedPositions = List.generate(
      gridSize,
      (_) => List.generate(gridSize, (_) => false),
    );
  }

  Color _getCellColor(int row, int col) {
    final point = Point(row, col);

    if (hintPositions.contains(point)) {
      return Colors.grey[300]!;
    }

    for (int i = 0; i < foundWords.length; i++) {
      final word = foundWords[i];
      final inserted = insertedWords.firstWhere(
        (w) => w.word == word,
        orElse: () => InsertedWord(word: '', positions: []),
      );
      if (inserted.positions.any((p) => p.x == row && p.y == col)) {
        return wordColors[i % wordColors.length].withOpacity(0.5);
      }
    }

    return selectedPositions[row][col] ? Colors.yellow : Colors.white;
  }

  @override
  void dispose() {
    timer?.cancel();
    _backgroundPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progressPercent = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(title: Text("Trivia + Sopa de Letras")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Tiempo restante: $timeRemaining s",
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
          SizedBox(height: 8),
          Text(
            questions[currentQuestionIndex].text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          // 🧠 Pregunta actual / total
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Pregunta ${currentQuestionIndex + 1} de ${questions.length}",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          // 🟢 Barra de progreso animada debajo de la pregunta
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progressPercent),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                // Interpolación del color según progreso
                Color progressColor;
                if (value < 0.33) {
                  progressColor = Colors.red;
                } else if (value < 0.66) {
                  progressColor = Colors.orange;
                } else {
                  progressColor = Colors.green;
                }

                return LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  color: progressColor,
                  minHeight: 8,
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton.icon(
              onPressed: _showHints,
              icon: Icon(Icons.help_outline),
              label: Text("Ayuda"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              itemCount: gridSize * gridSize,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ gridSize;
                int col = index % gridSize;
                return GestureDetector(
                  onTap: () => _onCellTap(row, col),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: _getCellColor(row, col),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Text(
                      grid[row][col],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

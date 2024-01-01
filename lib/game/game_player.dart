class Player implements Comparable<Player> {
  String name;
  int score;

  Player({required this.name, required this.score});

  @override
  int compareTo(Player other) {
    return other.score - this.score;
  }
}

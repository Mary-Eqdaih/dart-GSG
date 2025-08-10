import 'dart:io';
import 'dart:math';
import 'player.dart';
import 'team.dart';
import 'trainer.dart';
import 'stadium.dart';
import 'weather.dart';

final rand = Random();

class Game {
  late Team teamA;
  late Team teamB;
  late Stadium stadium;
  late Weather weather;

  void run() {
    print('Football Game Simulator');
    bool playAgain = true;

    while (playAgain) {
      teamA = createTeam(label: 'Team A');
      teamB = createTeam(label: 'Team B');
      weather = chooseWeather();
      stadium = createStadium();
      simulateMatch(teamA, teamB, stadium, weather);

      // Ask if user wants to play again
      print('\nDo you want to play again? (yes/no)');
      final answer = (stdin.readLineSync() ?? '').trim().toLowerCase();
      if (answer != 'yes' && answer != 'y') {
        playAgain = false;
        print('Thanks for playing! Goodbye!');
      }
    }
  }

  // Team Creation Method That Returns a class
  Team createTeam({required String label}) {
    print('*** $label setup ***');
    print('Enter team name: ');
    final nameInput = stdin.readLineSync() ?? '';
    String name;
    if (nameInput.trim().isEmpty) {
      name = (label == 'Team A') ? 'Team A' : 'Team B';
    } else {
      name = nameInput.trim();
    }

    // Trainer name with default if user leaves it blank
    print('Enter trainer name: ');
    final trNameInput = stdin.readLineSync() ?? '';
    final trName = trNameInput.trim().isEmpty
        ? 'Default Trainer'
        : trNameInput.trim();

    final trainer = Trainer(trName);
    print('Trainer Experience: ${trainer.experience}');

    // Automatically create 11 players for the team (4-4-2 formation),
    // each assigned a fixed position, with random power and stamina values.
    final positions = <String>[
      'Goalkeeper',
      'Right Back',
      'Center Back',
      'Center Back',
      'Left Back',
      'Right Midfielder',
      'Central Midfielder',
      'Central Midfielder',
      'Left Midfielder',
      'Striker',
      'Striker',
    ];

    final players = <Player>[];
    for (var i = 0; i < 11; i++) {
      final id = i + 1;
      final pos = positions[i];
      final p = Player(
        'Player $id',
        pos,
        id,
      ); // power & stamina randomized inside Player
      print(
        '${p.name}  |  Position: ${p.position}  |  Power: ${p.power} | Stamina : ${p.stamina}',
      );
      players.add(p);
    }

    // Show total power now
    var totalPower = 0;
    for (final p in players) {
      totalPower += p.power;
    }
    print('Total Player Power for $name: $totalPower');

    // Continuously asks the user to enter a valid strategy (Offensive, Defensive, or Balanced).
    // Once valid input is received, formats it with an uppercase first letter and stores it in `tactic`. to use it later for team creation
    String tactic = '';
    const valid = ['offensive', 'defensive', 'balanced'];
    while (true) {
      print('Choose a strategy: Offensive / Defensive / Balanced');
      print('Enter strategy: ');
      final input = (stdin.readLineSync() ?? '').trim().toLowerCase();
      if (valid.contains(input)) {
        tactic = input[0].toUpperCase() + input.substring(1);
        break;
      }
      print('Invalid. Please enter: Offensive, Defensive, or Balanced.\n');
    }

    // Return the new Team with its name, trainer, players, and strategy.
    return Team(name, trainer, players, tactic);
  }

  // Takes input from user(kind of the weather) then creates and returns a Weather object using this value.
  // Re-prompts the user until a valid weather type is entered.
  Weather chooseWeather() {
    const validWeathers = ['sunny', 'rainy', 'windy', 'snowy', 'hot', 'cloudy'];
    String kind = '';

    while (true) {
      print('*** Weather setup ***');
      print('Choose weather: Sunny / Rainy / Windy / Snowy / Hot / Cloudy');
      print('Enter weather: ');
      final input = (stdin.readLineSync() ?? '').trim().toLowerCase();

      if (validWeathers.contains(input)) {
        // Format first letter uppercase, rest lowercase
        kind = input[0].toUpperCase() + input.substring(1).toLowerCase();
        break;
      } else {
        print('Invalid weather type. Please try again.\n');
      }
    }

    return Weather(kind);
  }

  // Takes input from user(stadium name and location) then creates and returns a Stadium object using those values.
  // Uses defaults if user leaves fields blank.
  Stadium createStadium() {
    print('*** Stadium setup ***');

    print('Stadium name: ');
    final stadInput = stdin.readLineSync() ?? '';
    final stadName = stadInput.trim().isEmpty
        ? 'Local Ground'
        : stadInput.trim();

    print('Location: ');
    final locInput = stdin.readLineSync() ?? '';
    final loc = locInput.trim().isEmpty ? 'Unknown City' : locInput.trim();

    return Stadium(stadName, loc);
  }

  //  Pre-Match Setup
  // 1. Get strategy bonuses for both teams based on their chosen tactics (from strategyBonus).
  /* 2. Calculate each team's initial score using player power, trainer experience,
    strategy bonus, weather bonus, and random bonus (calculateScore function).*/
  // 3. Store the original scores (origAScore, origBScore) for reporting before any Lucky Factor changes.
  // 4. Determine the preWinner (which team is leading before luck is applied, or 'Draw' if tied).
  void simulateMatch(Team a, Team b, Stadium s, Weather w) {
    final strat = strategyBonus(a.tactic, b.tactic);
    var aScore = calculateScore(a, stratBonus: strat['A']!, weather: w);
    var bScore = calculateScore(b, stratBonus: strat['B']!, weather: w);
    final origAScore = aScore;
    final origBScore = bScore;

    String preWinner = '';
    if (aScore > bScore) {
      preWinner = a.tName;
    } else if (bScore > aScore) {
      preWinner = b.tName;
    } else {
      preWinner = 'Draw';
    }

    // Extra Feature Lucky Factor
    // 40% chance (rand.nextInt(101) < 41) that a random event changes the match outcome.
    // If one team is leading => the losing team gets enough points (+1 more than the difference) to take the lead.
    // If the match is tied => randomly choose one team to score a lucky goal (+1 point).
    // The variable `luckNote` stores a description of what happened for the match summary.
    String luckNote = '';
    if (rand.nextInt(101) < 41) {
      luckNote = 'CONGRATULATIONS!!!! LUCKY FACTOR ACTIVATED!\n';
      if (aScore > bScore) {
        final difference = (aScore - bScore) + 1;
        final beforeB = bScore;
        bScore += difference;
        luckNote +=
            ' ${b.tName.toUpperCase()} TEAM! got lucky: +$difference (from $beforeB to $bScore), flipping the result!\n';
      } else if (bScore > aScore) {
        final delta = (bScore - aScore) + 1;
        final beforeA = aScore;
        aScore += delta;
        luckNote +=
            ' ${a.tName.toUpperCase()} TEAM! got lucky: +$delta (from $beforeA to $aScore), flipping the result!\n';
      } else {
        if (rand.nextBool()) {
          aScore += 1;
          luckNote += 'Draw turned: ${a.tName} scored a lucky goal (+1).\n';
        } else {
          bScore += 1;
          luckNote += 'Draw turned: ${b.tName} scored a lucky goal (+1).\n';
        }
      }
    }

    //  sum of powers for each team
    final aPlayersSum = sumPlayerPowers(a);
    final bPlayersSum = sumPlayerPowers(b);

    print('\n===== MATCH SUMMARY ===== \n');
    print('Stadium Name: ${s.stadName} => Location: ${s.location}');
    print('Weather: ${w.kind}');
    print(
      'Before Luck => ${a.tName} Team : $origAScore | ${b.tName} Team : $origBScore (Initial: $preWinner)\n',
    );

    if (luckNote.isNotEmpty) {
      print(luckNote);
    } else {
      print('No Lucky Factor this match.\n');
    }

    print('Final Scores  => ${a.tName}: $aScore | ${b.tName}: $bScore \n');

    print('*** Team Totals *** \n');
    print(
      '${a.tName} Team => player power sum: $aPlayersSum   => trainer exp: ${a.trainer.experience}   => strategy: ${a.tactic}   => tactic bonus: ${strat['A']}\n',
    );
    print(
      '${b.tName} Team => player power sum: $bPlayersSum   => trainer exp: ${b.trainer.experience}   => strategy: ${b.tactic}   => tactic bonus: ${strat['B']} \n',
    );

    if (aScore > bScore) {
      print('Winner: ${a.tName}');
    } else if (bScore > aScore) {
      print('Winner: ${b.tName}');
    } else {
      print("It's a draw!");
    }
  }

  // Calculates a team's match score based on:
  // total player power
  // trainer's experience
  // strategy bonus strategyBonus function
  // weather effect bonus
  // a small random bonus for unpredictability (0–20 points)
  int calculateScore(
    Team team, {
    required int stratBonus,
    required Weather weather,
  }) {
    var playerPower = 0;
    for (final p in team.playersList) {
      final staminaBoost = (p.power * (p.stamina / 100) * 0.1).round();
      playerPower += p.power + staminaBoost;
    }

    /** if power = 70 and stamina = 80
     * 70 * 0.8 = 56
     * 56 * 0.1 = 5.6 → round → 6 bonus
     */

    final trainerPower = team.trainer.experience;
    final wx = weatherBonus(team.tactic, weather.kind);
    final randomBonus = rand.nextInt(21); // 0..20
    return playerPower + trainerPower + stratBonus + wx + randomBonus;
  }

  //  Offensive vs Defensive => Offensive gets +5, Defensive gets +10
  //  Defensive vs Offensive => Defensive gets +10, Offensive gets +5
  //  Balanced vs Balanced  => Both get +7
  //  Any other combination => Both get +3
  // Returns a map with bonuses for Team A ('A') and Team B ('B').
  Map<String, int> strategyBonus(String teamAStrat, String teamBStrat) {
    final a = teamAStrat.toLowerCase();
    final b = teamBStrat.toLowerCase();

    int aBonus = 0;
    int bBonus = 0;

    if (a == 'offensive' && b == 'defensive') {
      aBonus = 5;
      bBonus = 10;
    } else if (a == 'defensive' && b == 'offensive') {
      aBonus = 10;
      bBonus = 5;
    } else if (a == 'balanced' && b == 'balanced') {
      aBonus = 7;
      bBonus = 7;
    } else {
      aBonus = 3;
      bBonus = 3;
    }

    return {'A': aBonus, 'B': bBonus};
  }

  // Calculates the bonus based on the current weather and the team's chosen strategy.
  // Some strategies perform better or worse depending on conditions.
  int weatherBonus(String strategy, String weather) {
    final s = strategy.toLowerCase();
    final w = weather.toLowerCase();
    if (w == 'sunny') {
      return 2;
    }
    if (w == 'rainy') {
      if (s == 'defensive') return 3;
      if (s == 'offensive') return -2;
      return 1;
    }
    if (w == 'windy') {
      if (s == 'balanced') return 3;
      return 1;
    }
    if (w == 'snowy') {
      if (s == 'offensive') return -3;
      if (s == 'defensive') return 2;
      return 0;
    }
    if (w == 'hot') return -1;
    return 0;
  }

  int sumPlayerPowers(Team team) {
    var sum = 0;
    for (final p in team.playersList) {
      sum += p.power;
    }
    return sum;
  }
}

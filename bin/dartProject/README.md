# Football Game Simulator (Dart Project)

## 🎯 Project Objective
This is a console-based Football Game Simulator built using **Dart**.  
The project demonstrates **Object-Oriented Programming (OOP)** concepts by simulating a football match between two teams with:
- Players (random power & stamina)
- Trainers
- Stadium
- Weather effects
- Strategies with a payoff matrix
- Lucky factor for match surprises

---

## 🛠 Features
- **Team Creation**: Automatically generates 11 players with fixed positions.
- **Stamina & Power**: Each player has random stamina and power values.
- **Trainer Experience**: Randomized trainer experience score.
- **Strategy Selection**: Choose between Offensive, Defensive, and Balanced tactics.
- **Weather Effects**: Weather influences team performance.
- **Lucky Factor**: 40% chance of unexpected game-changing events.
- **Replay Option**: User can play multiple matches in one run.

---

## 📂 Project Structure
```
dartProject/
│-- game.dart         # Main game logic
│-- main.dart         # Entry point of the program
│-- player.dart       # Player class with attributes & methods
│-- team.dart         # Team class (name, trainer, players, strategy)
│-- trainer.dart      # Trainer class (name, experience)
│-- stadium.dart      # Stadium details
│-- weather.dart      # Weather details
```

---

## 🚀 How to Run
1. **Clone this repository**:
   ```bash
   git clone https://github.com/Mary-Eqdaih/dart-GSG.git
   ```

2. **Navigate to project folder**:
   ```bash
   cd bin/dartProject
   ```

3. **Run the project**:
   ```bash
   dart run main.dart
   ```

---

## 🎮 How to Play
1. Enter **team names** and **trainer names** (or leave blank for defaults).
2. Each team gets **11 players** with fixed positions.
3. Choose a **strategy** for each team.
4. Select **weather condition**.
5. The game simulates and displays:
   - Team details
   - Match result
   - Lucky factor events (if triggered)
6. Choose to **play again** or exit.

---

## 📌 Example Output
```
Football Game Simulator
*** Team A setup ***
Enter team name: Tigers
Enter trainer name: Alex
Trainer Experience: 45
Player 1 | Position: Goalkeeper | Power: 72 | Stamina: 80
...
Choose a strategy: Offensive / Defensive / Balanced
Enter strategy: Offensive

*** Weather setup ***
Enter weather: Sunny

*** Stadium setup ***
Enter weather: Sunny
Stadium name: Dream Arena
Location: New York

===== MATCH SUMMARY =====
Stadium Name: Dream Arena => Location: New York
Weather: Sunny
Before Luck => Tigers: 85 | Eagles: 78 (Initial: Tigers)
Lucky Factor Activated! Eagles got lucky and flipped the result!
Final Scores => Tigers: 85 | Eagles: 90

*** Team Totals ***

Tigers Team => player power sum: 661   => trainer exp: 23   => strategy: Offensive   => tactic bonus: 5

Eagles Team => player power sum: 718   => trainer exp: 77   => strategy: Defensive   => tactic bonus: 10

Winner: Eagles
```

---

## 👩‍💻 Author
- **Your Name**  
 - GitHub: [@Mary-Eqdaih](https://github.com/Mary-eqdaih)

import 'player.dart';
import 'trainer.dart';
class Team {
  String tName;
 Trainer trainer;
  List<Player> playersList;
  String tactic;

  Team(this.tName, this.trainer, this.playersList, this.tactic);
}

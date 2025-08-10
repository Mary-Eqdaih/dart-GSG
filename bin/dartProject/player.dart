import 'dart:math';
class Player {
  String name;
  String position;
  int id;
  int power;    
  int stamina; 

  Player(this.name, this.position, this.id)
      : power = Random().nextInt(101),
        stamina = Random().nextInt(101);
}

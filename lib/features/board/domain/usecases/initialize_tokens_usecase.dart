import '../entities/player.dart';
import '../entities/token.dart';

class InitializeTokensUseCase {
  void call(Player player) {
    
    for (int i = 1; i <= 4; i++) {
      Token token = Token(
        color: player.color,
        id: '${player.color.toString().split('(0xff')[0].split('Color')[1].toLowerCase()}-$i',
      );
      player.tokens.add(token);
    }
  }
}
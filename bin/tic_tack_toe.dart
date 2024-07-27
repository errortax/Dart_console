import "dart:io";
int NumberOfFilledCells = 0;
int N =3;
List<List<String>> board = List.generate(N, (i) => List.generate(N, (j) => " "));
void printBoard(){
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      stdout.write(board[i][j]);
      if(j<N-1){
        stdout.write("|");
      }
    }
    print("");
    if(i<N-1){
      for(int j=0;j<N;j++){
        stdout.write("-");
        if(j<N-1){
          stdout.write("+");
        }
      }
      print("");
    }
  }
}

bool checkWin(String player){
  for(int i=0;i<N;i++){
    if(board[i][0]==player && board[i][1]==player && board[i][2]==player){
      return true;
    }
    if(board[0][i]==player && board[1][i]==player && board[2][i]==player){
      return true;
    }
  }
  if(board[0][0]==player && board[1][1]==player && board[2][2]==player){
    return true;
  }
  if(board[0][2]==player && board[1][1]==player && board[2][0]==player){
    return true;
  }
  return false;
}

void main(){
  printBoard();
  String player = "X";
  while(true){
    print("Player $player's turn");
    print("Enter row and column number (0-2) separated by space");
    List<String> input = stdin.readLineSync()!.split(" ");
    int row = int.parse(input[0]);
    int col = int.parse(input[1]);
    if(row<0 || row>=N || col<0 || col>=N){
      print("Invalid input");
      continue;
    }
    if(board[row][col]!=" "){
      print("Cell already filled");
      continue;
    }
    board[row][col] = player;
    NumberOfFilledCells++;
    printBoard();
    if(checkWin(player)){
      print("Player $player wins");
      break;
    }
    if(NumberOfFilledCells==N*N){
      print("Game Draw");
      break;
    }
    player = player=="X"?"O":"X";
  }
}


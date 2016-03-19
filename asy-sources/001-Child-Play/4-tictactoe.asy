pair A = (-1, 1);
pair B = ( 0, 1);
pair C = ( 1, 1);
pair D = (-1, 0);
pair E = ( 0, 0);
pair F = ( 1, 0);
pair G = (-1,-1);
pair H = ( 0,-1);
pair I = ( 1,-1);

draw(A--C--I--G--cycle);
draw(B--H);
draw(D--I);


/*
  Source: Tic Tac Toe
  Points: A B C D E F G H I
  Item: A B D E
  Item: B C E F
  Item: D E G H
  Item: E F H I
  Item: A C D F
  Item: D F G I
  Item: A B G H
  Item: B C H I
  Item: A C G I
  Item: B D F H
  Item: B D C G
  Item: F H C G
  Item: B F A I
  Item: D H A I
*/

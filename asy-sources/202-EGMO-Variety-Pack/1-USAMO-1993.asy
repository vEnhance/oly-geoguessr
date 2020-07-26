size(10cm);

pair A = (0,4);
pair B = (6,0);
pair C = (0,-3);
pair D = (-2,0);
pair E = (0,0);
pair W = 2foot(E,A,B)-E;
pair X = 2foot(E,B,C)-E;
pair Y = 2foot(E,C,D)-E;
pair Z = 2foot(E,D,A)-E;

dot("$A$", A, dir(90));
dot("$B$", B, dir(0));
dot("$C$", C, dir(270));
dot("$D$", D, dir(180));
dot("$E$", E, dir(45));
dot("$W$", W, dir(45));
dot("$X$", X, dir(315));
dot("$Y$", Y, dir(225));
dot("$Z$", Z, dir(135));

draw(A--B--C--D--A);
draw(A--C);
draw(B--D);
draw(E--W, dotted);
draw(E--X, dotted);
draw(E--Y, dotted);
draw(E--Z, dotted);

/*
Source: USAMO 1993/2
Points: A B C D E W X Y Z
Item: A B E W
Item: B C E X
Item: C D E Y
Item: D A E Z
Item: W X Y Z
Text: $ABCD$ is orthodiagonal.
Text: $W$ is the reflection of $E$ over $AB$, etc.
*/

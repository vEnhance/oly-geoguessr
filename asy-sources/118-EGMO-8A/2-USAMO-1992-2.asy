pair B = dir(180);
pair D = dir(0);
pair C = .5*dir(240);
pair E = foot(C, B, D);
pair A = (E-.65C)/.35;
pair W = 2*foot(E, A, B)-E;
pair X = 2*foot(E, B, C)-E;
pair Y = 2*foot(E, C, D)-E;
pair Z = 2*foot(E, D, A)-E;
pair W_p = foot(E, A, B);
pair X_p = foot(E, B, C);
pair Y_p = foot(E, C, D);
pair Z_p = foot(E, D, A);


draw(A--B--C--D--cycle, lightblue);
draw(A--C, deepgreen);
draw(B--D, deepgreen);
draw(E--W, dotted);
draw(E--X, dotted);
draw(E--Y, dotted);
draw(E--Z, dotted);

dot("$A$", A, dir(90));
dot("$B$", B, dir(180));
dot("$C$", C, dir(-90));
dot("$D$", D, dir(0));
dot("$E$", E, dir(15));
dot("$W$", W, dir(140));
dot("$X$", X, dir(-110));
dot("$Y$", Y, dir(-80));
dot("$Z$", Z, dir(80));
dot("$W'$", W_p, dir(200));
dot("$X'$", X_p, dir(210));
dot("$Y'$", Y_p, dir(-30));
dot("$Z'$", Z_p, dir(20));

/*
    Source: USAMO 1992 P2 (8.12)
    Points: A B C D E W X Y Z W_p X_p Y_p Z_p
    Item: W X Y Z
    Item: A E W_p Z_p
    Item: B E W_p X_p
    Item: C E X_p Y_p
    Item: D E Y_p Z_p
    Item: W_p X_p Y_p Z_p
    Item: A B E W
    Item: B C E X
    Item: C D E Y
    Item: A D E Z
*/

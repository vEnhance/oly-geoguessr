pair O = (0, 0);
circle u_c = circle((point)O, 1);
pair A = .5*dir(30);
pair B = .65*dir(-20);
inversion inv = inversion(1, O);
pair A_s = inv*A;
pair B_s = inv*B;

draw(u_c, blue);
draw(O--A_s);
draw(O--B_s);

dot("$O$", O, dir(180));
dot("$A$", A, dir(140));
dot("$B$", B, dir(-120));
dot("$A^*$", A_s, dir(0));
dot("$B^*$", B_s, dir(0));

/*
    Source: Inversion and Angles (8.2)
    Points: O A B A_s B_s
    Item: A B A_s B_s

    Text: $A^*$, $B^*$ is the inverse of $A$ and $B$ wrt the blue circle
*/

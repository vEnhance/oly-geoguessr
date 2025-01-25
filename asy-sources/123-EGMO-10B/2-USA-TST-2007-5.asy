pair B = dir(100);
pair C = dir(40);
pair B_1 = dir(180);
pair C_1 = dir(0);
pair K = extension(B, B_1, C, C_1);
pair S = extension(B, C, B_1, C_1);
circle c_1 = circle(B, C, K);
pair A = intersectionpoints(c_1, line(K, S))[0];
pair T = (B_1+C_1)/2;
pair E = extension(B, C_1, C, B_1);

filldraw(triangle(A, B, C), opacity(0.1)+lightgreen, deepgreen);
draw(B--T--C, lightblue);
draw(C_1--B, grey);
draw(B_1--C, grey);
draw(C--S, grey);
draw(A--S, grey);
draw(B_1--B);
draw(C_1--C);
draw(B_1--S);

dot("$A$", A, dir(70));
dot("$B$", B, dir(160));
dot("$C$", C, dir(30));
dot("$E$", E, dir(80));
dot("$B_1$", B_1, dir(240));
dot("$C_1$", C_1, dir(-60));
dot("$K$", K, dir(90));
dot("$S$", S, dir(0));
dot("$T$", T, dir(-90));

/*
    Source: Shortlist 2009 G4 (10.22)
    Points: A B C E B_1 C_1 K S T
    Item: A E T
    Item: A B C E K
    Item: B_1 B K
    Item: C_1 C K
    Item: A K B_1 C_1
    Item: A C S C_1
    Item: A B S B_1
    Item: A B T C_1
    Item: A C T B_1
    Item: B C B_1 C_1
    
    Text: $K=BB_1\cap CC_1$, $E=BC_1\cap CB_1$
*/

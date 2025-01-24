pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
pair O = (0, 0);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = extension(A, I, B, C);
pair E = dir(-90);
pair F = intersectionpoints(u_c, circle(D, E))[1];
pair M = (B+C)/2;
pair T = 2*B*C/(B+C);

draw(A--E);
draw(u_c, blue);
draw(A--B--C--cycle);
draw(B--T--C, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(235));
dot("$E$", E, dir(-90));
dot("$F$", F, dir(-110));
dot("$M$", M, dir(-90));
dot("$T$", T, dir(-90));
dot("$O$", O, dir(0));

/*
    Source: Russian Olympiad 2009 (8.32)
    Points: A B C D E F M O T
    Item: A F T
    Item: D E F M
    Item: E M O T
    Item: B C O T
    
    Text: $T=BB\cap CC$
    Text: $M$ is the midpoint of $BC$
*/

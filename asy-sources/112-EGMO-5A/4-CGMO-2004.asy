/* there is no collinear, concyclic points to play */

pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair D = extension(A, O, B, C);
pair E = .35A+.65B;
circle c_1 = circle(A, D, E);
pair F = intersectionpoints(c_1, line(A, C))[0];
pair P = foot(A, B, C);
pair Q = intersectionpoints(c_1, line(A, P))[0];
pair T = intersectionpoints(c_1, line(B, C))[0];
pair X = foot(E, B, C);
pair Y = foot(F, B, C);

draw(E--X);
draw(F--Y);
draw(u_c, blue);
draw(A--D, deepgreen);
draw(A--P, deepgreen);
draw(A--B--C--cycle);
draw(c_1, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(180));
dot("$F$", F, dir(10));
dot("$P$", P, dir(-90));
dot("$Q$", Q, dir(30));
dot("$T$", T, dir(-90));
dot("$X$", X, dir(-90));
dot("$Y$", Y, dir(-90));

/*
    Source: CGMO 2004 (5.15)
    Points: A B C D E F O P Q T X Y
    
    Text: $P$ be the foot and $Q=AP\cap (AEF)$, $T=BC\cap (AEF)$
*/

pair A = dir(50);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair M = (B+C)/2;
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
circle incircle = circle(D, E, F);
pair K = intersectionpoints(incircle, line(A, M))[1];
pair L = intersectionpoints(incircle, line(A, M))[0];
line p_line1 = parallel(K, line(B, C));
line p_line2 = parallel(L, line(B, C));
pair X = intersectionpoints(incircle, p_line1)[0];
pair Y = intersectionpoints(incircle, p_line2)[1];
pair P = extension(A, X, B, C);
pair Q = extension(A, Y, B, C);
pair Z = extension(A, M, E, F);

draw(u_c, blue);
draw(A--B--C--cycle);
draw(incircle, lightblue);
draw(A--P, dashed+deepgreen);
draw(A--Q, dashed+deepgreen);
draw(X--K, .8*red);
draw(L--Y, .8*red);
draw(A--M);
draw(E--F);

dot("$A$", A, dir(50));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(0));
dot("$F$", F, dir(160));
dot("$I$", I, dir(0));
dot("$K$", K, dir(30));
dot("$L$", L, dir(180));
dot("$M$", M, dir(-90));
dot("$P$", P, dir(-90));
dot("$Q$", Q, dir(-90));
dot("$X$", X, dir(130));
dot("$Y$", Y, dir(-15));
dot("$Z$", Z, dir(108));

/*
    Source: Shortlist 2005 G6 (9.58)
    Points: A B C D E F I K L M P Q X Y Z
    Item: D I Z
    Item: X Y Z
    Item: A E F I
    Item: B D F I
    Item: C D E I

    Text: $M$ is the midpoint.
    Text: $AM$ intersects the incircle at $K$, $L$.
    Text: $XK\parallel YL\parallel BC$.
*/

pair A = dir(70);
pair P = dir(35);
pair D = dir(-100);
circle c_1 = circle(A, P, D);
point M = intersectionpoints(c_1, line((A+D)/2, rotate(90, (A+D)/2)*A))[0];
pair B = 2*foot(M, P, D)-D;
pair C = 2*foot(M, P, A)-A;
circle c_2 = circle(B, P, C);
pair E = .7B+.3C;
pair F = D+abs(B-E)*dir(D--A);
pair Q = extension(B, D, E, F);
pair R = extension(A, C, E, F);

filldraw(c_1, opacity(0.1)+lightgreen, deepgreen);
filldraw(c_2, opacity(0.1)+lightgreen, deepgreen);
draw(A--D--B--C--cycle, lightblue);
draw(E--F, grey);

dot("$A$", A, dir(100));
dot("$B$", B, dir(100));
dot("$C$", C, dir(-70));
dot("$D$", D, dir(-110));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$M$", M, dir(0));
dot("$P$", P, dir(200));
dot("$Q$", Q, dir(-30));
dot("$R$", R, dir(-110));

/*
    Source: IMO 2005 P5 (10.23)
    Points: A B C D E F M P Q R
    Item: M P Q R
    Item: D F M Q
    Item: A F M R
    Item: C E M R
    Item: B E M Q

    Text: $M=(APD)\cap (BPC)$
*/

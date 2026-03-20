pair D = origin;
pair A = dir(80);
pair C = 1.3*dir(10);
pair B = C + dir(115);

real k = 0.2;
pair E = B + k*dir(295);
pair F = k*dir(80);

pair P = intersectionpoint(A--C,B--D);
pair Q = intersectionpoint(B--D,E--F);
pair R = intersectionpoint(A--C,E--F);

pair T = intersectionpoints(
    circumcircle(F,Q,D),
    circumcircle(P,Q,R)
)[0];

draw(A--B--C--D--cycle);
draw(A--C, grey);
draw(B--D, grey);
draw(E--F, grey);

dot("$A$", A, dir(120));
dot("$B$", B, dir(70));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-140));
dot("$E$", E, dir(40));
dot("$F$", F, dir(160));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(180));
dot("$R$", R, dir(90));
dot("$T$", T, dir(-90));

/*
    Source: Shortlist 2005 G4 (IMO 2005/5)
    Points: A B C D E F P Q R T

    Item: T A F R
    Item: T F Q D
    Item: T B E Q
    Item: T B P C
    Item: T P Q R
    Item: A P D T
    Item: C E R T

    Text: $BC=DA$ and $BE=DF$.
*/

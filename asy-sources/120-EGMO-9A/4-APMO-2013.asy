pair A = dir(130);
pair B = dir(210);
pair D = dir(-30);
circle u_c = circle(A, B, D);
pair P = 2*B*D/(B+D);
pair C = intersectionpoints(u_c, line(A, P))[0];
line tangent1 = tangent(u_c, C);
pair Q = intersectionpoint(tangent1, line(P, D));
pair R = intersectionpoint(tangent1, line(A, D));
pair E = intersectionpoints(u_c, line(A, Q))[0];
pair T = extension(B, D, C, R);

draw(D--R);
draw(C--R, lightblue);
draw(A--Q, grey);
draw(A--P, grey);
draw(T--B);
draw(u_c, blue);
draw(A--B--D--cycle);
draw(B--P--D, lightblue);
draw(T--A, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(230));
dot("$C$", C, dir(-130));
dot("$D$", D, dir(10));
dot("$E$", E, dir(72)*1.3);
dot("$P$", P, dir(-90));
dot("$Q$", Q, dir(-75));
dot("$R$", R, dir(0));
dot("$T$", T, dir(180));

/*
    Source: APMO 2013 P5 (9.39)
    Points: A B C D E P Q R T
    Item: B E R
    Item: C Q R T

    Text: $PB$, $PD$ are tangents. Tangents at $C$ intersects $PD$, $AD$ at $Q$, $R$.
    Text: $E$ is the second intersection of $AQ$ and $(ABD)$. $TA$ is tangent.
*/

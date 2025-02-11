pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair H = A+B+C;
pair M = (A+B)/2;
pair N = (A+C)/2;
pair P = intersectionpoints(u_c, line(M, H))[0];
pair Q = intersectionpoints(u_c, line(N, H))[0];
pair R = extension(M, N, P, Q);

draw(R--N);
draw(R--P);
draw(R--A, dotted);
draw(M--P);
draw(N--Q);
draw(u_c, blue);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);


dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(0));
dot("$H$", H, dir(-105)*1.3);
dot("$M$", M, dir(130));
dot("$N$", N, dir(0));
dot("$P$", P, dir(-60));
dot("$Q$", Q, dir(240));
dot("$R$", R, dir(180));

/*
    Source: USA TSTST 2014 P4 (7.30)
    Points: A B C H O M N P Q R
    Item: A M N O
    Item: M N P Q

    Text: $H$ is the orthocenter, $O$ is the circumcenter.
    Text: $M$, $N$ are midpoints.
    Text: $P=\overrightarrow{MH}\cap (ABC)$, $Q=\overrightarrow{NH}\cap (ABC)$, $R=MN\cap PQ$.
*/

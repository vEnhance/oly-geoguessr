pair A = dir(90);
pair B = dir(210);
pair C = dir(-30);
pair M = (B+C)/2;
pair N = (A+B)/2;
pair X = N+abs(B-N)*dir(-20);
pair Y = 2*N-X;
pair T = intersectionpoint(M--Y, arc(X, abs(X-B), 120, 220));

draw(B--A--C, deepcyan);
draw(B--X--T, lightblue);
draw(A--X--M);
draw(A--Y--B);
draw(B--C);
draw(Y--M, grey);
draw(circumcircle(A, B, M), pink);

dot("$A$", A, dir(90));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$M$", M, dir(-100)*1.2);
dot("$N$", N, dir(140));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(180));
dot("$T$", T, dir(220));

/*
    Source: ISL 2007 G2
    Points: A B C M X N Y T
    Item: X N Y

    Text: $AB=AC$, $MB=MC$, $NA=NB$, $TX=BX$, $X\in (ABM)$, $\angle TMX=90^\circ$.
    Text: $Y=TM\cap (ABM)$.
*/

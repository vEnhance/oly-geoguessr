pair O_1 = (-1, 0);
pair O_2 = (1, 0);
pair K = 1.2*dir(78);
circle c_1 = circle((point)O_1, abs(O_1-K));
circle c_2 = circle((point)O_2, abs(O_2-K));
pair L = 2*foot(K, O_1, O_2)-K;
pair P = .7K+.3L;
pair B = O_1+abs(O_1-K)*dir(5);
pair D = O_2+abs(O_2-K)*dir(180);
pair A = intersectionpoints(line(P, B), c_1)[1];
pair C = intersectionpoints(line(P, D), c_2)[1];

filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
draw(A--B, dotted);
draw(C--D, dotted);
draw(K--L, grey);

dot("$A$", A, dir(130));
dot("$B$", B, dir(-10));
dot("$C$", C, dir(40));
dot("$D$", D, dir(180));
dot("$K$", K, dir(80)*1.2);
dot("$L$", L, dir(-90)*1.2);
dot("$P$", P, dir(0));

/*
    Source: Radical Center of Intersecting Circles (2.9)
    Points: A B C D K L P
    Item: A B C D
    
    Text: $P$ lies on $KL$. $AB$ and $CD$ are two chords passing through $P$.
*/

pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair M = (B+C)/2;
pair P = foot(H, A, M);
circle c_1 = circle(A, B, P);
circle c_2 = circle(A, C, P);

filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
draw(A--B--C--cycle, grey);

dot("$A$", A, dir(110)*1.7);
dot("$B$", B, dir(240));
dot("$C$", C, dir(-60));
dot("$M$", M, dir(-90));
dot("$P$", P, dir(10));

/*
    Source: 2.11
    Points: A B C M P
    Item: A M P
    
    Text: $(APB)$ and $(APC)$ are tangent to $BC$.
    Text: $M$ is the midpoint of $BC$.
*/

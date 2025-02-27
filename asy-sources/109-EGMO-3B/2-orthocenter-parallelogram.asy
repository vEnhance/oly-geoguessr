pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair D = dir(-75);
pair X = A+B+C;
pair Y = B+C+D;

filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);
draw(circle(A, B, C), purple);
draw(B--Y--C, grey);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$X$", X, dir(0));
dot("$Y$", Y, dir(-90));

/*
    Source: 3.17
    Points: A B C D X Y
    Item: B C X Y

    Text: $ABCD$ is cyclic.
    Text: $X$, $Y$ are the orthocenters of $\triangle ABC$, $\triangle BCD$.
*/

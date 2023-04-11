pair A = 2*dir(80);
pair B = origin;
pair C = 1.4*dir(0);

pair M = (B+C)/2;
path w = incircle(A,B,C);
pair K = intersections(A--M,w)[0];
pair L = intersections(A--M,w)[1];
pair X = intersections(w,K,K+dir(0))[0];
pair Y = intersections(w,L,L+dir(0))[0];

pair P = intersections(B--C,A,X)[0];
pair Q = intersections(B--C,A,Y)[0];

dot("$A$",A,dir(90));
dot("$B$",B,dir(200));
dot("$C$",C,dir(-20));
dot("$M$",M,dir(-90));
dot("$K$",K,dir(180));
dot("$L$",L,dir(50));
dot("$X$",X,dir(0));
dot("$Y$",Y,dir(130));
dot("$P$",P,dir(-90));
dot("$Q$",Q,dir(-90));

/*
Source: ISL 2005 G6
Points: A B C M K L X Y P Q
Item: B C M P Q
Item: A K L M
Item: A X P
Item: A Y Q
Item: K X L Y

Text: $M$ is a midpoint.
*/
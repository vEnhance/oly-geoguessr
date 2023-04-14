pair A = 2*dir(80);
pair B = origin;
pair C = 3*dir(0);

pair M = (B+C)/2;
path w = incircle(A,B,C);
pair K = intersectionpoints(A--M,w)[0];
pair L = intersectionpoints(A--M,w)[1];
pair X = point(w,intersections(w,K,K+dir(0))[0]);
pair Y = point(w,intersections(w,L,L+dir(0))[0]);

pair P = point(B--C,intersections(B--C,A,X)[0]);
pair Q = point(B--C,intersections(B--C,A,Y)[0]);

dot(A^^B^^C^^M^^K^^L^^X^^Y^^P^^Q);

draw(A--B--C--cycle);

label("$A$",A,dir(90));
label("$B$",B,dir(200));
label("$C$",C,dir(-20));
label("$M$",M,dir(-90));
label("$K$",K,dir(180));
label("$L$",L,dir(50));
label("$X$",X,dir(-110));
label("$Y$",Y,dir(90));
label("$P$",P,dir(-90));
label("$Q$",Q,dir(-90));

/*
Source: ISL 2005 G6
Points: A B C M K L X Y P Q
Item: A K L M
Item: A X P
Item: A Y Q
Item: K X L Y

Text: $M$ is a midpoint.
*/
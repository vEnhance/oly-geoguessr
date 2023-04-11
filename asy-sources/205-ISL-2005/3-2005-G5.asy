pair A = 3*dir(70);
pair B = origin;
pair C = (2,0);
pair M = (B+C)/2;

pair H = orthocenter(A,B,C);
pair I = incenter(A,B,C);
pair K = foot(H,A,I);
pair D = intersections(A--B,H,K)[0];
pair E = intersections(A--C,H,K)[0];
pair Q = intersections(H--M,A,I)[0];

/*
Source: ISL 2005 G5
Points: A B C H D E Q M
Item: A D B
Item: A E C
Item: B C M
Item: H Q M
Item: D E H
Item: A D E Q

Text: $AD=AE$. 
Text: $H$ is an orthocenter.
*/
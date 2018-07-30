pair A=dir(120);
pair B=dir(210);
pair C=dir(330);
pair H=A+B+C;
pair E=extension(B,H,A,C);
pair F=extension(C,H,A,B);
pair N=(B+C)/2;
pair X=-A;
pair G=extension(X,N,A,extension(E,F,B,C));

dot("$A$",A,A);
dot("$B$",B,B);
dot("$C$",C,C);
dot("$N$",N,S);
dot("$E$",E,E);
dot("$F$",F,F);
dot("$H$",H,S);
dot("$G$",G,G);
dot("$X$",X,S);

draw(A--B--C--cycle);
draw(circumcircle(A,B,C)^^circumcircle(A,E,F),dotted);
draw(B--E^^C--F);

/*
  Source: Orthocenter and intersection of two circles
  Points: A B C H E F N X G
  Item: B F E C
  Item: G H N X
  Text: Here $H$ is the orthocenter of $ABC$, and $N$ is the midpoint of $BC$.
  Text: The circumcircle of $ABC$ meets the circumcircle of $AEF$ at $G \ne A$.
  Text: Finally, $X$ is the antipode of $A$ in the circumcircle.
*/

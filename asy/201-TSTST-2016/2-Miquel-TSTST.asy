pair A=dir(120);
pair B=dir(210);
pair C=dir(330);
pair H=A+B+C;
pair E=extension(B,H,A,C);
pair F=extension(C,H,A,B);
pair N=(B+C)/2;
pair R=extension(E,F,B,C);
pair G=extension(-A,N,A,R);
pair Q=extension(R,H,A,N);

dot("$A$",A,A);
dot("$B$",B,B);
dot("$C$",C,C);
dot("$E$",E,E);
dot("$F$",F,NW);
dot("$H$",H,S);
dot("$G$",G,G);
dot("$Q$",Q,SE);
dot("$R$",R,S);

draw(A--B--C--cycle);
draw(circumcircle(A,B,C)^^circumcircle(A,E,F),dotted);
draw(arc(N,abs(B-N),-10,190),dotted);
draw(A--N^^B--R--E);
draw(B--E, dashed);
draw(C--F, dashed);

/*
  Source: Miquel point and HM-point
  Points: A B C H E F Q G R
  Item: B H Q C
  Item: R H Q
  Item: R G A
  Item: R B F G
  Item: R C E G
  Item: R F Q C
  Item: R B Q E
  Text: Point $Q$ is the second intersection of the $A$- median and the circumcircle of $AEF$,
  Text: and is also known as the $A$-HM point.
*/

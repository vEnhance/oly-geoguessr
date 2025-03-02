# How to contribute

The code base for this project is entirely written.
However, I have never gotten around to actually fleshing out levels for the game.

Fortunately, this is actually easy to do,
and I welcome contributions from anyone who wants to add them.
All you have to do is submit four Asymptote files (in `*.asy` format),
formatted appropriately, and I'll add them into the live game.
[Here is an example of a user-contributed submission](https://github.com/vEnhance/oly-geoguessr/tree/master/asy-sources/201-TSTST-2016/).

The syntax for one of the asymptote files looks like this:

```cpp
pair A = dir(120);
pair B = dir(210);
pair C = dir(330);
pair H = A+B+C;
pair E = extension(B,H,A,C);
pair F = extension(C,H,A,B);
pair N = (B+C)/2;
pair R = extension(E,F,B,C);
pair G = extension(-A,N,A,R);
pair Q = extension(R,H,A,N);

dot("$A$", A, dir(A));
dot("$B$", B, dir(B));
dot("$C$", C, dir(C));
dot("$E$", E, dir(E));
dot("$F$", F, dir(135));
dot("$H$", H, dir(270));
dot("$G$", G, dir(G));
dot("$Q$", Q, dir(315));
dot("$R$", R, dir(S));

draw(A--B--C--cycle);
draw(circumcircle(A,B,C), dotted);
draw(circumcircle(A,E,F), dotted);
draw(arc(N,abs(B-N),-10,190), dotted);
draw(A--N);
draw(B--R--E);
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
  Text: Point $Q$ is the second intersection of the $A$-median and the circumcircle of $AEF$,
  Text: and is also known as the $A$-HM point.
*/
```

An explanation of the file structure:

- Everything before the big comment is just for drawing the picture itself.
- The `Source` header is a human-readable description of the picture.
- The `Points` header is a space-separated list of all the point names.
  They should match the names of variables used in `pair` declaration.
- Each `Item` line is a space-separated list of either three collinear points
  or four concyclic points that are not already marked in the diagram
  (i.e. the items worth points in the game).
- Finally, each `Text` line is a description that shows up in the game.
  Line breaks occur after each declaration.

And that's it! Four files like this form a level.

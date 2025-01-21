pair A = dir(140);
pair B = dir(200);
pair C = dir(-20);
pair D = dir(80);

draw(A--B, lightblue);
draw(C--D, lightblue);
draw(A--C, .8*red);
draw(B--D, .8*red);
draw(A--D, deepgreen);
draw(B--C, deepgreen);

dot("$A$", A, dir(130));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(70));

/*
    Source: Ptolemy's Theorem (5.9)
    Points: A B C D
    Item: A B C D

    Text: Given $AB\cdot CD+AD\cdot BC=AC\cdot BD$
*/

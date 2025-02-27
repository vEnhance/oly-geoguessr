pair O_1 = (-3, 4);
pair O_2 = (1, 4);
pair O_3 = (-1.4, 1.6);
real r_1 = 1;
real r_2 = 1.8;
real r_3 = .6;
circle c_1 = circle((point)O_1, r_1);
circle c_2 = circle((point)O_2, r_2);
circle c_3 = circle((point)O_3, r_3);
real t_1 = abs(O_1-O_2);
real t_2 = abs(O_2-O_3);
real t_3 = abs(O_3-O_1);
pair O_12 = O_1+(r_1*t_1/abs(r_1-r_2))*dir(O_2--O_1);
pair O_23 = O_3+(r_3*t_2/abs(r_2-r_3))*dir(O_2--O_3);
pair O_13 = O_3+(r_3*t_3/abs(r_1-r_3))*dir(O_1--O_3);
line tangent1 = tangents(c_1, O_12)[0];
line tangent2 = tangents(c_1, O_12)[1];
line tangent3 = tangents(c_2, O_23)[0];
line tangent4 = tangents(c_2, O_23)[1];
line tangent5 = tangents(c_3, O_13)[0];
line tangent6 = tangents(c_3, O_13)[1];
pair T_1 = intersectionpoints(c_2, tangent1)[0];
pair T_2 = intersectionpoints(c_2, tangent2)[0];
pair T_3 = intersectionpoints(c_2, tangent3)[0];
pair T_4 = intersectionpoints(c_2, tangent4)[0];
pair T_5 = intersectionpoints(c_1, tangent5)[0];
pair T_6 = intersectionpoints(c_1, tangent6)[0];

filldraw(c_1, opacity(0.2)+paleblue, black+1.1);
filldraw(c_2, opacity(0.2)+paleblue, black+1.1);
filldraw(c_3, opacity(0.2)+paleblue, black+1.1);
draw(T_1--O_12--T_2, grey);
draw(T_3--O_23--T_4, grey);
draw(T_5--O_13--T_6, grey);

dot("$O_1$", O_1, dir(90));
dot("$O_2$", O_2, dir(90));
dot("$O_3$", O_3, dir(90));
dot("$X$", O_12, dir(180));
dot("$Y$", O_23, dir(220));
dot("$Z$", O_13, dir(-90));

/*
    Source: Shortlist 2006/G3 (3.19)
    Points: X Y Z O_1 O_2 O_3
    Item: X O_1 O_2
    Item: Y O_2 O_3
    Item: Z O_1 O_3
    Item: X Y Z

    Text: Three circles with centers $O_1$, $O_2$, $O_3$.
    Text: Their pairwise common external tangents intersect at $X$, $Y$, $Z$ respectively.
*/

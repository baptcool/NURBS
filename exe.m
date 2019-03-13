
hold on;
hold all;
x = [0 0;0 1;1 0;2 1;2 0];
t = [0 0 0 1 2 3 3 3];

w = [1 1 0 1 1 ];
NURBS(x,t,2, w); %pour 0, le point n'est pas prit en compte


w = [1 1 0.5 1 1 ];
hold all;
NURBS(x,t,2, w); %poid faible, la courbe s'éloigne du point.


w = [1 1 1 1 1 ];% courbe bspline classique
hold all;
NURBS(x,t,2, w);

figure
w = [1 1 5 1 1 ]; 
hold all;
NURBS(x,t,2, w);%poid élevé, la courbe se rapproche du point très fortement

% remarque: le changement d'un poid change l'allure globale de la courbe.



figure;
x = [0 0;-1 0;-1 1/2;-1 1;0 1; 1 1 ; 1 1/2; 1 0; 0 0 ];
w = [1 sqrt(2)/2 1 sqrt(2)/2 1 sqrt(2)/2 1 sqrt(2)/2 1];
t = [0 0 0 1/4 1/4 1/2 1/2 3/4 3/4 1 1 1];
NURBS(x,t,2, w); % un cercle !!




figure;
x = [1 0;0 0; 1/2 sqrt(3)/2; 1 sqrt(3); 3/2 sqrt(3)/2; 2 0 ;1 0];
w = [1 1/2 1 1/2 1 1/2 1];
t = [0 0 0 1/3 1/3 2/3 2/3 1 1 1];
NURBS(x,t,2, w); % un autre cercle mais dans un triangle






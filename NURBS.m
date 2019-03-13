
function [] = NURBS(point,t,m, w)
  
    imax = length(t)-m-1;
    
    x = (t(m+1):0.01:t(length(point)+1));
     y1 = [];
     x1 = [];
    for i=1:length(x) 
      total = 0;
      totalw=0;
      for j=(1:length(point))
        totalw += w(j)*Nf(t,x(i),m,j );
        total  += [point(j,1), point(j,2)] * Nf(t,x(i),m,j )*w(j)  ;%fonction B-plines
      endfor

        x1(i) = total(1)/totalw;
        y1(i) = total(2)/totalw;
    endfor
    hold on
    plot(point(:,1), point(:,2),x1,y1,'r');
  
  
  
endfunction



function [v] = Nf(t,x,m,i)
  if(m==0) 
    if(t(i) <= x && t(i+1) > x) %conditions initiales
      v= 1;
    else
      v= 0;
    endif 
  else
    if((t(i+m) == t(i))) % condition pour éviter de diviser par zero
      v1 = 0;
    else
      v1= ((x-t(i))/(t(i+m)-t(i)))*Nf(t,x,m-1,i) ;
    endif
    %*****************************
    if((t(i+m+1)==t(i+1)))% condition pour éviter de diviser par zero
      v2 = 0;
    else
      v2= ((t(i+m+1)-x)/(t(i+m+1)-t(i+1)))*Nf(t,x,m-1,i+1);
    endif
    v = v1+v2 ;%et voila! 
  endif
  endfunction
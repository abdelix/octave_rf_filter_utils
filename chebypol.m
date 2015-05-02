% [p] = chebypol (order)
%
% Computes the Chebychev polynomials

function [p] = chebypol (order)

  if(order==0)
    p=1;
  elseif (order==1)
    p=[1 0];
  else 
    
    P_ant_ant=1;
    P_ant=[1 0];
    
    for(n=2:order)
        p= 2*[P_ant 0]-[0 0 P_ant_ant]  ;
        P_ant_ant=P_ant;
        P_ant=p;
    end
    
  end

end

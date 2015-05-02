function [ G L ] = poly_cont_frac( N,D )
   % [ G L ] = poly_cont_frac( N,D ) 
   % 
   % Computes the continued fractien expansion of the rational function
   % Q(s)=N(s)/D(s) , where  N(s) and D(s) are polynomials defined by the
   % vectors N and D.
   % 
   % G and L satisfy
   %                              1
   % Q(s)=N(s)/D(s)= G(1) + -----------------
   %                                      G(2) +   1
   %                                               -----------
   %                                               ...  1
   %                                                  -------
   %                                                G(k)+L
   %
   % NOTE:  N must have a grater order than D
   %
   %
   % LICENSE :
   %Copyright (c) 2015, Abdelfetah Hadij
   %All rights reserved.
   
   %Redistribution and use in source and binary forms, with or without
   %modification, are permitted provided that the following conditions are met:
   
   %* Redistributions of source code must retain the above copyright notice, this
   %list of conditions and the following disclaimer.
   
   %* Redistributions in binary form must reproduce the above copyright notice,
   %this list of conditions and the following disclaimer in the documentation
   %and/or other materials provided with the distribution.
   
   %THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   %AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   %IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
   %DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
   %FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
   %DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
   %SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
   %CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
   %OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
   %OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
   
   polytrim=@(X) X(find(abs(X)>1e-8*max(abs(X)),1):end);
   D= polytrim(D);% remove right trailing zeros
   N=  polytrim(N);% remove right trailing zeros
   k=length(N)-1;
   if(length(N)<=length(D))
      error('Polynomial represented by N must have a grater order than the one  represented by D') 
   end
   
   G=[];
   [Q R]=deconv(N,D);
   G=[G Q(1)];
   
   N=D;
   % remove the right trailing zeros
   D=  polytrim(R);
   
  for (n=1:k-1)
   [Q R]=deconv(N,D);
   G=[G Q(1)];
   
   N=D;
   % remove the right trailing zeros
   D=  polytrim(R);
   
   end
   L=Q(2);
   
end


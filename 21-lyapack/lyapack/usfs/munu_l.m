function Y = munu_l(tr,X)
%
%  Solves linear systems with the real matrix A or its transposed A':
%
%  for tr = 'N':
%
%    Y = inv(A)*X,
%
%  for tr = 'T':
%
%    Y = inv(A')*X.
%
%  A is given implicitely as A = inv(LU)*N*inv(MU). ML, MU and the LU 
%  factors of N are provided as global data. These data must be generated 
%  by calling 'munu_l_i' before calling this routine!
%  
%  Calling sequence:
%
%    Y = munu_l(tr,X)
%
%  Input:
%
%    tr        (= 'N' or 'T') determines whether systems with A or A' 
%              should be solved;
%    X         matrix of proper size.
%
%  Output:
%
%    Y         the solution matrix. 
%
% 
%   LYAPACK 1.0 (Thilo Penzl, September 1999)

if nargin~=2
  error('Wrong number of input arguments.');
end

global LP_NL LP_NU LP_ML LP_MU

if ~length(LP_NL) | ~length(LP_NU) | ~length(LP_ML) | ~length(LP_MU) 
  error('This routine needs global data which must be generated by calling ''munu_l_i'' first.');
end 


if tr=='N'
  Y = LP_MU*(LP_NU\(LP_NL\(LP_ML*X)));      
elseif tr=='T'
  Y = LP_ML'*(LP_NL'\(LP_NU'\(LP_MU'*X)));      
else
  error('tp must be either ''N'' or ''T''.');
end



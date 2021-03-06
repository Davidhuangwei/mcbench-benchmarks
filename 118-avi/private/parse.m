function out = parse (array)
% ARRAY return the combined value of a 4x1 vector

out = double(array(1)) + ...
   	double(array(2))*256 + ...
      double(array(3))*256*256 + ...
      double(array(4))*256*256*256;
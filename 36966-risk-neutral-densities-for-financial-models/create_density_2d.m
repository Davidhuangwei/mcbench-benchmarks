% This is material illustrating the methods from the book
% Financial Modelling  - Theory, Implementation and Practice with Matlab
% source
% Wiley Finance Series
% ISBN 978-0-470-74489-5
%
% Date: 02.05.2012
%
% Authors:  Joerg Kienitz
%           Daniel Wetterau
%
% Please send comments, suggestions, bugs, code etc. to
% kienitzwetterau_FinModelling@gmx.de
%
% (C) Joerg Kienitz, Daniel Wetterau
% 
% Since this piece of code is distributed via the mathworks file-exchange
% it is covered by the BSD license 
%
% This code is being provided solely for information and general 
% illustrative purposes. The authors will not be responsible for the 
% consequences of reliance upon using the code or for numbers produced 
% from using the code. 



function create_density_2d(x,y,zdata1, zdata2, zdata3, legend1, legend2, legend3,tit)
%create_density_2d(ZDATA1,ZDATA2,ZDATA3)
%  ZDATA1:  surface zdata
%  ZDATA2:  surface zdata
%  ZDATA3:  surface zdata

%  Auto-generated by MATLAB on 19-Nov-2010 16:54:00

% Create figure
figure1 = figure('PaperSize',[20.98 29.68],'Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
view([50 10]);
grid('on');
hold('all');

%hidden off;

% Create surf
surf(x,y,zdata1,'Parent',axes1,'DisplayName',legend1,'FaceColor',[0 1 0]);

% Create surf
surf(x,y,zdata2,'Parent',axes1,'DisplayName',legend2,'FaceColor',[1 0 0]);

% Create surf
surf(x,y,zdata3,'Parent',axes1,'DisplayName',legend3,'FaceColor',[0 0 1]);

% Create xlabel
xlabel('Strike','HorizontalAlignment','right');

% Create ylabel
ylabel('Maturity','HorizontalAlignment','left');

% Create zlabel
zlabel('Implied Volatility');

% Create title
title(tit);



legend(axes1,'show');

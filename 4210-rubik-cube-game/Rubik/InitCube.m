function Cube = InitCube
% initialize the cube
Cube = [];
SmCube = ...
  [[0 0 0]; [1 0 0]; [0 1 0]; [1 1 0]; ...
   [0 0 1]; [1 0 1]; [0 1 1]; [1 1 1]];
Cube.Nodes = [];
for x=1:3,
  for y=1:3,
    for z=1:3,
      Cube.Nodes(:,1,(z-1)*9+(y-1)*3+x) = SmCube(:,1)*2+2*x-5;
      Cube.Nodes(:,2,(z-1)*9+(y-1)*3+x) = SmCube(:,2)*2+2*y-5;
      Cube.Nodes(:,3,(z-1)*9+(y-1)*3+x) = SmCube(:,3)*2+2*z-5;
    end
  end
end
Cube.Order = [[1 5 7 3];[2 4 8 6];[1 2 6 5];...
              [3 7 8 4];[1 3 4 2];[5 6 8 7]];
NumColor = [[1:3:25];[3:3:27];[1 2 3 10 11 12 19 20 21];...
  [7 8 9 16 17 18 25 26 27];[1:9];[19:27]];
ValColor = [[1 0 0];[1 0 1];[0 0 1];[0 1 0];[1 1 0];[1 1 1]];
Cube.Color = zeros(6,3,27); % black
for x=1:6,
  for y=1:9,
    Cube.Color(x,:,NumColor(x,y)) = ValColor(x,:);
  end
end
Cube.RotCubeCube = ... % for rotate cube
  [[ 7  8  9 16 17 18 25 26 27  4  5  6 13 14 15 22 23 24  1  2  3 10 11 12 19 20 21];...
   [19 20 21 10 11 12  1  2  3 22 23 24 13 14 15  4  5  6 25 26 27 16 17 18  7  8  9];...
   [19 10  1 22 13  4 25 16  7 20 11  2 23 14  5 26 17  8 21 12  3 24 15  6 27 18  9];...
   [ 3 12 21  6 15 24  9 18 27  2 11 20  5 14 23  8 17 26  1 10 19  4 13 22  7 16 25];...
   [ 3  6  9  2  5  8  1  4  7 12 15 18 11 14 17 10 13 16 21 24 27 20 23 26 19 22 25];...
   [ 7  4  1  8  5  2  9  6  3 16 13 10 17 14 11 18 15 12 25 22 19 26 23 20 27 24 21]];
Cube.RotCubeFlat = ... % for rotate cube
  [[1 2 5 6 4 3];...
   [1 2 6 5 3 4];...
   [6 5 3 4 1 2];...
   [5 6 3 4 2 1];...
   [3 4 2 1 5 6];...
   [4 3 1 2 5 6]];
Cube.RotLayerCube = ... % for rotate layer
  [[1:3:25];[3:3:27];[1 2 3 10 11 12 19 20 21];[7 8 9 16 17 18 25 26 27];[1:9];[19:27]];
Cube.NumColor = NumColor;
% Mouse polygons for any rotations
Cube.PgRotCubeX = ... % for rotate the cube around OX, OY, OZ
  [[168;114;171;225;168],[292;292;346;346;292],...
   [232;292;346;287;232],[292;347;347;292;292],...
   [232;171;119;180;232],[119;180;180;119;119],...
   [340;278;225;287;340],[119;180;180;119;119],...
   [240;240;180;180;240],[400;400;346;346;400],...
   [60;60;119;119;60],[292;292;240;240;292]];
Cube.PgRotCubeY(:,:,1) = ... 
  [[373;345;323;350;373],[273;214;239;299;273],...
   [296;273;299;324;296],[89;117;176;148;89],...
   [296;323;294;272;296],[107;85;146;170;107],...
   [352;375;350;324;352],[234;209;272;294;234],...
   [123;187;209;146;123],[203;265;239;176;203],...
   [256;191;170;234;256],[148;214;187;123;148]];
Cube.PgRotLayX = ... % for rotate the layer
  [[240;292;232;240],[240;292;292;240],...
   [60;171;114;60],[240;292;292;240],...
   [220;168;225;220],[400;346;346;400],...
   [400;287;346;400],[400;347;347;400],...
   [400;340;287;400],[240;180;180;240],...
   [240;232;180;240],[240;180;180;240],...
   [60;119;171;60],[60;119;119;60],...
   [220;225;278;220],[60;119;119;60],...
   [60;60;119;60],[240;240;292;240],...
   [240;180;240;240],[400;346;400;400],...
   [240;240;180;240],[400;400;347;400],...
   [60;119;60;60],[240;292;240;240]];
Cube.PgRotLayY = ... 
  [[246;273;296;246],[60;89;148;60],...
   [319;323;345;319],[246;214;273;246],...
   [398;373;350;398],[329;299;239;329],...
   [329;324;299;329],[142;176;117;142],...
   [329;352;324;329],[246;272;209;246],...
   [246;296;272;246],[60;146;85;60],...
   [319;294;323;319],[133;107;170;133],...
   [398;350;375;398],[319;234;294;319],...
   [319;256;234;319],[246;187;214;246],...
   [246;209;187;246],[329;239;265;329],...
   [60;123;146;60],[142;203;176;142],...
   [133;170;191;133],[60;148;123;60]];
Cube.hand = ...
  [[NaN,NaN,NaN,NaN,NaN,NaN,NaN,  1,  1,NaN,NaN,NaN,NaN,NaN,NaN,NaN];...
   [NaN,NaN,NaN,NaN,  1,  1,  1,  2,  2,  1,  1,  1,NaN,NaN,NaN,NaN];...
   [NaN,NaN,NaN,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,NaN,NaN,NaN];...
   [NaN,NaN,NaN,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,NaN,NaN,NaN];...
   [NaN,NaN,NaN,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  1,  1,NaN];...
   [NaN,  1,  1,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,  2,  2,  1];...
   [  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1];...
   [NaN,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1];...
   [NaN,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,NaN];...
   [NaN,NaN,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,NaN];...
   [NaN,NaN,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  1,NaN]];
return
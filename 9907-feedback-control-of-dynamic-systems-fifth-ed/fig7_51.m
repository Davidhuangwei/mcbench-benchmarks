%  Figure 7.51      Feedback Control of Dynamic Systems, 5e
%                        Franklin, Powell, Emami
%
% script for fig. 7.51
%  
clf;
dp=[1 1 0];
np=[1];
nc=conv([1 1.001],[8.32 0.8]);
dc=conv([1 4.08],[1 0.0196]);
num=conv(np,nc);
den=conv(dp,dc);
sys=tf(num,den);
rlocus(sys);
% This script runs a statistical analysis on the reproducibility of traces
% by using spatial matching to compare two traces and determine a 'k' value to represent the traces'                                                                         overall agreement 
% 
% (c) Lena Patel, 4/12/2018
%
clear all

% Query the user for relevant IRR calculation numbers
prompt = {'nn','np','pn','pp','N'};
titl = 'MouseClick Directory Finder';
lines = 1;
answer = inputdlg(prompt, titl, lines);
nn = str2double(answer{1});     %pixels in niether tracing
np = str2double(answer{2});     %pixels contained in one trace
pn = str2double(answer{3});     %pixels contained in second trace
pp = str2double(answer{4});     %pixels in both traces
N = str2double(answer{5});      %total number of pixels for hte particular fiber

Enn = (nn+np)*(nn+pn)/N;   %calculates the expected 'nn'
Epp = ((pn+pp)*(np+pp))/N;  %calculates the expected 'pp'

OA = ((nn + pp)/N) *100;      %observed agreement
EA = ((Enn+Epp)/N) *100;      %expected agreement

K = (OA - EA)/(100 - EA);              

fprintf('The IRR value (k) is: %d\n',K); 

%Criteria for k value by Landis and Koch (1977) 
%the ? value of 0.11?0.2 is considered as ?light?,
%0.21?0.4 as?fair?, 
%0.41?0.60 as?moderate?,
%0.61?0.80 as?substantial?, 
%0.81?1.0 as?almost perfect

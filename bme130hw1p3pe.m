% Part E
% bone
clc;                            %clears command window
clear;                          %clears workspace
load MRI.mat;                   %brings file into workspace
ax(1) = subplot(2,2,1);         %creates 2x2 plot, designates position 1
pcolor(I);                      %creates pseudocolor plot using matrix I
shading interp;                 %uses interpolation to smooth image out
colormap(ax(1),"bone");         %sets colormap to bone for this subplot
title('bone');                  %title bone

% jet
ax(2) = subplot(2,2,2);         %designates position 2
pcolor(I);                      %creates pseudocolor plot using matrix I
shading interp;                 %uses interpolation to smooth image out
colormap(ax(2),"jet");          %sets colormap to jet for this subplot
title('jet');                   %title jet

% hot
ax(3) = subplot(2,2,3);         %designates position 3
pcolor(I);                      %creates pseudocolor plot using matrix I
shading interp;                 %uses interpolation to smooth image out
colormap(ax(3),"hot");          %sets colormap to hot for this subplot
title('hot');                   %title hot

% hsv
ax(4) = subplot(2,2,4);         %designates position 4
pcolor(I);                      %creates pseudocolor plot using matrix I
shading interp;                 %uses interpolation to smooth image out
colormap(ax(4),"hsv");          %sets colormap to hsv for this subplot
title('hsv');                   %title hsv
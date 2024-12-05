% Homework 1 Problem 3, Part A 
clc;                            %clears command window
clear;                          %clears workspace
load MRI.mat;                   %brings file into workspace
subplot(2,2,1);                 %creates 2x2 plot, designates position 1
pcolor(I);                      %creates pseudocolor plot using matrix I
shading interp;                 %uses interpolation to smooth image out
colormap("bone");               %sets image color to grayscale
title('Part A');                %title part a

% Part B
subplot(2,2,2);                 %designates position 2
J = imcomplement(I);            %gets the complement of I
pcolor(J);                      %creates pseudocolor plot using J
shading interp;                 %uses interpolation to smooth image out
colormap("bone");               %sets image color to grayscale
title('Part B');                %title part b

% Part C
subplot(2,2,3);                 %designates position 3
K = sqrt(I);                    %square root each pixel value
pcolor(K);                      %creates pseudocolor plot using K
shading interp;                 %uses interpolation to smooth image out
colormap("bone");               %sets image color to grayscale
title('Part C');                %title part c

% Part D
subplot(2,2,4);                 %designates position 4
[r,c] = size(I);                %gets image dimensions
threshone = 0.3;                %set first threshold
threshtwo = 0.5;                %set second threshold
for a = 1:r                     %for loop of 1 through rows
    for b = 1:c                 %for loop of 1 through columns
        if I(a,b) < threshone       %if pixel is less than threshold one
            L(a,b) = 0;             %pixel becomes black
        elseif I(a,b) > threshtwo   %if pixel more than threshold two
            L(a,b) = 1;             %pixel becomes white
        else                        %anything in between
            L(a,b) = 0.5;           %pixel becomes gray
        end
    end
end
pcolor(L);                      %creates pseudocolor plot using L
shading interp;                 %uses interpolation to smooth image out
colormap("bone");               %sets image color to grayscale
title('Part D');                %title part d
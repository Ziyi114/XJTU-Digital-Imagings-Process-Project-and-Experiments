%==========================================================================
%                Sharpen using Laplace filetering
%                Name: myimlapsharp.m
%                School of Opto-Electronic Information, University of
%                Electronic Science and Technology of China
%                Date: 2017.04.20
%                Author£ºZhenming Peng
% =========================================================================
clc,clf,clear all,close all;
inima = imread('test4 copy.bmp'); % cell.tif,Fig0338(a)(blurry_moon).tif
subplot(131),imshow(inima),title('The original image')
% =========================================================================
if ndims(inima) == 3,   % RGB image is given
    f = rgb2gray(inima);
else
    f = inima;          % Graylevel image is given
end

if (~isa(f,'double'))
    f = double(f);
end

% =========================================================================
% Normalizing image f in preprocesing
% =========================================================================
f = (f-min(f(:)))/(max(f(:))-min(f(:))+eps);
% =========================================================================

h =[ 1 1 1;1 -8 1;1 1 1]; 
%h =[ 0 1 0;1 -4 1;0 1 0];
%h = fspecial('laplacian',0.0); % alpha ~[0-1]
laf = imfilter(f,h,'replicate');
subplot(132),imshow(laf,[]),title('Spatial Laplacian filtering')
sharpf = f-laf/max(laf(:));     % Sharpen
sharpf = imadjust(sharpf,[min(f(:)) max(f(:))]); % Scale the image
subplot(133),imshow(sharpf)
title('Sharpen in spatial domain')

% =========================================================================
% Boundary padding + Zeros padding
% =========================================================================
[M,N] = size(f);                     % Original size
padsiz = [3 3];                      % Set padding size (single bound)
bP = padsiz(1);bQ = padsiz(2);       % The bounds pixcels (single)
fb = padarray(f,padsiz,'replicate'); % Pad the double bounds of f
P = 2*(M+2*bP); Q = 2*(N+2*bQ);      % Double (padsiz + f)
fbp = zeros(P,Q);
fbp(1:M+2*bP,1:N+2*bQ) = fb;
Fbp = fftshift(fft2(fbp));           % FFT of fbp

% =========================================================================
% Laplace filter in frequence domain
% =========================================================================
H = zeros(P,Q);                          % 2*(padsiz + size(f))
for u = 1:P
    for v = 1:Q
        D = (u-1-P/2).^2 + (v-1-Q/2).^2; % change to [0~P-1,0~Q-1]
        H(u,v) = -4*pi*pi*D;
    end
end
Gp = H.*Fbp;                 % filtering with point operation
gp  = real(ifft2(ifftshift(Gp)));

% =========================================================================
g = gp(1+bP:M+bP,1+bQ:N+bQ); % Remove the left-top bounds
gmax = max(abs(g(:)));
figure,subplot(131),imshow(inima),title('The original image')
subplot(132),imshow(g./gmax,[]),title('Freq. Laplacian flitering')

% =========================================================================
% Sharpen image
% =========================================================================
gs = f-g./gmax; 
% =========================================================================
gs = imadjust(gs,[0 1]);   % Scale the image
subplot(133),imshow(gs,[]),title('Sharpen in freq. domain')
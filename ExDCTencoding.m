clear;clf
G=imread('Untitled (1).png'); % replace 'your_image_file' with your image file path
% Convert the image to grayscale if it is a color image
if size(G,3) == 3
    G = rgb2gray(G);
end
% Pad the image to make its size a multiple of 8x8
[m, n] = size(G);
M = ceil(m/8)*8;
N = ceil(n/8)*8;
img = padarray(G, [M-m, N-n], 'post');
subplot(121)
imagesc(img); axis image, axis off; colormap(gray);
title('Original image');

% Create a slider for Qpk value
hSlider = uicontrol('Style', 'slider', 'Min', 1, 'Max', 100, 'Value', 1, 'SliderStep', [2/99 , 2/99], 'Position', [50 50 500 20]);
hLabel = uicontrol('Style','text', 'Position',[50 75 500 20], 'String','Qpk value:');
addlistener(hSlider, 'ContinuousValueChange', @(hSlider, event) update(hSlider, img, hLabel));

% Create labels for min and max values
uicontrol('Style','text', 'Position',[50 30 30 20], 'String','1');
uicontrol('Style','text', 'Position',[520 30 30 20], 'String','100');

% Function to update the image and slider value display
function update(hSlider, img, hLabel)
    Qpk = round(get(hSlider, 'Value'));
    qimg=blkproc(img,[8 8],'bloc_dct8_normq',Qpk); % 8x8 DCT compression
    qimg=max(min(qimg,255),0); % recovery of image to [0 255]
    subplot(122)
    imagesc(qimg),axis image, axis off; colormap(gray);
    title(['Decoded image using Qpk=', num2str(Qpk)]);
    % Update the label above the slider with the current Qpk value
    set(hLabel, 'String', ['Qpk value: ', num2str(Qpk)]);
end

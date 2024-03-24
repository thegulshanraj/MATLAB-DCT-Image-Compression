% ( filename: bloc_dct8_normq.m )
% This function performs 8x8 DCT2 transformation on image
% blocks of 8x8 using a typical quantization matrix Q_matrix
% Qpk = parameter to trade-off data rate vs quality; Large Qpk => low rate
function qdimg=bloc_dct8_normq(imgbloc,Qpk)
% Input = imgbloc (8x8 original input image block for encoding)
% Output = qdimg (8x8 decoded image block)
% Typical 8x8 Q_matrix entered
Q_matrix=[16,11,10,16,26,40,51,61;
12,12,14,19,26,58,60,55;
14,13,16,24,40,57,69,56;
14,17,22,29,51,87,80,62;
18,22,37,56,68,109,103,77;
24,35,55,64,81,104,113,92;
49,64,78,87,103,121,120,101;
72,92,95,98,112,100,103,99];
%
dctbloc=dct2(imgbloc); % Take DCT2 of imageblock
Dyn=Q_matrix*Qpk; % Dynamic Q-matrix scaled by Qpk
qdct=round(dctbloc./Dyn); % Element-wise quantization (index)
iqdct=qdct.*Dyn; % denormalization
qdimg=round(idct2(iqdct)); % inverse DCT
end
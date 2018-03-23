
function resultImage = returnCorners(testImage, filter)

% calculate gradients to create matrix M

%I = imfilter(I,filter,'replicate');
[Ix, Iy] = imgradientxy(testImage);

% replace the gradient function with mask [-1 0 1]

% I = double(I); % Cast to double precision to ensure accuracy
% dx = [-1 0 1];
% dy = dx.';
% Ix = conv2(I, dx, 'same');
% Iy = conv2(I, dy, 'same');

% calculations for matrix M = [Ixx, Ixy; Ixy, Iyy];

Ixx = imfilter(Ix.*Ix,filter,'replicate'); 
Iyy = imfilter(Iy.*Iy,filter,'replicate');
Ixy = imfilter(Ix.*Iy,filter,'replicate');

%M = [Ixx, Ixy; Ixy, Iyy];

% [det(M) - k*trace(M)] gives single value for entire matrix

k = 0.05;
R =((Ixx.*Iyy)-(Ixy.^2)) - k*(((Ixx + Iyy).^2)); %Harris operator

% non-maxima suppression

%N = 3; threshold = 0.0001;
%R = R.*double(R == ordfilt2(R , N^2, true(N))) > threshold;

resultImage = R; 
end


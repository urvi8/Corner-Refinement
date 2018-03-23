
close all;

%% different filters

% unweightd filter/box filter
averagingFilter = fspecial('average'); 

% similar to openCV implementation
sobelFilter3 = fspecial('sobel'); 

% weighted filters
sigma = 1;
gaussianFilter3 = fspecial('gaussian',3,sigma);
diskFilter3 = fspecial('disk',sigma);

sigma2 = 2;
gaussianFilter5 = fspecial('gaussian',5,sigma2);
diskFilter5 = fspecial('disk',sigma2);

sigma3 = 3;
gaussianFilter7 = fspecial('gaussian',7,sigma3);
diskFilter7 = fspecial('disk',sigma3);

sigma4 = 4;
gaussianFilter9 = fspecial('gaussian',9,sigma4);
diskFilter9 = fspecial('disk',sigma4);

diskFilter11 = fspecial('disk');

%% Chessboard pattern

% synthesize the pattern
chessBoard = zeros(150,150);
chessBoard(1:50,1:50) = 1;
chessBoard(51:100,51:100) = 1;
chessBoard(1:50,101:150) = 1;
chessBoard(101:150,1:50) = 1;
chessBoard(101:150,101:150) = 1;

% Add noise (optional)
chessBoard = imnoise(chessBoard,'gaussian',0,0.0002);

% Find corners
resultChessBoard = returnCorners(chessBoard,gaussianFilter5);

% visualize results
figure(11); imshow(chessBoard);

figure(155); imagesc(resultChessBoard); colorbar;

%% Square grid pattern 

% synthesize the grid
squareGrid = ones(150,150);
squareGrid(1:50,1:50) = 0;
squareGrid(1:50,101:150) = 0;
squareGrid(101:150,1:50) = 0;
squareGrid(101:150,101:150) = 0;

% Add noise (optional)
squareGrid = imnoise(squareGrid,'gaussian',0,0.0005);

% Find corners
resultSqGrid = returnCorners(squareGrid,gaussianFilter5);

% Visualize
figure(21); imshow(squareGrid);

figure(255); imagesc(resultSqGrid); colorbar;


%% inverted square grid

% synthesize the grid
invertedGrid = zeros(150,150);
invertedGrid(1:50,1:50) = 1;
invertedGrid(1:50,101:150) = 1;
invertedGrid(101:150,1:50) = 1;
invertedGrid(101:150,101:150) = 1;

% Add noise (optional)
squareGrid = imnoise(squareGrid,'gaussian',0,0.0005);

% Find corners
resultInvGrid = return_corners(invertedGrid,gaussianFilter9);

% visualize

figure(31); imshow(invertedGrid);

figure(399); imagesc(resultInvGrid); colorbar;

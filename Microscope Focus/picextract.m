%create individual arrays for components of paths to test data
path = 'M:\LPE\Jack LPE\MATLAB\for sean\ex4\calib_good';

pics = dir(path);
picfolders = {pics.name};



for i = 4:length(picfolders)
    picuint1 =  imread(picfolders{1,i});
    picuint1 = picuint1(220:290,300:370);
    picuint2 = flip(picuint1,2);
    picuint3 = flip(picuint1,3);
    picuint4 = flip(picuint1,4);
    imagepx{i-3} = mat2gray(picuint1);
    imagepx2{i-3} = im2double(picuint2);
    imagepx3{i-3} = im2double(picuint3);
    imagepx4{i-3} = im2double(picuint4);
    name = picfolders{i};
    z(i-3) = str2double(name(7:8));
end

%unroll image
Ximage = imagepx;
for i = 1:length(imagepx)
    i;
    curimage = Ximage{i};
    X(i,:) = curimage(:)';
end
Ximage = imagepx2;
for i = 1:length(imagepx)
    i;
    curimage = Ximage{i};
    X2(i,:) = curimage(:)';
end

Ximage = imagepx3;
for i = 1:length(imagepx)
    i;
    curimage = Ximage{i};
    X3(i,:) = curimage(:)';
end
Ximage = imagepx4;
for i = 1:length(imagepx)
    i;
    curimage = Ximage{i};
    X4(i,:) = curimage(:)';
end
X = [X;X2;X3;X4];


%normalize y
y = z;
y = (y-min(y))/(max(y)-min(y));
y = [y y y y];
y = y';


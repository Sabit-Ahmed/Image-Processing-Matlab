pth = fileparts(which('cameraman.tif'));
D = dir(pth);
C = {'.tif';'.jp';'.png';'.bmp'};
idx = false(size(D));
for ii = 1:length(C)
idx = idx | (arrayfun(@(x) any(strfind(x.name,C{ii})),D));
end
D = D(idx);
for ii = 1:numel(D)
fprintf('%s, ',D(ii).name);
imshow(D(ii).name);
drawnow;
end
close all;
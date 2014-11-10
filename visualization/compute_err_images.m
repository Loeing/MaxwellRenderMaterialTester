
function compute_err_images(pzInput, pz_ground_truth, pzOutput)

filelist = dir(fullfile(pzInput, '*.bmp'));
ground_truth_img = imread(pz_ground_truth);

for i = 1:length(filelist)
    fn = filelist(i).name;
    disp(fn)
    pz_current_img = fullfile(pzInput, fn);

    pzOutImg = fullfile(pzOutput, fn);
    current_img = imread(pz_current_img);
    

    diff_img = uint8((double(current_img) - double(ground_truth_img) + 256) / 2);
    imwrite(diff_img, pzOutImg)
end
    

end


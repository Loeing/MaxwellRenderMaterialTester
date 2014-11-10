%compute_err_images
root_dir='/Users/Jing/Dropbox/3DMotion/src/MaxwellRenderMaterialTester/visualization/data/';
pzInput = [root_dir, 'render_images'];
pz_ground_truth = [root_dir 'render_images/sl_22.bmp'];
pzOutput = [root_dir 'err_images']; 
compute_err_images(pzInput, pz_ground_truth, pzOutput);
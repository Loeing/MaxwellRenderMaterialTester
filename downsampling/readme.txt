

A typical call should be like this:
dsvideo = vds(video,[32,32],24,0.1,0.1);

In which, video should be a 3D matrix corresponding to the animation, while the 2nd and 3rd parameter is the spacial and temporal size of down sampled video; the last two parameters are cutoff power percentage in spacial and temporal axes.

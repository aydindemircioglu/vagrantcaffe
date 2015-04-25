# vagrantcaffe

A small bootstrap building on data science toolbox to get caffe running in a vagrant box.
To get this running, just install virtualbox and vagrant as usual. Then (either in the git directory or
copy the files into a new folder) start vagrant as usual by typing

> $ vagrant up

This will create a Ubuntu 14.10 vagrant box and install python and all other dependencies
for caffe. Please allow for some time to get everything installed (roughly around 30-60 minutes).
After this you can find the current caffe in /usr/local/caffe.

To get directly started, just type

> $ vagrant ssh

This will bring you into the virtualbox. Then, just start ipython with some of the example notebooks,
e.g.

> vagrant $ ipython notebook /usr/local/caffe/examples/classification.ipynb --ip=0.0.0.0

To access the ipython notebook, open up a browser in your machine (not vagrant) and open 
http://localhost:8888

Have fun.


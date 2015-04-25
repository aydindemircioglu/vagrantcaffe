# vagrantcaffe

A small bootstrap building on data science toolbox to get caffe running in a vagrant box.
To get this running, just install virtualbox and vagrant as usual. Then (either in the git directory or
copy the files into a new folder) start vagrant as usual by typing

> $ vagrant up

This will create a Ubuntu 14.10 vagrant box and install python and all other dependencies
for caffe. Please allow for some time to get everything installed (roughly around 30-60 minutes,
for CUDA version even much longer, as the nvidia server are really not the fastest and roughly
a gig has to be downloaded from there).

After this you can find the current caffe in /usr/local/caffe in the virtual image.

To get directly started, just type

> $ vagrant ssh

This will bring you into the virtualbox. Then, just start ipython with some of the example notebooks,
e.g.

> vagrant $ ipython notebook /usr/local/caffe/examples/classification.ipynb --ip=0.0.0.0

To access the ipython notebook, open up a browser in your machine (not vagrant) and open 
http://localhost:8888

Have fun.


# TODO

- cuDNN should be installed too.


# desperate direct install

In case you are really desperate installing caffe on your local computer (without any virtual
environment), you probably can also execute ./bootstrap.sh directly directly. Just make sure you 
handle over root-rights (by calling 'sudo ./bootstrap.sh') and you are not
afraid of installing something into /usr/local/caffe. (i did not test this feature, so i do not take
any responsibility. please give feedback if you do, thanks!)



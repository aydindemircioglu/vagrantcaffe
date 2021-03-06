#!/usr/bin/env bash

apt-get update
apt-get install -y python python-sklearn python-skimage python-scikits-learn cmake python-tk
apt-get install -y bc libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler  expect-dev

rm -rf /usr/local/caffe
git clone https://github.com/BVLC/caffe /usr/local/caffe

#chown -R vagrant:vagrant ~/.ipython
chown -R vagrant:vagrant /usr/local/caffe/.*

cd /usr/local/caffe

# make sure we do not use the gpu
sed -e 's/# CPU_ONLY/CPU_ONLY/' Makefile.config.example >  Makefile.config
chown -R vagrant:vagrant /usr/local/caffe/

mkdir /usr/local/caffe/build
cd /usr/local/caffe/build
cmake ..

make -j2 all
make -j2 test
make -j2 runtest
make install
cd ../python
for req in $(cat requirements.txt); do sudo pip install $req; done 
ln -s /usr/local/caffe/python/caffe  /usr/lib/python2.7/dist-packages/caffe
# stupid opencv thing?
sudo ln /dev/null /dev/raw1394



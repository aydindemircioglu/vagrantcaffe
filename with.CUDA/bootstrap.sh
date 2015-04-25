#!/usr/bin/env bash

# add cuda first
wget -O /tmp/cuda-repo-ubuntu1410_7.0-28_amd64.deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1410/x86_64/cuda-repo-ubuntu1410_7.0-28_amd64.deb
dpkg -i /tmp/cuda-repo-ubuntu1410_7.0-28_amd64.deb 

apt-get update
apt-get install -y cuda-7-0 cuda-toolkit-7-0
apt-get install -y python python-sklearn python-skimage python-scikits-learn cmake python-tk
apt-get install -y bc libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler  expect-dev

# download caffee
rm -rf /usr/local/caffe
git clone https://github.com/BVLC/caffe /usr/local/caffe
chown -R vagrant:vagrant /usr/local/caffe/.*

cd /usr/local/caffe
mkdir /usr/local/caffe/build

# compile
cd /usr/local/caffe/build
cmake ..
make -j2 all
make -j2 test
make -j2 runtest
make install

# add python layer
cd ../python
for req in $(cat requirements.txt); do sudo pip install $req; done 
ln -s /usr/local/caffe/python/caffe  /usr/lib/python2.7/dist-packages/caffe

# stupid opencv thing?
sudo ln /dev/null /dev/raw1394


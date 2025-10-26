#!/usr/bin/env bash


sudo update-alternatives --install /usr/bin/python3 python /usr/bin/python3.13 13 --slave /usr/bin/pip3 pip /usr/bin/pip3.13
sudo update-alternatives --install /usr/bin/python3 python /usr/local/bin/python3.12 12 --slave /usr/bin/pip3 pip /usr/local/bin/pip3.12
sudo update-alternatives --install /usr/bin/python3 python /usr/local/bin/python3.11 11 --slave /usr/bin/pip3 pip /usr/local/bin/pip3.11
sudo update-alternatives --install /usr/bin/python3 python /usr/local/bin/python3.10 10 --slave /usr/bin/pip3 pip /usr/local/bin/pip3.10
sudo update-alternatives --install /usr/bin/python3 python /usr/local/bin/python3.9 9 --slave /usr/bin/pip3 pip /usr/local/bin/pip3.9

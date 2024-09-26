# README

Docker container with [Superscan](https://github.com/cshasha/superscan) installed

# Quick start

Run it like this:

```
sudo docker run -it -v `pwd`:/home/user/data fgajardoe/superscan_citeseq python3 superscan/superscan.py -h
```


# Debris
```
sudo docker run -it -v `pwd`:/home/user/data -w /home/user/superscan fgajardoe/superscan_citeseq bash #python3 superscan.py --dataset /home/user/data/YASCP_data_from_mmochi_RNA.h5ad --out_prefix YASCP_data_superscan
```

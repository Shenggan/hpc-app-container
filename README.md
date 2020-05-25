# hpc-app-container

[![Join the chat at https://gitter.im/hpc-app-container/community](https://badges.gitter.im/hpc-app-container/community.svg)](https://gitter.im/hpc-app-container/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

HPC Container Collection for [SJTU Center for High Performance Computing](https://docs.hpc.sjtu.edu.cn/).

Docker Hub Page: [https://hub.docker.com/repository/docker/chengshenggan/hpc-app-container](https://hub.docker.com/repository/docker/chengshenggan/hpc-app-container)

## Application List

### Relion

![Relion](https://github.com/Shenggan/hpc-app-container/workflows/Relion/badge.svg?branch=master)

Main Page: [http://www2.mrc-lmb.cam.ac.uk/relion](http://www2.mrc-lmb.cam.ac.uk/relion)

Version: [3.0.8](https://github.com/3dem/relion/releases/tag/3.0.8)

Base Image: [chengshenggan/hpc-base-container:cuda-9.2.ompi-4.0](https://github.com/Shenggan/hpc-base-container/blob/master/dgx2/cuda-9.2.openmpi-4.0.Dockerfile)

Usage:

```shell
# for docker user
docker pull chengshenggan/hpc-app-container:relion-3.0.8
# for singularity user
singularity pull docker://chengshenggan/hpc-app-container:relion-3.0.8
```

### Gromacs

![Gromacs](https://github.com/Shenggan/hpc-app-container/workflows/Gromacs/badge.svg?branch=master)

Main Page: [http://www.gromacs.org/](http://www.gromacs.org/)

Version: [2020](http://manual.gromacs.org/2020/download.html)

Base Image: [chengshenggan/hpc-base-container:gcc-8.cuda-10.2.ompi-4.0](https://github.com/Shenggan/hpc-base-container/blob/master/dgx2/gcc-8.cuda-10.2-openmpi4.0.Dockerfile)

Usage:

```shell
# for docker user
docker pull chengshenggan/hpc-app-container:gromacs-2020
# for singularity user
singularity pull docker://chengshenggan/hpc-app-container:gromacs-2020
```

### Lammps

![Lammps](https://github.com/Shenggan/hpc-app-container/workflows/Lammps/badge.svg?branch=master)

Main Page: [https://lammps.sandia.gov/](https://lammps.sandia.gov/)

Version: [patch_19Sep2019](https://github.com/lammps/lammps/releases/tag/patch_19Sep2019)

Base Image: [chengshenggan/hpc-base-container:gcc-8.cuda-10.2.ompi-4.0](https://github.com/Shenggan/hpc-base-container/blob/master/dgx2/gcc-8.cuda-10.2-openmpi4.0.Dockerfile)

Usage:

```shell
# for docker user
docker pull chengshenggan/hpc-app-container:lammps-2019
# for singularity user
singularity pull docker://chengshenggan/hpc-app-container:lammps-2019
```

#!/usr/bin/env bash

DEB13="build-essential checkinstall autotools-dev make cmake
       libreadline-dev libncurses-dev libssl-dev libsqlite3-dev tk-dev 
       libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev liblzma-dev 
       libgdbm-compat-dev libnsl-dev
       git lazygit
       gcc gfortran \
       gcc-12 gfortran-12 \
       gcc-13 gfortran-13 \
       gcc-14 gfortran-14 \
       libopenblas0 libopenblas-dev \
       python3-pip python3-setuptools
       neovim neomutt calcurse kitty \
       graphviz imagemagick inkscape gimp dia geogebra texlive-full \
       stow btop htop fastfetch\
       fonts-ubuntu fonts-ubuntu-console fonts-ubuntu-title"


debian13 () {
    echo "Post install for debian 13 trixie..."
    sudo apt install -y $DEB13
    echo "Done."
    return 0
}

debian14 () {
    echo "Post install for debian 14 forky..."
    echo "Done."
    return 0
}

add_gcc () {
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-$1 $2 --slave /usr/bin/gfortran gfortran /usr/bin/gfortran-$1 --slave /usr/bin/gcov gcov /usr/bin/gcov-$1
}

add_python () {
    sudo update-alternatives --install /usr/bin/python3 python /usr/local/bin/python$1 $2 --slave /usr/bin/pip3 pip /usr/local/bin/pip$1
}


case $1 in
    "debian13"|"13"|"trixie")
        debian13
        exit 0
        ;;
    "debian14"|"14"|"forky")
        debian14
        exit $?
        ;;
    "add")
        case $2 in
            "gcc")
                add_gcc $3 $4
                ;;
            "python")
                add_python $3 $4
                ;;
            *)
                ;;
        esac
        ;;
    *)
        exit $?
        ;;
esac

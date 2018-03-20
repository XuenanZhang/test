#!/bin/sh
exec 2>error.log
clear

echo "=================================================================================================================================================="
echo "================================================================== 安装开始 ======================================================================"
echo "=================================================================================================================================================="

mkdir -p ~/myPkg

mv -f .vimrc ~/
mv -f .agignore ~/
mkdir -p ~/.vim/plugin/snippets/
mv -f cpp.snippets ~/.vim/plugin/snippets/

#常用工具安装
echo "################################# 常用工具安装 #################################"
yum -y install make gcc gcc-c++ gdb 
yum -y install git subversion

#配色 有时安装不上
echo "################################# 配色 #################################"
cd ~/myPkg
git clone git://github.com/seebi/dircolors-solarized.git 

#vim相关 =================================================================================> begin
echo "################################# vim相关 #################################"
cd ~/myPkg
yum -y install git
yum -y install ctags
yum -y install cscope
mkdir -p ~/.vim/bundle/Vundle.vim
git clone http://github.com/VundleVim/Vundle.Vim ~/.vim/bundle/Vundle.vim
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


#vim中文文档安装
echo "vim中文文档安装（7.4）"
cd ~/myPkg
wget http://nchc.dl.sourceforge.net/sourceforge/vimcdoc/vimcdoc-1.9.0.tar.gz 2>&1
tar -xzvf vimcdoc-1.9.0.tar.gz
rm -f vimcdoc-1.9.0.tar.gz
cd vimcdoc-1.9.0/
./vimcdoc.sh -I

#字体安装
echo "字体安装"
cd ~/myPkg
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

#clang 安装
echo "clang"
wget http://llvm.org/releases/3.4.2/cfe-3.4.2.src.tar.gz 2>&1
wget http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz 2>&1
wget http://llvm.org/releases/3.4/clang-tools-extra-3.4.src.tar.gz 2>&1
wget http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz 2>&1
wget http://llvm.org/releases/3.4.2/libcxx-3.4.2.src.tar.gz 2>&1

tar zxvf cfe-3.4.2.src.tar.gz   
tar zxvf clang-tools-extra-3.4.src.tar.gz   
tar zxvf compiler-rt-3.4.src.tar.gz   
tar zxvf libcxx-3.4.2.src.tar.gz   
tar zxvf llvm-3.4.2.src.tar.gz

rm -f cfe-3.4.2.src.tar.gz   
rm -f clang-tools-extra-3.4.src.tar.gz   
rm -f compiler-rt-3.4.src.tar.gz   
rm -f libcxx-3.4.2.src.tar.gz   
rm -f llvm-3.4.2.src.tar.gz  

mv cfe-3.4.2.src clang  
mv clang/ llvm-3.4.2.src/tools/  
mv clang-tools-extra-3.4 extra  
mv extra/ llvm-3.4.2.src/tools/clang/  
mv compiler-rt-3.4 compiler-rt  
mv compiler-rt llvm-3.4.2.src/projects/  
mkdir build-3.4  
cd build-3.4/  
../llvm-3.4.2.src/configure --enable-optimized --enable-targets=host-only  
make -j2 && make install  

vim +PluginInstall +qall
	 
#vim相关 =======================================================================================> end

#autoconf安装
echo "################################# autoconf安装 #################################"
cd ~/myPkg
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.65.tar.gz 2>&1
tar -xzvf autoconf-2.65.tar.gz
rm -f autoconf-2.65.tar.gz
cd autoconf-2.65
./configure && make -j2 && make install

#htop安装
echo "################################# htop安装 #################################"
cd ~/myPkg
yum install -y ncurses ncurses-devel
##git clone https://github.com/hishamhm/htop
wget https://hisham.hm/htop/releases/2.0.2/htop-2.0.2.tar.gz 2>&1
tar -xzvf htop-2.0.2.tar.gz
rm -f htop-2.0.2.tar.gz
cd htop-2.0.2
./configure && make -j2 && make install

#the_silver_searcher安装 (AG)：
echo "################################# the_silver_searcher安装 #################################"
cd ~/myPkg
yum -y install pcre-devel xz-devel
wget https://github.com/ggreer/the_silver_searcher/archive/master.zip 2>&1
mv master.zip ag.zip
unzip ag.zip
cd the_silver_searcher-master/
./build.sh && make install
rm -f ag.zip
cd ..
wget https://geoff.greer.fm/ag/releases/the_silver_searcher-2.0.0.tar.gz 2>&1
tar -xzvf the_silver_searcher-2.0.0.tar.gz
rm -f the_silver_searcher-2.0.0.tar.gz
cd the_silver_searcher-2.0.0
./configure && make -j2 && make install

#python3.6安装 ：
echo "################################# python3.6安装 #################################"
cd ~/myPkg
wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz 2>&1
tar -xJvf Python-3.6.0.tar.xz
cd Python-3.6.0
./configure && make -j2 && make install


#配置环境变量
echo "################################# 配置环境变量 #################################"
cat >> ~/.bashrc << EOF

alias ls='ls --color=auto'
if [ -e /usr/share/terminfo/x/xterm-256color ]; then     
    export TERM='xterm-256color'
else
    export TERM-'xterm-color'
fi

eval \`dircolors ~/myPkg/dircolors-solarized/dircolors.256dark\`

PS1='[\[\e[32m\]\A#\##\[\e[31m\]\u\[\e[35m\]@\h \W\[\e[m\]]\[\e[33m\]#\[\e[m\] '

EOF

#设置共享文件夹
echo "################################# 设置共享文件夹 #################################"
mkdir ~/work/
mount -t cifs -o username=admin,password=563 //192.168.1.218/server ~/work/
echo "//192.168.1.218/server /root/work cifs defaults,username=admin,password=563 0 2" >> /etc/fstab

echo "=================================================================================================================================================="
echo "================================================================== 安装完成 ======================================================================"
echo "=================================================================================================================================================="
echo ""
echo ""
echo ""
echo "################################################################## 错误日志 ###########################################################"
cd ~/tools/
grep -iv '警告：\|llvm\|warning' error.log

#gcc cmake install
# yum install -y gcc gcc-c++ make automake
# yum install -y wget
# wget http://www.cmake.org/files/v2.8/cmake-2.8.11.tar.gz
# tar -zxvf cmake-2.8.11.tar.gz
# cd cmake-2.8.11
# ./bootstrap;gmake;gmake install


#centos升级gcc到4.7：
# wget -P /etc/yum.repos.d http://people.centos.org/tru/devtools-1.1/devtools-1.1.repo 
# yum --enablerepo=testing-1.1-devtools-6 install devtoolset-1.1-gcc devtoolset-1.1-gcc-c++
# #以上步骤安装gcc到/opt/centos/devtoolset-1.1/root/usr/bin/
# mv /usr/bin/gcc /usr/bin/gcc-4.4.7
# mv /usr/bin/g++ /usr/bin/g++-4.4.7
# mv /usr/bin/c++ /usr/bin/c++-4.4.7
# ln -s /opt/centos/devtoolset-1.1/root/usr/bin/* /usr/bin/

#python 升级到2.7
# wget -P ~/myPkg http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
# cd ~/myPkg
# tar -zxvf Python-2.7.3.tgz
# cd Python-2.7.3
# mkdir /usr/local/python27
# ./configure --prefix=/usr/local/python27
# make
# make install
# mv /usr/bin/python /usr/bin/python_old
# ln -s /usr/local/python27/bin/python2.7 /usr/bin/python

#YouCompleteMe install
#mkdir clang
#cd clang
#wget http://llvm.org/releases/3.6.2/cfe-3.6.2.src.tar.xz
#wget http://llvm.org/releases/3.6.2/llvm-3.6.2.src.tar.xz
#wget http://llvm.org/releases/3.6.2/compiler-rt-3.6.2.src.tar.xz
#wget http://llvm.org/releases/3.6.2/clang-tools-extra-3.6.2.src.tar.xz

#tar -xvf cfe-3.6.2.src.tar.xz  
#tar -xvf llvm-3.6.2.src.tar.xz  
#tar -xvf compiler-rt-3.6.2.src.tar.xz  
#tar -xvf clang-tools-extra-3.6.2.src.tar.xz

#mv cfe-3.6.2.src llvm-3.6.2.src/tools/clang
#mv clang-tools-extra-3.6.2.src llvm-3.6.2.src/tools/clang/extra/ 
#mv compiler-rt-3.6.2.src llvm-3.6.2.src/projects/compiler-rt

#mkdir build
#cd build
#../llvm-3.6.2.src/configure --enable-optimized --enable-targets=host-only  
#make -j3 
#make install

#cd ~/.vim/bundle/YouCompleteMe 
#mkdir ~/build  
#cd ~/build
#yum -y install python-devel
#cmake -G "Unix Makefiles"  ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ -DEXTERNAL_LIBCLANG_PATH=~/myPkg/clang/build/Release+Asserts/lib/libclang.so
#make ycm_core  
#make ycm_support_libs 

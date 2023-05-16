#based on https://github.com/computology/debian-package-shell-script-tutorial
#sudo apt-get install dh-make devscripts

#Creating the Debian boilerplate using dh_make
cat >>~/.bashrc <<EOF
DEBEMAIL="dev@meantrix.com"
DEBFULLNAME="Igor Siciliani"
export DEBEMAIL DEBFULLNAME
EOF
 
. ~/.bashrc
#Using dh_make to create the debian packaging structure

cd shutils-0.1/
dh_make --indep --createorig
# Create the debian/install and preinst files
cp ../install debian/install
cp ../preinst debian/preinst
debuild -us -uc

sudo dpkg -i ../shutils_0.1-1_all.deb
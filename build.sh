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

cd shutils/
cd shutils-0.1/
rm -rf debian/
dh_make --indep --createorig
# Create the debian/install and preinst files
cp ../install debian/install
cp ../preinst debian/preinst
cp ../postinst debian/postinst
cp ../postrm debian/postrm
cp ../control debian/control


debuild -us -uc

sudo apt remove shutils
sudo dpkg -i ../shutils_0.1-1_all.deb
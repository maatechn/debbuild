#!/bin/bash

#package name has characters that aren't lowercase alphanums or '-+.'
#maintainer script 'preinst' has bad permissions 664 (must be >=0555 and <=0775)

#configuration
PACKAGE_NAME=package
CREATE_PREINST=true
CREATE_POSTINST=true
CREATE_PRERM=false
CREATE_POSTRM=false

if $CREATE_PREINST; then
	echo '#!/bin/bash' > ./$PACKAGE_NAME/DEBIAN/preinst
	echo 'echo "exec preinst"' >> ./$PACKAGE_NAME/DEBIAN/preinst
	echo >> ./$PACKAGE_NAME/DEBIAN/preinst
	chmod 0775 ./$PACKAGE_NAME/DEBIAN/preinst
else
	rm -f ./$PACKAGE_NAME/DEBIAN/preinst
fi

rm -f ./$PACKAGE_NAME/DEBIAN/postinst
rm -f ./$PACKAGE_NAME/DEBIAN/prerm
rm -f ./$PACKAGE_NAME/DEBIAN/postrm

#dpkg-deb --build ./$PACKAGE_NAME


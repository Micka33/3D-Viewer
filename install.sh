mkdir cocosInstallFolder
cd cocosInstallFolder

# Downloading cocos2D
curl -O http://cocos2d-iphone.googlecode.com/files/cocos2d-iphone-2.0.tar.gz
tar xzf cocos2d-iphone-2.0.tar.gz
rm cocos2d-iphone-2.0.tar.gz
# Downloading cocos3D
curl -O https://codeload.github.com/cocos3d/cocos3d/zip/master
unzip master
rm master
# Performing installation
cd cocos3d-master
sh install-cocos3d.sh -f -2 `cd ../cocos2d-iphone-2.0;pwd`

cd ..
rm -rf cocosInstallFolder

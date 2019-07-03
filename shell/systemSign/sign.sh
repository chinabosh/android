unzip -q app-release.apk -d ./release
rm -f ./release/META-INF/CERT.RSA
rm -f ./release/META-INF/CERT.SF
cd ./release
for file in $(ls)
do 
zip -r -q app-release-tmp.apk -xi $file;
done
mv app-release-tmp.apk ../
cd ..
java -jar signapk.jar platform.x509.pem platform.pk8 app-release-tmp.apk app-sign-`date +%Y%m%d%H%M`.apk
rm -f app-release-tmp.apk
rm -rf ./release

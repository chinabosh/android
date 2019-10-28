#apk签名V1和V2，需要先边界对齐优化，用空间换时间，再签名
#边界对齐优化
/Users/bosh/Library/Android/sdk/build-tools/28.0.3/zipalign -v -p 4 /2019-10-25_15-42-55_legu.apk temp.apk
#apksigner 签V1和V2
/Users/bosh/Library/Android/sdk/build-tools/28.0.3/apksigner sign --ks keystore.jks --ks-key-alias alias --ks-pass pass:123456 -key-pass pass:123456 --out 2019-10-25_17-03-01_legu_aligned_signed.apk temp.apk
#确认是否签名
/Users/bosh/Library/Android/sdk/build-tools/28.0.3/apksigner verify -v 2019-10-25_17-03-01_legu_aligned_signed.apk

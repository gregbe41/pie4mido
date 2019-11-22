#!/bin/bash

device=$1
sourcerom=$2
DATE="$(date +%Y%m%d)"
DAY="$(date +%d/%m/%Y)"
zip_path="/home/gbe/android/lineage/out/target/product/mido/lineage-16.0-$DATE-UNOFFICIAL-$device.zip"
set -e

# datetime
timestamp=`cat /home/gbe/android/lineage/out/target/product/$device/system/build.prop | grep ro.build.date.utc | cut -d'=' -f2`


# filename
zip_name="lineage-16.0-$DATE-UNOFFICIAL-$device.zip"

zip_name_old=`cat /home/gbe/android/$device.json | grep "filename" | cut -d':' -f2 | cut -d'"' -f2`
`sed -i 's|$zip_name_old|$zip_name|g' ~/android/$device.json`

# id
id=`md5sum $zip_path | cut -d' ' -f1`
id_old=`cat ~/android/$device.json | grep "id" | cut -d':' -f2 | cut -d'"' -f2`
`sed -i 's|$id_old|$id|g' ~/android/$device.json`

# Rom type
type="Unofficial"
type_old=`cat ~/android/$device.json | grep "romtype" | cut -d':' -f2 | cut -d'"' -f2`
`sed -i 's|$type_old|$type|g' ~/android/$device.json`

# Rom size
size_new=`stat -c "%s" $zip_path`
size_old=`cat ~/android/$device.json | grep "size" | cut -d':' -f2 | cut -d',' -f1`


# Rom version
version="16.0"


# url
url="https://master.dl.sourceforge.net/project/pie4mido/pie_mido/$zip_name"


echo -e "{\n  \"response\": [\n    {\n      \"datetime\": $timestamp,\n      \"filename\": \"lineage-16.0-$DATE-UNOFFICIAL-mido.zip\",\n      \"id\": \"$id\",\n      \"romtype\": \"$type\",\n      \"size\": $size_new,\n      \"url\": \"https://sourceforge.net/projects/pie4mido/files/pie_mido/lineage-16.0-20191122-UNOFFICIAL-mido.zip\",\n      \"version\": \"16.0\"\n    }\n  ]\n}" >$device.json


#!/bin/bash

# kang by henlob

TAG=$1

# fwb
echo "Merging FWB..."
git clone -q https://github.com/XOSP-Reborn/frameworks_base base
cd base
git fetch -q https://android.googlesource.com/platform/frameworks/base $TAG
git merge FETCH_HEAD -q -m "Merge tag '$TAG' into eleven"
cd ..

# Settings 
echo "Merging Settings..."
git clone -q https://github.com/XOSP-Reborn/packages_apps_Settings settings
cd settings
git fetch -q https://android.googlesource.com/platform/packages/apps/Settings $TAG
git merge FETCH_HEAD -q -m "Merge tag '$TAG' into eleven"
cd ..

# soong 
echo "Merging build soong..."
git clone -q https://github.com/XOSP-Reborn/build_soong soong
cd soong
git fetch -q https://android.googlesource.com/platform/build/soong $TAG
git merge FETCH_HEAD -q -m "Merge tag '$TAG' into eleven"
cd ..

# build make 
echo "Merging build make..."
git clone -q https://github.com/XOSP-Reborn/build make
cd make
git fetch -q https://android.googlesource.com/platform/build $TAG
git merge FETCH_HEAD -q -m "Merge tag '$TAG' into eleven"
cd ..

# grep fetch heads
echo "Merge done! Conflicts :"
grep -sRi "<<< HEAD" *


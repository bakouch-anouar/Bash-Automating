#!/bin/bash

echo "welcome !"

firstline=$(head -n 1 ./source/changelog.md)

# the number without the markdown
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}

echo "You are building version" $version

echo "enter 1 : Yes | 0 :NO "
read $versioncontinue

if [ "$versioncontinue"=="1" ]
then
# copy files from source to build
    directory="source"
    pattern="*"
    destination="build"
    for file in "$directory"/"$pattern"
    do
      if [ "$file" == "secretinfo.md" ]
      then
       echo "$file not copied"
      else 
      cp $file $destination
      echo "$file copied"
      fi
    done
    cd ./"$destination"
    ls *
else 
  echo "Please come back when you are ready"
fi








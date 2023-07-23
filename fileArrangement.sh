#!/bin/zsh

typeset -A FILE_TYPES=(
    [png]=images
    [jpeg]=images
    [jpg]=images
    [webp]=images
    [pdf]=documents
    [csv]=documents
    [xlsx]=documents
)

source_dir="/Users/nikhilparashar/Downloads"

for file in "$source_dir"/*; do
   if [[ -f $file ]]; then 
      filename=$(basename $file)
      extension=${filename##*.}
      echo $extension
      if [[ -n ${FILE_TYPES[$extension]} ]]; then
          dest_folder="$source_dir/${FILE_TYPES[$extension]}"
          
          mkdir -p $dest_folder

          mv $file $dest_folder

          echo "File moved to $dest_folder"
      else 
          echo "Extenstion not availble in array"
      fi 
   elif [[ -d $file ]]; then
      echo "This is a directory"
   else 
      echo "$file - Invalid file"
   fi
done
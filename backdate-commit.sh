#!/bin/bash

# Tanggal awal
START_DATE="2026-03-16"

# Ambil daftar file yang berubah
files=($(git status --porcelain | awk '{print $2}'))

i=0

for file in "${files[@]}"
do
  # Hitung tanggal (tambah i hari dari start)
  commit_date=$(date -d "$START_DATE +$i day" +"%Y-%m-%d 10:00:00")

  # Stage 1 file
  git add "$file"

  # Commit dengan tanggal mundur
  GIT_AUTHOR_DATE="$commit_date" \
  GIT_COMMITTER_DATE="$commit_date" \
  git commit -m "Update $file pada $commit_date"

  echo "Committed $file pada $commit_date"

  ((i++))

  # Stop kalau sudah sampai tanggal 30 (15 hari max)
  if [ $i -ge 15 ]; then
    break
  fi
done

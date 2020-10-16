function largest-files {
  find . -type f -ls |awk '{print $7" "$11}' |sort -nrk1
}

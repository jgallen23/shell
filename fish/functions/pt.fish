function pt
  docker run -it -e PAPERTRAIL_TOKEN=$PAPERTRAIL_API_TOKEN --rm firstandthird/papertrail-cli $argv
end

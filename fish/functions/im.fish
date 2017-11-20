function im
  docker run -v $PWD:/images --rm -it --workdir /images v4tech/imagemagick $argv
end

# shell

## Profiles

```shell
docker run --rm -it --name $NAME -v shell-$NAME:/work -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.ssh:/ssh gregallen/shell
```

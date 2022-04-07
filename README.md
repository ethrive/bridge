# bridge

## build

```
git clone git@github.com:ethrive/bridge.git
cd bridge
docker image build . -t ethrive-bridge
```

## start

```
docker run --cap-add=NET_ADMIN --cap-add=NET_RAW --cap-add=SYS_ADMIN -p 8081:80 -it ethrive-bridge
```


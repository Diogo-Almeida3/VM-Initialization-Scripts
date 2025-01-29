podman pull docker.io/angr/angr                                                                                                                  
podman run -it --rm -v $PWD:/local docker.io/angr/angr

# (angr) angr@f7717a5fcd66:$ cd /local/
# (angr) angr@f7717a5fcd66:/local$ python3 solve.py 
# (angr) angr@f7717a5fcd66:/local$ exit

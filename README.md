# infra

## F.A.Q.

In case of
```shell script
ERROR: [1] bootstrap checks failed
[1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

You need to set the value in `sysctl.conf`. In Ubuntu you can do, open the conf in a editor with sudo:

```shell script
sudo nano /etc/sysctl.conf
```

Then add these lines somewhere in the file

```shell script
# used for docker and elastic search
vm.max_map_count=262144

```
> It is a good practice to ensure an empty line at the end of the file

Save and exit, with __nano__ it'll be `Ctrl + O (save)`, then Enter, then `Ctrl+X (exit)`.

And you can apply (_in order to avoid restart_) the settings manually: `sudo sysctl -w vm.max_map_count=262144`
# infra

## F.A.Q.

##### If you want to move docker files away from / (_root_) to free up some space

Source : https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/

Stop the docker daemon
```shell script
sudo service docker stop
```
Using your preferred text editor add a file named `daemon.json` under the directory `/etc/docker`. The file should have this content:
```json
{ 
   "graph": "/path/to/your/docker" 
}
```
Copy the current data directory to the new one
```shell script
sudo rsync -aP /var/lib/docker/ /path/to/your/docker
```
Rename the old docker directory
```shell script
sudo mv /var/lib/docker /var/lib/docker.old
```
Start the daemon back
```shell script
sudo service docker start
```
Test that containers are there
```shell script
docker ps -a
```
And old docker folder is not back
```shell script
ls /var/lib/docker
```
Then remove the omld files
```shell script
sudo rm -rf /var/lib/docker.old
```

##### inotify

[Inotify Watches Limit](https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit)

1. 1. Add the following line to either `/etc/sysctl.conf` file or a new `*.conf` file (_e.g. idea.conf_) under `/etc/sysctl.d/` directory:
```shell script
fs.inotify.max_user_watches = 524288
```
1. Then run this command to apply the change:
```shell script
sudo sysctl -p --system
```

##### In case of error while running __Elasticsearch__ 
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

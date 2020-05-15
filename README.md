A bash script to set up realtime audio for use with JACK, a la https://jackaudio.org/faq/linux_rt_config.html

You'll need to run this with sudo, because it does group stuff and edits things in /etc/

## Running it
* Download `setUpRealtime.bash`
* Start a shell instance - launch a terminal, that is
* Run these commands to run the script :)
```bash
cd theFolderYouDownloadedThisTo
chmod +x setUpRealtime.bash
sudo ./setUpRealtime.bash
```

## What It Actually Does
* Creates a group if it doesn't exist already (by default, audio)
* Adds a user to that group
* Configures realtime scheduling limits
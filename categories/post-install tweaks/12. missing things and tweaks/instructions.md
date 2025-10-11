# Preface
Some things are unfortunately misconfigured or absent in Cachy (though rare).
Such are the wrong phonon backend on older installs, or the lack of codecs. This shouldn't be the case on newer installs, but in case it is, open the terminal and run:

```sh
paru -S vlc-plugins-all phonon-qt6-vlc
```

Then run:

```sh
phononsettings
```

And configure it to use the vlc backend, on some apps (such as kalarm) you need to do this in its settings, so keep an eye out for that.

## Other missing (that I consider) stuff:

```sh
paru -S kdenetwork-filesharing fuse2 kio-admin khelpcenter sshfs kcmutils5 icoutils
```

### Explanations:
- dolphin share gui
- appimage support
- dolphin admin actions
- aggregated manual pages
- kde connect filesystem browser
- shows you some missing things in kde settings (such as s.m.a.r.t. monitor)
- lets you manipulate icons off binary files (helpful for extracting icons out of .exe files)

## SSH
If you want to use ssh to connect, the service needs to be enabled, you would thus run:

```sh
systemctl enable --now sshd
```

#### Without the `--now` flag you either need to restart or run that but with the `start` argument. Make sure to modify ufw accordingly (I prefer disabling the firewall entirely as it's cumbersome and I'm not running a server).
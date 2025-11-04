# Preface
Do you like having 900GiB (yes, you read that right) writes in one day? No? Neither do I, journald does however.

Because it has no way to filter entries before they hit disk globally, but instead service-level, you end up with such wonderful things as wine spamming you its stupid `fixme`'s ad infinitum 60 billion lines/s causing massive writes of garbage to the journal.

Now you could deal with this, service by service, game by game, etc. or- you could just throw the journal into RAM instead and just not.

# Open the terminal and do:

```sh
kate /etc/systemd/journald.conf
```

and uncomment the `Storage` line and set it like this:
```
Storage=volatile
```

save the file, then either reboot, or in the terminal type:

```sh
systemctl restart systemd-journald.service
```

Congratulations, your journal now lives in RAM where it doesn't matter if it does 900GiB/day.
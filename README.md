Shell script to spawn a command within a network namespace with the only
visible network link being Mullvad WireGuard tunnel connected to a random
server (within a certain country and/or city).

The configuration lives at `/etc/mullvad-netns/config`, it is a shell script
that is sourced when the program is run. There is a default configuration
installed that defines some variables.

As a quick start, one should set their account number. The default location
of this file is `/etc/mullvad-netns/account`. This file must not be readable
by anyone other than root.

```text
Usage:
  mullvad-netns [options] -- <command>
  mullvad-netns <command>

Run <command> under a network namespace connected to a randomly selected
Mullvad server over WireGuard as the only visible network device. This
ensures that the command does not have access to the network except through
the Mullvad tunnel.

Options
  -C, --country <regex>      use only servers from countries matching the
                               given regular expression
  -c, --city <regex>         use only servers from cities matching the
                               given regular expression

  -4, --ipv4                 connect to the Mullvad server over IPv4 (the default)
  -6, --ipv6                 connect to the Mullvad server over IPv6

  -h, --help                 display this help
```

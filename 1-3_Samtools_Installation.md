
# Samtools Installation

## 1. Install homebrew

Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system macOS as well as Linux.

### For Mac OS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### For Ubuntu (linux)

```bash
sh -c "$(curl –fsSL <https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh>)"
```

![Homebrew1.jpg](https://www.dropbox.com/s/cggwk1a2xqft1he/Homebrew1.jpg?dl0&raw=1)

*Note. you need to type your password that you previously set*

### Continue with installing homebrew in linux

![homebrew2.jpg](https://www.dropbox.com/s/iajc65ncky70557/Homebrew2.jpg?dl0&raw=1)

### Type following commands to countinue (linux)

![Homebrew3.jpg](https://www.dropbox.com/s/q9j4nobzh7v9z7e/Homebrew3.jpg?dl0&raw=1)

```bash
$ test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
$ test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
$ echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
```

### Check if homebrew is installed (linux & OS)

```bash
brew help
```

![Homebrew4.jpg](https://www.dropbox.com/s/66sn1u9lb0tms2q/Homebrew4.jpg?dl0&raw=1)

**When you see the screen like above then the brew is successfully installed.**

## 2. Install Samtools (linux & OS)

```bash
brew install samtools
```

### Check if the samtools is installed (linux & OS)

```bash
samtools
```

![Samtools2.jpg](https://www.dropbox.com/s/m8kv8orahan4f3k/Samtools2.jpg?dl0&raw=1)

# seccheck
Format wrapper for checksec inspired by:  @ansemjo
Requires objdump & checksec

Create root directory for seccheck, clone directory in root
```
mkdir ~/.seccheck
cd .seccheck
git clone {SECCHECK_LINK}
```
Add seccheck alias in bash profile, bash rc, profile, or whatever your environment config file is
```
vi ~/.bashrc
```
Add to alias section or EOF
```
alias seccheck='bash $HOME/.seccheck/seccheck.sh'
```
Source env config
```
source ~/.bashrc
```
Usage:
```
seccheck /bin/bash

[ARCH]		elf64-x86-64
[RELRO]		Full RELRO
[STACK CANARY]	Canary found
[NX]		NX enabled
[PIE]		PIE enabled
[RPATH]		No RPATH
[RUNPATH]	No RUNPATH
[Symbols]	No Symbols
[FORTIFY]	Yes
[Fortified]	13
[Fortifiable]	32
[FILE]		/bin/bash
```


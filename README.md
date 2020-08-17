# Gradle Example Project

## Gradle Commander - Project Wrapper

``` sh
# Gradle Initializer command
./gradlecmd.sh -init

```

``` sh
./gradlecmd.sh -h

Gradle Commander
Initiate Gradle	 [ -i, -init, --init ]
Clean Build	 [ -clean, --clean ]
Clean All	 [ -r, -remove, --remove ]
Reinit All	 [ -ri, -reinit, --reinit ]
Help Menu	 [ -h, -help, --help ]
```

``` sh
# Remove older build sessions
./gradlecmd.sh -clean 
```

``` sh
Package Wrapper
./wrapper.sh -help
```

``` sh
Create Package	[ -package, --package ]
Test Package	[ -test, --test ]
```

``` sh
# Build/Rebuild the package with all 
# distribution and report files
./wrapper.sh -package
```

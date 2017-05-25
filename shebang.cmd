@echo off
echo ! (shebang) - %~f0 %1 %2 %3 %4

if "%1"=="-on" (
    echo on
    SET PATHEXT=%PATHEXT:.CMD;=.CMD;.;%
    @echo off
) else if "%1"=="-off" (
    echo on
    SET PATHEXT=%PATHEXT:;.;=;%
    @echo off
) else if "%1"=="-install" (
    echo on
    ftype shebangfile=bash -c shebang-run %%0 %%*
    assoc .=shebangfile 
    @echo off
) else if "%1"=="-remove" (
    echo on
    ftype shebangfile=
    assoc .=
    @echo off
) else (
    echo "usage: shebang [option]"
    echo "  option may be any one of:"
    echo "    -on        # turns on shebang processing in this cmd session"
    echo "    -off       # turns off shebang processing in this cmd session"
    echo "    -install   # install shebang file type system-wide (system-wide, admin required)"
    echo "    -remove    # remove shebang file type association (system-wide, admin required)"
    exit /B 100
)

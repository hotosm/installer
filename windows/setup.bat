set PATH=%PATH%;%HOMEDRIVE%\Python25;%HOMEDRIVE%\Python25\Scripts;%PROGRAMFILES%\HOTOSM\bin;%PROGRAMFILES%\HOTOSM\lib;%PROGRAMFILES%\HOTOSM\osmosis\bin
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /f /d "%PATH%"
set PYTHONPATH=%PYTHONPATH%;%PROGRAMFILES%\HOTOSM\python\2.5\site-packages
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PYTHONPATH /t REG_EXPAND_SZ /f /d "%PYTHONPATH%"
set PROJ_LIB=%PROGRAMFILES%\HOTOSM\nad
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PROJ_LIB /t REG_EXPAND_SZ /f /d "%PROJ_LIB%"

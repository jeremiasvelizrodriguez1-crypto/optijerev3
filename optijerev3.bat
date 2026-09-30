@echo off
title OptiJere System Optimizer v5
color 0A
mode con: cols=70 lines=28

:: Pantalla de inicio
cls
echo.
echo ==============================================================
echo.
echo                       O P T I J E R E
echo.
echo                  SYSTEM OPTIMIZER v5
echo.
echo ==============================================================
echo.
echo                    Iniciando sistema...
echo.

setlocal EnableDelayedExpansion
set "barra="

for /L %%A in (1,1,25) do (
    set "barra=!barra!#"
    cls
    echo.
    echo ==============================================================
    echo.
    echo                       O P T I J E R E
    echo.
    echo                  SYSTEM OPTIMIZER v5
    echo.
    echo ==============================================================
    echo.
    echo              Iniciando: [!barra!]
    ping localhost -n 1 >nul
)

endlocal

timeout /t 1 >nul

:MENU
cls
echo.
echo ==============================================================
echo                       O P T I J E R E
echo                    SYSTEM OPTIMIZER v5
echo ==============================================================
echo.
echo   INFORMACION DEL EQUIPO
echo   ------------------------------------------------------------
echo   CPU   : Intel Celeron
echo   RAM   : 6 GB
echo   SIST. : Windows 64 bits
echo.
echo ==============================================================
echo.
echo       [1]  OPTIMIZACION RAPIDA
echo       [2]  MODO GAMING
echo       [3]  LIMPIAR TEMPORALES
echo       [4]  HERRAMIENTAS
echo       [5]  INFORMACION DEL PC
echo       [6]  SALIR
echo.
echo ==============================================================
echo.
set /p opcion=        Elegi una opcion: 

if "%opcion%"=="1" goto OPTIMIZAR
if "%opcion%"=="2" goto GAMING
if "%opcion%"=="3" goto LIMPIAR
if "%opcion%"=="4" goto HERRAMIENTAS
if "%opcion%"=="5" goto INFO
if "%opcion%"=="6" exit

goto MENU


:OPTIMIZAR
cls
echo.
echo ==============================================================
echo                    OPTIMIZACION RAPIDA
echo ==============================================================
echo.
echo [1/3] Limpiando temporales...
del /q /f /s "%TEMP%\*" >nul 2>&1

echo [2/3] Limpiando cache DNS...
ipconfig /flushdns >nul

echo [3/3] Finalizando...
echo.
echo ==============================================================
echo                 OPTIMIZACION TERMINADA
echo ==============================================================
echo.
pause
goto MENU


:GAMING
cls
echo.
echo ==============================================================
echo                         MODO GAMING
echo ==============================================================
echo.
echo Preparando el equipo...
echo.
echo [1/2] Limpiando temporales...
del /q /f /s "%TEMP%\*" >nul 2>&1

echo [2/2] Limpiando cache DNS...
ipconfig /flushdns >nul

echo.
echo ==============================================================
echo                     MODO GAMING LISTO
echo ==============================================================
echo.
echo Ya podes abrir tu juego.
echo.
pause
goto MENU


:LIMPIAR
cls
echo.
echo ==============================================================
echo                     LIMPIEZA
echo ==============================================================
echo.
echo Limpiando archivos temporales...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
echo.
echo Limpieza terminada.
echo.
pause
goto MENU


:HERRAMIENTAS
cls
echo.
echo ==============================================================
echo                       HERRAMIENTAS
echo ==============================================================
echo.
echo       [1] Administrador de tareas
echo       [2] Opciones de rendimiento
echo       [3] Comprobar disco
echo       [4] Volver
echo.
set /p herramienta=        Elegi una opcion: 

if "%herramienta%"=="1" start taskmgr
if "%herramienta%"=="2" start SystemPropertiesPerformance.exe
if "%herramienta%"=="3" goto DISCO
if "%herramienta%"=="4" goto MENU

goto HERRAMIENTAS


:DISCO
cls
echo.
echo ==============================================================
echo                     COMPROBANDO DISCO
echo ==============================================================
echo.
chkdsk C: /scan
echo.
pause
goto HERRAMIENTAS


:INFO
cls
echo.
echo ==============================================================
echo                    INFORMACION DEL PC
echo ==============================================================
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory"
echo.
echo PROCESADOR:
wmic cpu get name
echo.
pause
goto MENU
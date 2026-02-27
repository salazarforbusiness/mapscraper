@echo off
title Google Maps Scraper
color 0A
echo.
echo  ============================================
echo   Google Maps Scraper — Iniciando...
echo  ============================================
echo.

:: Tenta encontrar Python (Windows usa "py" ou "python")
set PYTHON_CMD=

py --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=py
    goto :found
)

python --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python
    goto :found
)

python3 --version >nul 2>&1
if not errorlevel 1 (
    set PYTHON_CMD=python3
    goto :found
)

:: Nenhum encontrado
color 0C
echo  [ERRO] Python nao encontrado no PATH!
echo.
echo  Solucoes:
echo  1. Instale o Python em: https://python.org/downloads
echo     Marque "Add Python to PATH" durante a instalacao.
echo.
echo  2. Se ja tiver instalado, abra o CMD e rode:
echo     where python
echo     where py
echo     e me informe o resultado.
echo.
pause
exit /b

:found
echo  Python encontrado: %PYTHON_CMD%
%PYTHON_CMD% --version
echo.

:: Instala dependencias automaticamente se necessario
echo  Verificando dependencias...

%PYTHON_CMD% -c "import selenium" >nul 2>&1
if errorlevel 1 (
    echo  Instalando selenium + webdriver-manager...
    %PYTHON_CMD% -m pip install selenium webdriver-manager -q
)

%PYTHON_CMD% -c "import openpyxl" >nul 2>&1
if errorlevel 1 (
    echo  Instalando openpyxl...
    %PYTHON_CMD% -m pip install openpyxl -q
)

%PYTHON_CMD% -c "import requests" >nul 2>&1
if errorlevel 1 (
    echo  Instalando requests + beautifulsoup4 + lxml...
    %PYTHON_CMD% -m pip install requests beautifulsoup4 lxml -q
)

echo  Tudo pronto! Abrindo o programa...
echo.

%PYTHON_CMD% "%~dp0maps_scraper_v2.py"

if errorlevel 1 (
    color 0C
    echo.
    echo  [ERRO] O programa encerrou com um erro.
    echo  Verifique se maps_scraper_v2.py esta na mesma pasta que este .bat
    echo.
    pause
)
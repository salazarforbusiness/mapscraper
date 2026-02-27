@echo off
chcp 65001 >nul
title Google Maps Scraper

echo.
echo  ============================================
echo       Google Maps Scraper - Launcher
echo  ============================================
echo.

:: Verifica Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERRO] Python nao encontrado!
    echo  Baixe em: https://python.org/downloads
    echo  Na instalacao, marque "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version 2^>^&1') do echo  [OK] %%i

echo.
echo  Instalando/verificando dependencias...
pip install selenium webdriver-manager openpyxl requests beautifulsoup4 lxml -q
echo  [OK] Dependencias prontas.
echo.

:: Verifica se o arquivo existe
if not exist "%~dp0maps_scraper_v2.py" (
    echo  [ERRO] Arquivo maps_scraper_v2.py nao encontrado!
    echo  Certifique-se que o .bat e o .py estao na mesma pasta.
    echo.
    pause
    exit /b 1
)

echo  Iniciando programa...
echo  ============================================
echo.

python "%~dp0maps_scraper_v2.py"

echo.
echo  ============================================
if %errorlevel% neq 0 (
    echo  [ERRO] O programa encerrou com erro codigo: %errorlevel%
    echo  Leia a mensagem acima para entender o problema.
) else (
    echo  Programa encerrado normalmente.
)
echo  ============================================
echo.
pause
@echo off
chcp 65001 >nul
title Google Maps Scraper

echo.
echo  ╔══════════════════════════════════════════╗
echo  ║       Google Maps Scraper - Launcher     ║
echo  ╚══════════════════════════════════════════╝
echo.

:: Verifica se Python está instalado
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERRO] Python nao encontrado!
    echo.
    echo  Instale o Python em: https://python.org/downloads
    echo  Marque a opcao "Add Python to PATH" durante a instalacao.
    echo.
    pause
    exit /b 1
)

echo  [OK] Python encontrado.
echo.
echo  Verificando dependencias...
echo.

pip show selenium >nul 2>&1
if %errorlevel% neq 0 (
    echo  Instalando selenium...
    pip install selenium --quiet
)

pip show webdriver-manager >nul 2>&1
if %errorlevel% neq 0 (
    echo  Instalando webdriver-manager...
    pip install webdriver-manager --quiet
)

pip show openpyxl >nul 2>&1
if %errorlevel% neq 0 (
    echo  Instalando openpyxl...
    pip install openpyxl --quiet
)

pip show requests >nul 2>&1
if %errorlevel% neq 0 (
    echo  Instalando requests...
    pip install requests --quiet
)

pip show beautifulsoup4 >nul 2>&1
if %errorlevel% neq 0 (
    echo  Instalando beautifulsoup4...
    pip install beautifulsoup4 lxml --quiet
)

echo  [OK] Todas as dependencias OK.
echo.
echo  Iniciando o programa...
echo.

:: Executa o scraper na mesma pasta do .bat
python "%~dp0maps_scraper_v2.py"

:: Se der erro, mostra a mensagem antes de fechar
if %errorlevel% neq 0 (
    echo.
    echo  [ERRO] O programa fechou com um erro.
    echo  Verifique se o arquivo maps_scraper_v2.py esta na mesma pasta.
    pause
)
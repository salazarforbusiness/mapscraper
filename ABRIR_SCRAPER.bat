@echo off
title Google Maps Scraper
color 0A
echo.
echo  ============================================
echo   Google Maps Scraper — Iniciando...
echo  ============================================
echo.

:: Verifica se Python esta instalado
python --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo  [ERRO] Python nao encontrado!
    echo.
    echo  Instale o Python em: https://python.org/downloads
    echo  Marque a opcao "Add Python to PATH" durante a instalacao.
    echo.
    pause
    exit /b
)

:: Instala dependencias automaticamente se necessario
echo  Verificando dependencias...
python -c "import selenium" >nul 2>&1
if errorlevel 1 (
    echo  Instalando selenium...
    pip install selenium webdriver-manager -q
)
python -c "import openpyxl" >nul 2>&1
if errorlevel 1 (
    echo  Instalando openpyxl...
    pip install openpyxl -q
)
python -c "import requests" >nul 2>&1
if errorlevel 1 (
    echo  Instalando requests + beautifulsoup4...
    pip install requests beautifulsoup4 lxml -q
)

echo  Tudo pronto! Abrindo o programa...
echo.

:: Executa o scraper (na mesma pasta do .bat)
python "%~dp0maps_scraper_v2.py"

if errorlevel 1 (
    color 0C
    echo.
    echo  [ERRO] O programa encerrou com um erro.
    echo  Verifique se o arquivo maps_scraper_v2.py esta na mesma pasta que este .bat
    echo.
    pause
)
@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Excel Explorer

where tar >nul 2>&1
if errorlevel 1 (
    echo May nay khong co lenh tar. Can Windows 10 tro len.
    pause
    exit /b 1
)

echo Dang giai nen...
if not exist "%~dp0excel-explorer" mkdir "%~dp0excel-explorer"
if not exist "%~dp0excel-explorer\_internal" mkdir "%~dp0excel-explorer\_internal"
if not exist "%~dp0excel-explorer\_internal\_polars_runtime_32" mkdir "%~dp0excel-explorer\_internal\_polars_runtime_32"
if not exist "%~dp0excel-explorer\_internal\numpy.libs" mkdir "%~dp0excel-explorer\_internal\numpy.libs"

tar -xf "%~dp0static.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen static.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0templates.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen templates.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0polars-py.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen polars-py.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0duckdb-py.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen duckdb-py.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0pandas.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen pandas.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0numpy.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen numpy.pack that bai.
    pause
    exit /b 1
)
tar -xf "%~dp0runtime.pack" -C "%~dp0"
if errorlevel 1 (
    echo Giai nen runtime.pack that bai.
    pause
    exit /b 1
)

copy /b /y "%~dp0app.pack" "%~dp0excel-explorer\excel-explorer.app" >nul
if errorlevel 1 (
    echo Ghep excel-explorer/excel-explorer.app that bai.
    pause
    exit /b 1
)
copy /b /y "%~dp0vc.01"+"%~dp0vc.02" "%~dp0excel-explorer\vc_redist.x64.app" >nul
if errorlevel 1 (
    echo Ghep excel-explorer/vc_redist.x64.app that bai.
    pause
    exit /b 1
)
copy /b /y "%~dp0polars.01"+"%~dp0polars.02"+"%~dp0polars.03"+"%~dp0polars.04"+"%~dp0polars.05"+"%~dp0polars.06"+"%~dp0polars.07" "%~dp0excel-explorer\_internal\_polars_runtime_32\_polars_runtime.pyd" >nul
if errorlevel 1 (
    echo Ghep excel-explorer/_internal/_polars_runtime_32/_polars_runtime.pyd that bai.
    pause
    exit /b 1
)
copy /b /y "%~dp0duckdb.01"+"%~dp0duckdb.02" "%~dp0excel-explorer\_internal\_duckdb.pyd" >nul
if errorlevel 1 (
    echo Ghep excel-explorer/_internal/_duckdb.pyd that bai.
    pause
    exit /b 1
)
copy /b /y "%~dp0numpy-bin.pack" "%~dp0excel-explorer\_internal\numpy.libs\libscipy_openblas64_-4e39871015dc1470c682dc512497ee22.dll" >nul
if errorlevel 1 (
    echo Ghep excel-explorer/_internal/numpy.libs/libscipy_openblas64_-4e39871015dc1470c682dc512497ee22.dll that bai.
    pause
    exit /b 1
)

cd /d "%~dp0excel-explorer"
call run.bat

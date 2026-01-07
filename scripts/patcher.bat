@echo off
setlocal enabledelayedexpansion

echo === Applying ROOT patches ===
cd /d G:\chromium\src

for %%p in (
    0001-branding.patch
    0002-disable-update-pings.patch
    0003-disable-google-api-warning.patch
    0004-extensions-manifestv2.patch
    0005-disable-ad-topics-and-etc.patch
    0006-prefer-https-by-default.patch
    0007-memory-saving-by-default.patch
    0008-spoof-chrome-ua-brand.patch
    0009-remove-f1-shortcut.patch
    0010-chromiuminstallmode.patch
    0011-settings.patch
) do (
    echo [ROOT] Applying %%p
    git apply "G:\chromium\patches\root\%%p"
    if errorlevel 1 echo Failed to apply %%p
)

echo.
echo === Applying SUBMODULE patches ===
pushd G:\chromium\src\third_party\search_engines_data\resources
git apply "G:\chromium\patches\submodules\third_party\search_engines_data\resources\0001-patch.patch"
if errorlevel 1 echo Failed to apply submodule patch
popd

echo.
echo === ALL PATCHES ATTEMPTED ===
pause

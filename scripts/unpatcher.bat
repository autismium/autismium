@echo off
setlocal enabledelayedexpansion

echo === Reverting ROOT patches ===
cd /d G:\chromium\src

for %%p in (
    0011-settings.patch
    0010-chromiuminstallmode.patch
    0009-remove-f1-shortcut.patch
    0008-spoof-chrome-ua-brand.patch
    0007-memory-saving-by-default.patch
    0006-prefer-https-by-default.patch
    0005-disable-ad-topics-and-etc.patch
    0004-extensions-manifestv2.patch
    0003-disable-google-api-warning.patch
    0002-disable-update-pings.patch
    0001-branding.patch
) do (
    echo [ROOT] Reverting %%p
    git apply -R "G:\chromium\patches\root\%%p"
    if errorlevel 1 echo Failed to revert %%p
)

echo.
echo === Reverting SUBMODULE patches ===
pushd G:\chromium\src\third_party\search_engines_data\resources
git apply -R "G:\chromium\patches\submodules\third_party\search_engines_data\resources\0001-patch.patch"
if errorlevel 1 echo Failed to revert submodule patch
popd

echo.
echo === ALL PATCHES ATTEMPTED ===
pause

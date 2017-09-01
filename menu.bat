@echo off
rem important notice and info
echo.
echo IMPORTANT NOTICE AND INFO
echo ===============================================================
echo.
echo Please make sure you are in the bootloader/ fast boot and rescue  mode
echo before you start please make sure you have the drivers
echo Before continuing check that you have the bootloader unlocked,
echo If you do not have it, do not continue, since you do not have the ability to flash twrp
echo and it will not work
echo if you do not have the boot loader unlocked please close this window.
echo nobody is responsible for you if you brick apart from your self.
echo it is your own fault if you brick so please keep that in mind
echo.
echo ===============================================================
echo.
echo Instructions and requirements
echo.
echo ===============================================================
echo.
echo you should have enabled usb debugging on your device
echo.
echo you must be on your homescreen on your device while doing this
echo.
echo please plug your phone into your computer and authorize it.
echo.
echo if you are not bootloader unlocked you can unlock it using your
echo bootloader unlock code and this tool.
echo.
echo if you do not have your a bootloader unlock code you can try to
echo message the huawei facebook page for your regionand ask for it
echo it worked for me
echo.
echo when bootloader unlocking your device will format
echo.
echo ===============================================================
echo.
echo If you have read all the requirements and info
echo and are ok with the risks press any key to continue
echo.
echo ===============================================================
echo.
pause > nul
cls
rem checks if bootloader is unlocked
echo do you have your bootloader unlocked?
echo.
set /p bu= y or n:

rem setting what happens when bootloader is unlocked
if %bu%==y (
TASKKILL /IM "adb.exe" /F
cls
TASKKILL /IM "adb.exe" /F
cls
echo rebooting to bootloader
data\adb.exe reboot-bootloader
goto twrp-install
)

rem setting what happens when bootloader is locked
if %bu%==n (
goto bootloader-unlock-setup
)
rem setting up the twrp installer function
:twrp-install
cls
echo Next step:
echo installing twrp recovery
echo.
data\fastboot.exe flash recovery data\twrp.img
data\fastboot.exe reboot
echo.
echo.
cls
echo thanks for using the huawei p8 lite 2017 twrp aio tool by tunip3
echo.
echo press any key to exit
pause > nul

rem preparing to unlock the bootloader
:bootloader-unlock-setup
TASKKILL /IM "adb.exe" /F
cls
TASKKILL /IM "adb.exe" /F
cls
echo rebooting to bootloader
data\adb.exe reboot-bootloader
goto bootloader-unlock-code

:bootloader-unlock-code
echo setting bootloader unlock-code
set /p buc= what is your bootloader code:
goto bootloader-unlock


:bootloader-unlock
echo unlocking the bootloader
data\fastboot.exe oem unlock %buc%
cls
echo a message should now pop on your screen asking you to
echo confirm that you want to unlock your bootloader use
echo volume keys to move up and down and the power button to select
pause
cls 
echo you now need to re-setup your phone and enable usb debugging
echo.
echo you now have your bootloader unlocked and can install twrp
echo.  
echo thanks for using the huawei p8 lite 2017 twrp aio tool by tunip3
echo.
echo press any key to exit
pause > nul


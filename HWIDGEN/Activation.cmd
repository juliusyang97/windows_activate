    @echo off
    rem author: 默然King
    rem url: http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667
    set "Apply=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
    title Windows 10 数字权利激活脚本
    pushd "%~dp0"
    setlocal enabledelayedexpansion

    cls
    if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="x86" (
    set processor=x86
    ) else (
    set processor=x64
        )

    echo ---------------------------------------------------------------
    echo     脚本仅支持 Windows 10 系统，其它系统请勿运行此脚本。
    echo     脚本支持激活以下版本 Windows 10，并获取数字权利。
    echo ---------------------------------------------------------------
    echo     Windows 10 家庭版、家庭N、家庭单语言版、家庭国家版、Windows 10 S、Windows 10 SN。
    echo     专业版、专业N、专业教育版、专业教育N、专业工作站版、工作站N。
    echo     企业版、企业 “LTSB 2016”、教育版、教育N。
    echo ---------------------------------------------------------------
    echo     激活时请保持电脑连网状态，断网情况下无法激活。
    echo     激活时 Windows Update服务请保持自动启动，禁用 Windows Update服务可能导致激活失败。
    echo ---------------------------------------------------------------
    echo     按任意键开始，或按Ctrl+C退出脚本！
    pause >nul
    :menu

    title Windows 10 数字权利激活脚本－选择功能
    cls
    echo ---------------------------------------------------------------
    echo     请选择任务。
    echo ---------------------------------------------------------------
    echo     [1]一键激活当前版本。
    echo     [2]选择其他版本，输入 KEY激活。
    echo     注意，输入的 KEY需要系统内置证书支持，否则无法激活。
    echo     [3]查看当前系统版本信息。
    echo    [4] 卸载当前系统KEY
    echo     [5]访问脚本发布帖，（仅限远景注册用户访问）
    echo     [6]退出脚本。

    echo ---------------------------------------------------------------

    choice /n /c 123456 /m 请输入数字选择
    cls
    if errorlevel 6 exit
    if errorlevel 5 goto url
    if errorlevel 4 goto delete
    if errorlevel 3 goto show
    if errorlevel 2 goto input
    if errorlevel 1 goto start

    :input
    title Windows 10 数字权利激活脚本－输入 KEY
    cls
    echo ---------------------------------------------------------------
    echo     支持的个版本 KEY
    echo ---------------------------------------------------------------
    echo Windows 10 S: V3WVW-N2PV2-CGWC3-34QGF-VMJ2C
    echo Windows 10 SN: NH9J3-68WK7-6FB93-4K3DF-DJ4F6
    echo ---------------------------------------------------------------
    echo Windows 10 家庭版: YTMG3-N6DKC-DKB77-7M9GH-8HVX7
    echo Windows 10 家庭N: 4CPRK-NM3K3-X6XXQ-RXX86-WXCHW
    echo Windows 10 家庭国家版: N2434-X9D7W-8PF6X-8DV9T-8TYMD
    echo Windows 10 单语言版: BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
    echo ---------------------------------------------------------------
    echo Windows 10 专业版: VK7JG-NPHTM-C97JM-9MPGT-3V66T
    echo Windows 10 专业N: 2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
    echo Windows 10 专业教育版: 8PTT6-RNW4C-6V7J2-C2D3X-MHBPB
    echo Windows 10 专业教育N: GJTYN-HDMQY-FRR76-HVGC7-QPF8P
    echo Windows 10 专业工作站版: DXG7C-N36C4-C4HTG-X4T3X-2YV77
    echo Windows 10 专业工作站N: WYPNQ-8C467-V2W6J-TX4WX-WT2RQ
    echo ---------------------------------------------------------------
    echo Windows 10 教育版: YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY
    echo Windows 10 教育N: 84NGF-MHBT6-FXBX8-QWJK7-DRR8H
    echo ---------------------------------------------------------------
    echo Windows 10 企业版: XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
    echo Windows 10 企业N: NK96Y-D9CD8-W44CQ-R8YTK-DYJWX
    echo ---------------------------------------------------------------
    echo.
    set /p pidkey="请输入或复制粘贴需要激活的版本KEY，按 Enter键开始激活:"
    goto activation

    :start
    cls
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo 您使用的计算机已永久激活！无需此操作。请在未激活的计算机上运行此脚本，或选择激活其它版本。按任意键退出脚本！ & pause >nul && exit )

    for /f "skip=5 delims=: tokens=2" %%i in ('dism /online /Get-CurrentEdition /English') do (set edition=%%i)
    goto %edition%

    :Cloud
    set pidkey=V3WVW-N2PV2-CGWC3-34QGF-VMJ2C
    goto activation

    :CloudN
    set pidkey=NH9J3-68WK7-6FB93-4K3DF-DJ4F6
    goto activation

    :Core
    set pidkey=YTMG3-N6DKC-DKB77-7M9GH-8HVX7
    goto activation

    :CoreCountrySpecific
    set pidkey=N2434-X9D7W-8PF6X-8DV9T-8TYMD
    goto activation

    :CoreN
    set pidkey=4CPRK-NM3K3-X6XXQ-RXX86-WXCHW
    goto activation

    :CoreSingleLanguage
    set pidkey=BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
    goto activation

    :Education
    set pidkey=YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY
    goto activation

    :EducationN
    set pidkey=84NGF-MHBT6-FXBX8-QWJK7-DRR8H
    goto activation

    :Enterprise
    set pidkey=XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
    goto activation

    :EnterpriseS
    set pidkey=NK96Y-D9CD8-W44CQ-R8YTK-DYJWX
    goto activation

    :Professional
    set pidkey=VK7JG-NPHTM-C97JM-9MPGT-3V66T
    goto activation

    :ProfessionalEducation
    set pidkey=8PTT6-RNW4C-6V7J2-C2D3X-MHBPB
    goto activation

    :ProfessionalEducationN
    set pidkey=GJTYN-HDMQY-FRR76-HVGC7-QPF8P
    goto activation

    :ProfessionalN
    set pidkey=2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
    goto activation

    :ProfessionalWorkstation
    set pidkey=DXG7C-N36C4-C4HTG-X4T3X-2YV77
    goto activation

    :ProfessionalWorkstationN
    set pidkey=WYPNQ-8C467-V2W6J-TX4WX-WT2RQ

    :activation
    title Windows 10 数字权利激活脚本－正在激活
    cls
for /f "tokens=2 delims==" %%i in ('wmic OS get OperatingSystemSKU /value ^| findstr "="') do (set skuid=%%i)
    reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d "%skuid%" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d "1" /f >nul

    echo ---------------------------------------------------------------
    echo      正在安装KEY，请等待完成。
    echo ---------------------------------------------------------------
    cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %pidkey%
    echo ---------------------------------------------------------------
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo 您选择的版本已在本计算机上永久激活！无需此操作。按任意键重新输入！ & pause>nul && goto input )
    echo     正在获取数字门票，请等待完成。
    echo ---------------------------------------------------------------
    start /wait %~dp0%processor%\Gatherosstate.exe

    timeout /nobreak /t 4 >nul
    :repeat
    if not exist %~dp0%processor%\GenuineTicket.xml goto repeat
    clipup -v -o -altto %~dp0%processor%\
    echo ---------------------------------------------------------------
    reg delete "HKLM\SYSTEM\Tokens" /f >nul
    cscript /nologo %SystemRoot%\system32\slmgr.vbs /ato
    :show
    echo ---------------------------------------------------------------
    for /f "skip=5 delims=: tokens=2" %%i in ('dism /online /Get-CurrentEdition /English') do (echo Windows 10%%i)
    for /f "tokens=2-4" %%i in ('ver') do (echo %%i %%j%%k)
for /f "skip=3 delims=" %%i in ('cscript /nologo %SystemRoot%\System32\slmgr.vbs /dli') do (echo %%i)
    echo ---------------------------------------------------------------

    pause
exit

    :url
    start "" "http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667"
goto menu

    :delete
    echo ---------------------------------------------------------------
    echo     正在卸载默认 KEY，请稍等。
    echo ---------------------------------------------------------------
    cscript /nologo %SystemRoot%\system32\slmgr.vbs /upk

pause
exit

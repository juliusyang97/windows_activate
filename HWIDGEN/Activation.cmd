    @echo off
    rem author: ĬȻKing
    rem url: http://bbs.pcbeta.com/forum.php?mod=viewthread&tid=1786788&page=1#pid48314667
    set "Apply=%*"
    cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %Apply%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
    title Windows 10 ����Ȩ������ű�
    pushd "%~dp0"
    setlocal enabledelayedexpansion

    cls
    if /i "%PROCESSOR_IDENTIFIER:~0,3%"=="x86" (
    set processor=x86
    ) else (
    set processor=x64
        )

    echo ---------------------------------------------------------------
    echo     �ű���֧�� Windows 10 ϵͳ������ϵͳ�������д˽ű���
    echo     �ű�֧�ּ������°汾 Windows 10������ȡ����Ȩ����
    echo ---------------------------------------------------------------
    echo     Windows 10 ��ͥ�桢��ͥN����ͥ�����԰桢��ͥ���Ұ桢Windows 10 S��Windows 10 SN��
    echo     רҵ�桢רҵN��רҵ�����桢רҵ����N��רҵ����վ�桢����վN��
    echo     ��ҵ�桢��ҵ ��LTSB 2016���������桢����N��
    echo ---------------------------------------------------------------
    echo     ����ʱ�뱣�ֵ�������״̬������������޷����
    echo     ����ʱ Windows Update�����뱣���Զ����������� Windows Update������ܵ��¼���ʧ�ܡ�
    echo ---------------------------------------------------------------
    echo     ���������ʼ����Ctrl+C�˳��ű���
    pause >nul
    :menu

    title Windows 10 ����Ȩ������ű���ѡ����
    cls
    echo ---------------------------------------------------------------
    echo     ��ѡ������
    echo ---------------------------------------------------------------
    echo     [1]һ�����ǰ�汾��
    echo     [2]ѡ�������汾������ KEY���
    echo     ע�⣬����� KEY��Ҫϵͳ����֤��֧�֣������޷����
    echo     [3]�鿴��ǰϵͳ�汾��Ϣ��
    echo    [4] ж�ص�ǰϵͳKEY
    echo     [5]���ʽű���������������Զ��ע���û����ʣ�
    echo     [6]�˳��ű���

    echo ---------------------------------------------------------------

    choice /n /c 123456 /m ����������ѡ��
    cls
    if errorlevel 6 exit
    if errorlevel 5 goto url
    if errorlevel 4 goto delete
    if errorlevel 3 goto show
    if errorlevel 2 goto input
    if errorlevel 1 goto start

    :input
    title Windows 10 ����Ȩ������ű������� KEY
    cls
    echo ---------------------------------------------------------------
    echo     ֧�ֵĸ��汾 KEY
    echo ---------------------------------------------------------------
    echo Windows 10 S: V3WVW-N2PV2-CGWC3-34QGF-VMJ2C
    echo Windows 10 SN: NH9J3-68WK7-6FB93-4K3DF-DJ4F6
    echo ---------------------------------------------------------------
    echo Windows 10 ��ͥ��: YTMG3-N6DKC-DKB77-7M9GH-8HVX7
    echo Windows 10 ��ͥN: 4CPRK-NM3K3-X6XXQ-RXX86-WXCHW
    echo Windows 10 ��ͥ���Ұ�: N2434-X9D7W-8PF6X-8DV9T-8TYMD
    echo Windows 10 �����԰�: BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
    echo ---------------------------------------------------------------
    echo Windows 10 רҵ��: VK7JG-NPHTM-C97JM-9MPGT-3V66T
    echo Windows 10 רҵN: 2B87N-8KFHP-DKV6R-Y2C8J-PKCKT
    echo Windows 10 רҵ������: 8PTT6-RNW4C-6V7J2-C2D3X-MHBPB
    echo Windows 10 רҵ����N: GJTYN-HDMQY-FRR76-HVGC7-QPF8P
    echo Windows 10 רҵ����վ��: DXG7C-N36C4-C4HTG-X4T3X-2YV77
    echo Windows 10 רҵ����վN: WYPNQ-8C467-V2W6J-TX4WX-WT2RQ
    echo ---------------------------------------------------------------
    echo Windows 10 ������: YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY
    echo Windows 10 ����N: 84NGF-MHBT6-FXBX8-QWJK7-DRR8H
    echo ---------------------------------------------------------------
    echo Windows 10 ��ҵ��: XGVPP-NMH47-7TTHJ-W3FW7-8HV2C
    echo Windows 10 ��ҵN: NK96Y-D9CD8-W44CQ-R8YTK-DYJWX
    echo ---------------------------------------------------------------
    echo.
    set /p pidkey="���������ճ����Ҫ����İ汾KEY���� Enter����ʼ����:"
    goto activation

    :start
    cls
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo ��ʹ�õļ���������ü������˲���������δ����ļ���������д˽ű�����ѡ�񼤻������汾����������˳��ű��� & pause >nul && exit )

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
    title Windows 10 ����Ȩ������ű������ڼ���
    cls
for /f "tokens=2 delims==" %%i in ('wmic OS get OperatingSystemSKU /value ^| findstr "="') do (set skuid=%%i)
    reg add "HKLM\SYSTEM\Tokens" /v "Channel" /t REG_SZ /d "Retail" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Kernel-ProductInfo" /t REG_DWORD /d "%skuid%" /f >nul
    reg add "HKLM\SYSTEM\Tokens\Kernel" /v "Security-SPP-GenuineLocalStatus" /t REG_DWORD /d "1" /f >nul

    echo ---------------------------------------------------------------
    echo      ���ڰ�װKEY����ȴ���ɡ�
    echo ---------------------------------------------------------------
    cscript /nologo %SystemRoot%\System32\slmgr.vbs /ipk %pidkey%
    echo ---------------------------------------------------------------
    wmic path SoftwareLicensingProduct where (LicenseStatus='1' and GracePeriodRemaining='0') get Name 2>nul | findstr /i "Windows" >nul 2>&1 && (echo. & echo ��ѡ��İ汾���ڱ�����������ü������˲�������������������룡 & pause>nul && goto input )
    echo     ���ڻ�ȡ������Ʊ����ȴ���ɡ�
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
    echo     ����ж��Ĭ�� KEY�����Եȡ�
    echo ---------------------------------------------------------------
    cscript /nologo %SystemRoot%\system32\slmgr.vbs /upk

pause
exit

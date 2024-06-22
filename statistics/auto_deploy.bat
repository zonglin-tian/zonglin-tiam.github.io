@echo off
REM ʹ�� UTF-8 ���뱣����־�ļ�
REM chcp 65001 > nul
REM ���ÿ���̨����Ϊ ANSI
chcp 437 > nul

REM ���� hexo ����·��
set BLOG_DIR=T:\root\notes\geek_road
REM ������־�ļ�·��
set LOG_FILE=%BLOG_DIR%\source\statistics\ad_log.txt

REM ���� Hexo ��ĿĿ¼
cd /d %BLOG_DIR%

REM ��ȡϵͳ���ں�ʱ��
set currentDate=%date%
set currentTime=%time%
REM ��ʽ����

REM ʹ�� ,. ��Ϊ�ָ���, ��ȡʱ�ͷ�
for /F "tokens=1 delims=,. " %%A in ("%currentTime%") do set timePart=%%A


hexo clean && hexo generate --silent && hexo deploy && if %errorlevel% neq 0 (
    echo Failed to deploy to GitHub Pages
    pause
    exit /b %errorlevel%
) else (
    echo Blog ��������: %currentDate%/%timePart% > %LOG_FILE%
)


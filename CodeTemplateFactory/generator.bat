@echo off
setlocal enabledelayedexpansion

echo 템플릿을 선택하세요:
echo 1) Kotlin Android (MVVM + Hilt)
echo 2) Flutter (Clean Architecture)
echo 3) React Native (Redux + Saga)
echo 4) FastAPI (Python)
echo 5) Node.js (Express)
echo 6) Next.js (Web)

set /p choice=선택 (1-6): 
set /p project_name=프로젝트 이름을 입력하세요: 

if "%choice%"=="1" (
    set /p package_name=패키지 이름을 입력하세요 (예: com.example.app): 
) else if "%choice%"=="4" (
    set /p package_name=패키지 이름을 입력하세요 (예: com.example.app): 
) else if "%choice%"=="5" (
    set /p package_name=패키지 이름을 입력하세요 (예: com.example.app): 
)

if "%choice%"=="1" (
    set template_dir=templates\kotlin-android\mvvm-hilt
    set category=android
) else if "%choice%"=="2" (
    set template_dir=templates\flutter\clean-architecture
    set category=flutter
) else if "%choice%"=="3" (
    set template_dir=templates\react-native\redux-saga
    set category=react-native
) else if "%choice%"=="4" (
    set template_dir=templates\fastapi\clean-architecture
    set category=python
) else if "%choice%"=="5" (
    set template_dir=templates\nodejs\express
    set category=nodejs
) else if "%choice%"=="6" (
    set template_dir=templates\nextjs
    set category=nextjs
) else (
    echo 잘못된 선택입니다.
    exit /b 1
)

set output_dir=output
set category_dir=%output_dir%\%category%
set project_dir=%category_dir%\%project_name%

mkdir "%output_dir%" 2>nul
mkdir "%category_dir%" 2>nul
mkdir "%project_dir%" 2>nul

for /r "%template_dir%" %%f in (*.template) do (
    set "source=%%f"
    set "relative_path=!source:%CD%\%template_dir%\=!"
    set "target_path=%project_dir%\!relative_path:.template=!"
    
    set "target_dir=!target_path:%%~nxf=!"
    if not exist "!target_dir!" mkdir "!target_dir!" 2>nul
    
    if "%choice%"=="1" (
        type "!source!" | powershell -Command "$input | ForEach-Object { $_ -replace '{{ project_name }}','%project_name%' -replace '{{ package_name }}','%package_name%' }" > "!target_path!"
    ) else if "%choice%"=="4" (
        type "!source!" | powershell -Command "$input | ForEach-Object { $_ -replace '{{ project_name }}','%project_name%' -replace '{{ package_name }}','%package_name%' }" > "!target_path!"
    ) else if "%choice%"=="5" (
        type "!source!" | powershell -Command "$input | ForEach-Object { $_ -replace '{{ project_name }}','%project_name%' -replace '{{ package_name }}','%package_name%' }" > "!target_path!"
    ) else (
        type "!source!" | powershell -Command "$input | ForEach-Object { $_ -replace '{{ project_name }}','%project_name%' }" > "!target_path!"
    )
    
    echo 생성된 파일: !relative_path!
)

echo.
echo 프로젝트가 생성되었습니다: %project_name%
echo 위치: %project_dir% 
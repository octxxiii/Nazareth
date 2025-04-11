#!/bin/bash

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 프로젝트 템플릿 생성기 실행 중...${NC}"
echo "템플릿을 선택하세요:"
echo "1) Kotlin Android (MVVM + Hilt)"
echo "2) Flutter (Clean Architecture)"
echo "3) React Native (Redux + Saga)"
echo "4) FastAPI (Python)"
echo "5) Node.js (Express)"
echo "6) Next.js (Web)"

read -p "선택 (1-6): " choice

# 프로젝트 이름 입력
read -p "프로젝트 이름을 입력하세요: " project_name

# 패키지 이름 입력 (Android/FastAPI/Node.js의 경우)
if [[ $choice == "1" || $choice == "4" || $choice == "5" ]]; then
    read -p "패키지 이름을 입력하세요 (예: com.example.app): " package_name
fi

# 템플릿 디렉토리 설정
case $choice in
    1)
        template_dir="templates/kotlin-android/mvvm-hilt"
        ;;
    2)
        template_dir="templates/flutter/clean-architecture"
        ;;
    3)
        template_dir="templates/react-native/redux-saga"
        ;;
    4)
        template_dir="templates/fastapi/clean-architecture"
        ;;
    5)
        template_dir="templates/nodejs/express"
        ;;
    6)
        template_dir="templates/nextjs"
        ;;
    *)
        echo -e "${RED}❌ 잘못된 선택입니다.${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}📋 선택 정보:${NC}"
echo "  언어/플랫폼: $template_dir"
echo "  프로젝트명: $project_name"
echo "  패키지명: $package_name"

# 프로젝트 디렉토리 생성
output_dir="$project_name"
mkdir -p "$output_dir"
cd "$output_dir"

echo -e "\n${GREEN}🔄 프로젝트 구조 생성 중...${NC}"

case $choice in
    1) # Kotlin Android
        # 기본 디렉토리 구조 생성
        mkdir -p "app/src/main/java/$(echo $package_name | tr . /)"
        mkdir -p "app/src/main/res/layout"
        mkdir -p "app/src/main/res/values"
        
        # build.gradle
        sed "s/{{ package_name }}/$package_name/g" \
            "$template_dir/build.gradle.template" > "app/build.gradle"
        
        # settings.gradle
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/settings.gradle.template" > "$output_dir/settings.gradle"
        
        # AndroidManifest.xml
        sed "s/{{ package_name }}/$package_name/g" \
            "templates/$template_dir/AndroidManifest.xml.template" > "$output_dir/app/src/main/AndroidManifest.xml"
        ;;
    2) # Flutter
        # 기본 디렉토리 구조 생성
        mkdir -p "$output_dir/lib/features"
        mkdir -p "$output_dir/lib/core"
        mkdir -p "$output_dir/lib/data"
        
        # pubspec.yaml
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/pubspec.yaml.template" > "$output_dir/pubspec.yaml"
        
        # main.dart
        cp "templates/$template_dir/main.dart.template" "$output_dir/lib/main.dart"
        ;;
    3) # React Native
        # 기본 디렉토리 구조 생성
        mkdir -p "$output_dir/src/features"
        mkdir -p "$output_dir/src/core"
        mkdir -p "$output_dir/src/services"
        
        # package.json
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/package.json.template" > "$output_dir/package.json"
        
        # App.tsx
        cp "templates/$template_dir/App.tsx.template" "$output_dir/App.tsx"
        ;;
    4) # FastAPI
        # 기본 디렉토리 구조 생성
        mkdir -p "$output_dir/app/api"
        mkdir -p "$output_dir/app/core"
        mkdir -p "$output_dir/app/db"
        
        # requirements.txt
        cp "templates/$template_dir/requirements.txt.template" "$output_dir/requirements.txt"
        
        # main.py
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/main.py.template" > "$output_dir/main.py"
        ;;
    5) # Node.js Express
        # 기본 디렉토리 구조 생성
        mkdir -p "$output_dir/src/controllers"
        mkdir -p "$output_dir/src/services"
        mkdir -p "$output_dir/src/models"
        
        # package.json
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/package.json.template" > "$output_dir/package.json"
        
        # app.ts
        cp "templates/$template_dir/app.ts.template" "$output_dir/src/app.ts"
        ;;
    6) # Next.js
        # 기본 디렉토리 구조 생성
        mkdir -p "$output_dir/src/app"
        mkdir -p "$output_dir/src/components"
        mkdir -p "$output_dir/src/lib"
        
        # package.json
        sed "s/{{ project_name }}/$project_name/g" \
            "templates/$template_dir/package.json.template" > "$output_dir/package.json"
        
        # next.config.js
        cp "templates/$template_dir/next.config.js.template" "$output_dir/next.config.js"
        ;;
esac

echo -e "\n${GREEN}🎉 프로젝트 구조가 생성되었습니다! -> $output_dir${NC}" 
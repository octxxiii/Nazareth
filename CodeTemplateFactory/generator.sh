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

# 템플릿 디렉토리와 카테고리 설정
case $choice in
    1)
        template_dir="templates/kotlin-android/mvvm-hilt"
        category="android"
        ;;
    2)
        template_dir="templates/flutter/clean-architecture"
        category="flutter"
        ;;
    3)
        template_dir="templates/react-native/redux-saga"
        category="react-native"
        ;;
    4)
        template_dir="templates/fastapi/clean-architecture"
        category="python"
        ;;
    5)
        template_dir="templates/nodejs/express"
        category="nodejs"
        ;;
    6)
        template_dir="templates/nextjs"
        category="nextjs"
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

# output 및 카테고리 디렉토리 생성
output_dir="output"
category_dir="$output_dir/$category"
project_dir="$category_dir/$project_name"

mkdir -p "$project_dir"

echo -e "\n${GREEN}🔄 프로젝트 구조 생성 중...${NC}"

# 템플릿 파일 복사 및 변수 치환
find "$template_dir" -type f -name "*.template" | while read -r template_file; do
    # 상대 경로 계산
    relative_path=${template_file#$template_dir/}
    target_path="$project_dir/${relative_path%.template}"
    
    # 대상 디렉토리 생성
    target_dir=$(dirname "$target_path")
    mkdir -p "$target_dir"
    
    # 파일 내용 치환 및 복사
    if [[ $choice == "1" || $choice == "4" || $choice == "5" ]]; then
        sed -e "s/{{ project_name }}/$project_name/g" \
            -e "s/{{ package_name }}/$package_name/g" \
            "$template_file" > "$target_path"
    else
        sed -e "s/{{ project_name }}/$project_name/g" \
            "$template_file" > "$target_path"
    fi
    
    echo "생성된 파일: $relative_path"
done

echo -e "\n${GREEN}🎉 프로젝트 구조가 생성되었습니다! -> $project_dir${NC}" 
# Code Template Factory

다양한 플랫폼과 아키텍처를 위한 프로젝트 템플릿 생성기입니다.

## 지원하는 템플릿

1. Kotlin Android (MVVM + Hilt)
2. Flutter (Clean Architecture)
3. React Native (Redux + Saga)
4. FastAPI (Python)
5. Node.js (Express)
6. Next.js (Web)

## 사용 방법

1. 스크립트 실행 권한 부여:
```bash
chmod +x generator.sh
```

2. 스크립트 실행:
```bash
./generator.sh
```

3. 프롬프트에 따라 다음 정보 입력:
   - 템플릿 선택 (1-6)
   - 프로젝트 이름
   - 패키지 이름 (Android/FastAPI/Node.js의 경우)

## 각 템플릿의 특징

### 1. Kotlin Android (MVVM + Hilt)
- MVVM 아키텍처 패턴
- Hilt 의존성 주입
- Room 데이터베이스
- Retrofit 네트워크 통신

MIT 

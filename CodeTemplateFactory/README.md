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
- Coroutines 비동기 처리

### 2. Flutter (Clean Architecture)
- Clean Architecture 패턴
- GetX 상태 관리
- Dio 네트워크 통신
- SharedPreferences 로컬 저장소

### 3. React Native (Redux + Saga)
- Redux 상태 관리
- Redux Saga 미들웨어
- React Navigation
- Axios 네트워크 통신

### 4. FastAPI (Python)
- Clean Architecture 패턴
- SQLAlchemy ORM
- Pydantic 데이터 검증
- JWT 인증
- PostgreSQL 데이터베이스

### 5. Node.js (Express)
- Express.js 웹 프레임워크
- MongoDB 데이터베이스
- JWT 인증
- Express Validator
- Morgan 로깅

### 6. Next.js (Web)
- TypeScript
- Tailwind CSS
- React Query
- Axios
- Headless UI

## 라이선스

MIT 
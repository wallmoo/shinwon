# shinwon mall
- 신원몰-marketA 오라클 버젼
- Spring + java 1.8 + oracle 11g + Maven(3.6.3)으로 구성

## 환경구성
- [Git](https://git-scm.com/) 설치 (형상관리 도구)
    - core.eol 설정 (git line ending 공통화)
    ```shell
    git config --global core.eol lf
    ```
    - core.autocrlf 설정 (LF를 기본 line ending으로 사용)
    ```shell
    git config --global core.autocrlf input
    ```
- [gitlab Clone](http://gitlab.beyondfnc.com/imvely/marketA.git/) 설치
- [Eclipse](https://www.eclipse.org/downloads/) 설치 (개발 Tool)
    - exerd 설치(3.x 이상)
        - eclipse > Help > Install New Software > Work with: http://exerd.com/update/3.x
        - ERD 프로그램
- Git Tool 설치 (형상관리로 인한 히스토리 조회 및 Pull, Patch 등 Request 요청 GUI)
    - 어느거를 쓰든 큰 상관은 없으나 입맛에 마춰서 한번 써보고 선택하길 바랍니다.
        - [Github Desktop](https://desktop.github.com/) (Github에서 제공)
        - [Sourcetree](https://www.sourcetreeapp.com/) 


## Clone 이후 진행
- Eclipse Project Import
- Maven > Update Project
- Run As > Maven build > Goals: compile
- Servers > Tomcat v7.0 이상, 9.0 권장


## Project Folder Structure (주요 폴더 설명, 현재 설명은 많이 부진한 상태 - 차후 보강할 예정임)
- src/main/java/com: 메인 소스 패키지
    - epasscni
    - market
        - mall
            - am: 백오피스 소스
            - batch: 배치 프로그램 소스
            - common
            - dao: 공통 Dao 소스
            - email
            - ifcomm
            - info
            - model
            - ocb
        - util
- src/main/resources: 환경설정파일 저장
    - egovframework
        - message
        - properties: 디비, 프라퍼티 파일관리
        - spring: spring 설정 관리
        - sqlmap
        - mysqlMapper: mybatis 쿼리 소스
- src/main/WEB-INF: 프론트 소스
    - config
    - jsp: Front 화면 소스
        - am: 백오피스 프론트 소스
        - common
        - global
        - info
    - kakaopay:
    - lib
    - tld:

    

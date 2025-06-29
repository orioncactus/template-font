# Template Font

> 리포지터리를 복제하고 이 README를 자유롭게 수정하세요.

## 개요

폰트 템플릿으로, 빠르게 폰트를 검수하고, 웹폰트를 생성할 수 있습니다.

## 기여자

-   [orioncactus](https://github.com/orioncactus): 템플릿 리포지터리 및 자동화 스크립트 제작

-   [black7375](https://github.com/black7375): 웹폰트 자동화 패키지 제작, 모노레포화

-   [jsryudev](https://github.com/jsryudev): 웹폰트 자동화 패키지 개선

---

## 설명

#### 폴더

-   `./sources`: 소스 파일을 두는 곳입니다.
-   `./scripts`: 폰트 생성에 필요한 스크립트를 돌리는 곳입니다.
-   `./packages`: 폰트 패키지, 웹폰트 실행 패키지를 포함한 곳입니다.
-   `./packages/subset-utils`: 웹폰트 자동화를 실행하는 패키지입니다.
-   `./packages/template-font`: 실제 폰트 패키지입니다.
-   `./documentation`: 폰트와 관련한 문서를 둡니다.

#### 소스 파일을 저장할 때

-   Glyphs로 소스 파일을 둔다면, 맥락 구분과 제한 용량 절감을 위해 `.glyphs`가 아닌, `.glyphspackage` 형태로 저장하세요.

#### 폰트 파일

-   otf 및 ttf가 필요합니다.
-   variable은 선택으로, 제외해도 무방합니다.

---

## 바꿀 정보

> 대/소문자 구분을 활성화하고 대치하세요.

###### 제외할 대상

-   `yarn.lock, yarn-*.cjs, ./.yarn`

#### 폰트 이름

> 네이밍 규칙을 같게 맞춰야 합니다.

-   `template-font`
-   `TemplateFont`
-   `Template Font`

#### 제작자 이름

-   `Lorem`
-   `로렘`

#### Vendor Identification

-   `LORM`

#### GitHub 아이디

-   `ipsum`

#### 웹사이트

-   `https://example.com`

#### 이메일 주소

-   `lorem@example.com`

#### 연도

-   `Copyright 2025`
-   `Copyright (c) 2025`
-   `Copyright © 2025`

#### 날짜

> 한국 시간이 아닌, UTC 기준으로 계산합니다.

-   `2025-06-30 15:00:00 +0000`
-   `Mon Jun 30 15:00:00 2025`

#### 버전

-   `@v1.0.0`
-   `"version": "1.0.0"`

###### 바꿀 대상

-   `./package.json, ./packages/*, ./packages/*/documentation/webfonts`

###### 제외할 대상

-   `./packages/subset-utils/*`

#### 디자이너

-   `Original glyphs from Inter by Rasmus Andersson; Redesigned as Template Font by Lorem.`

#### 상표권

-   `Template Font is a trademark of Lorem; Inter UI and Inter is a trademark of rsms.`

#### 폴더 및 파일 이름

> 폴더명은 직접 바꿔줘야 합니다. 네이밍 규칙을 같게 맞춰주세요.

-   `TemplateFont`
-   `template-font`

---

## 폰트 검수

> Glyphs로 내보낸 폰트에서 일부 문제를 해결합니다.

#### 실행하기 전에

-   스크립트를 실행하려면 [python3](https://www.python.org/downloads) 및 [FontTools](https://github.com/fonttools/fonttools)가 설치된 상태여야 합니다.

#### 실행

1. Glyphs로 생성한 폰트 파일을 다음 경로로 옮깁니다.

    - `./scripts/refine/temp`

2. 터미널을 열어 다음 경로로 이동합니다.

    - `cd {리포지터리 폴더}/scripts/refine`

3. `index.sh` 스크립트를 실행합니다.

    ```
    zsh index.sh
    ```

4. 알아서 폰트 파일이 수정되고, 옮겨집니다.

---

## 웹폰트 css

#### 패키지 webfonts 폴더에서

-   필요한 Weight 파일만 두세요. Weight를 일부 지웠거나 추가했다면, 아래 묶음 css 파일 만들기 과정을 계속하세요.
-   아래 경로에 있는 css 파일을 열어 font-weight를 알맞게 수정하세요.
    -   `./static/complete`
    -   `./static/split/*-{Weight}.css`
    -   `./variable/complete`
    -   `./variable/split`
-   `./static/split`에 있는 {폰트 이름}.css 파일을 간단히 수정하려면 아래 과정을 계속하세요.

#### 묶음 css 파일 만들기

> 웹폰트를 쉽게 쓸 수 있도록 split 서브셋에서 Weight별로 나뉘어진 css 파일을 한 파일로 묶는 과정입니다.

1. 터미널을 열어 다음 경로로 이동합니다.

    - `cd {리포지터리 폴더}/scripts/split-css-merge`

2. `index.sh` 스크립트를 실행합니다.

    ```
    zsh index.sh
    ```

3. 이제 각각 나뉘어진 split 서브셋을 묶은 파일을 생성했습니다.

---

## Actions 세팅

> 자동으로 웹폰트를 생성합니다.

#### 실행하기 전에

-   자동으로 웹폰트를 생성하려면 [yarn](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)이 설치된 상태여야 합니다.

```
brew install yarn
```

###### Weight 및 웹폰트 대상 확장자 설정

-   `코멘트` 항목을 검색해,
    -   웹폰트로 생성하려는 Weight로 변경하세요.
    -   otf만 있는 경우 ttf를 otf로 변경하세요.
    -   Variable이 없으면 해당 항목을 삭제하세요.

###### 폴더에서

-   리포지터리 폴더로 터미널을 열어 아래 명령어 실행

```
yarn
```

###### 리포지터리에서

> 이 기능을 활성화해야 GitHub Actions이 웹폰트를 리포지터리에 반영합니다.

-   리포지터리 페이지 → Settings → Actions → General → Workflow permissions 항목에서 `Read and write permissions` 체크

#### 실행

-   main 브랜치에 있고, 커밋할 때 커밋 메시지 앞에 `release:`를 붙이면 실행됩니다.

#### 확인

-   웹폰트가 잘 생성됐는지 확인하려면, 다음 웹페이지를 열어보세요.

    -   `./documentation/check/web/TemplateFont-complete.html`
    -   `./documentation/check/web/TemplateFont-split.html`

---

## jsDelivr

-   jsDelivr를 통해 웹폰트를 제공하려면, 해당 리포지터리가 공개 상태이며, Release를 통해 `v0.0.0` 과 같이 버전 태그를 붙여 배포해야 합니다.

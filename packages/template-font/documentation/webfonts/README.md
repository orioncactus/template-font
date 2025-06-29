# 웹폰트

대표적인 공개 CDN인 jsDelivr를 이용해 폰트를 사용할 수 있습니다.

## font-family

어디서든 동일한 환경을 가지고자 한다면 아래와 같은 font-family 구성을 추천합니다.

```css
font-family: "Template Font Variable", "Template Font", -apple-system, BlinkMacSystemFont, system-ui, "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
```

## 베리어블 Split 서브셋

가장 적은 용량으로 베리어블 속성과 함께 페이지에 포함된 문자만 선택적으로 다운로드해 보다 빠르고 쾌적하게 폰트를 사용하려면 아래 코드를 사용하세요. 사용하는 font-family 이름은 `"Template Font Variable"` 입니다.

#### HTML

```html
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/split/TemplateFontVariable.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/split/TemplateFontVariable.min.css" />
```

#### CSS

```css
@import url("https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/split/TemplateFontVariable.min.css");
```

## 일반 Split 서브셋

오래된 브라우저에도 호환성을 유지하며, 빠르고 쾌적하게 폰트를 사용하려면 아래 코드를 사용하세요. 사용하는 font-family 이름은 `"Template Font"` 입니다.

#### HTML

```html
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/split/TemplateFont.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/split/TemplateFont.min.css" />
```

#### CSS

```css
@import url("https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/split/TemplateFont.min.css");
```

## 일반 웹폰트

모든 기능을 포함한 폰트를 사용하려면 아래 코드를 사용하세요. 사용하는 font-family 이름은 `"Template Font"` 입니다.

#### HTML

```html
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/complete/TemplateFont.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/complete/TemplateFont.min.css" />
```

#### CSS

```css
@import url("https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/static/complete/TemplateFont.min.css");
```

## 베리어블 웹폰트

베리어블 폰트 속성과 함께 모든 기능을 포함한 폰트를 사용하려면 아래 코드를 사용하세요. 사용하는 font-family 이름은 `"Template Font Variable"` 입니다.

#### HTML

```html
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin="anonymous" />
<link rel="preload" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/complete/TemplateFontVariable.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/complete/TemplateFontVariable.min.css" />
```

#### CSS

```css
@import url("https://cdn.jsdelivr.net/gh/ipsum/template-font@v1.0.0/packages/template-font/fonts/webfonts/variable/complete/TemplateFontVariable.min.css");
```

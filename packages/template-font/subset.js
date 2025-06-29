const { FONTFAMILY, getFontList, subsets } = require("subset-utils");

const fontList = getFontList(FONTFAMILY.TemplateFont);
const variable = getFontList(FONTFAMILY.TemplateFont, { variable: true });

subsets(
    // TemplateFont
    ["complete", "woff2", fontList],
    ["split", "woff2", fontList],

    // TemplateFont Variable
    // 코멘트: Variable이 없다면 여기부터 삭제하세요
    ["complete", "woff2", variable],
    ["split", "woff2", variable]
    // 코멘트: Variable이 없다면 여기까지 삭제하세요
);

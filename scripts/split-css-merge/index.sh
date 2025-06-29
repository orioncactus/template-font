#!/bin/zsh

script_dir="$(cd "$(dirname "$0")" && pwd)"
package_path="$script_dir/../../packages"

# 폰트 설정
font_configs=(
    "TemplateFont:template-font" # 옵션: 다른 폰트 패키지를 추가한다면 여기 복제 후 이름 바꾸기
)

# 웨이트 순서
weights=("Black" "ExtraBold" "Bold" "SemiBold" "Medium" "Regular" "Light" "ExtraLight" "Thin") # 코멘트: 해당하는 Weight 대응

echo "Merging CSS files..."

for config in "${font_configs[@]}"; do
    font_name="${config%:*}"
    package_dir="${config#*:}"
    
    split_dir="$package_path/$package_dir/fonts/webfonts/static/split"
    output_file="$split_dir/$font_name.css"
    
    [[ ! -d "$split_dir" ]] && { echo "Directory not found: $split_dir"; continue; }
    
    : > "$output_file"
    count=0
    
    for weight in "${weights[@]}"; do
        css_file="$split_dir/$font_name-$weight.css"
        if [[ -f "$css_file" ]]; then
            echo "- $weight"
            [[ $count -gt 0 ]] && echo -e "\n" >> "$output_file"
            cat "$css_file" >> "$output_file"
            ((count++))
        fi
    done
    
    if [[ $count -gt 0 ]]; then
        echo "Done!"
    else
        echo "Error; No CSS files found."
        rm -f "$output_file"
    fi
done

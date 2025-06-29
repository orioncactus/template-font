#!/bin/zsh
set -e

script_dir="$(cd "$(dirname "$0")" && pwd)"
temp_path="$script_dir/temp"
package_path="$script_dir/../../packages"

font_configs=(
    "TemplateFont:template-font" # 옵션: 다른 폰트 패키지를 추가한다면 여기 복제 후 다음 줄에 이름 바꾸기
)


echo "Converting fonts to ttx..."
font_files=($(find "$temp_path" -maxdepth 1 -type f \( -name "*.ttf" -o -name "*.otf" \)))

if [[ ${#font_files[@]} -eq 0 ]]; then
    echo "Error: No TTF or OTF files found"
    exit 1
else
    for fonts_file in "${font_files[@]}"; do
        ttx "$fonts_file"
        rm "$fonts_file"
    done
fi


echo "Adding Macintosh Name Table..."
python3 "$script_dir/add-namerecord.py"


echo "Fixing Font Creation Date..."
python3 "$script_dir/fix-date.py"


echo "Fixing Unintended strings..."
python3 "$script_dir/fix-string.py"

if find "$temp_path" -type f -name '*VF.ttx' -print -quit | grep -q '.'; then
    echo "Adding Suffix from Variable..."
    python3 "$script_dir/rename.py"
fi


echo "Converting fonts..."
for fonts_file in "$temp_path"/*.ttx; do
    ttx "$fonts_file"
    rm "$fonts_file"
done

if find "$temp_path" -type f -name '*VF.ttf' | read; then
    echo "Fixing Variable file name..."
    find "$temp_path" -type f -name '*VF.ttf' -print0 | while IFS= read -r -d '' fonts_file; do
        mv "$fonts_file" "${fonts_file/VF/Variable}"
    done
fi


echo "Moving files to appropriate directories..."

for fonts_file in "$temp_path"/*; do
    filename=$(basename "$fonts_file")
    
    for config in "${font_configs[@]}"; do
        font_pattern="${config%:*}"
        package_dir="${config#*:}"
        font_path="$package_path/$package_dir/fonts"
        
        if [[ $filename == ${font_pattern}-* || $filename == ${font_pattern}Variable.* ]]; then
            if [[ $filename == *.otf ]]; then
                target_path="$font_path/otf"
            elif [[ $filename == *.ttf && $filename != *"Variable"* ]]; then
                target_path="$font_path/ttf"
            elif [[ $filename == *.ttf && $filename == *"Variable"* ]]; then
                target_path="$font_path/variable"
            fi
            
            if [[ -n "$target_path" ]]; then
                mkdir -p "$target_path"
                mv "$fonts_file" "$target_path"
                break
            fi
        fi
    done
done


echo "Done!"

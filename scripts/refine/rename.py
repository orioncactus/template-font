import os

script_dir = os.path.dirname(os.path.abspath(__file__))
folder_path = os.path.join(script_dir, 'temp/')


def process_file(file_path, replacements):
    with open(file_path, 'r') as file:
        filedata = file.read()

    for search, replace in replacements.items():
        filedata = filedata.replace(search, replace)

    with open(file_path, 'w') as file:
        file.write(filedata)


file_suffixes = [
    'VF',  # 옵션: 다른 폰트 패키지를 추가한다면 뒤에 서브 패밀리 이름 추가, ex) 'VF', 'StdVF'
]

file_name_list = [
    # 옵션: 다른 폰트 패키지를 추가한다면 여기부터 복제 후 이름 바꾸기
    {
        'TemplateFont': 'TemplateFontVariable',
        'Template Font': 'Template Font Variable'
    },
    # 옵션: 다른 폰트 패키지를 추가한다면 여기까지 복제 후 이름 바꾸기
]

for suffix, file_name in zip(file_suffixes, file_name_list):
    file_path = os.path.join(folder_path, f'TemplateFont{suffix}.ttx')
    if os.path.exists(file_path):
        process_file(file_path, file_name)
        file_name_print = os.path.basename(file_path)
        print(f"Renamed: {file_name_print}")
    else:
        print(f"File does not exist: {os.path.basename(file_path)}")

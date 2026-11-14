# Bổ sung và cập nhật template

Mỗi template cần dùng độc lập khi sao chép ra ngoài repo. Lệnh quản lý và CI nhận diện template qua `template.json`, không cần sửa danh sách đường dẫn trong script.

## Cấu trúc của một mẫu

Chọn một nhóm trong `templates/`, ví dụ `reports`, `papers`, hoặc thêm nhóm mới như `theses`. Đặt tên thư mục và ID dạng chữ thường, ngăn bằng dấu gạch nối:

```text
templates/<nhom>/<ten-template>/
|-- .vscode/
|   |-- extensions.json
|   `-- settings.json
|-- config/              # Nếu cần tách cấu hình
|-- content/             # Nếu cần tách nội dung
|-- images/              # Ảnh/logo nguồn
|-- .gitignore
|-- latexmkrc
|-- main.tex
|-- references.bib       # Nếu có trích dẫn
|-- template.json
|-- LICENSE
|-- NOTICE.md
`-- README.md
```

## Quy trình thêm mẫu

1. Sao chép một template gần với nhu cầu; bỏ `build/` và nội dung đề tài cá nhân.
2. Đổi ID, tên, mô tả và danh sách file gốc trong `template.json`.
3. Kiểm tra `latexmkrc`: chọn đúng engine, xuất PDF/file phụ vào `build/`, cho BibTeX tìm thấy dữ liệu từ thư mục dự án.
4. Giữ cấu hình VS Code tự chứa trong template. Cấu hình chung gọi `latexmk` từ thư mục file gốc và đọc engine từ `latexmkrc`.
5. Viết README nêu rõ mục đích, nơi sửa thông tin, nơi viết nội dung, cách build, output, phụ thuộc đặc biệt và nguồn/giấy phép nếu có.
6. Thêm một hàng vào bảng template trong README gốc.
7. Build từ thư mục repo, kiểm tra PDF và thử sao chép mẫu ra ngoài repo.

Ví dụ metadata:

```json
{
  "id": "ten-template",
  "name": "Tên hiển thị",
  "description": "Mô tả ngắn về mẫu",
  "category": "reports",
  "language": "vi",
  "engine": "pdflatex",
  "entrypoints": ["main.tex"]
}
```

`id` phải duy nhất trong repo. `entrypoints` là mảng tên file `.tex` nằm ngay tại thư mục template, ví dụ `["main.tex", "slides.tex"]`. File nội dung được `\input` không đưa vào mảng này. `engine` ghi nhận engine thực tế (`pdflatex`, `xelatex` hoặc `lualatex`); chế độ build được cấu hình trong `latexmkrc`, vì vậy hai nơi phải khớp nhau.

Nếu mẫu có package hệ thống mới, cập nhật hướng dẫn cài đặt và danh sách package trong workflow CI khi cần.

## Kiểm tra trước khi đưa vào repo

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1 -Template ten-template -Rebuild
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1
git status --short
```

- PDF hoàn chỉnh, không còn trích dẫn/tham chiếu chưa giải quyết ở lượt build cuối.
- Mẫu vẫn build được sau khi sao chép ra một thư mục riêng, kể cả đường dẫn có khoảng trắng.
- Tên và đường dẫn khớp cả chữ hoa/chữ thường để chạy được trên Linux.
- Mọi output ở `build/`; không đưa log, PDF sinh ra hoặc bài làm cá nhân vào commit.
- Dùng đường dẫn tương đối, lưu UTF-8; giữ thông báo tác giả và giấy phép của thành phần được tái sử dụng.

Các mẫu hiện tại không cần Python, Node.js hay package manager JavaScript để sử dụng. Script dùng Windows PowerShell 5.1 hoặc PowerShell 7+.

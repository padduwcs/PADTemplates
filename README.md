# LaTeX Templates

Bộ sưu tập template LaTeX cho báo cáo, slide và bài báo, kèm cấu hình để soạn trên máy cá nhân bằng VS Code. Mỗi template dùng độc lập, xuất PDF và file phụ vào `build/`, và có thể bổ sung dần mà không sửa lại các lệnh quản lý của repo.

## Bắt đầu

1. Cài môi trường theo [hướng dẫn cài đặt](docs/installation.md). Cấu hình Windows dùng **VS Code + MiKTeX + Strawberry Perl + LaTeX Workshop**.
2. Clone repo hoặc tải ZIP, rồi mở thư mục repo bằng VS Code.
3. Chạy kiểm tra trong PowerShell tại thư mục repo:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-environment.ps1
   ```

4. Tạo bài làm riêng từ một template:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\new-project.ps1 -Template hcmus-course-report -Destination .\projects\bao-cao-cua-toi
   code .\projects\bao-cao-cua-toi
   ```

5. Sửa thông tin và nội dung theo README của template. Lưu file, mở `main.tex`, nhấn **Ctrl + Alt + B** để build, rồi **Ctrl + Alt + V** để xem PDF.

`projects/` là nơi làm bài cá nhân và được Git bỏ qua. Bạn cũng có thể chọn một thư mục ngoài repo làm đích. Script không sao chép `build/` và không ghi đè thư mục đã có.

## Các template hiện có

| ID | Template | File gốc | Ngôn ngữ |
| --- | --- | --- | --- |
| `hcmus-course-report` | [Báo cáo môn học HCMUS](templates/reports/hcmus-course-report/) | `main.tex` | Tiếng Việt |
| `hcmus-report-slides` | [Báo cáo và slide HCMUS](templates/reports/hcmus-report-slides/) | `main.tex`, `slides.tex` | Tiếng Việt |
| `springer-lncs` | [Bài báo Springer LNCS](templates/papers/springer-lncs/) | `main.tex` | Tiếng Anh |

Cả ba mẫu hiện dùng **pdfLaTeX + BibTeX**, do `latexmk` điều phối. Với mẫu báo cáo và slide, thông tin nhóm được dùng chung, còn nội dung slide được viết riêng.

## Cấu trúc

```text
.
|-- .github/workflows/      # Build tự động khi push / mở pull request
|-- .vscode/               # Cấu hình khi mở cả repo
|-- docs/                  # Cài đặt, sử dụng, khắc phục lỗi
|-- scripts/               # Kiểm tra môi trường, tạo bài mới, build tất cả
|-- templates/
|   |-- reports/
|   |   |-- hcmus-course-report/
|   |   `-- hcmus-report-slides/
|   `-- papers/
|       `-- springer-lncs/
|-- CONTRIBUTING.md         # Quy ước bổ sung template
|-- LICENSE
`-- README.md
```

Mỗi template có `.vscode/`, `latexmkrc`, `.gitignore`, `template.json` và README riêng. Sao chép cả thư mục template là đủ; không cần đường dẫn hoặc gói lệnh riêng nằm ngoài thư mục đó.

## Các lệnh thường dùng

Chạy tại thư mục repo trong PowerShell:

```powershell
# Xem các ID template
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\new-project.ps1 -List

# Build mọi file gốc trong mọi template
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1

# Chỉ build một template
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1 -Template hcmus-report-slides
```

Để build trực tiếp bằng terminal, vào thư mục template hoặc bài làm trước:

```powershell
cd .\templates\reports\hcmus-course-report
latexmk main.tex
```

PDF nằm tại `build/main.pdf`. Với slide, chạy `latexmk slides.tex` và mở `build/slides.pdf`. Nếu dùng PowerShell 7, thay `powershell` bằng `pwsh`.

## Soạn trong VS Code

- **Ctrl + Alt + B** build tài liệu gốc của tab `.tex` đang chọn.
- **Ctrl + Alt + V** mở PDF tương ứng đã có; phím này không build lại.
- Tự động build khi lưu đang tắt. Lưu file rồi build khi muốn cập nhật PDF.
- Có thể mở cả repo hoặc mở riêng một template/bài làm; hai cách đều đưa output vào `build/` của dự án tương ứng.

Xem [cách sử dụng](docs/usage.md), [khắc phục lỗi](docs/troubleshooting.md), [cách thêm template](CONTRIBUTING.md) và [đưa repo lên GitHub](docs/repository.md).

## Kiểm tra tự động

GitHub Actions đọc các file `template.json`, build tất cả tài liệu đã khai báo và cung cấp PDF trong artifact `template-pdfs`. Thêm template theo quy ước sẽ được đưa vào lần kiểm tra tiếp theo. PDF và file build không được đưa vào lịch sử Git.

## Giấy phép

[MIT](LICENSE) cho phần thuộc quyền sở hữu của người duy trì và người đóng góp. Logo, class, package và tài nguyên bên thứ ba giữ điều kiện riêng; xem [NOTICE](NOTICE.md).

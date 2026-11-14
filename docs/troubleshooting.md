# Khắc phục lỗi

## Không tìm thấy `latexmk`, `pdflatex` hoặc `perl`

Đóng rồi mở lại VS Code sau khi cài. Chạy `Get-Command latexmk,pdflatex,perl` trong PowerShell để xem PATH. Nếu thiếu `latexmk`, cài package `latexmk` bằng MiKTeX Console. Nếu thiếu Perl trên Windows dùng MiKTeX, cài Strawberry Perl theo [hướng dẫn cài đặt](installation.md).

## PowerShell không cho chạy script

Dùng lệnh cho riêng tiến trình hiện tại:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-environment.ps1
```

Không cần thay đổi ExecutionPolicy toàn máy. Các script chạy được với Windows PowerShell 5.1 hoặc PowerShell 7+.

## `File ... .sty not found` hoặc thiếu `llncs.cls`

Mở MiKTeX Console, cập nhật package và bật cài package thiếu tự động. Có thể tìm package trong tab Packages; các tên quan trọng nằm trong [hướng dẫn cài đặt](installation.md#các-package-mà-mẫu-sử-dụng). Kiểm tra một file bằng `kpsewhich llncs.cls` hoặc `kpsewhich vietnam.sty`.

## `Ctrl + Alt + V` mở sai PDF hoặc báo không có PDF

1. Chọn lại đúng tab `main.tex` hoặc `slides.tex`.
2. Lưu và build bằng `Ctrl + Alt + B`, đợi hoàn tất.
3. Nhấn `Ctrl + Alt + V`. PDF phải nằm trong `build/` của template đó.

Nếu đã sao chép riêng template, kiểm tra đã mang theo `.vscode/settings.json` và `latexmkrc`. Nếu đang mở một thư mục bao ngoài repo, hãy mở trực tiếp repo hoặc dự án để cấu hình VS Code có hiệu lực. PDF cũ ở ngoài `build/` không phải output hiện tại.

## Lưu file nhưng PDF không thay đổi

Repo đặt `latex-workshop.latex.autoBuild.run` là `never`. Lưu file rồi build thủ công. Có thể đổi thành `onSave` trong cấu hình của bài làm nếu muốn tự build khi lưu.

## Mục lục hoặc trích dẫn hiện `??`

Dùng `latexmk` để chương trình chạy đủ các lượt LaTeX/BibTeX. Kiểm tra khóa trong `\cite{...}` khớp với `references.bib`; không biên dịch riêng file trong `content/`.

Sau khi đổi tên hoặc di chuyển nhiều file, chạy lại mọi lượt cho một template từ thư mục repo:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1 -Template hcmus-course-report -Rebuild
```

## Tiếng Việt bị lỗi

Lưu file bằng UTF-8. Hai mẫu báo cáo đã cấu hình tiếng Việt và font phù hợp với pdfLaTeX. Mẫu Springer LNCS hiện dành cho tiếng Anh; cần điều chỉnh cấu hình ngôn ngữ trước khi viết tiếng Việt trong mẫu đó.

Ký tự đặc biệt cần viết dưới dạng lệnh: `100\%`, `\&`, `ten\_bien`. Trong code dài hoặc URL, dùng môi trường/lệnh phù hợp thay vì chèn nguyên văn vào đoạn thường.

## PDF không ghi đè được

Đóng PDF nếu một ứng dụng bên ngoài đang khóa file. Dùng viewer của LaTeX Workshop trong VS Code, rồi build lại.

## Cần xem lỗi chi tiết

Mở Output → LaTeX Workshop hoặc đọc `build/main.log` / `build/slides.log`. Ưu tiên lỗi đầu tiên có tên file và số dòng. Chạy lại lệnh terminal ngay tại thư mục template để tách lỗi biên dịch khỏi lỗi phím tắt.

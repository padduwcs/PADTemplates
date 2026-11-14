# Báo cáo và slide HCMUS

Báo cáo tiếng Việt 12pt, giãn dòng 1.5; slide Beamer 16:9.

- `config/info.tex`: thông tin môn học, đề tài và nhóm dùng chung.
- `content/`: nội dung báo cáo; bảng phân công ở `content/general.tex`.
- `slides.tex`: nội dung slide, viết riêng với báo cáo.
- `images/`: ảnh. `references.bib`: tài liệu tham khảo, trích dẫn bằng `\cite{khoa}`.

Mở thư mục này trong VS Code, sửa và lưu, chọn `main.tex` hoặc `slides.tex` rồi build. Hoặc chạy tại đây:

```sh
latexmk main.tex
latexmk slides.tex
```

PDF: `build/main.pdf`, `build/slides.pdf`. VS Code: **Ctrl + Alt + B / V** để build / xem PDF; macOS dùng **Cmd + Option + B / V**.

Khi thay tài liệu mẫu, bỏ `\nocite{example}` trong `config/references.tex`.

[MIT](LICENSE) cho phần do người đóng góp sở hữu. Logo, class và package LaTeX giữ quyền và giấy phép riêng.

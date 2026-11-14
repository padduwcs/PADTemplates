# Báo cáo môn học HCMUS

Báo cáo tiếng Việt, A4, 12pt, giãn dòng 1.3.

- `main.tex`: môn học, đề tài, lớp, ngày và thứ tự các phần.
- `config/frontpage.tex`: giảng viên, sinh viên, MSSV.
- `content/`: nội dung; thêm phần bằng `\input{content/ten-file}` trong `main.tex`.
- `images/`: ảnh. `references.bib`: tài liệu tham khảo, trích dẫn bằng `\cite{khoa}`.

Mở thư mục này trong VS Code, sửa và lưu, chọn `main.tex` rồi build. Hoặc chạy tại đây:

```sh
latexmk main.tex
```

PDF: `build/main.pdf`. VS Code: **Ctrl + Alt + B / V** để build / xem PDF; macOS dùng **Cmd + Option + B / V**.

Khi thay tài liệu mẫu, bỏ `\nocite{example}` trong `config/references.tex`.

[MIT](LICENSE) cho phần do người đóng góp sở hữu. Logo, class và package LaTeX giữ quyền và giấy phép riêng.

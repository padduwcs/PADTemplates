# Báo cáo môn học HCMUS

Template báo cáo tiếng Việt, khổ A4, class `article`, cỡ chữ 12pt, giãn dòng 1.3. Có bìa, lời nói đầu, tóm tắt, mục lục, nội dung, phụ lục và tài liệu tham khảo.

## Bắt đầu

1. Mở chính thư mục này trong VS Code. Máy cần có bộ TeX, Perl và extension LaTeX Workshop.
2. Sửa thông tin ở đầu `main.tex`: môn học, mã môn, loại báo cáo, đề tài, lớp, học kỳ, ngày.
3. Sửa giảng viên, sinh viên và MSSV trong `config/frontpage.tex`.
4. Viết nội dung trong `content/`, lưu và chọn `main.tex`.
5. Nhấn `Ctrl + Alt + B` để build, rồi `Ctrl + Alt + V` để xem `build/main.pdf`.

Hoặc chạy tại thư mục này:

```shell
latexmk main.tex
```

Tự động build khi lưu đang tắt. Mỗi khi cần cập nhật PDF, lưu rồi build lại.

## Các file cần sửa

| Đường dẫn | Nội dung |
| --- | --- |
| `main.tex` | Thông tin báo cáo và thứ tự các phần |
| `config/frontpage.tex` | Danh sách giảng viên, sinh viên |
| `config/preamble.tex` | Gói lệnh, lề, header/footer, style code |
| `content/preface.tex` | Lời nói đầu |
| `content/abstract.tex` | Tóm tắt |
| `content/introduction.tex` | Giới thiệu |
| `content/background.tex` | Cơ sở lý thuyết |
| `content/main-content.tex` | Nội dung thực hiện |
| `content/results.tex` | Kết quả và đánh giá |
| `content/conclusion.tex` | Kết luận |
| `content/appendix.tex` | Phụ lục, phân công |
| `images/` | Logo và ảnh minh họa |
| `references.bib` | Dữ liệu BibTeX |
| `config/references.tex` | Cách hiển thị tài liệu tham khảo |

## Tùy chỉnh

- Thêm phần mới: tạo file trong `content/` rồi thêm `\input{content/ten-file}` vào `main.tex`.
- Mỗi file nội dung giữ dòng `% !TEX root = ../main.tex` để build đúng báo cáo khi đang sửa file đó.
- Bật danh mục hình/bảng: bỏ `%` trước dòng chứa `\listoffigures` / `\listoftables` trong `main.tex`.
- Chèn ảnh bằng `\includegraphics{images/ten-anh.png}`. Tên file không dấu, không khoảng trắng.
- Trích dẫn bằng `\cite{khoa}` với khóa trong `references.bib`. Khi đã có trích dẫn thật, xóa `\nocite{example}` trong `config/references.tex`.

## Sao chép và giấy phép

Giữ `.vscode/`, `.gitignore`, `latexmkrc` và các file nguồn khi sao chép. Có thể bỏ `build/`; thư mục này sẽ được tạo lại. Cấu hình không phụ thuộc thư mục cha của repo.

[MIT](LICENSE) cho phần thuộc quyền sở hữu của người đóng góp; [NOTICE](NOTICE.md) nêu phạm vi và các thành phần bên thứ ba.

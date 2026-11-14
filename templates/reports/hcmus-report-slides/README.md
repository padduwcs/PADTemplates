# Báo cáo và slide HCMUS

Template báo cáo tiếng Việt 12pt, giãn dòng 1.5, kèm bộ khung slide Beamer 16:9. Hai tài liệu dùng chung thông tin môn học, đề tài và nhóm trong `config/info.tex`.

## Bắt đầu

1. Mở chính thư mục này trong VS Code. Máy cần có bộ TeX, Perl và extension LaTeX Workshop.
2. **Sửa `config/info.tex` trước:** tên môn, loại báo cáo, đề tài, ngày, danh sách thành viên, giảng viên, trường.
3. Viết báo cáo trong `content/`. Viết slide riêng trong `slides.tex`.
4. Chọn `main.tex` hoặc `slides.tex`, lưu rồi nhấn `Ctrl + Alt + B`.
5. Nhấn `Ctrl + Alt + V` để xem PDF của tài liệu đang chọn.

Hoặc chạy tại thư mục này:

```shell
latexmk main.tex
latexmk slides.tex
```

Output tương ứng là `build/main.pdf` và `build/slides.pdf`. Tự động build khi lưu đang tắt.

## Các file cần sửa

| Đường dẫn | Nội dung |
| --- | --- |
| `config/info.tex` | Thông tin dùng chung cho báo cáo và slide |
| `main.tex` | Cấu hình báo cáo và thứ tự các phần |
| `content/title.tex` | Bố cục bìa |
| `content/general.tex` | Thành viên, phân công, cấu trúc bài nộp |
| `content/introduction.tex` | Mở đầu |
| `content/theory.tex` | Cơ sở lý thuyết |
| `content/implementation.tex` | Nội dung thực hiện |
| `content/conclusion.tex` | Kết luận |
| `slides.tex` | Nội dung thuyết trình, khung 5 trang mẫu |
| `hcmus-report-template.sty` | Gói lệnh, style code, header/footer |
| `images/` | Logo và ảnh minh họa |
| `references.bib` | Dữ liệu BibTeX |
| `config/references.tex` | Cách hiển thị tài liệu tham khảo |

Thông tin thành viên trong bảng phân công `content/general.tex` cần cập nhật riêng cho phù hợp công việc thực tế.

## Thêm nội dung

- Báo cáo: tạo file trong `content/`, giữ `% !TEX root = ../main.tex`, rồi thêm dòng `\input` tương ứng vào `main.tex`.
- Slide: thêm một môi trường `frame` vào `slides.tex`:

  ```latex
  \begin{frame}{Tiêu đề trang}
      Nội dung trình bày.
  \end{frame}
  ```

- Chèn ảnh bằng `\includegraphics{images/ten-anh.png}`.
- Trích dẫn trong báo cáo bằng `\cite{khoa}` với khóa trong `references.bib`. Xóa `\nocite{example}` trong `config/references.tex` khi đã thay tài liệu mẫu.

## Sao chép và giấy phép

Giữ `.vscode/`, `.gitignore`, `latexmkrc` và các file nguồn khi sao chép; bỏ `build/` nếu không cần bản PDF cũ. Cả báo cáo và slide có thể dùng độc lập với thư mục cha của repo.

[MIT](LICENSE) cho phần thuộc quyền sở hữu của người đóng góp; xem [NOTICE](NOTICE.md) cho thành phần bên thứ ba.

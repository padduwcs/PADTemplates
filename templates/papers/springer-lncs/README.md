# Bài báo Springer LNCS

Template bài báo tiếng Anh dùng class `llncs`, style tài liệu tham khảo `splncs04`, có ORCID, thông tin cơ quan và khung các mục nghiên cứu. Engine hiện tại: **pdfLaTeX**, tài liệu tham khảo: **BibTeX**.

## Bắt đầu

1. Mở chính thư mục này trong VS Code. Máy cần có bộ TeX, Perl và LaTeX Workshop.
2. Sửa `main.tex`: `\title`, `\titlerunning`, `\author`, `\authorrunning`, `\institute`, email và ORCID. Xóa hoặc thay các ORCID mẫu.
3. Viết abstract, keywords và các section trong `main.tex`.
4. Thêm tài liệu thật vào `references.bib`, trích dẫn bằng `\cite{khoa}`.
5. Lưu, chọn `main.tex`, nhấn `Ctrl + Alt + B` rồi `Ctrl + Alt + V`.

Hoặc chạy tại thư mục này:

```shell
latexmk main.tex
```

PDF nằm ở `build/main.pdf`. Tự động build khi lưu đang tắt.

## Hình và cấu trúc

- Đặt ảnh trong `images/`. Có sẵn `\graphicspath{{images/}}`, nên dùng `\includegraphics{ten-anh.png}`.
- Nội dung hiện có các mục Introduction, Related Work, Method, Experiments, Conclusion và Acknowledgement.
- Nếu tách nội dung ra file riêng, dùng `\input{content/ten-file}` và thêm dòng `% !TEX root = ../main.tex` ở đầu file trong `content/`.
- Các file `llncs.cls` và `splncs04.bst` được cung cấp bởi bộ TeX; không cần chép từ máy khác. Khi thiếu, cài package `llncs` qua trình quản lý package.

Mẫu hiện cấu hình cho tiếng Anh. Khi nộp bài, đối chiếu yêu cầu cụ thể của hội nghị với [hướng dẫn Springer Nature](https://www.springernature.com/gp/authors/publish-a-book/step-by-step-conference-proceedings).

## Sao chép và giấy phép

Giữ `.vscode/`, `.gitignore`, `latexmkrc` và các file nguồn khi sao chép. `build/` sẽ được tạo lại; template không phụ thuộc thư mục cha của repo.

[MIT](LICENSE) cho phần thuộc quyền sở hữu của người đóng góp; class, package và các thành phần khác giữ điều kiện riêng trong [NOTICE](NOTICE.md).

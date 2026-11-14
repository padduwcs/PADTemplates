# Bài báo Springer LNCS

Bài báo tiếng Anh, class `llncs`, dùng pdfLaTeX và BibTeX.

- `main.tex`: tiêu đề, tác giả, cơ quan, email, ORCID và nội dung. Thay các thông tin mẫu trước khi nộp.
- `references.bib`: tài liệu tham khảo, trích dẫn bằng `\cite{khoa}`.
- Ảnh đặt trong `images/`, chèn bằng `\includegraphics{ten-anh.png}`.

Mở thư mục này trong VS Code, sửa và lưu, chọn `main.tex` rồi build. Hoặc chạy tại đây:

```sh
latexmk main.tex
```

PDF: `build/main.pdf`. VS Code: **Ctrl + Alt + B / V** để build / xem PDF; macOS dùng **Cmd + Option + B / V**.

[MIT](LICENSE) cho phần do người đóng góp sở hữu. Class, font và package LaTeX giữ giấy phép riêng; đối chiếu [yêu cầu của Springer Nature](https://www.springernature.com/gp/authors/publish-a-book/step-by-step-conference-proceedings) khi nộp bài.

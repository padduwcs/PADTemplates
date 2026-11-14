# LaTeX Templates

Các mẫu báo cáo, slide và bài báo. Chọn mẫu, sửa nội dung và xuất PDF trên Windows, macOS hoặc Linux.

## Chuẩn bị

Cài [VS Code](https://code.visualstudio.com/) và extension **LaTeX Workshop** của James Yu. Sau đó cài bộ LaTeX theo hệ điều hành:

| Hệ điều hành | Cài đặt |
| --- | --- |
| Windows | [MiKTeX](https://miktex.org/download) + [Strawberry Perl](https://strawberryperl.com/) |
| macOS | [MacTeX](https://tug.org/mactex/) |
| Linux | [TeX Live](https://tug.org/texlive/quickinstall.html), bản đầy đủ |

**Đã có công cụ thì dùng tiếp, chỉ cài phần thiếu.** Có MiKTeX hoặc TeX Live đang hoạt động thì dùng bộ hiện tại; nếu `latexmk -v` chạy được thì không cần cài Perl riêng. Với MiKTeX, bật tự cài package thiếu trong MiKTeX Console. Mở lại VS Code sau khi cài.

## Chọn mẫu

| Mẫu | Dùng cho |
| --- | --- |
| [hcmus-course-report](templates/reports/hcmus-course-report/) | Báo cáo môn học tiếng Việt |
| [hcmus-report-slides](templates/reports/hcmus-report-slides/) | Báo cáo tiếng Việt kèm slide |
| [springer-lncs](templates/papers/springer-lncs/) | Bài báo tiếng Anh theo mẫu LNCS |

## Bắt đầu

1. Clone repo hoặc tải ZIP.
2. Sao chép **cả thư mục mẫu** muốn dùng ra nơi làm bài riêng, giữ cả `.vscode` và `latexmkrc`.
3. Mở thư mục vừa sao chép trong VS Code. Sửa thông tin và nội dung theo README của mẫu.
4. Lưu file, chọn `main.tex`, nhấn **Ctrl + Alt + B** để build, rồi **Ctrl + Alt + V** để xem PDF. Trên macOS dùng **Cmd + Option + B / V**.

Hoặc dùng terminal tại thư mục bài làm, với editor bất kỳ:

```sh
latexmk main.tex
```

PDF nằm trong **`build/main.pdf`**. Với slide, chọn `slides.tex` hoặc chạy `latexmk slides.tex`; PDF là `build/slides.pdf`. Mỗi lần sửa, lưu và build lại để cập nhật PDF.

Xem thêm: [cài đặt chi tiết](docs/installation.md) · [khắc phục lỗi](docs/troubleshooting.md) · [thêm template](CONTRIBUTING.md).

[MIT](LICENSE) cho phần do người đóng góp sở hữu; xem [NOTICE](NOTICE.md) cho thành phần bên thứ ba.

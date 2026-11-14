# LaTeX Templates

Các mẫu LaTeX dùng độc lập trên Windows, macOS và Linux.

## Chuẩn bị

Cài [VS Code](https://code.visualstudio.com/), extension **LaTeX Workshop** và bộ LaTeX:

| Hệ điều hành | Cài đặt |
| --- | --- |
| Windows | [MiKTeX](https://miktex.org/download) + [Strawberry Perl](https://strawberryperl.com/) |
| macOS | [MacTeX](https://tug.org/mactex/) |
| Linux | [TeX Live](https://tug.org/texlive/quickinstall.html), bản đầy đủ |

Đã có công cụ thì dùng tiếp, chỉ bổ sung phần thiếu. Với MiKTeX, bật tự cài package thiếu. Mở lại VS Code sau khi cài.

## Chọn mẫu

| Mẫu | Dùng cho |
| --- | --- |
| [hcmus-course-report](templates/hcmus-course-report/) | Báo cáo môn học tiếng Việt |
| [hcmus-report-slides](templates/hcmus-report-slides/) | Báo cáo tiếng Việt kèm slide |
| [springer-lncs](templates/springer-lncs/) | Bài báo tiếng Anh theo mẫu LNCS |

## Bắt đầu

1. Clone hoặc tải ZIP, rồi sao chép **cả thư mục mẫu** ra nơi làm bài riêng.
2. Mở thư mục đó trong VS Code, sửa nội dung theo README của mẫu.
3. Lưu, chọn `main.tex`: **Ctrl + Alt + B** để build, **Ctrl + Alt + V** để xem PDF. macOS dùng **Cmd + Option + B / V**.

Hoặc chạy trong terminal tại thư mục bài làm:

```sh
latexmk main.tex
```

PDF ở `build/main.pdf`. Slide: `latexmk slides.tex` → `build/slides.pdf`. Sau mỗi lần sửa, lưu và build lại.

Thêm mẫu: tạo thư mục trong `templates/` có `main.tex`, `latexmkrc`, `.vscode/` và README ngắn; thêm vào bảng trên. Có thể sao chép một mẫu sẵn có để bắt đầu.

Thiếu lệnh: kiểm tra đã cài bộ LaTeX và mở lại VS Code. Thiếu package: cài bằng trình quản lý của bộ LaTeX đang dùng.

[MIT](LICENSE) cho phần do người đóng góp sở hữu. Logo, class, package và tài nguyên bên thứ ba giữ quyền và giấy phép riêng.

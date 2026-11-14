# PADTemplates

**Preconfigured Academic Document Templates** — Các mẫu LaTeX dùng độc lập trên Windows, macOS và Linux.

## Cài nhanh

Chọn đúng hệ điều hành và chỉ cài phần còn thiếu. Nếu đã có bộ LaTeX đang hoạt động, dùng tiếp bộ đó.

**Windows — PowerShell** (cần [WinGet](https://learn.microsoft.com/windows/package-manager/winget/)):

```powershell
winget install -e --id Microsoft.VisualStudioCode --no-upgrade
winget install -e --id MiKTeX.MiKTeX --no-upgrade
winget install -e --id StrawberryPerl.StrawberryPerl --no-upgrade
```

Trong MiKTeX Console, cập nhật package và bật **Settings → Always install missing packages on-the-fly**. Nếu `latexmk` chưa có, cài package `latexmk` trong mục Packages.

**macOS — Terminal** (cần [Homebrew](https://brew.sh/)):

```sh
brew install --cask visual-studio-code mactex
```

**Linux** — cài [VS Code](https://code.visualstudio.com/download), rồi chọn lệnh cho bản phân phối:

| Bản phân phối | Cài LaTeX |
| --- | --- |
| Ubuntu / Debian | `sudo apt update` rồi `sudo apt install texlive-full` |
| Fedora | `sudo dnf install texlive-scheme-full latexmk` |
| Arch Linux | `sudo pacman -Syu --needed texlive texlive-langother` |

Linux khác: dùng [TeX Live](https://tug.org/texlive/quickinstall.html). Bản đầy đủ trên macOS/Linux cần vài GB dung lượng.

**Sau khi cài**, mở lại VS Code và terminal, rồi cài extension:

```sh
code --install-extension james-yu.latex-workshop
```

Nếu không có lệnh `code`, tìm **LaTeX Workshop** của James Yu trong Extensions của VS Code. Kiểm tra bộ LaTeX bằng `latexmk -v`.

## Chọn mẫu

| Mẫu | Dùng cho |
| --- | --- |
| [hcmus-course-report](templates/hcmus-course-report/) | Báo cáo môn học tiếng Việt |
| [hcmus-report-slides](templates/hcmus-report-slides/) | Báo cáo tiếng Việt kèm slide |
| [springer-lncs](templates/springer-lncs/) | Bài báo tiếng Anh theo mẫu LNCS |

## Bắt đầu

1. Clone bằng `git clone https://github.com/padduwcs/PADTemplates.git` hoặc tải ZIP, rồi sao chép **cả thư mục mẫu** ra nơi làm bài riêng.
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

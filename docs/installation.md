# Cài môi trường soạn LaTeX

Mục tiêu: soạn tiếng Việt trong VS Code, build bằng `latexmk`, xem PDF ngay trong editor và giữ mọi file sinh ra trong `build/`.

## Windows: cấu hình đang dùng cho repo

| Thành phần | Vai trò | Nguồn cài |
| --- | --- | --- |
| VS Code | Soạn mã nguồn và xem PDF | [VS Code cho Windows](https://code.visualstudio.com/docs/setup/windows) |
| MiKTeX | Bộ biên dịch, BibTeX, package và font LaTeX | [MiKTeX](https://miktex.org/download) |
| Strawberry Perl | Chạy chương trình `latexmk` | [Strawberry Perl](https://strawberryperl.com/) |
| LaTeX Workshop | Build, xem PDF và hỗ trợ cú pháp trong VS Code | Extension `james-yu.latex-workshop` |
| Git | Clone, cập nhật và quản lý phiên bản | [Git cho Windows](https://git-scm.com/downloads/win) |

### 1. Cài VS Code và Git

Cài VS Code bằng User Installer; bật tùy chọn thêm vào PATH để dùng lệnh `code`. Cài Git cho Windows nếu muốn clone và cập nhật repo bằng Git. Cũng có thể tải repo dưới dạng ZIP.

### 2. Cài MiKTeX

1. Tải Basic MiKTeX Installer và cài cho người dùng hiện tại.
2. Chọn khổ giấy A4. Cho phép cài package thiếu tự động bằng tùy chọn `Always` khi cài, hoặc `Always install missing packages on-the-fly` trong MiKTeX Console → Settings → General.
3. Mở MiKTeX Console → Updates, kiểm tra và cài các bản cập nhật.

Build lần đầu cần Internet nếu máy chưa có đủ package. Các bước này dựa trên [hướng dẫn cài MiKTeX](https://miktex.org/howto/install-miktex) và [hướng dẫn MiKTeX Console](https://miktex.org/howto/miktex-console).

### 3. Cài Strawberry Perl

Cài bản phù hợp từ trang Strawberry Perl, rồi mở terminal mới. `perl` phải có trong PATH. MiKTeX không kèm Perl, trong khi recipe `latexmk` cần Perl để chạy; xem [yêu cầu của LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install).

### 4. Cài LaTeX Workshop

Trong VS Code, mở Extensions bằng `Ctrl + Shift + X`, tìm **LaTeX Workshop** của **James Yu** và cài. Hoặc chạy:

```powershell
code --install-extension james-yu.latex-workshop
```

Repo và mỗi template đều có `.vscode/extensions.json` để VS Code đề xuất extension này. LaTeX Workshop dùng bộ TeX trên máy; cài riêng extension chưa đủ để biên dịch.

### 5. Kiểm tra PATH và công cụ

Đóng rồi mở lại VS Code sau khi cài để nhận PATH mới. Trong terminal mới, chạy:

```powershell
pdflatex --version
latexmk -v
perl -v
bibtex --version
```

Mở thư mục repo và chạy:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-environment.ps1
```

Script kiểm tra công cụ và một số package quan trọng. Nó không cài hoặc thay đổi phần mềm. Nếu thiếu `latexmk`, mở mục Packages của MiKTeX Console và cài package `latexmk`.

`-ExecutionPolicy Bypass` chỉ áp dụng cho tiến trình PowerShell đang chạy lệnh; không thay đổi chính sách toàn máy.

### 6. Build thử

Chạy tại thư mục repo:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-all.ps1
```

Kết quả hiện có là 4 PDF: hai báo cáo, một bộ slide và một bài báo. Chúng nằm trong `build/` của từng template. Sau đó tạo bài làm riêng theo [README](../README.md#bắt-đầu).

## Các package mà mẫu sử dụng

MiKTeX có thể tự cài package theo các lệnh `\usepackage`. Khi cần tìm thủ công:

| Nhóm | Package / file đáng chú ý |
| --- | --- |
| Tiếng Việt | `vntex`, `babel-vietnamese`, `vietnam.sty`, encoding T5 |
| Toán và hình | `amsmath`, `amsfonts`, `graphics`, `pgf`, `caption`, `subcaption` |
| Bảng và trình bày | `geometry`, `fancyhdr`, `lastpage`, `enumitem`, `booktabs`, `tabularx` |
| Code và thuật toán | `listings`, `tcolorbox`, `algorithm2e`, `algorithms`, `algorithmicx` |
| Bài báo | `llncs`, `splncs04.bst`, `ifsym`, `pict2e` |

Danh sách trên giúp tra lỗi; build toàn bộ template mới là bước kiểm tra đầy đủ các phụ thuộc thực tế.

## macOS và Linux

Các template không dùng đường dẫn riêng của Windows. Có thể dùng TeX Live trên Linux hoặc MacTeX trên macOS, cùng VS Code và LaTeX Workshop; xem [các bản phân phối được LaTeX Project giới thiệu](https://www.latex-project.org/get/).

Trên Ubuntu, cấu hình CI cài các nhóm package sau:

```bash
sudo apt-get update
sudo apt-get install --no-install-recommends -y \
  latexmk texlive-latex-extra texlive-lang-other \
  texlive-science texlive-publishers texlive-fonts-recommended \
  texlive-fonts-extra
```

Nhóm font có dung lượng lớn. Có thể dùng một bản TeX Live đầy đủ sẵn có thay cho việc cài các nhóm trên. Để chạy các script `.ps1`, cài [PowerShell 7](https://learn.microsoft.com/powershell/scripting/install/installing-powershell) rồi dùng:

```bash
pwsh -NoProfile -File ./scripts/check-environment.ps1
pwsh -NoProfile -File ./scripts/build-all.ps1
```

Nếu không dùng PowerShell, sao chép cả thư mục template bằng trình quản lý file, mở nó trong VS Code hoặc vào thư mục đó và chạy `latexmk main.tex`.

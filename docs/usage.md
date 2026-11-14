# Cách sử dụng

## Tạo bài làm riêng

Giữ `templates/` cho các mẫu có thể tái sử dụng. Tạo bài thật bằng script, chạy từ thư mục repo:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\new-project.ps1 -List
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\new-project.ps1 -Template hcmus-course-report -Destination .\projects\bao-cao-cua-toi
code .\projects\bao-cao-cua-toi
```

`-Destination` nhận đường dẫn tương đối hoặc tuyệt đối; đặt trong dấu ngoặc kép nếu có khoảng trắng. Thư mục đích phải chưa tồn tại. Script sao chép cả cấu hình VS Code và giấy phép, bỏ `build/` và `.git/`, và không tự khởi tạo Git cho bài làm mới.

Cũng có thể sao chép template bằng File Explorer; bật hiển thị file/thư mục ẩn và giữ `.vscode`, `.gitignore`, `latexmkrc`. Bỏ `build/` khi sao chép.

## Chọn đúng tài liệu để build và xem

Khi mở cả repo, bấm vào tab file gốc của template mong muốn:

| Tab được chọn | Tài liệu | PDF |
| --- | --- | --- |
| `templates/reports/hcmus-course-report/main.tex` | Báo cáo môn học | `build/main.pdf` trong mẫu đó |
| `templates/reports/hcmus-report-slides/main.tex` | Báo cáo kèm slide | `build/main.pdf` trong mẫu đó |
| `templates/reports/hcmus-report-slides/slides.tex` | Slide | `build/slides.pdf` trong mẫu đó |
| `templates/papers/springer-lncs/main.tex` | Bài báo | `build/main.pdf` trong mẫu đó |

Nhấn `Ctrl + Alt + B`, đợi build xong, rồi `Ctrl + Alt + V`. Đặt con trỏ trong tab `.tex` khi dùng phím tắt. Thư mục hiện tại trong terminal không quyết định các phím tắt này.

File nội dung của báo cáo có dòng chỉ về file gốc:

```latex
% !TEX root = ../main.tex
```

Nhờ vậy, đang sửa `content/introduction.tex` vẫn build cả báo cáo. Nếu di chuyển file sang cấp thư mục khác, sửa đường dẫn trong dòng này cho phù hợp.

## Điền thông tin và viết nội dung

- Báo cáo môn học: sửa thông tin trong `main.tex`, tên giảng viên/sinh viên trong `config/frontpage.tex`, nội dung trong `content/`.
- Báo cáo kèm slide: sửa `config/info.tex`, viết báo cáo trong `content/`, viết slide riêng trong `slides.tex`.
- Bài báo: sửa tiêu đề, tác giả, cơ quan, abstract, keywords và các section trong `main.tex`.

Chừa một dòng trống để bắt đầu đoạn mới. Dùng `\section`, `\subsection` và `\subsubsection` để chia mục; các mẫu báo cáo hiện dùng class `article`, không dùng `\chapter`.

Để thêm một phần báo cáo, tạo `content/discussion.tex`:

```latex
% !TEX root = ../main.tex
\section{Thảo luận}
Nội dung thảo luận.
```

Thêm `\input{content/discussion}` vào vị trí mong muốn trong `main.tex`. Muốn bỏ một phần, đặt `%` trước dòng `\input` tương ứng. Không thêm `\begin{document}` vào file nội dung.

## Hình ảnh và tham chiếu

Đặt ảnh trong `images/`, dùng tên không dấu, không khoảng trắng. Ví dụ cho mẫu báo cáo:

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/so-do.png}
    \caption{Sơ đồ hệ thống}
    \label{fig:so-do}
\end{figure}

Kiến trúc được trình bày ở Hình~\ref{fig:so-do}.
```

Mẫu bài báo có sẵn `\graphicspath{{images/}}`, nên có thể chỉ ghi tên ảnh. Không ghi đường dẫn tuyệt đối trên máy cá nhân vào tài liệu.

## Tài liệu tham khảo

Mỗi template có `references.bib` tại thư mục gốc. Ví dụ:

```bibtex
@book{ma-tai-lieu,
  author    = {Họ và tên tác giả},
  title     = {Tên tài liệu},
  publisher = {Nhà xuất bản},
  year      = {2026}
}
```

Trích dẫn bằng `\cite{ma-tai-lieu}`. `latexmk` tự chạy BibTeX và chạy lại LaTeX khi cần. Với hai mẫu báo cáo, xóa `\nocite{example}` trong `config/references.tex` sau khi thay mục mẫu bằng các tài liệu thật.

## Output và Git

- Giữ PDF, log và file phụ trong `build/`. Không sửa trực tiếp các file này.
- `build/` được Git bỏ qua, nhưng ảnh/PDF nguồn đặt trong `images/` vẫn có thể được theo dõi.
- `projects/` và `.local/` ở thư mục gốc repo được bỏ qua. Với bài làm cần quản lý phiên bản, đặt ngoài repo và tự khởi tạo Git cho bài đó.
- Có thể bỏ `build/` rồi build lại. Giữ thư mục này trong lúc làm để build nhanh hơn.

## Đường dẫn cũ

| Trước khi chuẩn hóa | Hiện tại |
| --- | --- |
| `report_01/` | `templates/reports/hcmus-course-report/` |
| `report_02/` | `templates/reports/hcmus-report-slides/` |
| `paper_01/` | `templates/papers/springer-lncs/` |

Trong các mẫu, `Content/` đã đổi thành `content/`, `Image/` hoặc `img/` thành `images/`; BibTeX thống nhất tại `references.bib`. Hãy đóng các tab trỏ tới đường dẫn cũ rồi mở lại từ Explorer.

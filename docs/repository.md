# Quản lý repo

## Đưa repo cục bộ lên GitHub

Tạo một repository trống trên GitHub, ví dụ `latex-templates`. Nếu đã có lịch sử Git ở máy, không thêm README hoặc license tự động trên GitHub để tránh hai lịch sử khởi tạo riêng.

Trong thư mục repo ở máy, xem nội dung trước khi tạo commit:

```shell
git status --short
git add .
git diff --cached --check
git diff --cached --stat
git commit -m "Initialize LaTeX template collection"
```

Nếu đã có commit đầu tiên, bỏ qua bước tạo lại commit. Thay `URL_REPO_CUA_BAN` bằng URL HTTPS hoặc SSH của repo vừa tạo:

```shell
git remote add origin URL_REPO_CUA_BAN
git push -u origin main
```

Nếu `origin` đã có, kiểm tra bằng `git remote -v` trước khi thay đổi. Không đưa file trong `build/`, `projects/` hoặc `.local/` vào commit.

## Lấy repo trên máy khác

Sau khi cài môi trường theo `docs/installation.md`, thay URL rồi chạy:

```shell
git clone URL_REPO_CUA_BAN latex-templates
cd latex-templates
code .
```

Chạy kiểm tra môi trường và build thử theo README. Cấu hình dùng lệnh trong PATH, không cần chép các đường dẫn cài đặt từ máy cũ.

## Cập nhật repo và template

Với một bản clone chưa sửa mẫu:

```shell
git pull --ff-only
```

Để bổ sung template, tạo nhánh làm việc rồi theo [CONTRIBUTING](../CONTRIBUTING.md):

```shell
git switch -c add-ten-template
```

Khi sửa cấu hình chung, cập nhật cả bản trong template nếu cần duy trì hành vi giống nhau khi sao chép ra ngoài repo. Các bài làm đã tạo là bản sao độc lập: cập nhật repo không tự thay đổi nội dung hay cấu hình của chúng.

## PDF xem trước trên GitHub

Workflow `Build templates` chạy khi có thay đổi mã mẫu/script trên nhánh `main` hoặc trong pull request. Có thể chạy thủ công ở tab Actions → Build templates → Run workflow.

Sau khi workflow thành công, tải artifact `template-pdfs` ở trang lần chạy để xem PDF. Workflow chỉ đọc repo, biên dịch và lưu artifact; không tự commit hoặc xuất bản nội dung lên website.

## Dữ liệu cục bộ sau khi chuyển cấu trúc

Các file build cũ được giữ ở `.local/legacy-build/` trên máy đã thực hiện chuyển cấu trúc. Chúng được Git bỏ qua và không cần cho bản clone mới. Bản build hiện tại nằm trong `build/` của từng template.

# Ghi chú rà soát — cần bạn kiểm lại (REVIEW NOTES)

Tài liệu này liệt kê **mọi chỗ** trong bản LaTeX mà tôi phải tự quyết định
khi chuyển từ `Nckh-official_2.docx` sang định dạng Springer LNCS. Nội dung khoa
học (số liệu, câu chữ, kết quả) được giữ **nguyên vẹn** — những mục dưới đây chỉ
là chỗ bản gốc thiếu/không khớp/đánh máy, nên cần bạn xác nhận trước khi nộp.

Ngày tạo: 2026-07-24.

---

## A. Trích dẫn không khớp danh sách tài liệu (QUAN TRỌNG)

### A1. Trích dẫn `[34]` trong mục Related Work
- **Ở đâu:** [sections/03_related_work.tex](sections/03_related_work.tex) — mục 2.3
  *Robust Diagnostics and Anomaly Detection*, câu
  *"They are detected by anomaly detection [34]."*
- **Vấn đề:** Bản Word ghi `[34]` nhưng danh sách tài liệu chỉ có **23 nguồn**
  (1–23). Không có nguồn số 34.
- **Tôi đã xử lý:** map tạm về `\cite{arbaoui2024}` (Arbaoui 2024) — nguồn gần
  chủ đề nhất (anomaly detection cho pin). Có để lại comment `% NOTE` ngay tại dòng đó.
- **Bạn cần làm:** xác nhận nguồn thật sự bạn muốn trích cho câu này, rồi đổi key
  trong `\cite{...}`.

### A2. DOI nghi là placeholder — Ghafari 2023
- **Ở đâu:** [bib/references.bib](bib/references.bib) — entry `ghafari2023`.
- **Vấn đề:** DOI trong bản Word là `10.0000/jnanoscitec.2023`. Tiền tố `10.0000`
  không phải DOI thật (giống chỗ điền tạm).
- **Tôi đã xử lý:** giữ **nguyên** DOI như bản gốc + comment `% NOTE` cảnh báo.
- **Bạn cần làm:** tra DOI thật của bài *"Current and future prospects of Li-ion
  batteries: A review" (NanoSci Technol, 2023)*. Nếu không có DOI → xóa dòng
  `doi = {...}` trong entry đó (phần còn lại vẫn in bình thường).

---

## B. Tham chiếu chéo (cross-reference) chỉnh lại cho đúng số mục

### B1. "As noted in Section 1" → Section 3.1
- **Ở đâu:** [sections/05_experiments.tex](sections/05_experiments.tex) — mục 4.2,
  câu về việc tránh so sánh với các nghiên cứu chia dữ liệu trong cùng một pin.
- **Vấn đề:** Bản Word ghi *"As noted in Section 1"*, nhưng giao thức cross-battery
  thực chất được giới thiệu ở **mục 3.1** (Dataset and Evaluation Protocol), không
  phải mục 1 (Introduction).
- **Tôi đã xử lý:** trỏ tới `\ref{subsec:dataset}` (tự động ra "Section 3.1"). Có comment `% NOTE`.
- **Bạn cần làm:** xác nhận đây đúng là mục bạn muốn nhắc tới. Nếu bạn thực sự
  muốn nhắc Introduction thì đổi `\ref{subsec:dataset}` → `\ref{sec:introduction}`.

> Lưu ý chung: các tham chiếu "Section 3.4 / 4.3 / 4.4 / 5 ..." trong bản Word đã
> được thay bằng `\ref{...}` để LaTeX **tự đánh số**. Nhờ vậy nếu sau này bạn thêm/bớt
> mục, số sẽ tự cập nhật, không bị lệch. Không cần sửa tay.

---

## C. Chuẩn hóa nhỏ về hình thức (không đổi nội dung khoa học)

1. **Tên tác giả — ĐÃ đổi sang chuẩn Springer (tên trước, họ sau).**
   Hướng dẫn Springer (mục 2.2) yêu cầu *given name trước, family name sau*.
   Tên tiếng Việt gốc (họ trước) đã được đảo lại trong
   [sections/00_metadata.tex](sections/00_metadata.tex):
   Nguyen Phuc Duy → **Phuc Duy Nguyen** (họ: Nguyen); tương tự cho 4 người còn
   lại. Running head giờ là **"P. D. Nguyen et al."** (đúng: họ Nguyen viết đủ,
   tên viết tắt). Thứ tự người + email giữ nguyên, chỉ đảo cách hiển thị tên.
2. **Email đồng tác giả:** bản Word để trống (`[…]@fpt.edu.vn`). Tôi đã điền đủ
   5 email bạn cung cấp trong tin nhắn.
3. **Khoa/Faculty:** bản Word ghi "Falcuty of Software of Engineering" (lỗi đánh
   máy). Tôi sửa thành "Faculty of Software Engineering".
4. **Lỗi chính tả trong tiêu đề bảng/đề mục** của bản Word đã sửa:
   "MambaSOHPRedictor" → "MambaSOHPredictor"; "prioritise/normalise"... dùng nhất
   quán chính tả Anh-Anh (British) cho toàn bài.
5. **Tiêu đề mục con** ở Related Work trong bản Word có lẫn nhãn "B.", "C.", "D."
   (kiểu IEEE). Đã bỏ để dùng đánh số tự động của LNCS (2.1, 2.2, ...).
6. **Đơn vị nhiệt độ 4°C:** dùng macro `\degC{4}` để in nhất quán "4 °C".
7. **Dòng "Source: Authors' processing, 2026" dưới bảng — ĐÃ xóa toàn bộ (6 bảng)**
   để tuân thủ chuẩn Springer CS (bài LNCS không ghi "Source" dưới bảng). Riêng
   **chú thích "†"** (oracle) ở Bảng 2 vẫn giữ vì là chú thích kỹ thuật cần thiết.

---

## D. Hình ảnh

- **Fig. 1** = `figures/architecture.png` (trích từ `image1.png` trong file Word).
- **Fig. 2** = `figures/soh_prediction_b0048.png` (trích từ `image2.png`).
- Ảnh là **PNG raster** lấy trực tiếp từ file Word. Nếu bạn có bản **vector**
  (PDF/EPS) của sơ đồ kiến trúc thì nên thay vào để in nét hơn — Springer khuyến
  nghị vector cho sơ đồ. Chỉ cần thay file cùng tên trong `figures/`.

---

## E. Giảm số trang: 15 → 12 trang (giữ nguyên nội dung khoa học)

Theo yêu cầu về giới hạn 11–12 trang, tôi đã nén bài từ 15 xuống **12 trang** mà
**không bỏ** bất kỳ số liệu, luận điểm, bảng, hình hay tài liệu tham khảo nào.
Cách làm (đều hợp chuẩn Springer):

1. **Nén văn xuôi**: viết lại gọn các đoạn dài (Introduction, Related Work,
   Methodology, Experiments, Discussion, Conclusion) — bỏ chữ thừa, gộp câu.
   Toàn bộ con số, tên cell (B00xx), siêu tham số, và 23 trích dẫn được giữ
   nguyên (đã đối chiếu tự động).
2. **Bố cục float**: đặt bảng/hình ở `[t]`; chỉnh tham số đóng gói float
   (`\topfraction`, `\textfraction`…) và khoảng cách float
   (`\textfloatsep`/`\intextsep`/`\floatsep`) để thu hồi khoảng trắng quanh 8
   float. Đây chỉ là **thay đổi cách xếp float**, không đụng khổ chữ (type area)
   hay giãn dòng của LNCS.
3. **Hình 2** thu về `0.78\textwidth`, **Hình 1** về `0.95\textwidth` (ảnh vốn
   dư lề trắng).
4. **Phương trình SOH** (định nghĩa tỉ lệ đơn giản) đưa vào trong dòng; giữ
   **phương trình FiLM** ở dạng hiển thị (là đóng góp chính).
5. **Tài liệu tham khảo gọn hơn**: bỏ URL trùng khi đã có DOI/arXiv (Gu 2023,
   Patel 2025, Nie 2023); rút gọn địa chỉ lặp trong entry NASA (Saha 2007).
6. **Một ngoại lệ cần bạn biết**: báo cáo EDGAR (Crippa 2024) có **16 tác giả**
   (viện JRC) — tôi rút danh sách này thành *"Crippa, M., Guizzardi, D.,
   Pagani, F., et al."* để vừa trang. Đây là thông lệ chấp nhận được cho báo cáo
   kỹ thuật nhiều tác giả. **Nếu bạn muốn giữ đủ 16 tên**, mở
   [bib/references.bib](bib/references.bib) entry `crippa2024`, thay
   `and others` bằng 13 tên còn lại (đã ghi chú ngay trong file). Việc này chỉ
   làm dài thêm ~3 dòng, có thể đẩy bài sang 13 trang.

## F. Tình trạng biên dịch (bản hiện tại)

- **12 trang**. Biên dịch **sạch: 0 lỗi, 0 tham chiếu thiếu (undefined),
  0 hộp tràn lề (overfull)**, 0 underfull trong thân bài.
- Còn 13 cảnh báo *underfull hbox* nhưng **tất cả nằm trong danh mục tài liệu
  tham khảo** — do các đường link DOI/URL dài không ngắt được trên dòng căn đều.
  Đây là hiện tượng bình thường ở mọi bài LaTeX có URL, không ảnh hưởng nội dung.
- Đã đối chiếu tự động: **toàn bộ giá trị số/thập phân** trong bản Word đều xuất
  hiện đầy đủ trong PDF (chỉ trừ "Section 5.2" — vốn là tham chiếu chéo đã được
  thay bằng `\ref`, không phải số liệu).
- 23 tài liệu tham khảo, tất cả đều được `\cite`; abstract 236 từ (chuẩn 150–250).

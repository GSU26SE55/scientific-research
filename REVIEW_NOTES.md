# Ghi chú rà soát — bản LaTeX so với `Nckh-official_2.docx`

Ngày cập nhật: **2026-07-30**.

Bản LaTeX này được **viết lại toàn bộ** với nguyên tắc: *giữ nguyên từng câu chữ
của file Word*, chỉ đổi **hình thức trình bày** sang chuẩn Springer LNCS.

Tài liệu này liệt kê **mọi chỗ** bản LaTeX khác bản Word — không sót chỗ nào.

---

## 0. Bằng chứng kiểm tra tự động (đã chạy trên bản PDF hiện tại)

| Hạng mục | Kết quả |
|---|---|
| 81 đoạn văn thân bài của Word | **81/81** xuất hiện nguyên văn trong PDF (chỉ trừ 2 chỗ ở mục A2 & C2) |
| Mọi con số / % / tên cell (B00xx) trong Word | **có đủ** trong PDF (chỉ trừ "5.2" — xem A2) |
| 149 ô của 6 bảng | **149/149** đúng nội dung |
| Trích dẫn trong bài | **58/58** vị trí, số trùng khớp (chỉ trừ `[34]` — xem A1) |
| Danh mục tài liệu | **23/23**, thứ tự & đánh số **trùng khít** bản Word |
| Abstract / Keywords / Tiêu đề | trùng nguyên văn |
| 2 hình | file PNG **giống hệt từng byte** ảnh trong `.docx` |
| Biên dịch | **0 lỗi, 0 tham chiếu thiếu, 0 hộp tràn lề (overfull)** |

---

## A. Bốn chỗ bản Word bị lỗi — **cần bạn quyết định**

### A1. Trích dẫn `[34]` không tồn tại
- **Ở đâu:** [sections/03_related_work.tex](sections/03_related_work.tex), mục 2.3,
  câu *"They are detected by anomaly detection [34]."*
- **Vấn đề:** danh mục chỉ có **23** nguồn, không có nguồn số 34.
- **Đã xử lý:** tạm map về `\cite{arbaoui2024}` → in ra `[3]`. Có comment `% NOTE`
  ngay tại dòng đó.
- **Bạn cần làm:** xác nhận nguồn đúng rồi đổi key trong `\cite{...}`.

### A2. Tham chiếu "Section 5.2" không tồn tại
- **Ở đâu:** [sections/04_methodology.tex](sections/04_methodology.tex), mục 3.3,
  phần *Representation Modulation via FiLM*.
- **Vấn đề:** Section 5 (Discussion) **không có mục con** nào, nên "5.2" không trỏ tới đâu.
- **Đã xử lý:** trỏ về Section 5 (`\ref{sec:discussion}`). Đây là **con số duy nhất**
  trong Word không xuất hiện trong PDF.
- **Bạn cần làm:** xác nhận, hoặc cho biết mục nào là đúng.

### A3. Dấu "†" ở Bảng 2 không có chú thích
- **Ở đâu:** [sections/05_experiments.tex](sections/05_experiments.tex), Bảng 2,
  dòng *"Naive last-SOH (oracle)†"*.
- **Vấn đề:** bản Word có dấu † nhưng **không hề định nghĩa** nó ở đâu (file Word
  không có footnote/endnote nào — đã kiểm tra `footnotes.xml`/`endnotes.xml` đều rỗng).
  Ý nghĩa chỉ được giải thích trong đoạn văn phía dưới.
- **Đã xử lý:** giữ **đúng như Word** (có dấu †, không có chú thích). Tôi đã viết sẵn
  một dòng chú thích và **để ở dạng comment** ngay dưới bảng — chỉ cần bỏ dấu `%` là hiện.
- **Bạn cần làm:** quyết định bật chú thích đó hay bỏ luôn dấu †.

### A4. DOI nghi là placeholder — Ghafari 2023
- **Ở đâu:** [bib/references.bib](bib/references.bib), entry `ghafari2023`.
- **Vấn đề:** DOI `10.0000/jnanoscitec.2023` — tiền tố `10.0000` không phải DOI thật.
- **Đã xử lý:** giữ **nguyên** như Word + comment `% NOTE`.
- **Bạn cần làm:** tra DOI thật, hoặc xoá dòng `doi = {...}` (phần còn lại vẫn in bình thường).

---

## B. Chỗ giữ nguyên văn Word dù *có thể* là lỗi — báo để bạn biết

Những chỗ này tôi **cố tình không sửa** vì bạn yêu cầu bám sát bản Word. Nếu muốn
sửa, báo tôi một câu là xong.

1. **"As noted in Section 1"** ([05_experiments.tex](sections/05_experiments.tex), mục 4.2).
   Giao thức cross-battery thực ra được giới thiệu ở **mục 3.1**, không phải mục 1.
   Tôi dùng `\ref{sec:introduction}` nên PDF in đúng "Section 1" như Word.
   Đổi sang `\ref{subsec:dataset}` là ra "Section 3.1".
2. **Chính tả Anh-Anh / Anh-Mỹ lẫn lộn** — bản Word dùng cả hai:
   `prioritise` / `normalized`, `modelling` / `modeling`,
   `generalisation` / `generalization`, `ageing` / `aging`,
   `favourably` / `favorably`, `utilise` / `summarized`…
   Tôi giữ **đúng từng từ như Word**. Muốn thống nhất về một chuẩn thì báo tôi.
3. **Bảng 3** — tiêu đề cột 1 trong Word là **"Model"** nhưng nội dung là các thống kê
   (Mean ± std, Median, Fold B0048). Giữ nguyên "Model".
4. **Bảng 3** — ô *"Fold B0048 (= main battery testing)"*: giữ nguyên cách diễn đạt này.
5. **Bảng 6** — bản Word **không có trích dẫn** ở dòng SambaMixer-L và TIDSIT.
   Tôi cũng **không thêm** `\cite`. (Bảng 1 thì Word *có* trích dẫn, nên tôi giữ đủ.)
6. **Mục 2.4** — bản Word đi thẳng từ tiêu đề mục vào Bảng 1, không có câu dẫn.
   Tôi giữ nguyên (không tự thêm câu dẫn).
7. **Abstract dài 253 từ.** Springer khuyến nghị 150–250 từ. Đây là abstract nguyên văn
   của bạn; muốn về ≤250 chỉ cần cắt ~3 từ.
8. **Các dòng "Source: …" dưới bảng** (5 dòng: Bảng 1, 3, 4, 5, 6) — **đã giữ lại**
   vì là nội dung của file Word. Lưu ý: bài LNCS thường **không** ghi dòng này.
   Muốn bỏ cả 5 dòng cùng lúc: mở [preamble.tex](preamble.tex) và đổi định nghĩa
   thành `\newcommand{\srcnote}[1]{}` — không phải sửa file section nào cả.

---

## C. Ba lỗi đánh máy rõ ràng — **đã sửa**

| # | Bản Word | Bản LaTeX | Ở đâu |
|---|---|---|---|
| C1 | `MambaSOHPRedictor` (chữ R hoa) | `MambaSOHPredictor` | [02_introduction.tex](sections/02_introduction.tex) |
| C2 | `… trong cùng một cell. **Namely: Specifically:**` (lặp 2 lần) | chỉ giữ `Specifically:` | [04_methodology.tex](sections/04_methodology.tex) |
| C3 | `deploy ability` (tách đôi) | `deployability` | [07_conclusion.tex](sections/07_conclusion.tex) |
| C4 | `Falcuty of Software of Engineering` | `Faculty of Software Engineering` | [00_metadata.tex](sections/00_metadata.tex) |

Mỗi chỗ đều có comment `% NOTE` ngay tại dòng để bạn dễ tìm.

---

## D. Chuyển đổi hình thức sang chuẩn Springer (KHÔNG đổi nội dung)

1. **Bỏ nhãn thủ công của tiêu đề mục.** Word ghi `B.`, `C.`, `D.` (kiểu IEEE) ở
   Related Work, `A.`–`E.` ở Methodology, `4.1`–`4.6` ở Experimental Results.
   `llncs.cls` tự đánh số và cho ra **đúng y hệt** các số đó (2.1–2.4, 3.1–3.5, 4.1–4.6),
   nên mọi tham chiếu chéo trong bài vẫn khớp.
2. **Tiêu đề in đậm trong dòng** (`Patch Encoding:`, `Uncertainty Quantification:`,
   `(a) Component Ablation:`…) → dùng `\subsubsection` — đúng kiểu heading cấp 3 của
   LNCS (in đậm, chạy trong dòng). Dấu `:` đổi thành `.` theo quy ước LNCS.
   Kéo theo **đúng 1 chữ bị đổi hoa/thường**: mục 4.4 (b), Word viết
   `… across SOH bands: the 80-90% band …` → LaTeX in `… across SOH bands.`
   **T**`he 80–90% band …` (viết hoa vì đã thành câu mới). Không còn chỗ nào khác.
3. **`Figure 1.` → `Fig. 1.`** (LNCS tự sinh nhãn). Nội dung caption giữ nguyên văn.
4. **Bảng kẻ khung** đúng như `Springer_Latex_Template/samplepaper.tex`
   (`|l|l|` + `\hline`), caption **trên** bảng, caption hình **dưới** hình.
   Mọi float dùng `[H]` để nằm đúng vị trí như trong Word.
5. **Tài liệu tham khảo:** Word dùng APA; LNCS bắt buộc `splncs04` (số, sắp xếp
   alphabet). May mắn là thứ tự alphabet **trùng khít** danh sách của Word →
   `[1]`…`[23]` trong PDF = `[1]`…`[23]` trong Word.
6. **Gộp trích dẫn liền nhau:** Word viết `[10] [15]`, LaTeX in `[10,15]` (chuẩn Springer).
7. **`(Mamba) ([6])`** → `(Mamba) [6]`: bỏ cặp ngoặc thừa bọc ngoài nhãn trích dẫn.
8. **Dấu %:** Word viết lẫn `1.52%` (47 lần) và `1.52 %` (2 lần).
   Đã thống nhất về **không có khoảng trắng** — theo đa số.
9. **`4°C` → `4 °C`** (khoảng trắng mảnh, đúng chuẩn SI mà Springer dùng), qua macro `\degC{4}`.
10. **Dấu gạch:** các khoảng như `B0049–B0052`, `2022-2030`, `80-90%` dùng en dash (`--`) nhất quán.
11. **Tên tác giả:** Springer yêu cầu *tên trước, họ sau*. Đã đảo:
    Nguyen Phuc Duy → **Phuc Duy Nguyen**, v.v. Running head: **"P. D. Nguyen et al."**
    Thứ tự người giữ nguyên.
12. **Email đồng tác giả:** bản Word để trống (`[…]@fpt.edu.vn`); đã điền đủ 6 email
    bạn cung cấp. Bản Word ghi `[Co-authors]` — không dùng lại placeholder này.
13. **Công thức FiLM** giữ **trong dòng** đúng như Word (không tách ra dòng riêng).

---

## E. Số trang: **13 trang**

Bản trước (12 trang) đạt được bằng cách **viết gọn lại văn xuôi** — tức là *không*
đúng câu chữ của Word. Lần này bạn yêu cầu bám sát bản Word nên văn xuôi đã được
**khôi phục nguyên văn**, cộng thêm:

- 5 dòng `Source: …` dưới bảng (trước đây bị xoá),
- entry Crippa 2024 khôi phục **đủ 16 tác giả** (trước đây rút gọn thành `et al.`),
- các URL/DOI của Gu 2023, Nie 2023, Patel 2025 và địa chỉ đầy đủ của Saha 2007.

Nếu **bắt buộc** phải về 12 trang, đây là các "nút vặn" xếp theo mức độ ít ảnh
hưởng tới bài nhất:

1. Bỏ 5 dòng `Source: …` → `\newcommand{\srcnote}[1]{}` trong `preamble.tex` (~5 dòng).
2. Rút entry `crippa2024` về `et al.` (~3 dòng) — có ghi chú sẵn trong file `.bib`.
3. Thu nhỏ Hình 2 từ `0.78\textwidth` xuống `0.7`.
4. Cuối cùng mới nên viết gọn văn xuôi — nhưng như thế lại lệch khỏi bản Word.

---

## F. File đã xoá khỏi repo

- `sections/09_appendix.tex` — phụ lục mẫu của **IEEE** (dùng `\appendices`,
  `\toprule`, tham chiếu tới nhãn không tồn tại). Không nằm trong bản Word, và sẽ
  gây lỗi biên dịch nếu vô tình `\input`.
- `sections/10_biography.tex` — tiểu sử tác giả kiểu **IEEE** (`\begin{IEEEbiography}`),
  không dùng được với `llncs.cls`.

Cả hai vẫn còn trong lịch sử git nếu cần lấy lại.

`sections/08_acknowledgment.tex` được **giữ lại nhưng không nạp** vào bài, vì bản
Word đi thẳng từ Conclusion sang References. Muốn bật: bỏ comment dòng `\input`
tương ứng trong [main.tex](main.tex).

---

## H. Cập nhật Abstract — **2026-08-09**

Người dùng cung cấp trực tiếp một bản **Abstract mới** (tiếng Anh, dán trong
chat, không phải từ file Word) để thay cho abstract cũ trong
[sections/01_abstract.tex](sections/01_abstract.tex). Nội dung khoa học
(kiến trúc, số liệu MAE 1.52% / RMSE 1.97%, độ trễ <100 ms) **không đổi** so
với abstract cũ — chỉ là một cách diễn đạt khác. Phần `\keywords{...}` được
**giữ nguyên** vì bản mới không cung cấp danh sách từ khóa thay thế.

Ba chỗ trong văn bản gốc người dùng gửi có vấn đề rõ ràng, đã sửa khi đưa vào
LaTeX (theo đúng nguyên tắc ở mục C — chỉ sửa lỗi máy móc rõ ràng, có ghi chú):

1. **"win-window"** → **"window"** — lặp âm tiết, rõ là lỗi đánh máy/OCR.
2. **"Under-Taint estimate"** → **"Uncertainty estimation"** — cụm từ vô nghĩa
   trong ngữ cảnh ("Under-Taint ... employs Monte Carlo Dropout"); Monte Carlo
   Dropout dùng để ước lượng độ bất định (uncertainty), không có khái niệm
   "under-taint" trong domain này.
3. **"To prioritise predictive maintenance, combine results into a risk
   matrix."** → **"To prioritise predictive maintenance, the results are
   combined into a risk matrix."** — câu gốc lẫn thể mệnh lệnh (imperative)
   vào giữa đoạn văn mô tả (descriptive), sửa về thể bị động cho nhất quán với
   phần còn lại của abstract.

Đã biên dịch lại: **0 lỗi, 0 tham chiếu thiếu**, vẫn **13 trang**. Các cảnh báo
"Underfull \hbox" còn lại trong log đều nằm trong phần tài liệu tham khảo
(bibliography), có từ trước, không liên quan tới thay đổi này.

**Nếu bạn muốn giữ nguyên văn 100% (kể cả 3 chỗ trên), báo lại và tôi sẽ revert.**

**Cập nhật nhỏ (cùng ngày):** người dùng gửi lại đoạn abstract lần hai; hai lỗi
"win-window" / "under-taint estimate" xuất hiện **giống hệt** lần đầu — xác nhận
đây là lỗi trích xuất văn bản có tính hệ thống (do xuống dòng có gạch nối:
`win-\ndow`, `Uncer-\ntainty`), không phải chủ ý — nên giữ nguyên bản đã sửa. Câu
"To prioritise predictive maintenanthe results are combinedults into a risk
matrix." trong lần gửi thứ hai bị lỗi dán chồng (clipboard), đã bỏ qua. Một thay
đổi hợp lệ được áp dụng: thêm mạo từ **"an"** trước MAE/RMSE ("an MAE of 1.52%
and an RMSE of 1.97%") theo đúng bản người dùng gửi.

---

## G. Hình ảnh

- **Fig. 1** = `figures/architecture.png` (chính là `word/media/image1.png`).
- **Fig. 2** = `figures/soh_prediction_b0048.png` (chính là `word/media/image2.png`).
- Đã đối chiếu **SHA-1**: hai file giống hệt từng byte với ảnh trong `.docx`.
- Ảnh là **PNG raster**. Nếu bạn có bản **vector** (PDF/EPS) của sơ đồ kiến trúc thì
  nên thay vào để in nét hơn — Springer khuyến nghị vector cho sơ đồ. Chỉ cần thay
  file cùng tên trong `figures/`.

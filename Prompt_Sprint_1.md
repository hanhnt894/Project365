# Sprint 1 — Project365 Foundation

> Mục tiêu: Khởi tạo nền tảng Project365. Chỉ tạo những gì thực sự cần.

====================================================
## Yêu cầu ban đầu
====================================================

Tạo dự án mã nguồn mở Project365 với cấu trúc:

Project365/
├── README.md
├── LICENSE
├── .gitignore
├── English365/
│   ├── README.md
│   ├── Day001/
│   ├── Day002/
│   ├── Day003/
│   ├── Day004/
│   └── Resources/
├── docs/
├── scripts/
└── assets/

README.md tổng quan: giới thiệu, mục tiêu, tầm nhìn, 7 modules
(English365, Dev365, AI365, Reading365, Income365, Health365, Communication365),
cấu trúc thư mục, roadmap (Sprint 1-5), sprint hiện tại, hướng dẫn sử dụng, license.

LICENSE: MIT License.

.gitignore: Windows, VSCode, Visual Studio, Rider, .NET, Node.js, Python, Docker.

English365/README.md: giải thích module, mục tiêu học, cấu trúc Lesson Pack
(Lesson.md, Anki.csv, README.md + mở rộng Listening.md, Pronunciation.md, Shadowing.md),
quy trình học mỗi ngày, quy tắc đặt tên Day001-Day365.

Mỗi Day có Lesson.md (từ vựng, mẫu câu, ví dụ, bài tập), Anki.csv (English,Vietnamese),
README.md (mục tiêu, tài liệu).

====================================================
## Thay đổi trong Sprint 1
====================================================

### 1. Đổi tên thư mục

Day001 → 001, Day002 → 002, Day003 → 003, Day004 → 004.
Cập nhật toàn bộ đường dẫn và liên kết trong README.

### 2. Chuẩn hóa Lesson.md

Template 8 sections cho mỗi Lesson.md:
- Topic
- Vocabulary (bảng English | Tiếng Việt)
- Grammar
- Reading (đoạn văn mẫu)
- Listening (nghe và chép)
- Speaking (bài tập nói)
- Writing (bài tập viết)
- Reflection (câu hỏi tự đánh giá)

### 3. Rút gọn README của từng Day

Mỗi README.md chỉ gồm:
- Topic
- Vocabulary count
- Grammar
- Status (✅ Completed / 🟨 In Progress / ⏳ Not Started)

### 4. Progress.md

Tạo English365/Progress.md theo dõi 365 ngày.
001-003: ✅ Completed
004: 🟨 In Progress → sau đổi thành ✅ Completed
005-365: ⏳ Not Started
Thống kê: 4 / 365 completed.

### 5. CHANGELOG.md

Tạo file changelog ghi lại các thay đổi theo Sprint.

### 6. Chuẩn hóa cấu trúc (cuối Sprint 1)

Project365/
├── README.md
├── LICENSE
├── CHANGELOG.md
├── .gitignore
├── English365/
│   ├── README.md
│   ├── Progress.md
│   ├── templates/
│   │   ├── Lesson.template.md
│   │   ├── README.template.md
│   │   └── Anki.template.csv
│   ├── Resources/
│   │   ├── README.md
│   │   ├── Pronunciation/README.md
│   │   ├── Listening/README.md
│   │   ├── Shadowing/README.md
│   │   └── Images/README.md
│   ├── 001/  (Lesson.md, README.md, Anki.csv)
│   ├── 002/  (Lesson.md, README.md, Anki.csv)
│   ├── 003/  (Lesson.md, README.md, Anki.csv)
│   ├── 004/  (Lesson.md, README.md, Anki.csv)
│   └── 005/  (Lesson.md, README.md, Anki.csv) — generated from template
├── docs/
├── scripts/
│   └── generate-day.ps1
└── assets/

Xóa các file .gitkeep dư thừa.

### 7. Template chuẩn

Lesson.template.md — 11 sections với emoji:
🎯 Goal, 📚 Vocabulary, 📝 Grammar, 📖 Reading, 🎧 Listening,
🗣 Speaking, ✍ Writing, 🎤 Pronunciation, 🧠 Shadowing,
📅 Review, 📓 Reflection.

README.template.md — 4 fields:
Topic, Vocabulary count, Grammar summary, Status.

Anki.template.csv — 6 columns:
Type, Front, Back, IPA, Example, Tags.

### 8. Script generate-day.ps1

scripts/generate-day.ps1 <DayNumber>

Chức năng:
- Tạo thư mục English365/<DayNumber> nếu chưa có
- Copy Lesson.template.md → Lesson.md
- Copy README.template.md → README.md
- Copy Anki.template.csv → Anki.csv
- Không ghi đè nếu đã tồn tại
- Log: [OK] Create ... / Dayxxx already exists.

### 9. Resources

English365/Resources/ gồm:
- Pronunciation/ — IPA, minimal pairs, accent Bắc, mouth position, audio
- Listening/ — audio files, podcast transcripts, dictation exercises
- Shadowing/ — scripts, daily practice logs
- Images/ — lesson illustrations, vocabulary flashcards, diagrams

### 10. English365/README.md

Cập nhật quy trình học:

Morning: 🎯 Goal → 📚 Vocabulary → 📝 Grammar → 📖 Reading → 🎧 Listening → 🗣 Speaking → ✍ Writing
Evening: 🎤 Pronunciation → 🧠 Shadowing → 📅 Review → 📓 Reflection → Anki

### 11. Development Workflow (README gốc)

| Sprint | Nội dung |
|--------|----------|
| Sprint 1 | Project Structure |
| Sprint 2 | Lesson Generator |
| Sprint 3 | AI English Coach |
| Sprint 4 | Automation |
| Sprint 5 | Speech & Pronunciation |

====================================================
## Git & Release
====================================================

Branch: master
Commit: release: Sprint 1 - English365 foundation completed
Tag: v1.0.0 - "Sprint 1 Completed"
Remote: https://github.com/hanhnt894/Project365.git

====================================================
## Danh sách file (Sprint 1)
====================================================

### Đã tạo (34 files)

.gitignore
CHANGELOG.md
LICENSE
README.md
English365/README.md
English365/Progress.md
English365/001/Anki.csv
English365/001/Lesson.md
English365/001/README.md
English365/002/Anki.csv
English365/002/Lesson.md
English365/002/README.md
English365/003/Anki.csv
English365/003/Lesson.md
English365/003/README.md
English365/004/Anki.csv
English365/004/Lesson.md
English365/004/README.md
English365/005/Anki.csv
English365/005/Lesson.md
English365/005/README.md
English365/Resources/README.md
English365/Resources/Pronunciation/README.md
English365/Resources/Listening/README.md
English365/Resources/Shadowing/README.md
English365/Resources/Images/README.md
English365/templates/Lesson.template.md
English365/templates/README.template.md
English365/templates/Anki.template.csv
scripts/generate-day.ps1

### Đã xóa (4 files)

assets/.gitkeep
docs/.gitkeep
scripts/.gitkeep
English365/Resources/.gitkeep

====================================================
## Kết luận
====================================================

Sprint 1 hoàn thành.
Project365 Ready for Sprint 2.

Modules chưa phát triển: Dev365, AI365, Reading365, Income365, Health365, Communication365.

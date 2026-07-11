# Config — Project365

File: `config.json`

JSON không hỗ trợ comment, nên file này giải thích từng trường.

---

## `project`

Thông tin dự án.

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Tên dự án |
| `version` | string | Phiên bản hiện tại (SemVer) |
| `repository` | string | URL GitHub repository |
| `language` | string | Ngôn ngữ mặc định |
| `timezone` | string | Múi giờ — tất cả thời gian đều tính theo Asia/Ho_Chi_Minh |

---

## `english365`

Cấu hình module English365.

| Field | Type | Description |
|-------|------|-------------|
| `startDay` | number | Ngày bắt đầu (luôn là 1) |
| `currentDay` | number | Ngày hiện tại đang học |
| `targetDay` | number | Mục tiêu 365 ngày |
| `currentSprint` | number | Sprint đang phát triển |

---

## `repository`

Cấu hình GitHub.

| Field | Type | Description |
|-------|------|-------------|
| `defaultBranch` | string | Branch mặc định |
| `commitPrefix` | string | Prefix cho commit message, ví dụ: `feat(day005)` |

---

## `review`

Lịch review (ôn tập) định kỳ.

### `weekly`

| Field | Type | Description |
|-------|------|-------------|
| `enabled` | boolean | Bật/tắt review hàng tuần |
| `dayOfWeek` | string | Ngày trong tuần (Sunday, Monday, ...) |

### `monthly`

| Field | Type | Description |
|-------|------|-------------|
| `enabled` | boolean | Bật/tắt review hàng tháng |
| `strategy` | string | Chiến lược: `LastDayOfMonth` — ngày cuối tháng |

---

## `aiCoach`

AI Coach tự động sinh Lesson Pack.

| Field | Type | Description |
|-------|------|-------------|
| `enabled` | boolean | Bật/tắt AI Coach |
| `lessonGenerator` | boolean | Sinh nội dung Lesson.md |
| `reflectionGenerator` | boolean | Sinh câu hỏi Reflection |
| `reviewGenerator` | boolean | Sinh bài Review |

---

## `anki`

Cấu hình Anki integration.

| Field | Type | Description |
|-------|------|-------------|
| `deckName` | string | Tên deck trong Anki |
| `newCardsPerDay` | number | Số thẻ mới mỗi ngày |
| `reviewLimit` | number | Giới hạn thẻ ôn tập mỗi ngày |

---

## `paths`

Đường dẫn thư mục trong dự án.

| Field | Type | Description |
|-------|------|-------------|
| `english365` | string | Thư mục module English365 |
| `templates` | string | Thư mục template CLI |
| `scripts` | string | Thư mục PowerShell scripts |
| `prompts` | string | Thư mục prompt cho AI |
| `docs` | string | Thư mục tài liệu |

---

## `git`

Cấu hình tự động hóa Git.

| Field | Type | Description |
|-------|------|-------------|
| `autoPull` | boolean | Tự động pull trước khi commit |
| `autoCommit` | boolean | Tự động commit sau khi sinh Lesson |
| `autoPush` | boolean | Tự động push lên GitHub |

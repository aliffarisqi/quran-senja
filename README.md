# quransenja

**Quran Senja** is a mobile application built with the latest **Flutter** and powered by **GetX state management**. It provides a complete experience for reading and listening to the Quran, focusing on clean architecture, efficient audio playback (even for long-duration files), and responsive user interaction.

<img width="1512" height="982" alt="Image" src="https://github.com/user-attachments/assets/ee8600a2-1973-44ad-97c8-7b5734deacb4" />
<img width="1512" height="982" alt="Image" src="https://github.com/user-attachments/assets/fa2b180b-6914-46ed-ab24-df09bafe606b" />
<img width="1512" height="982" alt="Image" src="https://github.com/user-attachments/assets/865bfddd-d5e3-4153-a0eb-6af016c63d10" />
<img width="1512" height="982" alt="Image" src="https://github.com/user-attachments/assets/557bec0d-0ea9-4ce0-b4a7-f2b495157840" />
---

## Key Features

- **Surah List Display**  
  Fetches all surahs from a public API, displaying surah name, meaning, number of verses, and surah type.

- **Surah Search**  
  Instantly search surahs by name meaning of name surah, and the place mecca or medina using a responsive, real-time search bar powered by GetX.

- **Full Surah Audio Playback**  
  Each surah has a single, full-length audio file with:
  - Play and Pause, Next and Previous controls
  - Interactive seekbar or slider
  - Buffer information slider
  - Current time & total duration
  - **Loading indicator** for partially loaded audio

- **Auto-Next Surah**  
  Automatically plays the next surah when the current one finishes.

- **Long Audio Duration Support**  
  Designed to handle surah audio files up to 2+ hours with correct slider and playback status handling.

- **Modern Architecture**  
  - `Controller`: GetX logic per module
  - `Service`: API handling with Dio
  - `Model`: Structured response parsing
  - `Views`: Responsive & clean UI components

---

## Tech Stack

| Tech          | Purpose                          |
|---------------|----------------------------------|
| Flutter       | Mobile SDK                       |
| GetX          | State Management & Routing       |
| Dio           | HTTP Client for APIs             |
| Just Audio    | Audio player integration         |
| GitHub        | Version Control                  |

---

## Getting Started

1. **Clone the repo:**

   ```bash
   git clone https://github.com/aliffarisqi/quran-senja.git
   cd quran-senja
   
2. **Install dependencies
   ```bash
   flutter pub get

3. **Run app
   ```bash
   flutter run

## API Source
This app uses a free public API provided by Santrikoding:

### List Surah: https://quran-api.santrikoding.com/api/surah

### Surah Detail: https://quran-api.santrikoding.com/api/surah/{nomor}


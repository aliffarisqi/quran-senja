import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../shared/models/surah_model.dart';

/// A GetX controller for managing Surah audio playback.
///
/// This controller handles all audio playback logic, including loading Surahs,
/// managing play/pause states, tracking playback position, and handling
/// navigation between Surahs.
class SurahPlaybackController extends GetxController {
  // Static getter to easily access the controller instance.
  static SurahPlaybackController get instance => Get.find();

  // The core audio player instance from the just_audio package.
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Reactive variables to manage the playback state.
  final RxBool isPlaying = false.obs;
  final Rx<Duration> duration = Duration.zero.obs;
  final Rx<Duration> position = Duration.zero.obs;
  final Rx<Duration> bufferedPosition = Duration.zero.obs;

  // Reactive variables for managing the Surah list and current Surah.
  final RxInt currentSurahIndex = 0.obs;
  final RxList<SurahModel> surahList = <SurahModel>[].obs;

  /// Provides read-only access to the currently playing Surah model.
  SurahModel? get currentSurah => surahList.isNotEmpty ? surahList[currentSurahIndex.value] : null;

  @override
  void onInit() {
    initListeners();
    super.onInit();
  }

  @override
  void onClose() {
    // It's crucial to dispose of the audio player to free up resources.
    _audioPlayer.dispose();
    super.onClose();
  }

  /// Initializes all the stream listeners for the audio player.
  ///
  /// These listeners update the reactive variables whenever the player's
  /// state changes, which in turn automatically updates the UI.
  void initListeners() {
    // Listen for changes in the total duration of the track.
    _audioPlayer.durationStream.listen((d) {
      if (d != null) duration.value = d;
    });

    // Listen for changes in the current playback position.
    _audioPlayer.positionStream.listen((p) {
      position.value = p;
    });

    // Listen for changes in the buffered position (how much of the audio is loaded).
    _audioPlayer.bufferedPositionStream.listen((b) {
      bufferedPosition.value = b;
    });

    // Listen for changes in the playing state (e.g., play, pause).
    _audioPlayer.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });

    // Listen for the audio processing state.
    _audioPlayer.processingStateStream.listen((state) {
      // If a Surah finishes, automatically play the next one.
      if (state == ProcessingState.completed) {
        playNext();
      }
    });
  }

  /// Loads a new list of Surahs and starts playing from the initial index.
  Future<void> loadSurahList(List<SurahModel> list, int initialIndex) async {
    surahList.value = list;
    currentSurahIndex.value = initialIndex;
    await playSurahAtIndex(initialIndex);
  }

  /// Loads and plays the Surah at the specified index.
  Future<void> playSurahAtIndex(int index) async {
    if (index < 0 || index >= surahList.length) return;

    currentSurahIndex.value = index;
    final surah = surahList[index];

    try {
      await _audioPlayer.setUrl(surah.audio);
      await _audioPlayer.play();
      isPlaying.value = true;
    } catch (e) {
      // You can implement error handling here, e.g., showing a snackbar.
      isPlaying.value = false;
    }
  }

  /// Toggles the play/pause state of the current Surah.
  Future<void> togglePlayPause() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    isPlaying.value = _audioPlayer.playing;
  }

  /// Plays the next Surah in the list, or loops back to the first one.
  Future<void> playNext() async {
    final nextIndex = currentSurahIndex.value + 1;
    if (nextIndex < surahList.length) {
      await playSurahAtIndex(nextIndex);
    } else {
      // Loop back to the beginning of the list.
      await playSurahAtIndex(0);
    }
  }

  /// Plays the previous Surah in the list, or loops to the last one.
  Future<void> playPrevious() async {
    final prevIndex = currentSurahIndex.value - 1;
    if (prevIndex >= 0) {
      await playSurahAtIndex(prevIndex);
    } else {
      // Loop to the end of the list.
      await playSurahAtIndex(surahList.length - 1);
    }
  }

  /// Seeks to a specific position in the current audio track.
  Future<void> seekTo(Duration newPosition) async {
    await _audioPlayer.seek(newPosition);
  }
}

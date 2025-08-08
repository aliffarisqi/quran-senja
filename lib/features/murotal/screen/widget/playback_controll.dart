import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/shape/app_spacing.dart';
import '../../../../common/widget/space/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/murotal_playback_controller.dart';

/// A widget that displays the audio playback controls.
///
/// This widget uses `Obx` to reactively update the UI based on the state
/// of the `SurahPlaybackController`, including playback position, duration,
/// and the playing status.
class PlaybackControll extends StatelessWidget {
  const PlaybackControll({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the controller instance, assuming it's initialized via AppBinding.
    final controller = SurahPlaybackController.instance;

    return Obx(() {
      final pos = controller.position.value;
      final dur = controller.duration.value;
      final buffered = controller.bufferedPosition.value;

      return Positioned(
        // Positions the container at the bottom of the screen.
        bottom: 0,
        left: 0,
        right: 0,
        child: QSRoundedContainer(
          hasShadow: true,
          width: double.infinity,
          padding: EdgeInsets.only(
            top: QSSizes.spaceBtwSections,
            left: QSSizes.spaceBtwSections,
            right: QSSizes.spaceBtwSections,
            bottom: QSSizes.spaceBtwSections * 2,
          ),
          child: Column(
            children: [
              // Row to display current position and total duration.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(pos)),
                  Text(_formatDuration(dur)),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Buffered bar (non-interactive).
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: SliderComponentShape.noThumb,
                      activeTrackColor: QSColors.primary,
                      inactiveTrackColor: QSColors.primaryLight,
                    ),
                    child: Slider(
                      min: 0,
                      max: dur.inMilliseconds.toDouble(),
                      value: buffered.inMilliseconds.toDouble().clamp(0, dur.inMilliseconds.toDouble()),
                      onChanged: (_) {},
                    ),
                  ),

                  // Position slider (interactive).
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      activeTrackColor: QSColors.primaryMedium,
                      inactiveTrackColor: Colors.transparent,
                      thumbColor: QSColors.primaryMedium,
                    ),
                    child: Slider(
                      min: 0,
                      max: dur.inMilliseconds.toDouble(),
                      value: pos.inMilliseconds.toDouble().clamp(0, dur.inMilliseconds.toDouble()),
                      onChanged: (newValue) {
                        // Seek to the new position when the slider is dragged.
                        controller.seekTo(Duration(milliseconds: newValue.toInt()));
                      },
                    ),
                  ),
                ],
              ),
              QSAppSpacing.verticalLg,
              // Row of playback control buttons.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Previous track button.
                  IconButton(
                    onPressed: controller.playPrevious,
                    icon: Icon(
                      Icons.skip_previous,
                      color: QSColors.darkerGrey,
                      size: QSSizes.iconLg,
                    ),
                  ),
                  // Play/Pause button in a rounded container.
                  QSRoundedContainer(
                    radius: QSSizes.cardRadiusLg,
                    padding: const EdgeInsets.all(QSSizes.spacingSm),
                    hasShadow: true,
                    child: IconButton(
                      onPressed: controller.togglePlayPause,
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          // Changes icon based on the playing state.
                          controller.isPlaying.value ? CupertinoIcons.pause_solid : CupertinoIcons.play_arrow_solid,
                          key: ValueKey(controller.isPlaying.value),
                          color: QSColors.primaryMedium,
                          size: QSSizes.iconLg,
                        ),
                      ),
                    ),
                  ),
                  // Next track button.
                  IconButton(
                    onPressed: controller.playNext,
                    icon: Icon(
                      Icons.skip_next,
                      color: QSColors.darkerGrey,
                      size: QSSizes.iconLg,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  /// Formats a `Duration` object into a `mm:ss` or `hh:mm:ss` string.
  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }
}

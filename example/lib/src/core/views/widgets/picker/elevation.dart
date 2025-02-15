import 'package:example/src/core/views/widgets/bordered_container.dart';
import 'package:example/src/features/home/views/ui_states/toast_detail_ui_state.dart';
import 'package:flutter/material.dart';

final elevationValues = {
  'None': 0.0,
  'Low mode shadow': 5.0,
  'High mode shadow': 10.0,
};

class ElevationPicker extends StatelessWidget {
  const ElevationPicker({
    super.key,
    this.selectedElevation,
    this.onChanged,
  });

  final double? selectedElevation;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedElevation =
        this.selectedElevation ?? elevationValues.values.first;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: elevationValues.entries.map((e) {
        final name = e.key;
        final value = e.value;

        return Expanded(
          child: BorderedContainer(
            height: 48,
            elevation: value,
            margin: const EdgeInsetsDirectional.only(end: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              onChanged?.call(value);
            },
            active: selectedElevation == value,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Offstage(
                  offstage: selectedElevation != value,
                  child: const Icon(Icons.check),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ShadowPicker extends StatelessWidget {
  const ShadowPicker({
    super.key,
    this.selectedShadow = ShadowOptions.none,
    this.onChanged,
  });

  final ShadowOptions selectedShadow;
  final ValueChanged<ShadowOptions>? onChanged;

  @override
  Widget build(BuildContext context) {
    final selectedShadow = this.selectedShadow;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ShadowOptions.values.map((e) {
        final name = e.title;
        final value = e;

        return Expanded(
          child: ShadowContainer(
            height: 48,
            boxShadow: e.shadow,
            margin: const EdgeInsetsDirectional.only(end: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              onChanged?.call(value);
            },
            active: selectedShadow == value,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Offstage(
                  offstage: selectedShadow != value,
                  child: const Icon(Icons.check),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

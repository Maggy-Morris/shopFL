import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../cubit/slider_cubit.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  SfRangeValues _values = const SfRangeValues(40, 60);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<SliderCubit, SliderState>(
          builder: (context, state) {
            return Center(
              child: SfRangeSlider(
                shouldAlwaysShowTooltip: true,
                stepSize: 5,
                min: 0,
                max: 100,
                tooltipShape: const SfPaddleTooltipShape(),
                values: _values,
                onChanged: (SfRangeValues values) {
                  _values = values;
                  context.read<SliderCubit>().onSliderChanged(values);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

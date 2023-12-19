import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/widget/generate_number_dialog/generate_number_vm.dart';
import 'package:lucky_generator/widget/generic_button.dart';

class GenerateNumberDialog extends StatefulWidget {
  const GenerateNumberDialog({super.key});

  @override
  State<StatefulWidget> createState() => _GenerateNumberDialogState();
}

class _GenerateNumberDialogState extends BaseState<GenerateNumberDialog> {
  late final GenerateNumberVM _vm = GenerateNumberVM()..bind(this);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Row(children: [
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]),

                // Disclaimer
                Text(S().generate_number_title, textAlign: TextAlign.center),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(children: [
                    // Middle progress circle
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                          width: double.infinity,
                          child: Observer(
                              builder: (ctx) => CircularProgressIndicator(
                                    strokeWidth: 10,
                                    backgroundColor: Colors.black12,
                                    value: _vm.indicatorPercent,
                                    semanticsLabel: 'Circular progress indicator',
                                  ))),
                    ),

                    // Text in progress circle center
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Observer(
                          builder: (ctx) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Message
                              Text(
                                _vm.getGeneratingText(_vm.generateState),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),

                              // Generated number
                              if (_vm.generatedNumber != null)
                                Text(
                                  _vm.generatedNumber.toString(),
                                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                                )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),

                const SizedBox(height: 30),

                // Generate button
                Observer(
                    builder: (ctx) => GenericButton(
                          title: S().generate,
                          onPressed: _vm.isGenerating ? null : _vm.onGenerateButtonPressed,
                        ))
              ],
            )));
  }
}

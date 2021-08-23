import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/atoms/button.dart';
import '../../../widgets/global/top_bar.dart';
import '../settings.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Settings"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: BlocBuilder<SettingsCubit, String>(
                      builder: (context, state) {
                    return Text('Key: $state');
                  })),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: Theme.of(context).accentColor,
                    hintText: 'Enter a search term'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      onClick: () {
                        context
                            .read<SettingsCubit>()
                            .setKey(textController.text);
                      },
                      text: 'Set LIFX API key',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

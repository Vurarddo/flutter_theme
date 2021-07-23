import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:cross_platform_project/application.dart';
import 'package:cross_platform_project/ui_kit/fields/dropdown_button_field.dart';
import 'package:cross_platform_project/infrastructure/theme/theme_extensions.dart';

import 'ui_kit/checkbox/vt_checkbox.dart';
import 'utils/localization_extensions.dart';

class UIScreen extends StatefulWidget {
  static const _routeName = '/ui';

  static PageRoute<UIScreen> getRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: _routeName),
      builder: (context) => UIScreen(),
    );
  }

  @override
  _UIScreenState createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  int? _selectValue;
  bool _hidePassword = true;
  bool _vtCheckBoxValue = true;
  bool _vtSwitchValue = true;
  bool? _vtTristateCheckBoxValue;

  void _onChangeVTCheckBox(bool? value) {
    setState(() => _vtCheckBoxValue = value!);
  }

  void _onChangeVTSwitch(bool? value) {
    setState(() => _vtSwitchValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations!.uiScreen),
        actions: [
          PopupMenuButton<ThemeMode>(
            itemBuilder: (context) => [
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.light,
                child: Text(context.localizations!.lightTheme),
              ),
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.dark,
                child: Text(context.localizations!.darkTheme),
              ),
              PopupMenuItem<ThemeMode>(
                value: ThemeMode.system,
                child: Text(context.localizations!.systemTheme),
              ),
            ],
            onSelected: (themeMode) {
              context.read<ApplicationState>().setThemeMode(themeMode);
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DividerTheme(
                data: context.theme.dividerTheme.copyWith(color: Colors.transparent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildText(),
                    Divider(),
                    ..._buildButtons(),
                    Divider(),
                    _buildSelect(),
                    Divider(),
                    ..._buildSwitches(),
                    Divider(),
                    _buildUserNameField(),
                    Divider(),
                    _buildPasswordField(),
                    Divider(),
                    _buildErrorField(),
                    Divider(),
                    _buildAreaField(),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildText() {
    final textTheme = context.theme.textTheme;

    return [
      Text('Headline 1', style: textTheme.headline1),
      Text('Headline 2', style: textTheme.headline2),
      Text('Headline 3', style: textTheme.headline3),
      Text('Headline 4', style: textTheme.headline4),
      Text('Headline 5', style: textTheme.headline5),
      Text('Headline 6', style: textTheme.headline6),
      Text('Subtitle 1', style: textTheme.subtitle1),
      Text('Subtitle 2', style: textTheme.subtitle2),
      Text('Body Text 1', style: textTheme.bodyText1),
      Text('Body Text 2', style: textTheme.bodyText2),
      Text('Caption', style: textTheme.caption),
      Text('Button', style: textTheme.button),
      Text('Overline', style: textTheme.overline),
    ];
  }

  void _showDummyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.localizations!.dummyDialog),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.localizations!.close),
            ),
          ],
        );
      },
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  List<Widget> _buildButtons() {
    return [
      Row(
        children: [
          TextButton(
            onPressed: _showDummyDialog,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(context.localizations!.clickMe),
            ),
          ),
          VerticalDivider(),
          TextButton(
            onPressed: null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(context.localizations!.clickMe),
            ),
          ),
        ],
      ),
      Divider(),
      Row(
        children: [
          ElevatedButton(onPressed: _showDatePicker, child: Text(context.localizations!.clickMe)),
          VerticalDivider(),
          ElevatedButton(onPressed: null, child: Text(context.localizations!.clickMe)),
        ],
      ),
      Divider(),
      Row(
        children: [
          OutlinedButton(onPressed: _showTimePicker, child: Text(context.localizations!.clickMe)),
          VerticalDivider(),
          OutlinedButton(onPressed: null, child: Text(context.localizations!.clickMe)),
        ],
      ),
      Divider(),
      FloatingActionButton(
        onPressed: () {},
        child: FaIcon(const IconData(0x1F6E0, fontFamily: 'FF Mark'), color: Colors.black),
      ),
    ];
  }

  Widget _buildSelect() {
    return DropdownButtonField(
      value: _selectValue,
      onChanged: (int? value) {
        setState(() {
          _selectValue = value!;
        });
      },
      decoration: InputDecoration(labelText: context.localizations!.select),
      itemsBuilder: (selectedItem) => [
        DropdownMenuItem(value: 1, child: Text(context.localizations!.one)),
        DropdownMenuItem(value: 2, child: Text(context.localizations!.two)),
        DropdownMenuItem(value: 3, child: Text(context.localizations!.three)),
        DropdownMenuItem(value: 4, child: Text(context.localizations!.four)),
      ],
    );
  }

  List<Widget> _buildSwitches() {
    return [
      Row(
        children: [
          VTCheckbox(value: _vtCheckBoxValue, onChanged: _onChangeVTCheckBox),
          VerticalDivider(),
          Switch(value: _vtSwitchValue, onChanged: _onChangeVTSwitch),
          VerticalDivider(),
          Radio(value: 1, groupValue: 1, onChanged: (value) {}),
        ],
      ),
      Row(
        children: [
          VTCheckbox(value: false, onChanged: (value) {}),
          VerticalDivider(),
          Switch(value: false, onChanged: (value) {}),
          VerticalDivider(),
          Radio(value: 2, groupValue: 1, onChanged: (value) {}),
        ],
      ),
      Row(
        children: [
          VTCheckbox(value: null, onChanged: null, tristate: false),
          VerticalDivider(),
          Switch(value: true, onChanged: null),
          VerticalDivider(),
          Radio(value: 1, groupValue: 1, onChanged: null),
        ],
      ),
      Row(
        children: [
          VTCheckbox(
              value: _vtTristateCheckBoxValue,
              onChanged: (v) {
                setState(() {
                  _vtTristateCheckBoxValue = v;
                });
              },
              tristate: true),
        ],
      ),
    ];
  }

  Widget _buildUserNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: context.localizations!.username,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordField() {
    final icon = _hidePassword ? Icons.visibility : Icons.visibility_off;
    return TextFormField(
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: context.localizations!.password,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
          icon: Icon(icon),
        ),
      ),
    );
  }

  Widget _buildErrorField() {
    return TextFormField(
      validator: (v) => context.localizations!.somethingWrong,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: context.localizations!.errorField,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildAreaField() {
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: context.localizations!.multiline,
        border: OutlineInputBorder(),
      ),
    );
  }
}

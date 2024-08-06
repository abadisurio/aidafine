part of 'app_preferences_page.dart';

class _AppPreferencesList extends StatelessWidget {
  const _AppPreferencesList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPreferencesBloc, AppPreferencesState>(
      buildWhen: (previous, current) {
        return previous.preferences != current.preferences;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.preferences.length,
          itemBuilder: (context, index) {
            final entry = state.preferences.entries.elementAt(index);
            late Widget trailing;
            switch (entry.value.value.runtimeType) {
              case bool:
                trailing = Switch(
                  value: entry.value.value as bool? ?? false,
                  onChanged: (value) {
                    context
                        .read<AppPreferencesBloc>()
                        .add(ToggleBoolean(id: entry.key, value: value));
                  },
                );
              default:
            }

            return ListTile(
              title: Text(entry.value.name),
              trailing: trailing,
            );
          },
        );
      },
    );
  }
}

import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;

class BulbGroup {
  final String name;
  final List<Bulb> bulbs;

  BulbGroup({required this.name, required this.bulbs});
}

List<BulbGroup> lightsToBulbGroup(List<Bulb> lights) {
  final Set<String> groupNames =
      Set.from(lights.map((lights) => lights.group.name));

  final bulbGroups = groupNames
      .map((groupName) => BulbGroup(name: groupName, bulbs: []))
      .toList();

  for (final BulbGroup group in bulbGroups) {
    final Iterable<Bulb> matchingBulbs =
        lights.where((Bulb light) => light.group.name == group.name);
    group.bulbs.addAll(matchingBulbs.toList());
  }

  return bulbGroups;
}

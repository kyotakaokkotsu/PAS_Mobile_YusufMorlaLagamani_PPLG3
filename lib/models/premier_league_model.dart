class PremierLeagueModel {
  final List<Team> teams;

  PremierLeagueModel({required this.teams});

  factory PremierLeagueModel.fromJson(Map<String, dynamic> json) {
    return PremierLeagueModel(
      teams: (json["teams"] as List? ?? [])
          .map((team) => Team.fromJson(team))
          .toList(),
    );
  }
}

class Team {
  final String name;
  final String stadium;
  final String badge;

  Team({required this.name, required this.stadium, required this.badge});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json["strTeam"] ?? "",
      stadium: json["strStadium"] ?? "",
      badge: json["strBadge"] ?? "",
    );
  }
}

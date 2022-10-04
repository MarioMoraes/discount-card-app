class CardSelectModel {
  String? description;
  bool? selected;

  CardSelectModel({this.description, this.selected});

  @override
  String toString() {
    return 'CardSelectModel (description: $description, selected: $selected)';
  }
}

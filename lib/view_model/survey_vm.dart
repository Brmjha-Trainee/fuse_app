class SurveyChoices {
  final String? choiceText;
   bool isSelected;
  SurveyChoices(this.choiceText, {this.isSelected = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyChoices &&
          runtimeType == other.runtimeType &&
          choiceText == other.choiceText;

  @override
  int get hashCode => choiceText.hashCode;
}

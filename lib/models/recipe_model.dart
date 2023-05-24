class RecipeModel {
  String label;
  String appUrl;
  String imageUrl;
  double cal;

  // RecipeModel(this.label, this.appUrl, this.cal, this.imageUrl, {required label});
  RecipeModel(
      {this.label = "LABEL",
      this.cal = 0.000,
      this.imageUrl = "IMAGE",
      this.appUrl = "URL"});
  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      label: recipe['label'],
      cal: recipe['calories'],
      appUrl: recipe['url'],
      imageUrl: recipe['image'],
    );
  }
}

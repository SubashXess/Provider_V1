class FavoriteListModel {
  int? id;
  String? image;
  String? title;

  FavoriteListModel({this.id, this.image, this.title});

  FavoriteListModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
    };
  }

  static List<FavoriteListModel> favoriteList = [
    FavoriteListModel(
        id: 0,
        image: 'assets/images/cover-1.jpg',
        title: 'Flux Pavilion - Cannot Hold You (feat. Jamie Lidell)'),
    FavoriteListModel(
        id: 1,
        image: 'assets/images/cover-2.jpg',
        title: 'One Hope & Vorsa - toxic love (lyrics)'),
    FavoriteListModel(
        id: 2,
        image: 'assets/images/cover-3.jpg',
        title: 'ALOTT x Wankelmut x Enny-Mae - You and I'),
    FavoriteListModel(
        id: 3,
        image: 'assets/images/cover-4.jpg',
        title: 'Dylan Matthew - End Up Alone'),
    FavoriteListModel(
        id: 4,
        image: 'assets/images/cover-5.jpg',
        title: 'Culture Code - Mayday (feat. Natalie Major)'),
    FavoriteListModel(
        id: 5,
        image: 'assets/images/cover-6.jpg',
        title: 'What So Not - As One (feat. Herizen)'),
    FavoriteListModel(
        id: 6,
        image: 'assets/images/cover-7.jpg',
        title: 'SAINT. - Walking Home'),
    FavoriteListModel(
        id: 7,
        image: 'assets/images/cover-8.jpg',
        title: 'Dabin & CAPPA - Feel Like (Midnight Kids Remix)'),
    FavoriteListModel(
        id: 8, image: 'assets/images/cover-9.jpg', title: 'Echos - Mourning'),
    FavoriteListModel(
        id: 9,
        image: 'assets/images/cover-10.jpg',
        title: 'Adam Jensen - Bad Day for My Enemies (lyrics)'),
  ];
}

class TPropertiesModel {
  String title;
  String subTitle;
  String description;
  String thumbnail;
  List<String> images;
  int rooms;

  int area;
  int floors;
  int showers;
  int livingRoom;
  int price;
  double rating;
  String category;
  String status;
  String owner;
  TPropertiesModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.rooms,
    required this.area,
    required this.floors,
    required this.price,
    required this.rating,
    required this.showers,
    required this.livingRoom,
    required this.category,
    required this.status,
    required this.owner,
  });
}

List<TPropertiesModel> properties = [
  TPropertiesModel(
      title: 'Penthouse Villa',
      subTitle: "St. Second Avenue 780, NY",
      description:
          'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
      thumbnail: 'assets/images/proprietes/840102411_34.jpg',
      images: [
        'assets/images/proprietes/appartements-maison-avantages-inconvenients-conseils-interieurs-duplex-jardin-deco.jpg',
        'assets/images/proprietes/app-maison-de-ville.jpg',
        'assets/images/proprietes/unnamed.jpg',
        'assets/images/proprietes/840102411_34.jpg'
      ],
      rooms: 5,
      area: 3000,
      floors: 3,
      price: 3000,
      rating: 4.3,
      showers: 2,
      livingRoom: 2,
      category: 'Villas',
      status: 'Acheté',
      owner: 'Théophile'),
  TPropertiesModel(
      title: 'Duplex Housing',
      subTitle: "St. Second Avenue 780, NY",
      description:
          'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
      thumbnail: 'assets/images/proprietes/app-maison-de-ville.jpg',
      images: [
        'assets/images/proprietes/app-maison-de-ville.jpg',
        'assets/images/proprietes/app-maison-de-ville.jpg',
        'assets/images/proprietes/app-maison-de-ville.jpg'
      ],
      rooms: 3,
      area: 3500,
      floors: 2,
      price: 5000,
      rating: 4.7,
      showers: 3,
      livingRoom: 2,
      category: 'Maisons',
      status: 'Vendu',
      owner: 'Gauthier Morel'),
  TPropertiesModel(
      title: 'Orchard House',
      subTitle: "St. Second Avenue 780, NY",
      description:
          'Est pariatur pariatur nisi cupidatat deserunt incididunt enim eiusmod do minim exercitation. Exercitation mollit enim officia cupidatat occaecat quis cillum cupidatat consectetur ad. Amet in dolore occaecat labore non anim. Laborum anim occaecat eiusmod occaecat ut sit. Est excepteur Lorem culpa deserunt anim duis quis anim ea in tempor exercitation exercitation. Veniam magna pariatur irure commodo mollit ut irure. Tempor aute consequat in labore magna sunt et commodo ut cupidatat.',
      thumbnail: 'assets/images/proprietes/app-maison-de-ville.jpg',
      images: [
        'assets/images/proprietes/app-maison-de-ville.jpg',
        'assets/images/proprietes/app-maison-de-ville.jpg',
        'assets/images/proprietes/app-maison-de-ville.jpg'
      ],
      rooms: 4,
      area: 4200,
      floors: 3,
      price: 6000,
      rating: 4.8,
      showers: 1,
      livingRoom: 1,
      category: 'Maisons',
      status: 'En location',
      owner: 'Gauthier Morel'),
];

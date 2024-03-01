class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.animalsCount = 0,
    this.countFur = 0,
    this.rating = 0.0,
    this.name = '',
    this.age = '',
    this.sex = '',
  });

  String name;
  String title;
  int animalsCount;
  int countFur;
  String age;
  double rating;
  String imagePath;
  String sex;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'lib/images/happyAnimalsClub.png',
      title: 'Happy Animals Club',
      animalsCount: 24,
      countFur: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'lib/images/pawsLogo.jpg',
      title: 'PAWS Animal Rehabilitation Center ',
      animalsCount: 22,
      countFur: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'lib/images/animalsRescuePH.png',
      title: 'Animal Rescue PH',
      animalsCount: 24,
      countFur: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'lib/images/darvLoho.jpeg',
      title: 'Davao City Dog Pound',
      animalsCount: 22,
      countFur: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> listOfFurFriends = <Category>[
    Category(
      imagePath: 'lib/images/Deputy.PNG',
      name: 'DEPUTY',
      age: '1 year old',
    ),
    Category(
      imagePath: 'lib/images/Mita.PNG',
      name: 'MITA',
      age: '3 years old',
    ),
    Category(
      imagePath: 'lib/images/Therese.PNG',
      name: 'THERESE',
      age: '5 years old',
    ),
    Category(
      imagePath: 'lib/images/Tina.PNG',
      name: 'TINA',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Tiktok.PNG',
      name: 'TIKTOK',
      age: '1 year old',
    ),
    Category(
      imagePath: 'lib/images/Shadow.PNG',
      name: 'TENDER',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Deputy.PNG',
      name: 'DEPUTY',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Grumpy.PNG',
      name: 'GRUMPY',
      age: '3 years old',
    ),
    Category(
      imagePath: 'lib/images/Shadow.PNG',
      name: 'SHADOW',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Haruka.PNG',
      name: 'HARUKA',
      age: '1 year old',
    ),
    Category(
      imagePath: 'lib/images/Violet.PNG',
      name: 'VIOLET',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Skyler.PNG',
      name: 'SKYLER',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Tala.PNG',
      name: 'TALA',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Sawyer.PNG',
      name: 'SAWYER',
      age: '2 years old',
    ),
    Category(
      imagePath: 'lib/images/Eagle.PNG',
      name: 'EAGLE',
      age: '5 months old',
    ),
    Category(
      imagePath: 'lib/images/Kevin.PNG',
      name: 'KEVIN',
      age: '1 year old',
    ),
  ];
}

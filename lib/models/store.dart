class Store {
  final String? image, title, description, location;
  final String? sid;
  Store({
    this.sid,
    this.image,
    this.title,
    this.description,
    this.location,
  });
}

List<Store> stores = <Store>[
  Store(
    sid: 'st-1',
    image: 'assets/images/st_1.png',
    title: 'Store 1',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt.",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-2',
    image: 'assets/images/st_2.png',
    title: 'Store 2',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-3',
    image: 'assets/images/st_3.png',
    title: 'Store 3',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-4',
    image: 'assets/images/st_4.png',
    title: 'Store 4',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-5',
    image: 'assets/images/st_5.png',
    title: 'Store 5',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-6',
    image: 'assets/images/st_6.png',
    title: 'Store 6',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
];

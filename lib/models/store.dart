class Store {
  final String? title, description, location;
  final String? sid;
  Store({
    this.sid,
    this.title,
    this.description,
    this.location,
  });
}

List<Store> stores = <Store>[
  Store(
    sid: 'st-1',
    title: 'Store 1',
    description: dummyText,
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-2',
    title: 'Store 2',
    description: dummyText,
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-3',
    title: 'Store 3',
    description: dummyText,
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-4',
    title: 'Store 4',
    description:
        "Velit esse ea nulla exercitation esse labore occaecat tempor deserunt",
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-5',
    title: 'Store 5',
    description: dummyText,
    location: "Gurgaon, Haryana",
  ),
  Store(
    sid: 'st-6',
    title: 'Store 6',
    description: dummyText,
    location: "Gurgaon, Haryana",
  ),
];

String dummyText = 'Cillum tempor do non irure sit, duis deserunt sint non '
    'aliqua ullamco sit excepteur. Duis minim in ipsum excepteur '
    'in ea. Nulla proident amet aute. Anim proident tempor '
    'voluptate officia, esse qui dolore incididunt sit. Quis '
    'id non consequat. Incididunt consectetur aute aliqua. '
    'Ullamco in amet officia ipsum. Cillum deserunt incididunt '
    'laboris lorem in sint minim. Ut irure adipiscing nostrud. '
    'Pariatur et dolore pariatur eiusmod non.'
    '\n\n'
    '  -  Men\'s and Women\'s Clothing\n'
    '  -  Womens\'s Jewelary\n'
    '  -  Men\'s Accessories\n'
    '  -  Kid\'s Apparells and New born Toys\n';

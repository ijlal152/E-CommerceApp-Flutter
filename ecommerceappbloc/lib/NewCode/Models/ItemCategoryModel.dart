class ItemCategoryModel {
  const ItemCategoryModel(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final homeCategries = <ItemCategoryModel>[
  const ItemCategoryModel('assets/icons/category_sofa@2x.png', 'Sofa', '1'),
  const ItemCategoryModel('assets/icons/category_chair@2x.png', 'Chair', '2'),
  const ItemCategoryModel('assets/icons/category_table@2x.png', 'Table', '3'),
  const ItemCategoryModel('assets/icons/category_kitchen@2x.png', 'Kitchen', '4'),
  const ItemCategoryModel('assets/icons/category_lamp@2x.png', 'Lamp', '5'),
  const ItemCategoryModel('assets/icons/category_cupboard@2x.png', 'Cupboard', '6'),
  const ItemCategoryModel('assets/icons/category_vase@2x.png', 'Vase', '7'),
  const ItemCategoryModel('assets/icons/category_others@2x.png', 'Others', '8'),
];

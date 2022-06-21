class ListItem {
  final String title;
  final String price;

  const ListItem({
    required this.title,
    required this.price,
  });
}

final List<ListItem> listItems = [
  const ListItem(
    title: '발사믹치킨 + 웨지감자',
    price: '22,000원',
  ),
  const ListItem(
    title: '시그니처순살세트 + 웨지감자',
    price: '34,000원',
  ),
  const ListItem(
    title: '리얼치킨버거 + 웨지감자',
    price: '25,000원',
  ),
  const ListItem(
    title: '교촌칠리포테이토 + 웨지감자',
    price: '30,000원',
  ),
];

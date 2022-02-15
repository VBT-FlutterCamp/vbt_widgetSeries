class OnBoardModel {
  String title;
  String description;
  String image;
  OnBoardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardModel> models = [
  OnBoardModel(
      title: 'Discounted Secondhand Books',
      description: 'Used and near new secondhand books at great prices.',
      image: 'assets/images/book_girl.png'),
  OnBoardModel(
      title: '20 Book Grocers Nationally',
      description: 'We ve successfully opened 20 stores across Australia.',
      image: 'assets/images/book_read.png'),
  OnBoardModel(
      title: 'Sell or Recycle Your Old Books With Us',
      description: 'If you re looking to downsize, sell or recycle old books, the Book Grocer can help.',
      image: 'assets/images/book_share.png')
];

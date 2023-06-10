import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/data_models.dart';

Map homePagePosterMap = {
  "imageAsset": Assets.images.programming.path,
  "writer": "ملیکا عزیزی",
  "date": "یک روز پیش",
  "title": "دوازده قدم برنامه نویسی یک دوره ی",
  "view": "253"
};

List<HashTagModel> tagList = [
  HashTagModel(title: 'جاوا'),
  HashTagModel(title: 'برنامه نویسی وب'),
  HashTagModel(title: 'پادکست رادیو کدیاد'),
  HashTagModel(title: 'وب'),
  HashTagModel(title: 'هوش مصنوعی'),
  HashTagModel(title: 'IOT'),
  HashTagModel(title: 'دارت'),
  HashTagModel(title: 'جاوا'),
];

List<HashTagModel> selectedTags = [];

List<BlogModel> blogList = [
  BlogModel(
      id: 1,
      imageUrl:
          'https://static.digiato.com/digiato/2023/04/Elon-Musk-31-910x600.jpg.webp',
      title:
          'ایلان ماسک حدود 4 میلیاد از سهام تسلا را فروخت و با توجه به وضعیت بازار به باد فنا داد',
      writer: 'جواد تاجی',
      writerImageUrl:
          'https://digitato.com/wp-content/uploads/2021/02/1-30.jpg',
      date: 'یک ساعت پیش',
      content:
          'ایلان ماسک مشهور به غول تکنولوژی 4 میلیارد از سهام تسلا را فروخت و به باد فنا داد چرا اون این کار را کرد ؟ یک سوال اساسی و مهم است اما برای شنیدن جواب بیا پایین',
      views: '256'),
  BlogModel(
      id: 1,
      imageUrl:
          'https://static.digiato.com/digiato/2023/04/Elon-Musk-31-910x600.jpg.webp',
      title: 'ایلان ماسک حدود 4 میلیاد از سهام تسلا را فروخت',
      writer: 'جواد تاجی',
      writerImageUrl:
          'https://digitato.com/wp-content/uploads/2021/02/1-30.jpg',
      date: 'یک ساعت پیش',
      content:
          'ایلان ماسک مشهور به غول تکنولوژی 4 میلیارد از سهام تسلا را فروخت و به باد فنا داد چرا اون این کار را کرد ؟ یک سوال اساسی و مهم است اما برای شنیدن جواب بیا پایین',
      views: '256'),
  BlogModel(
      id: 1,
      imageUrl:
          'https://static.digiato.com/digiato/2023/04/Elon-Musk-31-910x600.jpg.webp',
      title: 'ایلان ماسک حدود 4 میلیاد از سهام تسلا را فروخت',
      writer: 'جواد تاجی',
      writerImageUrl:
          'https://digitato.com/wp-content/uploads/2021/02/1-30.jpg',
      date: 'یک ساعت پیش',
      content:
          'ایلان ماسک مشهور به غول تکنولوژی 4 میلیارد از سهام تسلا را فروخت و به باد فنا داد چرا اون این کار را کرد ؟ یک سوال اساسی و مهم است اما برای شنیدن جواب بیا پایین',
      views: '256'),
  BlogModel(
      id: 1,
      imageUrl:
          'https://static.digiato.com/digiato/2023/04/Elon-Musk-31-910x600.jpg.webp',
      title: 'ایلان ماسک حدود 4 میلیاد از سهام تسلا را فروخت',
      writer: 'جواد تاجی',
      writerImageUrl:
          'https://digitato.com/wp-content/uploads/2021/02/1-30.jpg',
      date: 'یک ساعت پیش',
      content:
          'ایلان ماسک مشهور به غول تکنولوژی 4 میلیارد از سهام تسلا را فروخت و به باد فنا داد چرا اون این کار را کرد ؟ یک سوال اساسی و مهم است اما برای شنیدن جواب بیا پایین',
      views: '256'),
  BlogModel(
      id: 1,
      imageUrl:
          'https://static.digiato.com/digiato/2023/04/Elon-Musk-31-910x600.jpg.webp',
      title: 'ایلان ماسک حدود 4 میلیاد از سهام تسلا را فروخت',
      writer: 'جواد تاجی',
      writerImageUrl:
          'https://digitato.com/wp-content/uploads/2021/02/1-30.jpg',
      date: 'یک ساعت پیش',
      content:
          'ایلان ماسک مشهور به غول تکنولوژی 4 میلیارد از سهام تسلا را فروخت و به باد فنا داد چرا اون این کار را کرد ؟ یک سوال اساسی و مهم است اما برای شنیدن جواب بیا پایین',
      views: '256'),
];

List<PodcastModel> podcastList = [
  PodcastModel(
      id: 1,
      imageUrl:
          'https://media.wired.com/photos/620eb0f39266d5d11c07b3c5/master/w_2560%2Cc_limit/Gear-Podcast-Gear-1327244548.jpg',
      title: 'رمزون',
      nariator: 'سیاوش امیریان'),
      PodcastModel(
      id: 2,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHSS5AT0i3gCz6ZBSuiPQH3vQ2TTrEE8dyZxRUc3Gs27NphYWbHEQr_-aqaQvP0amfjEU&usqp=CAU',
      title: 'کدیاد',
      nariator: 'رضا عزیزی'),
      PodcastModel(
      id: 3,
      imageUrl:
          'https://www.clio.com/wp-content/uploads/2020/05/Clio_2020-Blog_Image-Top_10_Law_Firm_Podcasts.png',
      title: 'گیک',
      nariator: 'جادی میرمیرانی'),
      PodcastModel(
      id: 4,
      imageUrl:
          'https://media.wired.com/photos/5926c36b7034dc5f91bec876/master/w_2560%2Cc_limit/PodcastTA.jpg',
      title: 'متا',
      nariator: 'بهزاد کریم خانی'),
      PodcastModel(
      id: 5,
      imageUrl:
          'https://www.clio.com/wp-content/uploads/2020/05/Clio_2020-Blog_Image-Top_10_Law_Firm_Podcasts.png',
      title: 'گیک',
      nariator: 'جادی میرمیرانی'),
      PodcastModel(
      id: 6,
      imageUrl:
          'https://media.wired.com/photos/5926c36b7034dc5f91bec876/master/w_2560%2Cc_limit/PodcastTA.jpg',
      title: 'متا',
      nariator: 'بهزاد کریم خانی'),
];

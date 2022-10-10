import '../assets/assets_path.dart';

class ModelGeneral {
  String title;
  String? name;
  String imageUrl;
  double percentProgress;

  ModelGeneral({
    required this.imageUrl,
    required this.title,
    this.name,
    this.percentProgress = 0.53,
  });
}

//---------------------------------Category-----------------------------------//
final List<ModelGeneral> category = [
  ModelGeneral(
    imageUrl: AssetPath.iconBusiness,
    title: 'Business',
    name: '12 Mentors',
  ),
  ModelGeneral(
    imageUrl: AssetPath.iconDesign,
    title: 'Design',
    name: '43 Mentors',
  ),
  ModelGeneral(
    imageUrl: AssetPath.iconEntertainment,
    title: 'Entertainment',
    name: '52 Mentors',
  ),
  ModelGeneral(
    imageUrl: AssetPath.iconFood,
    title: 'Food',
    name: '52 Mentors',
  ),
  ModelGeneral(
    imageUrl: AssetPath.iconCode,
    title: 'IT & Software',
    name: '84 Mentors',
  ),
  ModelGeneral(
    imageUrl: AssetPath.iconMusic,
    title: 'Music',
    name: '10 Mentors',
  ),
];
//---------------------------------Activity-----------------------------------//
final List<ModelGeneral> activityComplete = [
  ModelGeneral(
    imageUrl: AssetPath.imgContent2,
    title: 'Jessica Apnovka ',
    name: 'Teaches Bussines',
    percentProgress: 1,
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent4,
    title: 'Bianca Lisa',
    name: 'Teaches Music',
    percentProgress: 1,
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent3,
    title: 'Nadine Anabelle',
    name: 'Teaches Sing',
    percentProgress: 1,
  ),
];

final List<ModelGeneral> activityIncomplete = [
  ModelGeneral(
    imageUrl: AssetPath.imgContent,
    title: 'Aquila Hernandez',
    name: 'Teaches Piano',
    percentProgress: 0.53,
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent5,
    title: 'James Haritz',
    name: 'Teaches Guitar',
    percentProgress: 0.53,
  ),
];
//----------------------------------Preview-----------------------------------//
final List<ModelGeneral> preview = [
  ModelGeneral(
    imageUrl: AssetPath.imgPreview,
    title: 'Entertainment',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview2,
    title: 'Healthy Food',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview,
    title: 'Entertainment',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview2,
    title: 'Healthy Food',
  ),
];
//----------------------------------Mentor------------------------------------//
final List<ModelGeneral> mentor = [
  ModelGeneral(
    imageUrl: AssetPath.imgMentor,
    title: 'Teaching Fashion',
    name: 'Bianca Lovata',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor2,
    title: 'Teach Photograph',
    name: 'Beatrix Anna',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor,
    title: 'Teaching Fashion',
    name: 'Bianca Lovata',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgMentor2,
    title: 'Teach Photograph',
    name: 'Beatrix Anna',
  ),
];

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
class ModelSetting {
  final String title;
  final String iconUrl;

  const ModelSetting({
    required this.iconUrl,
    required this.title,
  });
}

class ModelSubjects extends ModelSetting {
  ModelSubjects({required super.iconUrl, required super.title});
}

final List<ModelSubjects> subjects = [
  ModelSubjects(
    iconUrl: AssetPath.imgContentCourse,
    title: 'Social Psychology',
  ),
  ModelSubjects(
    iconUrl: AssetPath.imgContentCourse2,
    title: 'Psychology of Self',
  ),
  ModelSubjects(
    iconUrl: AssetPath.imgContentCourse3,
    title: 'Psychology Mood',
  ),
];

final List<ModelSubjects> subjectsGet = [
  ModelSubjects(
    iconUrl: AssetPath.iconTime,
    title: '11 Hours of Demand Video',
  ),
  ModelSubjects(
    iconUrl: AssetPath.iconFile,
    title: 'Exclusive learning materials',
  ),
  ModelSubjects(
    iconUrl: AssetPath.iconInfinity,
    title: 'Full lifetime access',
  ),
];

//----------------------------------Menu Item---------------------------------//
const ModelSetting itemShare = ModelSetting(
  iconUrl: AssetPath.iconShare,
  title: 'Share',
);

const ModelSetting itemDownload = ModelSetting(
  iconUrl: AssetPath.iconDownload,
  title: 'Download',
);

const ModelSetting itemRemove = ModelSetting(
  iconUrl: AssetPath.iconRemove,
  title: 'Remove',
);

const ModelSetting itemPlayVideo = ModelSetting(
  iconUrl: AssetPath.iconPlayCircle,
  title: 'Play',
);

final List<ModelSetting> menuItem = [itemShare, itemDownload, itemRemove];
final List<ModelSetting> menuItemDownload = [itemPlayVideo, itemRemove];
//----------------------------------Language----------------------------------//
final List<ModelSetting> language = [
  const ModelSetting(
    iconUrl: AssetPath.iconFrance,
    title: 'France',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconGerman,
    title: 'Germany',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconIndonesia,
    title: 'Indonesian',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconItaly,
    title: 'Italy',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconJapan,
    title: 'Japan',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconRussia,
    title: 'Russian',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconSweden,
    title: 'Sweden',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconUS,
    title: 'United States',
  ),
];
//------------------------------Account Setting-------------------------------//
final List<ModelSetting> accountSetting = [
  const ModelSetting(
    iconUrl: AssetPath.iconUser,
    title: 'Change Phone Number',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconPassword,
    title: 'Password',
  ),
];
//--------------------------------Application---------------------------------//
final List<ModelSetting> application = [
  const ModelSetting(
    iconUrl: AssetPath.iconDownload,
    title: 'Download Video',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconMyFavorite,
    title: 'My Favorite',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconLanguage,
    title: 'Language',
  ),
];

final List<ModelSetting> applicationToggle = [
  const ModelSetting(
    iconUrl: AssetPath.iconBell,
    title: 'Notification  ',
  ),
  const ModelSetting(
    iconUrl: AssetPath.iconDarkMode,
    title: 'Dark Mode   ',
  ),
];
//--------------------------------My Favorite---------------------------------//
final List<ModelGeneral> myFavorite = [
  ModelGeneral(
    imageUrl: AssetPath.imgContent3,
    title: 'Alexander Rithopher',
    name: 'Teaches Social Psychology',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgContent,
    title: 'Alexander Jane',
    name: 'Teaches Social Psychology',
  ),
  ModelGeneral(
    imageUrl: AssetPath.imgPreview,
    title: 'Keiben Kimberly',
    name: 'Teaches Healthy Food',
  ),
];

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
class ModelSettingDownload {
  final String title;
  final String name;
  final String imgUrl;
  final String part;

  const ModelSettingDownload({
    required this.imgUrl,
    required this.part,
    required this.title,
    required this.name,
  });
}

const ModelSettingDownload itemPart1 = ModelSettingDownload(
  imgUrl: AssetPath.imgContentDownload,
  part: 'Course Part 1',
  title: 'Introduction Mentor and\nCourse',
  name: 'Beatrix Annabel',
);

const ModelSettingDownload itemPart2 = ModelSettingDownload(
  imgUrl: AssetPath.imgContentDownload2,
  part: 'Course Part 2',
  title: 'Build Mood for Model in\nPhoto Shot',
  name: 'Beatrix Annabel',
);

const ModelSettingDownload itemPart3 = ModelSettingDownload(
  imgUrl: AssetPath.imgContentDownload3,
  part: 'Course Part 3',
  title: 'Cleaning and Setting\nCamera for Excelent Result',
  name: 'Beatrix Annabel',
);

const ModelSettingDownload itemPart4 = ModelSettingDownload(
  imgUrl: AssetPath.imgContentDownload4,
  part: 'Course Part 4',
  title: 'Make Vlog Video in\nFirst time With Walking',
  name: 'Beatrix Annabel',
);

final List<ModelSettingDownload> downloadItem = [
  itemPart1,
  itemPart2,
  itemPart3,
  itemPart4,
];
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

class ModelCourse extends ModelSetting {
  final String? time, part;

  const ModelCourse({
    required super.iconUrl,
    required super.title,
    this.time,
    this.part,
  });
}

const ModelCourse itemCourse1 = ModelCourse(
  iconUrl: AssetPath.imgCourseList,
  part: 'Course Part 1',
  time: '10:09',
  title: 'Introduction Mentor\nand Course 👋🏻',
);

const ModelCourse itemCourse2 = ModelCourse(
  iconUrl: AssetPath.imgCourseList2,
  part: 'Course Part 2',
  time: '10:09',
  title: 'Social Perceptions\nand Misperceptions',
);

const ModelCourse itemCourse3 = ModelCourse(
  iconUrl: AssetPath.imgCourseList3,
  part: 'Course Part 3',
  time: '10:09',
  title: 'Psychology of\nSelf-Presentation',
);

const ModelCourse itemCourse4 = ModelCourse(
  iconUrl: AssetPath.imgCourseList4,
  part: 'Course Part 4',
  time: '10:09',
  title: 'Conformity and\nDeindividiation',
);

const ModelCourse itemCourse5 = ModelCourse(
  iconUrl: AssetPath.imgCourseList5,
  part: 'Course Part 5',
  time: '10:10',
  title: 'Group Behavior: The\nGood, Bad, and Ugly',
);

final List<ModelCourse> courseItem = [
  itemCourse1,
  itemCourse2,
  itemCourse3,
  itemCourse4,
  itemCourse5,
];

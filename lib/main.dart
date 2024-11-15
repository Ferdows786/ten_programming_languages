import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('fa', 'Afg'),
      debugShowCheckedModeBanner: false,
      title: 'زبان های برنامه نویسی',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => homePage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/animations/Animation_Loading.json'),
      ),
      nextScreen: homePage(),
      backgroundColor: Colors.white,
      duration: 4000,
      splashIconSize: 400,
    );
  }
}

class homePage extends StatelessWidget {
  List languages = [
    {
      'name': 'Python',
      'description':
          'یک زبان سطح بالا است که به دلیل سینتکس ساده و خوانا، محبوبیت زیادی بدست آورده است. این زبان برای کاربرد های مختلف مانند توسعه وب، هوش مصنوعی وغیره کار ها استفاده میشود.',
      'image': 'assets/images/Python_11zon.png'
    },
    {
      'name': 'Javascript',
      'description':
          'زبانی است که در توسعه سمت کلاینت و تعاملات کاربر در وب استفاده میشود. این زبان همچنان به کمک فریم ورک های قوی مانند node.js در سمت سرور نیز استفاده میشود.',
      'image': 'assets/images/Javascript_11zon.png'
    },
    {
      'name': 'Java',
      'description':
          'یک زبان برنامه نویسی پر کاربرد است که در ساخت برنامه های سازمانی و موبایل بخصوص سیستم عامل اندروید استفاده میشود.',
      'image': 'assets/images/Java.png'
    },
    {
      'name': 'C++',
      'description':
          ' یک زبان قدرتمندی است که برای توسعه برنامه های سیستمی و بازی ها استفاده میشود که با کارایی بالا در سیستم های پیچیده و برنامه های کاربردی استفاده میشود سی پلس پلس  به‌خاطر طراحی بهینه و کنترل مستقیم بر منابع سخت‌افزاری، یکی از زبان‌های سریع و کارآمد است به همین دلیل سی پلس پلس در برنامه‌هایی که نیاز به عملکرد بالا دارند، مانند بازی‌های ویدئویی، نرم‌افزارهای علمی و غیره استفاده میشود',
      'image': 'assets/images/C++_11zon.jpg'
    },
    {
      'name': 'Swift',
      'description':
          'زبان برنامه نویسی است که توسط شرکت اپل برای توسعه برنامه های آی او اس و مک او اس طراحی شده است. این زبان با سرعت بالا و امنیت بالا طراحی شده است و سینتکس ساده و کارپسند دارد که توسعه دهندگان را قادر میسازد تا به راحتی کد های بهینه و امن بنویسند',
      'image': 'assets/images/Swift_11zon.png'
    },
    {
      'name': 'Kotlin',
      'description':
          'یک زبان مدرن و چند پلتفورم است که توسط شرکت جیت برینز توسعه داده شده و برای توسعه اپلیکیشن های اندرویدی توصیه میشود',
      'image': 'assets/images/Kotlin.png'
    },
    {
      'name': 'Ruby',
      'description':
          'یک زبان برنامه نویسی شی گرا است که بدلیل سادگی و انعطاف پذیری بسیار محبوب است. فلسفه روبی تمرکز بر خوانایی کد و بهره وری توسعه دهنده است که باعث شده است این زبان در میان تاپ ها و توسعه دهندگان وب مورد توجه قرار بگیرد',
      'image': 'assets/images/Ruby_11zon.png'
    },
    {
      'name': 'PHP',
      'description':
          'یک زبان سمت سرور است که بطور گسترده در توسعه وب استفاده میشود. این زبان برای ایجاد صفحات پویا و مدیریت دیتابیس ها در وبسایت ها بسیار مناسب است و با بسیاری از سیستم های مدیریت محتوا مانند وردپرس سازگار است',
      'image': 'assets/images/PHP.png'
    },
    {
      'name': 'Go',
      'description':
          'یک زبان سریع و کارآمد است که توسط شرکت گوگل برای کاربرد های مقیاس پذیر و بهینه سازی شده توسعه داده شده است. با داشتن یک سینتکس ساده و عملکرد بالا توسعه دهندگان را قادر میسازد تا برنامه هایی با کارایی و مقیاس پذیری بالا تولید کنند که برای سیستم های توزیع شده و کلان داده ایده آل است',
      'image': 'assets/images/Go.png'
    },
    {
      'name': 'Dart',
      'description':
          'یک زبان شی گرا است که توسط شرکت گوگل برای توسعه اپلیکیشن های موبایل، وب و دسکتاپ ایجاد شده است. این زبان با فریم ورک فلاتر شناخته میشود که برای ساخت اپلیکیشن های کراس پلتفورم استفاده میشود',
      'image': 'assets/images/dart.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text(
                'Username',
                style: TextStyle(fontFamily: 'Source Sans Pro'),
              ),
              accountEmail: Text(
                'Username@gmail.com',
                style: TextStyle(fontFamily: 'Source Sans Pro'),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  CupertinoIcons.person,
                  size: 60,
                  color: Colors.cyan,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings),
              title: Text(
                'تنظیمات',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'iranYekan',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text(
                'ارتباط با ما',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'iranYekan',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(CupertinoIcons.share),
              title: Text(
                'اشتراک گذاری',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'iranYekan',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sharePage()));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'setting') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingPage()));
              } else if (value == 'about') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutPage()));
              } else if (value == 'share') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sharePage()));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(CupertinoIcons.settings),
                  title: Text('تنظیمات '),
                ),
                value: 'setting',

              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(CupertinoIcons.info),
                  title: Text('درباره ما'),
                ),
                value: 'about',
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(CupertinoIcons.share),
                  title: Text('اشتراک گذاری'),
                ),
                value: 'share',
              ),
            ],
          ),
        ],
        title: Center(
          child: Text(
            'زبان های برنامه نویسی',
            style: TextStyle(
                color: Colors.white, fontFamily: 'iranYekan', fontSize: 25),
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailsPage(
                    name: languages[index]['name']!,
                    description: languages[index]['description']!,
                    image: languages[index]['image']!,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      languages[index]['image']!,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    languages[index]['name']!,
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    languages[index]['description']!,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class detailsPage extends StatelessWidget {

  String name;
  String description;
  String image;

  detailsPage(
      {required this.name, required this.description, required this.image});

  void launchURL() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  fontFamily: 'iranYekan'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'iranYekan',
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  launchURL();
                },
                label: Text('More details'),
                icon: Icon(CupertinoIcons.ellipsis),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class settingPage extends StatefulWidget {
  const settingPage({super.key});

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  bool isDarkMode = false;

  bool notificationIsEnabled = true;

  String username = 'Username';

  var increaseSizeFont = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            'صفحه تنظیمات',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'iranYekan'),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text(
              'نام کاربری',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'iranYekan',
                fontSize: increaseSizeFont,
              ),
            ),
            subtitle: Text(
              username,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'iranYekan',
                fontSize: increaseSizeFont - 2,
              ),
            ),
            onTap: () {
              changeUsername(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.moon_stars),
            title: Text(
              'حالت شب',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'iranYekan', fontSize: increaseSizeFont),
            ),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.bell),
            title: Text(
              'اعلان‌ها',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'iranYekan', fontSize: increaseSizeFont),
            ),
            trailing: Switch(
              value: notificationIsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationIsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.photo),
            title: Text(
              'تصویر پروفایل',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'iranYekan', fontSize: increaseSizeFont),
            ),
            onTap: () {
              changeProfilePicture(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(CupertinoIcons.power),
            title: Text(
              'خروج',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'iranYekan', fontSize: increaseSizeFont),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'تغیر اندازه فونت',
              style: TextStyle(
                fontSize: increaseSizeFont,
                fontFamily: 'iranYekan',
                color: Colors.white,
              ),
            ),
            subtitle: Slider(
              value: increaseSizeFont,
              max: 32.0,
              min: 12.0,
              onChanged: (newFontSize) {
                setState(() {
                  increaseSizeFont = newFontSize;
                },);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class aboutPage extends StatelessWidget {
  const aboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            'صفحه درباره ما',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'iranYekan'),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment(0, 0.2),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/I AM F.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Text(
              'Flutter developer',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Source Sans Pro',
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: Divider(
                thickness: 2,
              ),
            ),
            Card(
              color: Colors.cyan,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  'FerdowsOsmani@gmail.com',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ),
            Card(
              color: Colors.cyan,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  '+93 729 60 62 81',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Source Sans Pro'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class sharePage extends StatelessWidget {
  const sharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            'صفحه اشتراک گذاری',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'iranYekan'),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              const url =
                  'https://play.google.com/store/apps/details?id=com.example.ten_programming_languages';
              Share.share(url);
            },
            child: Text(
              'اشتراک گذاری لینک',
              style: TextStyle(color: Colors.white, fontFamily: 'iranYekan'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void changeUsername(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var userName;
      TextEditingController controller = TextEditingController(text: userName);
      return AlertDialog(
        title: Text('تغییر نام کاربری'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'نام جدید'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                String userName = controller.text;
              });
              Navigator.pop(context);
            },
            child: Text('ذخیره'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('انصراف'),
          ),
        ],
      );
    },
  );
}

void setState(Null Function() param0) {}

void changeProfilePicture(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('تغییر تصویر پروفایل'),
        content: Text('اینجا می‌توانید تصویر جدید را انتخاب کنید.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('انتخاب تصویر'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('انصراف'),
          ),
        ],
      );
    },
  );
}

void logout(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خروج'),
          content:
              Text('آیا مطمئن هستید که میخواهید از حساب کاربری خارج شوید؟'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('خروج'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('انصراف')),
          ],
        );
      },);
}

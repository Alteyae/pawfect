import 'package:flutter/material.dart';
import 'package:modernlogintute/design_paws/home_screen.dart';
import 'package:modernlogintute/pages/donation.dart';
import 'package:modernlogintute/pages/volunteer.dart';

import '../components/post_cell_widget.dart';
import '../components/post_details_page.dart';
import '../design_paws/adopt_page.dart';

class Post {
  final String title;
  final String image;
  final String author;
  final String date;

  Post(
      {required this.title,
      required this.image,
      required this.author,
      required this.date});
}

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Adopt',
    ),
    // Add more items as needed
  ];

  final data = [
    Post(
      image: 'lib/images/kapon.jpeg',
      title: 'What is KAPON?',
      author: 'Altheae Owe',
      date: '23 Sep 2023',
    ),
    Post(
      image: 'lib/images/sevenThingsToKnowAboutDeworming.png',
      title: '7 Things to Know About Deworming Your pets',
      author: 'Altheae Owe',
      date: '24 Mar 2020',
    ),
    Post(
      image: 'lib/images/rabies.jpeg',
      title: 'What is Rabies? | Causes and Symptoms',
      author: 'Altheae Owe',
      date: '16 Feb 2023',
    ),
    Post(
      image: 'lib/images/animalCruelty.jpeg',
      title: 'Stop the Cruelty, Please!',
      author: 'Altheae Owe',
      date: '12 Mar 2023',
    ),
  ];

  List<String> imagePaths = [
    'lib/images/pet-care.png',
    'lib/images/donation.png',
    'lib/images/volunteer-icon.png',
  ];

  List<String> labels = ['Adopt', 'Donate', 'Volunteer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quick Access',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 140,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _navigateToPage(index);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(16.0),
                              width: 85.0,
                              height: 85.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  imagePaths[index],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(),
                            Text(
                              labels[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Stay Informed',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final post = data[index];
                  return PostCellWidget(
                      title: post.title,
                      image: post.image,
                      author: post.author,
                      date: post.date,
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PostDetailsPage(
                              title: post.title,
                              image: post.image,
                              author: post.author,
                              date: post.date,
                            ),
                          ),
                        );
                      });
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'A Gallery of Fur-Ever Homes',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'lib/images/gallery1.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'lib/images/gallery2.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'lib/images/gallery3.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey, // Set the color of the line
                thickness: 1.0, // Set the thickness of the line
                height: 20, // Set the vertical space above and below the line
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Community',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Join Our Community',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Share us your stories with your pawfect ones',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const MyHomePage(),
                          ),
                        );
                      },
                      child: const Text('Join Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarItems,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const DesignCourseHomeScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DesignCourseHomeScreen()));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DonationInfoScreen()));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const VolunteerInfoScreen()));
        break;
    }
  }
}

import 'package:flutter/material.dart';

const List<String> storyImages = [
  'assets/images/image1.avif',
  'assets/images/image2.avif',
  'assets/images/image3.avif',
  'assets/images/image4.avif',
  'assets/images/image5.avif',
];

const List<String> userNames = [
  'Alice Johnson',
  'Bob Smith',
  'Catherine Lee',
  'David Brown',
  'Eva Green',
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _FacebookAppBar(),
      body: _FacebookBody(),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            'Facebook Clone © 2024',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class _TopTitleBar extends StatelessWidget {
  const _TopTitleBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              'facebook',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconTabBar extends StatelessWidget implements PreferredSizeWidget {
  const _IconTabBar();

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: Colors.blue, // Color for the selected icon
      unselectedLabelColor: Colors.grey, // Color for the unselected icons
      indicatorColor: Colors.blue, // The line below the selected icon
      tabs: <Widget>[
        Tab(icon: Icon(Icons.home, size: 28)), 
        Tab(icon: Icon(Icons.people_alt)), 
        Tab(icon: Icon(Icons.ondemand_video)), 
        Tab(icon: Icon(Icons.notifications_none)), 
        Tab(icon: Icon(Icons.menu)), 
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class _FacebookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _FacebookAppBar();

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight * 2), 
      child: DefaultTabController(
        length: 5, 
        child: Column(
          children: <Widget>[
            SizedBox(height: 24),
            _TopTitleBar(),
            _IconTabBar(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(128.0);
}

class _FacebookBody extends StatelessWidget {
  const _FacebookBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _PostCreationBar(),
        Divider(height: 1, thickness: 8, color: Colors.black12), 
        
        _StorySection(),
        Divider(height: 1, thickness: 8, color: Colors.black12), 

        _PostWidget(),
        Divider(height: 1, thickness: 8, color: Colors.black12), 
        
      ],
    );
  }
}

class _PostCreationBar extends StatelessWidget {
  const _PostCreationBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            backgroundColor: Colors.black12, 
            radius: 20,
            child: Icon(Icons.person, color: Colors.white), 
          ),
          const SizedBox(width: 8), 
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "What's on your mind?",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  const _StorySection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyImages.length + 1, 
        itemBuilder: (context, index) {
          
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120, 
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 2.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                              SizedBox(height: 4),
                              Text('Create Story', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final String imagePath = storyImages[index - 1]; 
          final String userName = userNames[index - 1];
          
          return Container(
            width: 120,
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8), 
            child: Card(
              clipBehavior: Clip.antiAlias, 
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                fit: StackFit.expand, 
                children: <Widget>[
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 3.0), 
                      ),
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.blue, size: 20), 
                      ),
                    ),
                  ),
                  
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Text(
                      userName, 
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
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

class _PostWidget extends StatelessWidget {
  const _PostWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/image1.avif'),
              ),
              const SizedBox(width: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Code HQ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'a few seconds ago',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(), 
              const Icon(Icons.more_horiz), 
            ],
          ),
        ),
        
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text('My first post in here.'),
        ),

        Image.asset(
          'assets/images/image1.avif', 
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.thumb_up_alt_outlined, size: 20, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Like', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.comment_outlined, size: 20, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Comment', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.share_outlined, size: 20, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('Share', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

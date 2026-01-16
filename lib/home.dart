import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'friends_page.dart';
import 'auth_service.dart';
import 'login_page.dart';
import 'notifications_page.dart';

const List<String> storyImages = [
  'assets/images/image1.jpg',
  'assets/images/image2.jpg',
  'assets/images/image3.jpg',
  'assets/images/image4.jpg',
  'assets/images/image5.jpg',
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
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const _FacebookAppBar(),
        body: const TabBarView(
          children: [
            _FacebookBody(),
            FriendsPage(),
            Center(child: Text("Videos")),
            NotificationsPage(),
            Center(child: Text("Menu")),
          ],
        ),
      ),
    );
  }
}

class _FacebookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _FacebookAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        children: [
          _buildTopTitleBar(context),
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.home, size: 28)),
              Tab(icon: Icon(Icons.people_alt, size: 28)),
              Tab(icon: Icon(Icons.ondemand_video, size: 28)),
              Tab(icon: Icon(Icons.notifications_none, size: 28)),
              Tab(icon: Icon(Icons.menu, size: 28)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopTitleBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'facebook',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(115.0);
}

class _FacebookBody extends StatelessWidget {
  const _FacebookBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _PostCreationBar(),
        Divider(height: 1, thickness: 8, color: Colors.black12),
        _StorySection(),
        Divider(height: 1, thickness: 8, color: Colors.black12),
        _PostWidget(),
      ],
    );
  }
}

class _PostCreationBar extends StatelessWidget {
  const _PostCreationBar();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: user?.photoURL != null
                ? NetworkImage(user!.photoURL!)
                : null,
            backgroundColor: Colors.grey[300],
            child: user?.photoURL == null
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          const Text(
            "What's on your mind?",
            style: TextStyle(color: Colors.grey, fontSize: 16),
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
          if (index == 0) return _buildCreateStoryCard();
          return _buildUserStoryCard(index - 1);
        },
      ),
    );
  }

  Widget _buildCreateStoryCard() {
    return Container(
      width: 110,
      margin: const EdgeInsets.all(8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: const Icon(Icons.add, color: Colors.blue),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4),
              child: Text("Create Story", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStoryCard(int index) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(storyImages[index], fit: BoxFit.cover),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                userNames[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
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
      children: [
        const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/image1.jpg'),
          ),
          title: Text('Code HQ', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('a few seconds ago'),
          trailing: Icon(Icons.more_horiz),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('My first post in here.'),
        ),
        Image.asset(
          'assets/images/image1.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ActionBtn(Icons.thumb_up_alt_outlined, "Like"),
              _ActionBtn(Icons.comment_outlined, "Comment"),
              _ActionBtn(Icons.share_outlined, "Share"),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionBtn(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

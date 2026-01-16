import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _buildHeader(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: Text(
              'Friend Requests',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE44236),
              ),
            ),
          ),
          _buildFriendItem("Drew Young", 8, "1w", 'assets/images/image2.jpg'),
          _buildFriendItem("Rachel Smith", 8, "1w", 'assets/images/image3.jpg'),
          _buildFriendItem("Rachel Smith", 7, "2w", 'assets/images/image4.jpg'),
          _buildFriendRequestItem(
            "Eliiz Kei Ho",
            8,
            "",
            'assets/images/image5.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Friends',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF242526),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendItem(String name, int mutual, String time, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 46, backgroundImage: AssetImage(image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  '$mutual mutual friends',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _btn(
                        "Confirm",
                        const Color(0xFF1877F2),
                        Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _btn(
                        "Delete",
                        const Color(0xFFE4E6EB),
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendRequestItem(
    String name,
    int mutual,
    String time,
    String image,
  ) => _buildFriendItem(name, mutual, time, image);

  Widget _btn(String text, Color bg, Color fg) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        foregroundColor: fg,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

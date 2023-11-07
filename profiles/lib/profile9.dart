// /**
//  * Author: Damodar Lohani
//  * profile: https://github.com/lohanidamodar
//   */

// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';

class Profile9 extends StatelessWidget {
  const Profile9({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  50), // Adjust these values for the desired curve shape
              topRight: Radius.circular(50),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              height: 580,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('images/pf2/travel.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.8),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              _buildAvatar('images/pff.jpg'),
              const SizedBox(height: 10.0),
              Text(
                "Muhammad Farooq",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Flutter & Full Stack Developer",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "255K",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "105K",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Following",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Favorite",
                // style: Theme.of(context).textTheme.headlineSmall,
                // selectionColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFavoriteCard(context, "Design","/images/pf9/design.jpg"),
                    const SizedBox(width: 10.0),
                    _buildFavoriteCard(context, "Fruits","/images/pf9/fruits.jpg"),
                    const SizedBox(width: 10.0),
                    _buildFavoriteCard(context, "Nature","/images/pf9/nature.jpg"),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Text(
              //   "Friends",
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              // SizedBox(
              //   height: 60,
              //   width: double.infinity,
              //   child: Stack(
              //     children: [
              //       ...avatars
              //           .asMap()
              //           .map(
              //             (i, e) => MapEntry(
              //               i,
              //               Transform.translate(
              //                 offset: Offset(i * 30.0, 0),
              //                 child: SizedBox(
              //                     height: 60,
              //                     width: 60,
              //                     child: _buildAvatar(e, radius: 30)),
              //               ),
              //             ),
              //           )
              //           .values
              //           .toList(),
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 2,
        backgroundImage: NetworkImage(image),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String title,String imgg) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgg),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
            foregroundDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0)),
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news2/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storis = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hi Mohammad !',
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 13),
                child: Text(
                  'Explore today',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              _stotyList(storis: storis),
              const _catigorye(),
              const _PostList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _catigorye extends StatelessWidget {
  const _catigorye();

  @override
  Widget build(BuildContext context) {
    final catigoryIthem = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: catigoryIthem.length,
      itemBuilder: (context, index, realIndex) {
        return _catigoryIthem(
          category: catigoryIthem[realIndex],
        );
      },
      options: CarouselOptions(
          autoPlay: false,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          padEnds: false),
    );
  }
}

class _catigoryIthem extends StatelessWidget {
  final Category category;
  const _catigoryIthem({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 56,
          right: 56,
          bottom: 20,
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 20, color: Color(0xaa0d253c))
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
                colors: [Color(0xff0d253c), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              'assets/img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 48,
          left: 42,
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    );
  }
}

class _stotyList extends StatelessWidget {
  const _stotyList({
    required this.storis,
  });

  final List<StoryData> storis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final story = storis[index];
            return _stoty(story: story);
          },
          itemCount: storis.length,
        ),
      ),
    );
  }
}

class _stoty extends StatelessWidget {
  const _stoty({
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileimageViwed(context)
                  : _profileimageNormal(),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 22,
                  height: 22,
                ),
              )
            ],
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _profileimageNormal() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
          Color.fromARGB(199, 42, 135, 202),
          Color.fromARGB(255, 74, 204, 202),
          Color.fromARGB(134, 48, 228, 180)
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(1),
        child: _profileMetod(),
      ),
    );
  }

  Widget _profileimageViwed(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: DottedBorder(
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(14),
        padding: const EdgeInsets.all(5),
        color: Theme.of(context).textTheme.labelMedium!.color!,
        dashPattern: const [8, 3, 5, 2],
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: _profileMetod(),
        ),
      ),
    );
  }

  Widget _profileMetod() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset('assets/img/stories/${story.imageFileName}'),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList();
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
            left: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 25),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'More',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: const Color.fromARGB(255, 0, 124, 126)),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemExtent: 149,
          shrinkWrap: true,
          itemCount: posts.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return _posts(
              post: post,
            );
          },
        )
      ],
    );
  }
}

class _posts extends StatelessWidget {  const _posts({required this.post});
  final PostData post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Color(0x1a5282ff)),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                    'assets/img/posts/small/${post.imageFileName}')),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: const Color.fromARGB(255, 6, 1, 58),
                        fontWeight: FontWeight.w200,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        post.likes,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        CupertinoIcons.clock,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        post.likes,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
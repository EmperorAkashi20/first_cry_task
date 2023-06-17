part of home;

class HomeTab extends ConsumerWidget {
  static const ROUTE_NAME = "/homeTab";
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            collapsedHeight: 40,
            toolbarHeight: 40,
            backgroundColor: Colors.grey.withOpacity(0.5),
            elevation: 0,
            centerTitle: false,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Deliver to 560102",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_drop_down_sharp, color: Colors.grey, size: 40)
              ],
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                  enlargeFactor: 1,
                  padEnds: false,
                  autoPlayInterval: const Duration(seconds: 4),
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: [
                  "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg",
                  "https://img.freepik.com/free-photo/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643.jpg",
                  "https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg",
                  "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",
                  "https://media.istockphoto.com/id/1093110112/photo/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-of-green-forest-with-pure.jpg?s=612x612&w=0&k=20&c=lpQ1sQI49bYbTp9WQ_EfVltAqSP1DXg0Ia7APTjjxz4=",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(i), fit: BoxFit.fill)),
                      );
                    },
                  );
                }).toList(),
              ),
              // const SizedBox(height: 20),
              // SizedBox(
              //   height: 50,
              //   child: ListView.builder(
              //     physics: const ScrollPhysics(),
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 4,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //         child: Container(
              //           height: 20,
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: NetworkImage(images[index]))),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const _ProductScreen(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  images[index],
                                ),
                              ),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 20,
                              width: double.infinity,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  "${index + 1} Product Data",
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

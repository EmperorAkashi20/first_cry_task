part of home;

class _ProductScreen extends ConsumerWidget {
  const _ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePvd = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Image.asset(
          "assets/images/firstcry-logo.png",
          width: 90,
        ),
        centerTitle: false,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.share,
            color: Colors.black,
          ),
          SizedBox(width: 7),
          Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              disableGesture: false,
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
                enlargeFactor: 1,
                padEnds: false,
                autoPlayInterval: const Duration(seconds: 1),
              ),
              items: [
                "https://www.seekpng.com/png/detail/23-237995_kids-clothes-png-image-black-and-white-library.png",
                "https://www.seekpng.com/png/detail/23-237995_kids-clothes-png-image-black-and-white-library.png",
                "https://www.seekpng.com/png/detail/23-237995_kids-clothes-png-image-black-and-white-library.png",
                "https://www.seekpng.com/png/detail/23-237995_kids-clothes-png-image-black-and-white-library.png",
                "https://www.seekpng.com/png/detail/23-237995_kids-clothes-png-image-black-and-white-library.png",
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoView(imageUrl: i),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(i),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: Text(
                              "${i.length}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 18,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Premium",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Cute Walk by Babyhug Casual Shoes With Velcro Closure Polka Dot Print- Blue",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "₹ 824.50",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "MRP: ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "₹ 824.50",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' 50% OFF',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "MRP incl. all taxtes; Add'l charges may apply on discounted price",
                    style: TextStyle(fontSize: 12),
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-vector/boy-girl-with-happy-face_1308-98776.jpg?w=2000"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Save ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹ 164.90",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' with club',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.left,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Club Price: ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₹ 659.60",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  const SizedBox(height: 20),
                  CarouselSlider(
                    disableGesture: false,
                    options: CarouselOptions(
                      height: 80.0,
                      viewportFraction: 1,
                      enlargeFactor: 1,
                      padEnds: true,
                      autoPlay: false,
                    ),
                    items: [
                      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                      "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      "https://images.pexels.com/photos/1266810/pexels-photo-1266810.jpeg?cs=srgb&dl=pexels-simon-berger-1266810.jpg&fm=jpg",
                      "https://images.unsplash.com/photo-1495344517868-8ebaf0a2044a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(i),
                                      fit: BoxFit.fill)),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Size"),
                      Row(
                        children: [
                          Icon(Icons.straighten, color: Colors.blue),
                          SizedBox(width: 10),
                          Text(
                            "SIZE HELP",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                              ),
                              child: const Center(
                                child: Text('3-6M'),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  ),
                  const Divider(
                    thickness: 5,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.local_shipping_outlined),
                      Text("    Delivery Pincode 560102"),
                      Text(
                        " (Update)",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox.adaptive(
                        value: homePvd.checked,
                        onChanged: (value) {
                          homePvd.updateChecked(value);
                        },
                      ),
                      const Text("Get it by tomorrow 8PM"),
                    ],
                  ),
                  const Divider(thickness: 5),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      circleAvatarWithWhiteBackground(
                        const Icon(Icons.card_giftcard),
                        "Gift\nWrap",
                      ),
                      circleAvatarWithWhiteBackground(
                        const Icon(Icons.integration_instructions),
                        "COD\nAvailable",
                      ),
                      circleAvatarWithWhiteBackground(
                        const Icon(Icons.access_alarm),
                        "Days Return\nor Exchange",
                      ),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 5),
                  const SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget circleAvatarWithWhiteBackground(Icon icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 20,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: icon,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AboutUser extends StatefulWidget {
  const AboutUser({super.key});

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.elliptical(20, 20), bottomRight:Radius.elliptical(20, 20) ),
                    child: Image.asset("assets/images/dating_image.png", fit: BoxFit.fitWidth,)
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 25),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Parul Sharma",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                            ),
                            Text(
                              "Entrepreneur",style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                            ),
                          ],
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xffF26B8A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Icon(Icons.send, color: CupertinoColors.white,)),
                          ),
                        ),

                      ],
                               ),
                     const SizedBox(height: 30,),
                     Divider(height: 20, color: Colors.grey[200],),
                     const SizedBox(height: 10,),
                     const Text(
                       "About",style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 16
                     ),
                     ),
                     const SizedBox(height: 10,),
                     ReadMoreText(
                       "In the heart of bustling New York City, amidst the constant symphony of honking horns and hurried footsteps, there exists a figure whose presence seems to carve out a tranquil oasis within the chaos. Meet Alex Thompson, a enigmatic soul with an insatiable thirst for adventure and a heart brimming with compassion.With a shock of unruly curls that seem to dance in the wind and eyes as deep and mysterious as the ocean, Alex possesses an allure that draws people in like moths to a flame. Despite the cacophony of urban life, there's an unmistakable serenity that surrounds them, a calming presence that whispers tales of faraway lands and untold dreams. Born with a restless spirit, Alex has traversed the globe, from the misty highlands of Scotland to the sun-kissed beaches of Bali, each journey leaving an indelible mark on their soul. They are a seeker of experiences, a collector of memories, and a connoisseur of life's most precious moments. But beneath the veneer of wanderlust lies a heart of gold. Alex's compassion knows no bounds, and they can often be found lending a helping hand to those in need or championing causes close to their heart. Whether it's volunteering at the local shelter or fighting for environmental justice, Alex is a beacon of light in a world that often feels shrouded in darkness.Yet, for all their worldly adventures and noble deeds, there's a sense of longing that lingers in Alex's eyes, a yearning for something elusive and intangible. Perhaps it's the quest for meaning or the search for belonging, but whatever it may be, one thing is certain: Alex's journey is far from over, and the world is but a canvas upon which they will continue to paint their vibrant tapestry of life. So, if you ever find yourself wandering the bustling streets of New York City and happen upon a figure with a smile as warm as the sun and eyes as deep as the ocean, take a moment to pause and listen, for you may just hear the whispered echoes of a soul in search of its place in the world — the enigmatic spirit of Alex Thompson.",
                       trimLines: 3,
                       style: TextStyle(
                         fontSize: 14,
                         height: 1.2,
                         color: Colors.grey[500]
                       ),
                       // colorClickableText: Colors.pink,
                       trimMode: TrimMode.Line,
                       trimCollapsedText:
                       ' Show more',
                       trimExpandedText:
                       ' Show less',
                       textAlign: TextAlign.start,
                       moreStyle: const TextStyle(
                         fontSize: 14,
                         fontWeight: FontWeight.bold,
                         color: Color(0xffF26B8A),
                       ),
                     ),
                     const SizedBox(height: 30,),
                     Divider(height: 20, color: Colors.grey[200],),
                     const SizedBox(height: 10,),
                     const Text(
                       "Interests",style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 16
                     ),
                     ),
                     const SizedBox(height: 10,),
                     Divider(height: 20, color: Colors.grey[200],),
                     const SizedBox(height: 10,),
                     const Text(
                       "Gallery",style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 16
                     ),
                     ),
                     const SizedBox(height: 10,),
                     SizedBox(
                       height: 450,
                       width: MediaQuery.of(context).size.width,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: GridView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: 6,
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 3,
                             crossAxisSpacing: 2.0,
                             mainAxisSpacing: 8.0,
                             childAspectRatio: 0.7,
                           ),
                           itemBuilder: (BuildContext context, int index) {
                             return ClipRRect(
                               borderRadius: BorderRadius.circular(20),
                               child: Image.network("https:"
                                   "//images.pexels.com/photos/853405/pexels-photo-853405.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&d"
                                   "pr=1", fit: BoxFit.fitWidth,),
                             );
                           },
                         ),
                       ),
                     ),






                   ],
                 ),
               )
            ],
          ),
            Positioned(
              left: 110,
              top: 360,

              child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // shadow color
                      spreadRadius: 8, // spread radius
                      blurRadius: 15, // blur radius
                      offset: Offset(0, 2),
                    )]
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.cancel_rounded , color: const Color(0xffF26B8A),),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // shadow color
                        spreadRadius: 8, // spread radius
                        blurRadius: 15, // blur radius
                        offset: Offset(0, 2),
                      )]
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_rounded,size: 35 , color: const Color(0xffF26B8A),),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // shadow color
                        spreadRadius: 8, // spread radius
                        blurRadius: 15, // blur radius
                        offset: Offset(0, 2),
                      )]
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.star , color: Colors.orangeAccent),
                  ),
                )
              ],
            ),)
          ]
        ),
      ),
    );
  }
}

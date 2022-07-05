import 'package:flutter/material.dart';
import 'package:hackathon/components.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget({Key? key, required this.drawerColor}) : super(key: key);
  final RandomColor drawerColor;
 final date = DateTime.now();
  Uri uri = Uri.parse('https://korafdavid.github.io/Abahackathon/');



  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[100],
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/gdg.png')))),
           ListTile(
            onTap: ()async {
              
  if (!await launchUrl(uri)) throw 'Could not launch $uri';

            },
            leading: const Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('Learn More'),
            subtitle: Text('Join GDG Aba'),
          ),
          const ListTile(
            leading: Icon(
              Icons.more,
              color: Colors.yellow,
            ),
            title: Text('About'),
            subtitle: Text('about organizers'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('GDG Aba Hackathon', style: TextStyle(color: Colors.grey)),
                Text('Copyright ${date.year}', style: TextStyle(color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/gdg.png',
                    height: 15,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

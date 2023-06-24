import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 3,
                  imageUrl:
                      'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/354262316_597026632519901_4053590601695216731_n.jpg?_nc_cat=104&cb=99be929b-3346023f&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=zb4V0JHJUJ4AX-NupXx&_nc_ht=scontent.fcai20-2.fna&oh=00_AfBchD6Sx5-flYL67ROqJF-0OMnYkL5EtmaOqOEdjGKJxw&oe=649B8DA5',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            'Hussein Mohamed'.toUpperCase(),
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_decoration/icon_decoration.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12)),
            child: DecoratedIcon(
              icon: Icon(
                FontAwesomeIcons.instagram,
                size: 28,
                //color: Colors.white,
              ),
              decoration: IconDecoration(
                  border: IconBorder(color: Colors.black, width: 0.3)),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12)),
            child: DecoratedIcon(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 28,
                color: Colors.white,
              ),
              decoration: IconDecoration(
                  border: IconBorder(color: Colors.black, width: 5)),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12)),
            child: DecoratedIcon(
              icon: Icon(
                FontAwesomeIcons.facebookF,
                size: 28,
                color: Colors.white,
              ),
              decoration: IconDecoration(
                  border: IconBorder(color: Colors.black, width: 5)),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12)),
            child: DecoratedIcon(
              icon: Icon(
                FontAwesomeIcons.snapchat,
                size: 28,
                //color: Colors.white,
              ),
              decoration: IconDecoration(
                  border: IconBorder(color: Colors.black, width: 1)),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(12)),
            child: DecoratedIcon(
              icon: Icon(
                FontAwesomeIcons.envelope,
                size: 28,
                //color: Colors.white,
              ),
              decoration: IconDecoration(
                  border: IconBorder(color: Colors.black, width: 0.3)),
            ),
          ),
        ],
      ),
    );
  }
}

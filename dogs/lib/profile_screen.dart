import 'package:dogs/star.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/beach.jpg'),
          Transform.translate(
            offset: const Offset(0, 100),
            child: Column(
              children: [ProfileImage(), ProfileDetails(), ProfileActions()],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/dog.jpg',
        width: 200,
        height: 200,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Argo Loxot',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
          ),
          const StarRating(value: 5),
          _buildDetailsRow('Age', '4'),
          _buildDetailsRow('Status', 'Good Boy'),
        ],
      ),
    );
  }
}

Widget _buildDetailsRow(String heading, String value) {
  return Row(
    children: [
      Text('$heading: ', style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(value),
    ],
  );
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ],
    );
  }
}

Widget _buildIcon(IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(children: [Icon(icon, size: 40), Text(label)]),
  );
}

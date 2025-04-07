import 'package:flutter/material.dart';

class SearchPairTab extends StatefulWidget {
  @override
  _SearchPairTabState createState() => _SearchPairTabState();
}

class _SearchPairTabState extends State<SearchPairTab> {
  List<String> pairedDevices = []; // List of paired devices

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Perform device search
            _searchAndPairDevice();
          },
          child: Text('Search NeuroTech Devices',style: TextStyle(color: Colors.white),),
        ),
        SizedBox(height: 36.0),
        Text(
          'Paired Devices',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            itemCount: pairedDevices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(pairedDevices[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove paired device
                    setState(() {
                      pairedDevices.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _searchAndPairDevice() {
    // Simulate searching and pairing devices
    setState(() {
      pairedDevices.add('New Device'); // Add a new paired device
    });
  }
}

import 'package:flutter/material.dart';
import 'package:neuro_hub/utils/color.dart';
import 'package:neuro_hub/utils/images.dart';
import 'package:neuro_hub/view/device_details.dart';
import 'package:neuro_hub/view/devices_pages/neurosight_page.dart';
import 'package:neuro_hub/view/devices_pages/neurotab_page.dart';
import 'package:neuro_hub/view/devices_pages/neurowatch_page.dart';
import 'package:neuro_hub/view/devices_pages/neurolens_page.dart';
import 'package:neuro_hub/view/devices_pages/neurobuds_page.dart';
import 'package:neuro_hub/view/devices_pages/neurocore_page.dart';
import 'package:neuro_hub/view/devices_pages/neuroring_page.dart';

class DevicesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 1000
          ? 3
          : MediaQuery.of(context).size.width > 600
              ? 2
              : 1,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      mainAxisSpacing: 40.0,
      crossAxisSpacing: 40.0,
      childAspectRatio: 1.6,
      shrinkWrap: true,
      children: [
        DeviceTile(
          icon: watch,
          title: 'Neuro Watch',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Watch')),
            );
          },
        ),
        DeviceTile(
          icon: tablet,
          title: 'Neuro Tab',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Tab')),
            );
          },
        ),
        DeviceTile(
          icon: sight,
          title: 'Neuro Sight',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Sight')),
            );
          },
        ),
        DeviceTile(
          icon: lens,
          title: 'Neuro Lens',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Lens')),
            );
          },
        ),
        DeviceTile(
          icon: core,
          title: 'Neuro Core',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Core')),
            );
          },
        ),
        DeviceTile(
          icon: buds,
          title: 'Neuro Buds',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Buds')),
            );
          },
        ),
        DeviceTile(
          icon: ring,
          title: 'Neuro Ring',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DeviceDetailsScreen(title: 'Neuro Ring')),
            );
          },
        ),
      ],
    );
  }
}

class DeviceTile extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const DeviceTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DeviceTile> createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Transform.scale(
          scale: isHovered ? 1.05 : 1.0,
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                color: lightGrey,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(widget.icon, size: 70.0, color: Colors.white),
                  Image(
                    image: AssetImage(widget.icon),
                    color: Colors.white,
                    height: 60,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10),
                  Text(widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

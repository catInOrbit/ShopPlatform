import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindWay extends StatefulWidget {
  @override
  _FindWayState createState() => _FindWayState();
}

class _FindWayState extends State<FindWay> {
  static const routeName = '/Findway';
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(10.774846, 106.695235);
  LatLng _lastMapPosition = _center;
  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(10.774846, 106.695235), zoom: 11.0),
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove,
                mapType: MapType.normal,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CỬA HÀNG TẠP HOA VĨNH HIÊN',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text('Đồ uống'),
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.clock),
                      Text('20 phút-3.1 km'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          child: Text('Địa chỉ'),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                                '82 Nguyễn Thị Minh Khai, Phường 6, Quận 3'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 50,
                        child: Text('Giờ hoạt động'),
                      ),
                      Expanded(
                          child: Container(
                        height: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Chủ nhật'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ hai'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ ba'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ tư'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ năm'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ sáu'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Thứ bảy'),
                                Text('00:00 - 23:59'),
                              ],
                            ),
                          ],
                        ),
                      ))
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

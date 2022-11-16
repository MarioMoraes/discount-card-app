import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/modules/drug/pharmacies/detail/controller/pharmacy_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/widgets/custom_app_bar_title.dart';
import '../../../../models/pharmacy_and_prices_model.dart';

class PharmacyDetailPage extends StatefulWidget {
  final PharmacyAndPricesModel model;
  final PharmacyDetailController controller;

  const PharmacyDetailPage(
      {Key? key, required this.controller, required this.model})
      : super(key: key);

  @override
  State<PharmacyDetailPage> createState() => _PharmacyDetailPageState();
}

class _PharmacyDetailPageState extends State<PharmacyDetailPage> {
  @override
  void initState() {
    widget.controller.getInfo(widget.model.pharmacy.nabp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTitle(
        msg: 'Drug Search',
        subtitle: 'Pharmacy Detail',
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {
          Modular.to.pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SHOW DISCOUNT CARD',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/images/id-card.png',
              fit: BoxFit.cover,
              width: 20,
              height: 20,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          _DrugDetails(model: widget.model, controller: widget.controller),
          _PharmacyAddress(model: widget.model),
          Expanded(
            child: BlocBuilder<PharmacyDetailController, PharmacyDetailState>(
              bloc: widget.controller,
              builder: (context, state) {
                if (state.status == SearchStatus.loading) {
                  return LoadingAnimationWidget.fourRotatingDots(
                      color: context.primaryColor, size: 20);
                }

                if (state.status == SearchStatus.completed) {
                  return _ShowMap(
                    state: state,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DrugDetails extends StatelessWidget {
  final PharmacyAndPricesModel model;
  final PharmacyDetailController controller;

  const _DrugDetails({Key? key, required this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .65,
                child: Text(
                  model.medication.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                model.medication.price.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff04461F),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${model.medication.quantity.toStringAsFixed(0)} ${model.medication.type} ',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
              const Text(
                '\$5.0 Bonus Saving',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            model.pharmacy.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          )),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PharmacyDetailController, PharmacyDetailState>(
                bloc: controller,
                builder: (context, state) {
                  if (state.status == SearchStatus.completed) {
                    return Text(
                      state.pharmacy!.flag24Hours ? 'Open' : 'Close',
                      style: TextStyle(
                        color: context.primaryColor,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              BlocBuilder<PharmacyDetailController, PharmacyDetailState>(
                bloc: controller,
                builder: (context, state) {
                  return Text(
                    'Until 9:00pm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PharmacyAddress extends StatelessWidget {
  final PharmacyAndPricesModel model;
  const _PharmacyAddress({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Located At',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  model.pharmacy.address,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Phone',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  model.pharmacy.phoneNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 45,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(55, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'CALL',
                    style: TextStyle(color: Colors.white),
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

class _ShowMap extends StatefulWidget {
  final PharmacyDetailState state;
  const _ShowMap({Key? key, required this.state}) : super(key: key);

  @override
  State<_ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<_ShowMap> {
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentPosition = CameraPosition(
      target: LatLng(
          widget.state.pharmacy!.latitude, widget.state.pharmacy!.longitude),
      zoom: 12.4746,
    );

    return GoogleMap(
      initialCameraPosition: _currentPosition,
      mapType: MapType.normal,
      markers: Set.from(allMarkers),
    );
  }

  _addMarker() {
    allMarkers.add(
      Marker(
          markerId: const MarkerId('idMarker'),
          draggable: true,
          position: LatLng(widget.state.pharmacy!.latitude,
              widget.state.pharmacy!.longitude)),
    );
  }
}

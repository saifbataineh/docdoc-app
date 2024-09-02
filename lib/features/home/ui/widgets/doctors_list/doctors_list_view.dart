import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/ui/widgets/doctors_list/doctors_list_view_item.dart';

class DoctorsListView extends StatefulWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, this.doctorsList});

  @override
  State<DoctorsListView> createState() => _DoctorsListViewState();
}

class _DoctorsListViewState extends State<DoctorsListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(
            doctorsModel: widget.doctorsList?[index],
          );
        },
      ),
    );
  }
}

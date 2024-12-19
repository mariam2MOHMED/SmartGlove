import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/home/view/widget/section_item.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/provider/user_provider.dart';
import '../../../utils/widgets/loaing_indictor.dart';
import '../../models/section_model.dart';

class SectionsScreen extends StatefulWidget {

   SectionsScreen({super.key});

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
late  final userId;
bool shouldgetTask=true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = Provider.of<UserProvider>(context, listen: false).
      curruser!.id;
      Provider.of<SectionProvider>(context, listen: false).
      getAllSections(userId);
    });
  }

@override
Widget build(BuildContext context) {
  final sectionProvider = Provider.of<SectionProvider>(context);

  return Padding(
    padding: const EdgeInsets.only(
        top: 20.0, right: 24.0, left: 24.0,
    bottom: 20.0
    ),
    child: Column(
      children: [
        Expanded(
          child:sectionProvider.sections.isEmpty?LoadingIndictor(): GridView.builder(
            itemCount: sectionProvider.sections.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return SectionItem(
                index: index,
                sectionModel: sectionProvider.sections[index],
              );
            },
          ),
        ),
      ],
    ),
  );
}

}

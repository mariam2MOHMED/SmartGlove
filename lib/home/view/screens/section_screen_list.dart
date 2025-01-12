import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/view/screens/section_content_screen.dart';
import 'package:graduationproject/home/view/widget/section_item.dart';
import 'package:graduationproject/utils/firebase_functions.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/provider/user_provider.dart';
import '../../../utils/widgets/loaing_indictor.dart';
import '../../models/section_model.dart';

class SectionsScreenList extends StatefulWidget {
  SectionsScreenList({super.key});

  @override
  State<SectionsScreenList> createState() => _SectionsScreenListState();
}

class _SectionsScreenListState extends State<SectionsScreenList> {
  late final String userId; // Declare userId as a late variable
  bool shouldgetTask = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize the class field userId, not a local variable
      userId = Provider.of<UserProvider>(context, listen: false).curruser!.id;
      Provider.of<SectionProvider>(context, listen: false).
      getAllSections(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sectionProvider = Provider.of<SectionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sections"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0,
            right: 24.0,
            left: 24.0,
            bottom: 20.0),
        child: sectionProvider.sections.isEmpty
            ? LoadingIndictor()
            : ListView.separated(
          itemBuilder: (context, index) {
            final sectionModel = sectionProvider.sections[index]; // Use the sectionModel from the list
            return Slidable(
              startActionPane: ActionPane(
                motion:   index>8 ?DrawerMotion():BehindMotion(),
                children: [
                  if(index>8)
                  SlidableAction(
                    onPressed: (context) async {
                      final navigatorContext = Navigator.of(context).context; // Get a Navigator-safe context
                      await FirebaseUtils.deleteSection(sectionModel, userId).then((value) {
                        Fluttertoast.showToast(
                          msg: "Section deleted successfully",
                          timeInSecForIosWeb: 5,
                          textColor: AppTheme.white,
                          backgroundColor: Colors.green,
                        ).catchError((error) {
                          print("The error is $error");
                        });
                        if (navigatorContext.mounted) { // Check if the context is still valid
                          Provider.of<SectionProvider>(navigatorContext, listen: false).getAllSections(userId);
                        }
                      });
                    },
                    label: 'Delete',
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    spacing: 4.0,
                    borderRadius: BorderRadius.circular(12.0),
                    icon: CupertinoIcons.delete,
                  ),

                ],
              ),
              child: SecItem(
                sectionModel: sectionModel,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.0);
          },
          itemCount: sectionProvider.sections.length,
        ),
      ),
    );
  }
}

class SecItem extends StatelessWidget {
  final SectionModel sectionModel;

  const SecItem({required this.sectionModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SectionContentScreen.routeName,
          arguments: sectionModel, // Ensure this is not null
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              sectionModel.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}
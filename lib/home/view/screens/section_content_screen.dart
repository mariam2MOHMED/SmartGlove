// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:graduationproject/app_theme.dart';
// import 'package:graduationproject/home/view/widget/section_content_item.dart';
// import 'package:graduationproject/home/view/widget/show_dialog.dart';
// import 'package:graduationproject/home/view/widget/show_dialog_content.dart';
// import 'package:graduationproject/utils/provider/section_content_provider.dart';
// import 'package:graduationproject/utils/provider/section_provider.dart';
// import 'package:graduationproject/utils/provider/user_provider.dart';
// import 'package:graduationproject/utils/widgets/loaing_indictor.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/section_model.dart';
//
// class SectionContentScreen extends StatefulWidget {
//   static String routeName="/SectionContentScreen";
//   const SectionContentScreen({super.key});
//
//   @override
//   State<SectionContentScreen> createState() => _SectionContentScreenState();
// }
//
// class _SectionContentScreenState extends State<SectionContentScreen> {
//   bool isLoading = true;
// var sentenceController=TextEditingController();
//   late SectionModel sectionModel;
//   @override
//   // void initState() {
//   //   super.initState();
//   //   _loadData();
//   //   setState(() {
//   //
//   //   });// Fetch the section contents
//   // }
//   // late final sections;
//   // void _loadData() async {
//   //   final userId = Provider.of<UserProvider>
//   //     (context, listen: false).curruser!.id;
//   //    sections = Provider.of<SectionProvider>
//   //     (context, listen: false).sections;
//   //
//   //   for (var section in sections) {
//   //     await Provider.of<SectionContentProvider>
//   //       (context, listen: false).
//   //     getAlSecsContent(userId, section);
//   //  await   Provider.of<SectionContentProvider>(context).
//   //     getSectionContentBySectionId(section);
//   //   }
//   //
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }
//
//
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       final args =
//       ModalRoute.of(context)!.settings.arguments as SectionModel;
//       sectionModel = args;
//       _loadData();
//     });
//   }
//
//   void _loadData() async {
//     await Provider.of<SectionContentProvider>(context, listen: false)
//         .getSectionContentBySectionId(sectionModel); // Fetch content by section ID
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     SectionContentProvider secs =
//     Provider.of<SectionContentProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//             ""),
//       ),
//       body: isLoading
//           ? Center(
//           child: LoadingIndictor()) // Show a loading spinner
//           :Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child:
//               Consumer<SectionContentProvider>(
//                 builder: (context, provider, child) {
//                   return ListView.separated(
//                     itemBuilder: (context, index) {
//                       return SectionContentItem(
//                         sectionContentModel:
//                         provider.sectionContents[index],
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return SizedBox(height: 20.0);
//                     },
//                     itemCount: provider.sectionContents.length,
//                   );
//                 },
//               )
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppTheme.primary,
//         shape: CircleBorder(),
//         onPressed: (){
//           showDialog(context: context, builder: (context)=>
//               ShowDialogContent(sentenceController: sentenceController));
//         },
//         child: Icon(CupertinoIcons.add,
//           color: Colors.white,),
//       ),
//     );
//   }
// }
//
//
// class NoTasks extends StatelessWidget {
//   const NoTasks({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(Icons.menu_sharp,size: 44,color: AppTheme.primary,),
//         SizedBox(height: 24.0,),
//         Text("No Items Yet",style:
//         TextStyle(
//           color: AppTheme.primary,
//           fontSize: 30.0,
//           fontWeight: FontWeight.bold
//         ),)
//       ],
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/view/widget/section_content_item.dart';
import 'package:graduationproject/utils/provider/section_content_provider.dart';
import 'package:graduationproject/utils/widgets/loaing_indictor.dart';
import 'package:provider/provider.dart';

import '../../models/section_model.dart';

class SectionContentScreen extends StatefulWidget {
  static String routeName = "/SectionContentScreen";

  @override
  State<SectionContentScreen> createState() =>
      _SectionContentScreenState();
}

class _SectionContentScreenState extends State<SectionContentScreen> {
  bool isLoading = true;
  late SectionModel sectionModel; // Selected section
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args =
      ModalRoute.of(context)!.settings.arguments as SectionModel;
      sectionModel = args;
      _loadData();
    });
  }

  void _loadData() async {
    await Provider.of<SectionContentProvider>(context, listen: false)
        .getSectionContentBySectionId(sectionModel); //
    // Fetch content by section ID

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SectionContentProvider sectionContentProvider =
    Provider.of<SectionContentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("sectionModel.text"), // Title of the section
        backgroundColor: AppTheme.primary,
      ),
      body: isLoading
          ? Center(
        child: LoadingIndictor(), // Show a loading indicator
      )
          : ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return SectionContentItem(
            sectionContentModel:
            sectionContentProvider.sectionContents[index],
          ); // Display content item
        },
        separatorBuilder: (context, index) => SizedBox(height: 12.0),
        itemCount: sectionContentProvider.sectionContents.length,
      ),
    );
  }
}

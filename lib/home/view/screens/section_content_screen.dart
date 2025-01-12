import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/view/widget/section_content_item.dart';
import 'package:graduationproject/home/view/widget/show_dialog_content.dart';
import 'package:graduationproject/utils/provider/section_content_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:graduationproject/utils/widgets/loaing_indictor.dart';
import 'package:provider/provider.dart';
import '../../models/section_model.dart';

class SectionContentScreen extends StatefulWidget {
  static String routeName = "/SectionContentScreen";

  @override
  State<SectionContentScreen> createState() => _SectionContentScreenState();
}

class _SectionContentScreenState extends State<SectionContentScreen> {
  bool isLoading = true;
  SectionModel? sectionModel;
  final sentenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args = ModalRoute.of(context)?.settings.arguments as SectionModel?;
      if (args != null) {
        sectionModel = args;
        _loadData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Section data not found")));
        Navigator.pop(context);
      }
    });
  }

  void _loadData() async {
    final userId = Provider.of<UserProvider>(context, listen: false).curruser!.id!;

    try {
      if (sectionModel != null) {
        await Provider.of<SectionContentProvider>(context, listen: false)
            .getAlSecsContent(userId, sectionModel!);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to load section content: $e")));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    SectionContentProvider sectionContentProvider = Provider.of<SectionContentProvider>(context, listen: false);

    // Get the contents for the current section
    final sectionContents = sectionContentProvider.getSectionContents(sectionModel?.id ?? "");

    return Scaffold(
      appBar: AppBar(
        title: Text(sectionModel?.name ?? "Section Content"),
        backgroundColor: AppTheme.primary,
      ),
      body: isLoading
          ? _buildLoadingIndicator()
          : sectionContents.isEmpty
          ? _buildNoTasks()
          : _buildContentList(sectionContents),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => ShowDialogContent(
              sentenceController: sentenceController,
              currentSection: sectionModel!, // Pass the current section
            ),
          );
          sentenceController.clear();
          _loadData();
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, color: AppTheme.white),
      ),
    );
  }

  Widget _buildLoadingIndicator() => Center(child: LoadingIndictor());

  Widget _buildNoTasks() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.library_books, size: 56,
            color: AppTheme.primary),
        SizedBox(height: 24.0),
        Text("No Items Yet",
            style: Theme.of(context).textTheme.titleMedium),
      ],
    ),
  );

  Widget _buildContentList(List<SectionContentModel> sectionContents) =>
      ListView.separated(
    padding: const EdgeInsets.all(20.0),
    itemBuilder: (context, index) => SectionContentItem(
        sectionContentModel: sectionContents[index]),
    separatorBuilder: (context, index) => SizedBox(height: 12.0),
    itemCount: sectionContents.length,
  );
}
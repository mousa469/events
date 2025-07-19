import 'package:events/core/models/event_category_model.dart';
import 'package:events/features/layout/edit_event/data/managers/update_event_details/update_event_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCategoryDropDownMenu extends StatefulWidget {
  const EventCategoryDropDownMenu({
    super.key,
    required this.category,
    required this.onCategorySelected,
  });

  final String category;
  final void Function(String category) onCategorySelected;

  @override
  State<EventCategoryDropDownMenu> createState() =>
      _EventCategoryDropDownMenuState();
}

class _EventCategoryDropDownMenuState extends State<EventCategoryDropDownMenu> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UpdateEventDetailsCubit>(context).category =
        widget.category;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DropdownMenu(
        onSelected: (value) {
          widget.onCategorySelected(value.toString());
        },
        hintText: widget.category,
        // hintText: event.category,
        width: double.infinity,
        dropdownMenuEntries: createCategoryDropDownMenuItems(context: context),
      ),
    );
  }

  List<DropdownMenuEntry> createCategoryDropDownMenuItems({
    required BuildContext context,
  }) {
    List<EventCategoryModel> categories =
        EventCategoryModel.createEventCategories(context: context);
    List<DropdownMenuEntry> entries = [];
    for (var i = 0; i < categories.length; i++) {
      entries.add(
        DropdownMenuEntry<String>(
          style: ButtonStyle(),
          value: categories[i].title,
          label: categories[i].title,
        ),
      );
    }

    return entries;
  }
}

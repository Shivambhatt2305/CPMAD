import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_multilang/contorller/todo_controller.dart';
import '../../contorller/todo_controller.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key});

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final _controller = TextEditingController();
  String? editingId;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      editingId = args['id'] as String?;
      _controller.text = (args['title'] as String?) ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoCtrl = Get.find<TodoController>();
    final isEditing = editingId != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'edit_todo'.tr : 'add_todo'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'hint_title'.tr,
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _save(todoCtrl, isEditing),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () => _save(todoCtrl, isEditing),
                    child: Text('save'.tr),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    child: Text('cancel'.tr),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _save(TodoController c, bool isEditing) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    if (isEditing) {
      c.updateTitle(editingId!, text);
    } else {
      c.add(text);
    }
    Get.back();
  }
}
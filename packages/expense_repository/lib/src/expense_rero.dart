import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRerository {
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategory();
}

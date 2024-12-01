class Course {
  final String title;
  final int completed;
  final int total;

  Course({required this.title, required this.completed, required this.total});
}

final List<Course> courses = [
  Course(title: "Data Types", completed: 10, total: 16),
  Course(title: "Java Basic", completed: 12, total: 18),
  Course(title: "Methods", completed: 0, total: 6),
  Course(title: "Operators", completed: 5, total: 15),
  Course(title: "OOP", completed: 6, total: 24),
  Course(title: "Conditional", completed: 0, total: 5),
];

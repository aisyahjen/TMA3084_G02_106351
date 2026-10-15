import 'myLib.dart';

void main() {
  Employee employee = Employee('Aisyah', 5000.0, 7.0, 10.0);

  double totalSalary = employee.calculateTotalSalary();

  print('Total Salary = \$${totalSalary.toStringAsFixed(1)} USD');
}

import 'dart:async';
import 'dart:math';
import 'package:square_example/redux/app_state.dart';
import 'actions.dart';

AppState reducer(AppState state, dynamic action) {

  // Получаем корни квадратного уравнения
  String getSolution() {
    double a = action.a.toDouble();
    double b = (action.b).toDouble();
    double c = action.c.toDouble();

    double sqDisc = 0;
    double disc = (b * b) - 4 * a * c;
    print('disc: $disc');

    if (disc < 0) {
      return 'No solution!';
    } else {
      sqDisc = sqrt(disc);
    }
    print('sqDisc: $sqDisc');

    if (sqDisc == 0) {
      double result = -b / (2*a);
      return '1 solution: ${result.toStringAsFixed(2)}';
    }

    else if (sqDisc > 0) {
      double result_1 = (-b + sqDisc) / (2*a);
      double result_2 = (-b - sqDisc) / (2*a);
      print("result_1: $result_2");

      return '2 solutions: (${result_1.toStringAsFixed(2)}, ${result_2.toStringAsFixed(2)})';
    }

    return '';

  }

  if (action is Solve) {
    var finalRes = getSolution();
    print("Check result: $finalRes");
    return AppState(result: finalRes, a: state.a, b: state.b, c: state.c);
  }

  else {
    return state;
  }
}


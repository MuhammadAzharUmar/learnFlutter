abstract class Shape {
  double area();
  String _name = "Hashir";
  String get getName => _name;
  bool condition = false;
  void setName(String name) {
    if (condition) {
      _name = name;
    }
  }
}

class abc extends Shape {
  @override
  double area() {
    return 2.3;
  }
}

class Circle extends Shape {
  @override
  void setName(String name) {
    print("Azhar");
    _name=name;
  }

  @override
  double area() {
    return 3.14;
  }
}

void main() {
  Circle sh = Circle();
  print(sh.getName);
  sh.setName("name");
  print(sh.getName);
  print("class abc");
  abc b = abc();
  print(b.getName);
  b.setName("Azhar");
  print(b.getName);
}

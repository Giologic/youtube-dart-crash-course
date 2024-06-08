class Cat {
  double energy = 20;

  Cat(this.energy);

  void eat(Food food) {
    energy += food.nutrition;
  }

  void setEnergy(double energy) {
    this.energy = energy;
  }

  void resetEnergy() {
    energy = 20;
  }
}

abstract class Food {
  double get nutrition;
}

class Sausage implements Food {
  static final String _color = "red";
  final String _expiration = DateTime(2024, 06, 24).toString();
  final double _nutrition = 10.0;

  @override
  double get nutrition {
    return _nutrition;
  }

  get getColor {
    return _color;
  }

  get getExpiration {
    return _expiration;
  }
}

class Veggies implements Food {
  final double _nutrition = 30.0;

  @override
  double get nutrition {
    return _nutrition;
  }
}

void main() {
  var cat = Cat(20);
  var sausage = Sausage();
  var veggies = Veggies();
  cat.eat(sausage);
  cat.eat(veggies);
  print(cat.energy);
}

mixin M {
  void doSomething() {
    print('Print message...');
  }
}

class B {
  String name = 'Class B';
  void displayInformation() {
    print('Information from B');
  }
}

class C extends B with M {
  @override
  void displayInformation() {
    doSomething();
  }
}

void main() {
  var c = C();
  c.displayInformation();
}

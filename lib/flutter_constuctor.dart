
class Person {
  String name;
  int age;
  int a;
  int b;

  Person(String name, int age, int a, int b) {
    this.name = name;
    this.age = age;
    this.a = a;
    this.b = b;
  }
int sum(int a, int b){
return (a+b);
}

  @override
  String toString() {
    return "Customer [name=${this.name},age=${this.age},value of a =${this.a}, value of b = ${this.b}]";
  }

}
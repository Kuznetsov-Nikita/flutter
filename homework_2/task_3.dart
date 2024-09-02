void main() {
  final storage = SmartStorage<UserModel>([]);
  
  storage.addAll([
    UserModel(id: 1, name: 'a'), 
    UserModel(id: 2, name: 'b'), 
    UserModel(id: 3, name: 'c')
  ]);
  print(storage.storage);
  storage.add(UserModel(id: 4, name: 'b'));
  print(storage.storage);
  storage.insert(1, UserModel(id: 5, name: 'a'));
  print(storage.storage);
  
  print(storage.firstWithName('a'));
  print(storage.lastWithName('a'));
  print(storage.withName('b'));
  
  storage.removeWithName('a');
  print(storage.storage);
  
  print(storage.removeAt(2));
  print(storage.storage);
  print(storage.removeLast());
  print(storage.storage);
  
  try {
    storage.firstWithName('c');
  } catch (e) {
    print(e);
  }
}

abstract class NamedModel {
  final String name;
  
  const NamedModel({required this.name});
}

class SmartStorage<T extends NamedModel> {
  final List<T> storage;

  const SmartStorage(this.storage);

  void add(T element) {
    storage.add(element);
  }
  
  void addAll(Iterable<T> iterable) {
    storage.addAll(iterable);
  }
  
  void insert(int index, T element) {
    storage.insert(index, element);
  }
  
  void insertAll(int index, Iterable<T> iterable) {
    storage.insertAll(index, iterable);
  }
  
  bool remove(Object? value) {
    return storage.remove(value);
  }
  
  T removeAt(int index) {
    return storage.removeAt(index);
  }
  
  T removeLast() {
    return storage.removeLast();
  }
  
  void removeWithName(String name) {
    storage.removeWhere((element) => element.name == name);
  }
  
  T firstWithName(String name) {
    return storage.firstWhere((element) => element.name == name);
  }
  
  T lastWithName(String name) {
    return storage.lastWhere((element) => element.name == name);
  }
  
  T singleWithName(String name) {
    return storage.singleWhere((element) => element.name == name);
  }
  
  Iterable<T> withName(String name) {
    return storage.where((element) => element.name == name);
  }
}

class UserModel implements NamedModel {
  final int id;
  @override
  final String name;
  
  const UserModel({required this.id, required this.name});
  
  String toString() {
    return '{ id: $id, name: $name }';
  }
}


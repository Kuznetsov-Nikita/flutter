import 'dart:convert';

void main() {  
  final ben = UserModel(id: 1, name: 'Ben', inMarriage: true, childrenIds: [3, 4]);
  print(jsonEncode(ben));
}

class UserModel {
  final int id;
  final String name;
  final bool inMarriage;
  final List<int> childrenIds;
  
  const UserModel({
    required this.id, 
    required this.name, 
    this.inMarriage = false, 
    this.childrenIds = const [],
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'inMarriage': inMarriage,
      'children': childrenIds,
    };
  }
}


int findFirstUniqueElement(List<int> array) {
  final Map<int, int> elementsCount = {};
  
  for (var element in array) {
    final elementCount = elementsCount[element];
    
    if (elementCount == null) {
      elementsCount[element] = 1;
    } else {
      elementsCount[element] = elementCount! + 1;
    }
  }
  
  late var answer = -1;
  
  for (var i = 0; i < array.length; ++i) {
    if (elementsCount[array[i]] == 1) {
      answer = i;
      break;
    }
  }
  
  return answer;
}

List<int> removeDuplicatedFromSortedList(List<int> array) {
  if (array.isEmpty) {
    return array;
  }
  
  final List<int> result = [array[0]];
  
  for (var i = 1; i < array.length; ++i) {
    if (array[i] != result.last) {
      result.add(array[i]);
    }
  }
  
  return result;
}

int findNod(int a, int b) {
  if (a == 0 && b == 0) {
    throw(Exception('GCD(0, 0) is not defined'));
  }
  
  a = a.abs();
  b = b.abs();
  
  while (a != 0 && b != 0) {
    if (a > b) {
      a = a % b;
    } else {
      b = b % a;
    }
  }
  
  return a + b;
}

int lengthOfLastWord(String roman) {
  final wordsAndSymbols = roman.split(' ').reversed;
  late var ans = 0;
  
  for (var string in wordsAndSymbols) {
    if (string.isNotEmpty && string.runes.every((rune) => isLetter(rune))) {
      ans = string.length;
      break;
    }
  }
  
  return ans;
}

bool isLetter(int rune) {
  const smallACode = 97;
  const smallZCode = 122;
  const capitalACode = 65;
  const capitalZCode = 90;
  
  return (rune >= smallACode && rune <= smallZCode) ||
    (rune >= capitalACode && rune <= capitalZCode);
}


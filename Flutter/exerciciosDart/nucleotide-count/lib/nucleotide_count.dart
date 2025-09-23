// Implement a custom InvalidNucleotideException exception

class NucleotideCount {
  count(String strand) {
    List list = strand.split("");
    Map<String, dynamic> result = {'A': 0, 'C': 0, 'G':0, 'T':0};

    list.forEach((digit) {
      if(!result.containsKey(digit)){
        throw InvalidNucleotideException();
      }

      result[digit] += 1;
    },);

    return result;
  }
}

class InvalidNucleotideException implements Exception{

}

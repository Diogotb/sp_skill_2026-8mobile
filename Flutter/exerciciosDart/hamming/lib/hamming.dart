class Hamming {
  int distance(String s, String t) {
    int distance = 0;

    if(s.length != t.length){
      throw ArgumentError("strands must be of equal length");
    }

    for(int i = 0; i < t.length; i++){
      if (s[i] != t[i]) distance++;
    }

    return distance;
  }
}

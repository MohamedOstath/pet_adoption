class CacheData {
  static int petId = 0;

  void setPetId(int value) {
    CacheData.petId = value;
  }

  int getPetId() {
    return petId;
  }
}

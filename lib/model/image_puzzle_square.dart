class ImagePuzzleTile {
  bool xBlank;
  String image;
  int location;
  bool canMove;

  ImagePuzzleTile(
      {required this.xBlank,
      required this.image,
      required this.location,
      required this.canMove});

  bool isSame(ImagePuzzleTile imagePuzzleSquare) {
    if (xBlank == imagePuzzleSquare.xBlank &&
        location == imagePuzzleSquare.location) {
      return true;
    } else {
      return false;
    }
  }

  factory ImagePuzzleTile.defaultTile() {
    return ImagePuzzleTile(
        xBlank: true, image: '', location: 9, canMove: false);
  }
}

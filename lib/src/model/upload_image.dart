

class UploadImage {
  List<String> images;
  String message;
  bool isSuccess;

  UploadImage({this.images, this.message, this.isSuccess});

  factory UploadImage.fromJson(Map<String, dynamic> json) {
    print(json['message']);
    return UploadImage(
        images: new List<String>.from(json['filenames']),
        message: json['message'],
        isSuccess: json['success']);
  }
}

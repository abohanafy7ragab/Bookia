class ProfileResponse {
  final ProfileData? data;
  final String message;
  final List<dynamic> error;
  final int status;

  ProfileResponse({
    this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: json['data'] is Map<String, dynamic>
          ? ProfileData.fromJson(json['data'])
          : null,
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}

class ProfileData {
  final int id;
  final String name;
  final String email;
  final String? address;
  final String? city;
  final String? phone;
  final bool emailVerified;
  final String? image;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.emailVerified,
    this.image,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      emailVerified: json['email_verified'] ?? false,
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'address': address,
        'city': city,
        'phone': phone,
        'email_verified': emailVerified,
        'image': image,
      };
}
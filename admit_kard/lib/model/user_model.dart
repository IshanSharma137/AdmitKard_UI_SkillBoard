class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? whatsapp;
  String? country;
  String? dob;
  String? gender;
  String? status;
  String? course;
  String? pref_count;
  String? pref_cour;
  String? spec;
  String? intake;
  String? budget;
  String? object;
  String? jobrole;
  String? comp;
  String? grad;
  String? back;
  String? imageUrl;

  UserModel({this.uid, this.email, this.firstName, this.lastName, this.phone, this.whatsapp, this.country, this.dob, this.gender, 
  this.status, this.course, this.pref_count, this.pref_cour, this.spec, this.intake, this.budget, this.object, this.jobrole, this.comp
  , this.grad, this.back,  this.imageUrl});

  //data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phone: map['phone'],
      whatsapp: map['whatsapp'],
      country: map['country'],
      dob: map['dob'],
      gender: map['gender'],
      status: map['status'],
      course: map['course'],
      pref_count: map['pref_count'],
      pref_cour: map['pref_cour'],
      spec: map['spec'],
      intake: map['intake'],
      budget: map['budget'],
      object: map['object'],
      jobrole: map['jobrole'],
      comp: map['comp'],
      grad: map['grad'],
      back: map['back'],
      imageUrl: map['imageUrl']

    );
  }

  

  Map<String, dynamic> toMap() {
    return { 
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'whatsapp': whatsapp,
      'country': country,
      'dob': dob,
      'gender': gender,
      'status': status,
      'course': course,
      'pref_count': pref_count,
      'pref_cour': pref_cour,
      'spec': spec,
      'intake': intake,
      'budget': budget,
      'object': object,
      'jobrole': jobrole,
      'comp': comp,
      'grad': grad,
      'back': back

    };
  }
}
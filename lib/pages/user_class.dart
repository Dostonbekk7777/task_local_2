class User{
 late String email;
 var phone;
 var adres;
 var password;

 User({required this.email,required this.phone,required this.adres,required this.password});

 User.fromJson(Map<String, dynamic> json)
     : email = json['email'],
       phone = json['phone'],
        adres = json['adres'],
 password = json['password'];

 Map<String, dynamic> toJson() => {
   'email' : email,
   'phone' : phone,
   'adres' : adres,
   'password': password

 };
}
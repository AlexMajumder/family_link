import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  final String maritalStatus;
  final String occupation;
  final String samaj;
  final String qualification;

  final String birthDate;
  final String bloodGroup;
  final String duty;

  final String email;
  final String phone;
  final String altPhone;
  final String landline;
  final String socialLink;

  final String flat;
  final String building;
  final String street;
  final String landmark;
  final String city;
  final String district;
  final String state;
  final String nativeCity;
  final String nativeState;
  final String country;
  final String pincode;

  const ProfileScreen({
    super.key,
    this.name = 'Alex Majumder',
    this.age = '23',
    this.gender = 'Male',
    this.maritalStatus = 'Single',
    this.occupation = 'Software Developer',
    this.samaj = 'Default Samaj',
    this.qualification = 'Bachelor\'s Degree',
    this.birthDate = '01/01/1990',
    this.bloodGroup = 'O+',
    this.duty = 'General Duties',
    this.email = 'alex.doe@gmail.com',
    this.phone = '+1234567890',
    this.altPhone = '+0987654321',
    this.landline = '123-456-7890',
    this.socialLink = 'https://facebook.com/johndoe',
    this.flat = '12A',
    this.building = 'Sunshine Apartments',
    this.street = 'Main Street',
    this.landmark = 'Near Central Park',
    this.city = 'Metropolis',
    this.district = 'Central District',
    this.state = 'StateName',
    this.nativeCity = 'Hometown',
    this.nativeState = 'HomeState',
    this.country = 'CountryName',
    this.pincode = '123456',
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name;
  late String age;
  late String gender;
  late String maritalStatus;
  late String occupation;
  late String samaj;
  late String qualification;

  late String birthDate;
  late String bloodGroup;
  late String duty;

  late String email;
  late String phone;
  late String altPhone;
  late String landline;
  late String socialLink;

  late String flat;
  late String building;
  late String street;
  late String landmark;
  late String city;
  late String district;
  late String state;
  late String nativeCity;
  late String nativeState;
  late String country;
  late String pincode;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    age = widget.age;
    gender = widget.gender;
    maritalStatus = widget.maritalStatus;
    occupation = widget.occupation;
    samaj = widget.samaj;
    qualification = widget.qualification;

    birthDate = widget.birthDate;
    bloodGroup = widget.bloodGroup;
    duty = widget.duty;

    email = widget.email;
    phone = widget.phone;
    altPhone = widget.altPhone;
    landline = widget.landline;
    socialLink = widget.socialLink;

    flat = widget.flat;
    building = widget.building;
    street = widget.street;
    landmark = widget.landmark;
    city = widget.city;
    district = widget.district;
    state = widget.state;
    nativeCity = widget.nativeCity;
    nativeState = widget.nativeState;
    country = widget.country;
    pincode = widget.pincode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profile',
            onPressed: _editProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Profile Info'),
            _buildInfoRow('Full Name', name),
            _buildInfoRow('Age', age),
            _buildInfoRow('Gender', gender),
            _buildInfoRow('Marital Status', maritalStatus),
            _buildInfoRow('Occupation', occupation),
            _buildInfoRow('Samaj Name', samaj),
            _buildInfoRow('Qualification', qualification),

            _buildSectionTitle(context, 'Personal Info'),
            _buildInfoRow('Birth Date', birthDate),
            _buildInfoRow('Blood Group', bloodGroup),
            _buildInfoRow('Exact Nature of Duties', duty),

            _buildSectionTitle(context, 'Contact Info'),
            _buildInfoRow('Email ID', email),
            _buildInfoRow('Phone Number', phone),
            _buildInfoRow('Alternative Number', altPhone),
            _buildInfoRow('Landline Number', landline),
            _buildInfoRow('Social Media Link', socialLink),

            _buildSectionTitle(context, 'Address Info'),
            _buildInfoRow('Flat Number', flat),
            _buildInfoRow('Building Name', building),
            _buildInfoRow('Street Name', street),
            _buildInfoRow('Landmark', landmark),
            _buildInfoRow('City', city),
            _buildInfoRow('District', district),
            _buildInfoRow('State', state),
            _buildInfoRow('Native City', nativeCity),
            _buildInfoRow('Native State', nativeState),
            _buildInfoRow('Country', country),
            _buildInfoRow('Pincode', pincode),
          ],
        ),
      ),
    );
  }

  void _editProfile() async {
    final updated = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          name: name,
          age: age,
          gender: gender,
          maritalStatus: maritalStatus,
          occupation: occupation,
          samaj: samaj,
          qualification: qualification,
          birthDate: birthDate,
          bloodGroup: bloodGroup,
          duty: duty,
          email: email,
          phone: phone,
          altPhone: altPhone,
          landline: landline,
          socialLink: socialLink,
          flat: flat,
          building: building,
          street: street,
          landmark: landmark,
          city: city,
          district: district,
          state: state,
          nativeCity: nativeCity,
          nativeState: nativeState,
          country: country,
          pincode: pincode,
        ),
      ),
    );

    if (updated != null) {
      setState(() {
        name = updated['name'] ?? name;
        age = updated['age'] ?? age;
        gender = updated['gender'] ?? gender;
        maritalStatus = updated['maritalStatus'] ?? maritalStatus;
        occupation = updated['occupation'] ?? occupation;
        samaj = updated['samaj'] ?? samaj;
        qualification = updated['qualification'] ?? qualification;
        birthDate = updated['birthDate'] ?? birthDate;
        bloodGroup = updated['bloodGroup'] ?? bloodGroup;
        duty = updated['duty'] ?? duty;
        email = updated['email'] ?? email;
        phone = updated['phone'] ?? phone;
        altPhone = updated['altPhone'] ?? altPhone;
        landline = updated['landline'] ?? landline;
        socialLink = updated['socialLink'] ?? socialLink;
        flat = updated['flat'] ?? flat;
        building = updated['building'] ?? building;
        street = updated['street'] ?? street;
        landmark = updated['landmark'] ?? landmark;
        city = updated['city'] ?? city;
        district = updated['district'] ?? district;
        state = updated['state'] ?? state;
        nativeCity = updated['nativeCity'] ?? nativeCity;
        nativeState = updated['nativeState'] ?? nativeState;
        country = updated['country'] ?? country;
        pincode = updated['pincode'] ?? pincode;
      });
    }
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}

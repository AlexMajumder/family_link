import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
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

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.occupation,
    required this.samaj,
    required this.qualification,
    required this.birthDate,
    required this.bloodGroup,
    required this.duty,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.landline,
    required this.socialLink,
    required this.flat,
    required this.building,
    required this.street,
    required this.landmark,
    required this.city,
    required this.district,
    required this.state,
    required this.nativeCity,
    required this.nativeState,
    required this.country,
    required this.pincode,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late String _gender;
  late String _maritalStatus;
  late final TextEditingController _occupationController;
  late final TextEditingController _samajController;
  late final TextEditingController _qualificationController;

  late final TextEditingController _birthDateController;
  late String _bloodGroup;
  late final TextEditingController _dutyController;

  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _altPhoneController;
  late final TextEditingController _landlineController;
  late final TextEditingController _socialLinkController;

  late final TextEditingController _flatController;
  late final TextEditingController _buildingController;
  late final TextEditingController _streetController;
  late final TextEditingController _landmarkController;
  late final TextEditingController _cityController;
  late final TextEditingController _districtController;
  late final TextEditingController _stateController;
  late final TextEditingController _nativeCityController;
  late final TextEditingController _nativeStateController;
  late final TextEditingController _countryController;
  late final TextEditingController _pincodeController;

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> maritalStatusOptions = ['Single', 'Married', 'Widowed'];
  final List<String> bloodGroupOptions = [
    'A+','A-','B+','B-','AB+','AB-','O+','O-'
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _gender = widget.gender;
    _maritalStatus = widget.maritalStatus;
    _occupationController = TextEditingController(text: widget.occupation);
    _samajController = TextEditingController(text: widget.samaj);
    _qualificationController = TextEditingController(text: widget.qualification);

    _birthDateController = TextEditingController(text: widget.birthDate);
    _bloodGroup = widget.bloodGroup;
    _dutyController = TextEditingController(text: widget.duty);

    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phone);
    _altPhoneController = TextEditingController(text: widget.altPhone);
    _landlineController = TextEditingController(text: widget.landline);
    _socialLinkController = TextEditingController(text: widget.socialLink);

    _flatController = TextEditingController(text: widget.flat);
    _buildingController = TextEditingController(text: widget.building);
    _streetController = TextEditingController(text: widget.street);
    _landmarkController = TextEditingController(text: widget.landmark);
    _cityController = TextEditingController(text: widget.city);
    _districtController = TextEditingController(text: widget.district);
    _stateController = TextEditingController(text: widget.state);
    _nativeCityController = TextEditingController(text: widget.nativeCity);
    _nativeStateController = TextEditingController(text: widget.nativeState);
    _countryController = TextEditingController(text: widget.country);
    _pincodeController = TextEditingController(text: widget.pincode);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _samajController.dispose();
    _qualificationController.dispose();
    _birthDateController.dispose();
    _dutyController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _altPhoneController.dispose();
    _landlineController.dispose();
    _socialLinkController.dispose();
    _flatController.dispose();
    _buildingController.dispose();
    _streetController.dispose();
    _landmarkController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _nativeCityController.dispose();
    _nativeStateController.dispose();
    _countryController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nameController, 'Full Name'),
              _buildTextField(_ageController, 'Age', keyboardType: TextInputType.number),
              _buildDropdown('Gender', genderOptions, (val) => setState(() => _gender = val!), _gender),
              _buildDropdown('Marital Status', maritalStatusOptions, (val) => setState(() => _maritalStatus = val!), _maritalStatus),
              _buildTextField(_occupationController, 'Occupation'),
              _buildTextField(_samajController, 'Samaj Name'),
              _buildTextField(_qualificationController, 'Qualification'),

              _buildDatePickerField(_birthDateController, 'Birth Date'),
              _buildDropdown('Blood Group', bloodGroupOptions, (val) => setState(() => _bloodGroup = val!), _bloodGroup),
              _buildTextField(_dutyController, 'Exact Nature of Duties'),

              _buildTextField(_emailController, 'Email ID', keyboardType: TextInputType.emailAddress),
              _buildTextField(_phoneController, 'Phone Number', keyboardType: TextInputType.phone),
              _buildTextField(_altPhoneController, 'Alternative Number'),
              _buildTextField(_landlineController, 'Landline Number'),
              _buildTextField(_socialLinkController, 'Social Media Link'),

              _buildTextField(_flatController, 'Flat Number'),
              _buildTextField(_buildingController, 'Building Name'),
              _buildTextField(_streetController, 'Street Name'),
              _buildTextField(_landmarkController, 'Landmark'),
              _buildTextField(_cityController, 'City'),
              _buildTextField(_districtController, 'District'),
              _buildTextField(_stateController, 'State'),
              _buildTextField(_nativeCityController, 'Native City'),
              _buildTextField(_nativeStateController, 'Native State'),
              _buildTextField(_countryController, 'Country'),
              _buildTextField(_pincodeController, 'Pincode', keyboardType: TextInputType.number),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label),
        validator: (val) => (val == null || val.trim().isEmpty) ? 'Enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, ValueChanged<String?> onChanged, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(labelText: label),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
        validator: (val) => (val == null || val.isEmpty) ? 'Select $label' : null,
      ),
    );
  }

  Widget _buildDatePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: label),
        validator: (val) => (val == null || val.trim().isEmpty) ? 'Select $label' : null,
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.tryParse(_parseDate(controller.text)) ?? DateTime(1990, 1),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            controller.text = "${picked.day}/${picked.month}/${picked.year}";
          }
        },
      ),
    );
  }

  String _parseDate(String dateStr) {
    // Try to parse from dd/mm/yyyy format to yyyy-mm-dd for DateTime.parse
    try {
      final parts = dateStr.split('/');
      if (parts.length == 3) {
        return '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
      }
    } catch (_) {}
    return dateStr;
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'name': _nameController.text.trim(),
        'age': _ageController.text.trim(),
        'gender': _gender,
        'maritalStatus': _maritalStatus,
        'occupation': _occupationController.text.trim(),
        'samaj': _samajController.text.trim(),
        'qualification': _qualificationController.text.trim(),
        'birthDate': _birthDateController.text.trim(),
        'bloodGroup': _bloodGroup,
        'duty': _dutyController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'altPhone': _altPhoneController.text.trim(),
        'landline': _landlineController.text.trim(),
        'socialLink': _socialLinkController.text.trim(),
        'flat': _flatController.text.trim(),
        'building': _buildingController.text.trim(),
        'street': _streetController.text.trim(),
        'landmark': _landmarkController.text.trim(),
        'city': _cityController.text.trim(),
        'district': _districtController.text.trim(),
        'state': _stateController.text.trim(),
        'nativeCity': _nativeCityController.text.trim(),
        'nativeState': _nativeStateController.text.trim(),
        'country': _countryController.text.trim(),
        'pincode': _pincodeController.text.trim(),
      });
    }
  }
}

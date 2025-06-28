import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FamilyMemberRegistrationScreen extends StatefulWidget {
  const FamilyMemberRegistrationScreen({super.key});

  @override
  State<FamilyMemberRegistrationScreen> createState() => _FamilyMemberRegistrationScreenState();
}

class _FamilyMemberRegistrationScreenState extends State<FamilyMemberRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Personal Info
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _gender;
  String? _maritalStatus;
  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _dutyController = TextEditingController();
  String? _bloodGroup;
  File? _photoFile;

  // Relation with Head
  String? _relation;

  // Contact Info
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _altPhoneController = TextEditingController();
  final TextEditingController _landlineController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _socialLinkController = TextEditingController();

  // Current Address
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _doorNumberController = TextEditingController();
  final TextEditingController _flatNumberController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  // Native Place
  final TextEditingController _nativeCityController = TextEditingController();
  final TextEditingController _nativeStateController = TextEditingController();

  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  final List<String> maritalStatusOptions = ['Single', 'Married', 'Widowed'];
  final List<String> bloodGroupOptions = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  final List<String> relationOptions = [
    'Father',
    'Mother',
    'Son',
    'Daughter',
    'Brother',
    'Sister',
    'Spouse',
    'Other',
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _ageController.dispose();
    _qualificationController.dispose();
    _occupationController.dispose();
    _dutyController.dispose();

    _phoneController.dispose();
    _altPhoneController.dispose();
    _landlineController.dispose();
    _emailController.dispose();
    _socialLinkController.dispose();

    _countryController.dispose();
    _stateController.dispose();
    _districtController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _landmarkController.dispose();
    _buildingController.dispose();
    _doorNumberController.dispose();
    _flatNumberController.dispose();
    _pincodeController.dispose();

    _nativeCityController.dispose();
    _nativeStateController.dispose();

    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedFile != null) {
      setState(() {
        _photoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _birthDateController.text = "${picked.day}/${picked.month}/${picked.year}";
      // Optional: auto-set age
      final age = DateTime.now().year - picked.year;
      _ageController.text = age.toString();
    }
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_relation == null || _relation!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select relation with family head')),
        );
        return;
      }
      if (_bloodGroup == null || _bloodGroup!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select blood group')),
        );
        return;
      }
      // Data is valid. You can now send data to backend or navigate
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Family Member Registered Successfully!')),
      );
      // Example: print or send data
      print('Registered family member: ${_firstNameController.text} ${_lastNameController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Member Registration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo upload preview and button
              Center(
                child: GestureDetector(
                  onTap: _pickPhoto,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: _photoFile != null ? FileImage(_photoFile!) : null,
                    child: _photoFile == null
                        ? const Icon(Icons.camera_alt, size: 50, color: Colors.white70)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(child: TextButton(onPressed: _pickPhoto, child: const Text('Upload Photo'))),
              const SizedBox(height: 24),

              // Personal Info Section
              _buildSectionTitle(context, 'Personal Information'),
              _buildTextField(_firstNameController, 'First Name'),
              _buildTextField(_middleNameController, 'Middle Name', optional: true),
              _buildTextField(_lastNameController, 'Last Name'),
              _buildDatePickerField(_birthDateController, 'Birth Date', _selectBirthDate),
              _buildTextField(_ageController, 'Age', keyboardType: TextInputType.number),
              _buildDropdown('Gender', genderOptions, (val) => setState(() => _gender = val!), _gender),
              _buildDropdown('Marital Status', maritalStatusOptions, (val) => setState(() => _maritalStatus = val!), _maritalStatus),
              _buildTextField(_qualificationController, 'Qualification'),
              _buildTextField(_occupationController, 'Occupation'),
              _buildTextField(_dutyController, 'Exact Nature of Duties'),
              _buildDropdown('Blood Group', bloodGroupOptions, (val) => setState(() => _bloodGroup = val!), _bloodGroup),

              const SizedBox(height: 24),
              _buildDropdown('Relation with Family Head', relationOptions, (val) => setState(() => _relation = val!), _relation),

              const SizedBox(height: 24),
              // Contact Info Section
              _buildSectionTitle(context, 'Contact Information'),
              _buildTextField(_phoneController, 'Phone Number', keyboardType: TextInputType.phone),
              _buildTextField(_altPhoneController, 'Alternative Number', optional: true),
              _buildTextField(_landlineController, 'Landline Number', optional: true),
              _buildTextField(_emailController, 'Email ID', keyboardType: TextInputType.emailAddress),
              _buildTextField(_socialLinkController, 'Social Media Link', optional: true),

              const SizedBox(height: 24),
              // Current Address Section
              _buildSectionTitle(context, 'Current Address'),
              _buildTextField(_countryController, 'Country'),
              _buildTextField(_stateController, 'State'),
              _buildTextField(_districtController, 'District'),
              _buildTextField(_cityController, 'City'),
              _buildTextField(_streetController, 'Street Name'),
              _buildTextField(_landmarkController, 'Landmark', optional: true),
              _buildTextField(_buildingController, 'Building Name', optional: true),
              _buildTextField(_doorNumberController, 'Door Number', optional: true),
              _buildTextField(_flatNumberController, 'Flat Number', optional: true),
              _buildTextField(_pincodeController, 'Pincode', keyboardType: TextInputType.number),

              const SizedBox(height: 24),
              // Native Place Section
              _buildSectionTitle(context, 'Native Place'),
              _buildTextField(_nativeCityController, 'Native City'),
              _buildTextField(_nativeStateController, 'Native State'),

              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label, {
        bool optional = false,
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          suffixText: optional ? '(Optional)' : null,
        ),
        validator: (val) {
          if (optional) return null;
          if (val == null || val.trim().isEmpty) {
            return 'Enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, ValueChanged<String?> onChanged, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(labelText: label),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
        validator: (val) => val == null || val.isEmpty ? 'Select $label' : null,
      ),
    );
  }

  Widget _buildDatePickerField(TextEditingController controller, String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: label),
        validator: (val) => val == null || val.trim().isEmpty ? 'Select $label' : null,
        onTap: onTap,
      ),
    );
  }
}

import 'dart:io';
import 'package:family_link/features/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/success_dialog.dart';

class HeadRegistrationScreen extends StatefulWidget {
  const HeadRegistrationScreen({super.key});

  static const name = '/head-registration-screen';

  @override
  State<HeadRegistrationScreen> createState() => _HeadRegistrationScreenState();
}

class _HeadRegistrationScreenState extends State<HeadRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Profile Info
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _gender;
  String? _maritalStatus;
  File? _photoFile;
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _samajController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();

  // Personal Info
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _dutyController = TextEditingController();

  // Contact Info
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _altPhoneController = TextEditingController();
  final TextEditingController _landlineController = TextEditingController();
  final TextEditingController _socialLinkController = TextEditingController();

  // Address Info
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _nativeCityController = TextEditingController();
  final TextEditingController _nativeStateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedFile != null) {
      setState(() {
        _photoFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Head Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              const SizedBox(height: 24),

              _buildSectionTitle('Profile Info'),
              _buildTextField(_nameController, 'Full Name'),
              _buildTextField(_ageController, 'Age', keyboardType: TextInputType.number),
              _buildDropdown('Gender', ['Male', 'Female', 'Other'], (value) => _gender = value, _gender),
              _buildDropdown('Marital Status', ['Single', 'Married', 'Widowed'], (value) => _maritalStatus = value, _maritalStatus),
              _buildTextField(_occupationController, 'Occupation'),
              _buildTextField(_samajController, 'Samaj Name'),
              _buildTextField(_qualificationController, 'Qualification'),

              _buildSectionTitle('Personal Info'),
              _buildDatePickerField(_birthDateController, 'Birth Date'),
              _buildDropdown('Blood Group', [
                'A+',
                'A-',
                'B+',
                'B-',
                'AB+',
                'AB-',
                'O+',
                'O-'
              ], (value) => _bloodGroupController.text = value!, _bloodGroupController.text),
              _buildTextField(_dutyController, 'Exact Nature of Duties'),

              _buildSectionTitle('Contact Info'),
              _buildTextField(_emailController, 'Email ID', keyboardType: TextInputType.emailAddress),
              _buildTextField(_phoneController, 'Phone Number', keyboardType: TextInputType.phone),
              _buildTextField(_altPhoneController, 'Alternative Number'),
              _buildTextField(_landlineController, 'Landline Number'),
              _buildTextField(_socialLinkController, 'Social Media Link'),

              _buildSectionTitle('Address Info'),
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
                onPressed: _onSubmit,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String label, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(hintText: label),
        validator: (value) => (value == null || value.trim().isEmpty) ? 'Enter $label' : null,
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, Function(String?) onChanged, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: (value == null || value.isEmpty) ? null : value,
        decoration: InputDecoration(hintText: label),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
        validator: (value) => (value == null || value.isEmpty) ? 'Select $label' : null,
      ),
    );
  }


  Widget _buildDatePickerField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(hintText: label),
        validator: (value) => (value == null || value.trim().isEmpty) ? 'Select $label' : null,
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime(1990, 1),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => SuccessDialog(
          onOkPressed: () {
            Navigator.of(context).pop();
           Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
        ),
      );
    }
  }


  @override
  void dispose() {
    for (final controller in [
      _nameController,
      _ageController,
      _occupationController,
      _samajController,
      _qualificationController,
      _birthDateController,
      _bloodGroupController,
      _dutyController,
      _emailController,
      _phoneController,
      _altPhoneController,
      _landlineController,
      _socialLinkController,
      _flatController,
      _buildingController,
      _streetController,
      _landmarkController,
      _cityController,
      _districtController,
      _stateController,
      _nativeCityController,
      _nativeStateController,
      _countryController,
      _pincodeController,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }
}

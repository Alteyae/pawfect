import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdoptionForm(),
    );
  }
}

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({super.key});

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Variables
  String _petType = '';
  DateTime? _birthdate;
  final String _status = '';
  String _Q4 = '';
  String _Q3 = '';
  String _Q2 = '';
  String _occupation = '';
  String _socialMediaLink = '';
  String _fullName = '';
  String _email = '';
  String _phone = '';
  String _address = '';
  String _currentPets = '';
  String _petHistory = '';
  DateTime? _preferredInterviewDateTime;
  String _meetAndGreet = '';
  bool _agreesToTerms = false;
  bool _homeVisitPermission = false;

  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_currentPage < 2) {
        // Move to the next page
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        setState(() {
          _currentPage++;
        });
      } else {
        // Process and submit the form data
        // You can add your submission logic here
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Process and store the form data (e.g., send to a server)
      // You can implement data storage and submission logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption Form'),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentPage + 1) / 3, // Adjust for the number of pages
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable manual page swiping
              children: [
                buildPageOne(),
                buildPageTwo(),
                buildPageThree(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageOne() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Contact Information', style: TextStyle(fontSize: 18)),
            // Full Name
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              onSaved: (value) {
                _fullName = value!;
              },
            ),
            // Email Address
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email Address'),
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),
            // Phone Number
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: (value) {
                _phone = value!;
              },
            ),
            // Address
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onSaved: (value) {
                _address = value!;
              },
            ),
            // Birthdate
            TextFormField(
              decoration: const InputDecoration(labelText: 'Birthdate'),
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null && selectedDate != _birthdate) {
                  setState(() {
                    _birthdate = selectedDate;
                  });
                }
              },
              controller: TextEditingController(
                text: _birthdate != null
                    ? "${_birthdate!.day}/${_birthdate!.month}/${_birthdate!.year}"
                    : '',
              ),
            ),
            // Occupation
            TextFormField(
              decoration: const InputDecoration(labelText: 'Occupation'),
              onSaved: (value) {
                _occupation = value!;
              },
            ),
            // Social Media Link
            TextFormField(
              decoration: const InputDecoration(labelText: 'Social Media Link'),
              onSaved: (value) {
                _socialMediaLink = value!;
              },
            ),

            const SizedBox(height: 16),

            const Text('Alternate Contact Information',
                style: TextStyle(fontSize: 18)),
            const Text(
                'If the applicant is a minor, a parent or a guardian must be the alternate contact and co-sign the application.',
                style: TextStyle(fontSize: 10)),
            //Alternate Contact Info Name
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
              onSaved: (value) {
                _fullName = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Full Name'),
              onSaved: (value) {
                _fullName = value!;
              },
            ),
            //Alternate Contact Info Phone Number
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              onSaved: (value) {
                _fullName = value!;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _nextPage,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageTwo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What are you looking to adopt?',
                style: TextStyle(fontSize: 18)),
            // Radio buttons for pet type (cat, dog, both)
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'cat',
                      groupValue: _petType,
                      onChanged: (value) {
                        setState(() {
                          _petType = value!;
                        });
                      },
                    ),
                    const Text('Cat'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'dog',
                      groupValue: _petType,
                      onChanged: (value) {
                        setState(() {
                          _petType = value!;
                        });
                      },
                    ),
                    const Text('Dog'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'both',
                      groupValue: _petType,
                      onChanged: (value) {
                        setState(() {
                          _petType = value!;
                        });
                      },
                    ),
                    const Text('Both'),
                  ],
                ),
              ],
            ),
//q2
            const Text('Are you appplying to adopt a shelter animal?',
                style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _Q2,
                      onChanged: (value) {
                        setState(() {
                          _Q2 = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'No',
                      groupValue: _Q2,
                      onChanged: (value) {
                        setState(() {
                          _Q2 = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),

//q3
            const Text('What type of building do you live in?',
                style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'House',
                      groupValue: _Q3,
                      onChanged: (value) {
                        setState(() {
                          _Q3 = value!;
                        });
                      },
                    ),
                    const Text('House'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Condo',
                      groupValue: _Q3,
                      onChanged: (value) {
                        setState(() {
                          _Q3 = value!;
                        });
                      },
                    ),
                    const Text('Condo'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Apartment',
                      groupValue: _Q3,
                      onChanged: (value) {
                        setState(() {
                          _Q3 = value!;
                        });
                      },
                    ),
                    const Text('Apartment'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Other',
                      groupValue: _Q3,
                      onChanged: (value) {
                        setState(() {
                          _Q3 = value!;
                        });
                      },
                    ),
                    const Text('Other'),
                  ],
                ),
              ],
            ),
            //q4
            const Text('Do you rent?', style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _Q4,
                      onChanged: (value) {
                        setState(() {
                          _Q4 = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'No',
                      groupValue: _Q4,
                      onChanged: (value) {
                        setState(() {
                          _Q4 = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            //q5
            const Text('Do you have other pets?',
                style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _currentPets,
                      onChanged: (value) {
                        setState(() {
                          _currentPets = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'No',
                      groupValue: _currentPets,
                      onChanged: (value) {
                        setState(() {
                          _currentPets = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            //q6
            const Text('Have you had pets in the past?',
                style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _petHistory,
                      onChanged: (value) {
                        setState(() {
                          _petHistory = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'No',
                      groupValue: _petHistory,
                      onChanged: (value) {
                        setState(() {
                          _petHistory = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to Page One
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 16), // Add some spacing
                ElevatedButton(
                  onPressed: _nextPage,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageThree() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preferred date and time for zoom interview',
                style: TextStyle(fontSize: 18)),
            // Date and Time Picker
            TextFormField(
              onTap: () async {
                final selectedDateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (selectedDateTime != null) {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                  );
                  if (selectedTime != null) {
                    setState(() {
                      _preferredInterviewDateTime = DateTime(
                        selectedDateTime.year,
                        selectedDateTime.month,
                        selectedDateTime.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  }
                }
              },
              controller: TextEditingController(
                text: _preferredInterviewDateTime != null
                    ? DateFormat.yMd()
                        .add_jm()
                        .format(_preferredInterviewDateTime!)
                    : '',
              ),
            ),

            const SizedBox(height: 16),

            const Text(
                'Will you be able to visit the shelter for the meet-and-greet?',
                style: TextStyle(fontSize: 18)),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Yes',
                      groupValue: _meetAndGreet,
                      onChanged: (value) {
                        setState(() {
                          _meetAndGreet = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'No',
                      groupValue: _meetAndGreet,
                      onChanged: (value) {
                        setState(() {
                          _meetAndGreet = value!;
                        });
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 20,
              color: Colors.black,
            ),
            const SizedBox(height: 20),

            const Text('TERMS AND AGREEMENT', style: TextStyle(fontSize: 18)),

            CheckboxListTile(
              title: const Text('I agree to abide by the adoption policies'),
              value: _agreesToTerms,
              onChanged: (value) {
                setState(() {
                  _agreesToTerms = value!;
                });
              },
            ),
            // Home Visit Permission
            CheckboxListTile(
              title: const Text('I give permission for a home visit'),
              value: _homeVisitPermission,
              onChanged: (value) {
                setState(() {
                  _homeVisitPermission = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: _nextPage,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/data/repository/register_repository.dart';
import 'package:form1/ui/Loading.dart';
import 'package:go_router/go_router.dart';
import '../bloc/form_bloc/form_event.dart';
import '../bloc/register_bloc/register_bloc.dart';
import '../bloc/register_bloc/register_event.dart';
import '../bloc/register_bloc/register_state.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
          registerRepository:context.read<RegisterRepository>()),
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.formStatus is FormSuccess) {
              final success = state.formStatus as FormSuccess;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(success.message)),
              );
              context.go('/main');
            } else if (state.formStatus is FormFailed) {
              final failure = state.formStatus as FormFailed;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(failure.message)),
              );
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              if(state.formStatus==FormLoading()){
                return LoadingScreen();
              }
              return SlotLayout(config: {
                Breakpoints.small: SlotLayout.from(
                  key: Key('mobile'),
                  builder: (context) => RegisterMobileView(),
                ),
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: Key('laptop'),
                  builder: (context) => RegisterLaptopView(),
                ),
              });
            },
          ),
        ),
      ),
    );

  }
}


class RegisterMobileView extends StatefulWidget {
  const RegisterMobileView({super.key});

  @override
  State<RegisterMobileView> createState() => _RegisterMobileViewState();
}

class _RegisterMobileViewState extends State<RegisterMobileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Asset/image/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom:0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: RegistrationForm(),
              ),
            ),
          ),
        ],
      ),
    );

  }
}


class RegisterLaptopView extends StatefulWidget {
  const RegisterLaptopView({super.key});

  @override
  State<RegisterLaptopView> createState() => _RegisterLaptopViewState();
}

class _RegisterLaptopViewState extends State<RegisterLaptopView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.height*0.1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: Colors.grey
            )
          ]
        ),
        child: Row(
          children: [
            // Left Side: Image
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Asset/image/img.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Right Side: Registration Form with padding and scroll
            Expanded(
              flex: 5,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.all( MediaQuery.of(context).size.height*0.05),
                      child: const RegistrationForm()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterBloc>().state;
    return SingleChildScrollView(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:20),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 30, color: Colors.black),
            ),
            SizedBox(height:10),
            Center(
              child: Text(
                'Registration',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Name',
                errorText: state.isNameValid ? null : 'Name is required',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => context.read<RegisterBloc>().add(NameChanged(name: value)),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Email',
                errorText: state.isEmailValid ? null : 'Enter a valid email',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => context.read<RegisterBloc>().add(EmailChanged(email: value)),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone Number',
                errorText: state.isPhoneValid ? null : 'Enter a 10-digit phone number',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) => context.read<RegisterBloc>().add(PhoneChanged(phoneNumber: value)),
            ),

            SizedBox(height: 10),
            TextFormField(

              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today_rounded),
                labelText: 'Date of Birth',
                errorText: state.isDobValid ? null : 'DOB is required',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              controller: TextEditingController(text: state.dob), // Assume dob is a String in your state
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  final formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  context.read<RegisterBloc>().add(DobChanged(dob: formattedDate));
                }
              },
            ),


            SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 12,
                    ),
                    hint: Text(
                      'Select Street',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    value: state.street.isNotEmpty ? state.street : null,
                    items: ['Hopes College', 'Singanalore', 'Peelamadu']
                        .map((street) =>
                        DropdownMenuItem(value: street, child: Text(street)))
                        .toList(),
                    onChanged: (value) {
                      context.read<RegisterBloc>().add(
                        StreetChange(street: value!),
                      );
                    },
                  ),
                ),
                if (!state.isStreetValid)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Text(
                      'Street is required',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 10),

// State Dropdown with Validation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    value: state.state.isNotEmpty ? state.state : null,
                    hint: Text(
                      'Select State',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    buttonStyleData: ButtonStyleData(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.blue[100],
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      elevation: 8,
                    ),
                    items: ['Tamil Nadu', 'Kerala', 'Karnataka']
                        .map((state) => DropdownMenuItem(
                      value: state,
                      child: Text(state),
                    ))
                        .toList(),
                    onChanged: (value) => context.read<RegisterBloc>().add(
                      StateChange(state: value!),
                    ),
                  ),
                ),
                if (!state.isStateValid)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Text(
                      'State is required',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 10),

// Country Dropdown with Validation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    value: state.country.isNotEmpty ? state.country : null,
                    hint: Text(
                      'Country',
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    items: ['India', 'Saudi Arabia', 'USA']
                        .map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    ))
                        .toList(),
                    onChanged: (value) => context.read<RegisterBloc>().add(
                      CountryChanged(country: value!),
                    ),
                  ),
                ),
                if (!state.isCountryValid)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                    child: Text(
                      'Country is required',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 children: [
                   Icon(Icons.male),
                   SizedBox(height: 10,),
                   Text('Gender', style: TextStyle(fontSize: 16)),
                 ],
               ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: state.gender,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(GenderChanged(gender: value!));
                          },
                        ),
                        Text('Male'),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: state.gender,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(GenderChanged(gender: value!));
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Other',
                          groupValue: state.gender,
                          onChanged: (value) {
                            context.read<RegisterBloc>().add(GenderChanged(gender: value!));
                          },
                        ),
                        Text('Other'),
                      ],
                    ),
                  ],
                ),
                if (!state.isGenderValid)
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4),
                    child: Text(
                      'Gender is required',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.info_rounded),
                labelText: 'About',
                errorText: state.isAboutValid ? null : 'This field is required',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: null,
              minLines: 3,
              onChanged: (value) => context.read<RegisterBloc>().add(AboutChanged(about: value)),
            ),
            SizedBox(height: 10),
            // Password Field
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                errorText: state.isPasswordValid ? null : 'Password must be at least 6 characters',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: !_isPasswordVisible,
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(PasswordChanged(password: value)),
            ),

            SizedBox(height: 10),

// Confirm Password Field
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Confirm Password',
                errorText: state.isConfirmPasswordValid ? null : 'Passwords do not match',
                filled: true,
                fillColor: Colors.blue[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: !_isConfirmPasswordVisible,
              onChanged: (value) => context
                  .read<RegisterBloc>()
                  .add(ConfirmPasswordChanged(confirmPassword: value)),
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: state.termsAccepted == 'true',
                  onChanged: (value) {
                    context.read<RegisterBloc>().add(
                      ConditionChanged(accepted: value == true ? 'true' : 'false'),
                    );
                  },
                ),
                const Text('Accept terms and conditions'),
              ],
            ),
            if (!state.isTermsAccepted)
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You must accept the terms',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor:  Colors.blue[100],
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {
                context.read<RegisterBloc>().add(RegisterSubmit());
              },
              child: Container(
                child: Text('Register',style:TextStyle(
                  color: Colors.black,
                )),
              )
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}



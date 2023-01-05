import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sqflite_windows/src/share/models/client_model.dart';

class EditClientPage extends StatefulWidget {
  final ClientModel? client;
  const EditClientPage({super.key, this.client});

  @override
  State<EditClientPage> createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ClientModel? client = ModalRoute.of(context)!.settings.arguments as ClientModel?;
    if (client != null) {
      _nameController.text = client.name;
      _cpfController.text = client.cpf;
      _phoneController.text = client.phone;
      _addressController.text = client.address;
      _districtController.text = client.district;
      _cepController.text = client.cep;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome do cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o CPF do cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o telefone do cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Endereço, número',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o endereço do cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _districtController,
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o bairro do cliente';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cepController,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o CEP do cliente';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Validado com sucesso')));
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

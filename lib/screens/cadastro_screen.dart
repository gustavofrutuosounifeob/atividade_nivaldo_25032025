import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  bool mostrarRequisitos = false;

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('FLUXO LIVRE', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PRIMEIRO CADASTRO", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              _buildTextField("Nome Completo", nomeController),
              _buildTextField("E-mail", emailController),
              _buildTextField("CPF", cpfController),
              _buildPasswordField("Senha", senhaController),
              _buildPasswordField("Confirmar Senha", confirmarSenhaController),
              if (mostrarRequisitos) _buildPasswordRequirements(),
              SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    _buildButton("Cadastrar", Colors.blueGrey[900]!, _cadastrar),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancelar", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.black), // Define a cor do texto como preto
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black), // Rótulo do campo em preto
          filled: true, // Habilita a cor de fundo
          fillColor: Colors.white, // Define a cor de fundo como branca
          border: OutlineInputBorder(),
        ),
        validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        style: TextStyle(color: Colors.black), // Define a cor do texto como preto
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black), // Rótulo do campo em preto
          filled: true, // Habilita a cor de fundo
          fillColor: Colors.white, // Define a cor de fundo como branca
          border: OutlineInputBorder(),
        ),
        onTap: () {
          if (label == "Senha") {
            setState(() {
              mostrarRequisitos = true;
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty) return 'Campo obrigatório';
          if (label == "Confirmar Senha" && value != senhaController.text) {
            return 'As senhas não coincidem';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordRequirements() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("A senha deve conter:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text("• Letra maiúscula", style: TextStyle(color: Colors.black)),
          Text("• Número", style: TextStyle(color: Colors.black)),
          Text("• Caracteres especiais (!@#%)", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

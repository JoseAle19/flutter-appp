// ignore: file_names
import 'package:appproyecto2/widgets/MyDropDownButton.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: implementation_imports

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombre = TextEditingController();

  String? selectedValue;

  Future<void> _guardarDatos() async {
    var url = 'http://10.0.2.2:3001/guardar-datos';
    var datos = {
      'nombre': _nombre.text,
    };

    var response = await http.post(
      Uri.parse(url),
      body: datos,
    );

    if (response.statusCode == 200) {
      print('Datos guardados exitosamente');
      // Realizar acciones adicionales después de guardar los datos
    } else {
      print(
          'Error al guardar los datos. Código de estado: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}";
    /*  String formattedDate = DateFormat('yyyy-MM-dd').format(now); */
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inspección Técnica'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Text(
                    'Fecha de Inspección: $formattedDate',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Coordenadas',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'X',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Y',
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TX TELEVISIÓN',
                    ),
                    MyDropDowButton()
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'MODULADOR TV',
                    ),
                    MyDropDowButton()
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('TX RADIO FM'), MyDropDowButton()],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('TRANSMISOR HF'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('ANTENA TV'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ANTENA FM',
                    ),
                    MyDropDowButton()
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('RECEPTOR SATELITAL'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('ANTENA PARABOLICA'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('POZO  A TIERRA'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('PARA RAYOS'), MyDropDowButton()],
                ),
                const SizedBox(height: 40.0, width: 30),
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    // color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Tomar Foto'),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Text('Foto'),
                          ),
                        )
                      ],
                    )),
                // Boton de guardar
                const SizedBox(height: 40.0, width: 30),
                ElevatedButton(
                  onPressed: () {
                    // print('Mandar los datos ala api');
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


    // TextFormField(
    //                 controller: _nombre,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Nombre del Beneficiario'),
    //                 validator: (value) {
    //                   if (value!.isEmpty) {
    //                     return 'Por favor ingresa el nombre';
    //                   }
    //                   return null;
    //                 },
    //               ),
    //               DropdownButtonHideUnderline(
    //                 child: DropdownButton(
    //                   value: "Quincenal",
    //                   items: const [
    //                     DropdownMenuItem(
    //                         value: "Quincenal", child: Text("Quincenal")),
    //                     DropdownMenuItem(
    //                       value: "Mensual",
    //                       child: Text("Mensual"),
    //                     )
    //                   ],
    //                   onChanged: (value) {},
    //                 ),
    //               ),
    //               const SizedBox(height: 40.0, width: 30),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   if (_formKey.currentState!.validate()) {
    //                     _guardarDatos();
    //                   }
    //                 },
    //                 child: const Text('Guardar'),
    //               ),
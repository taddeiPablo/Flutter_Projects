// libreriamos que necesitamos para trabajar
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

// aqui creamos la clase ImcResultScreen que utilizaremos como una screen
// o view de nuestra app.
class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  // aqui creamoss el constructor de la clase ImcResultScreen
  // y le pasamos la key como parametro.
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  // aqui sobreescribimos el metodo build que nos permitira
  // construir la vista de la pantalla.
  @override
  Widget build(BuildContext context) {
    // aqui realizamos el calculo del indice de masa corporal
    double calcImc = weight / ((height / 100) * (height / 100));
    // aqui devolvemos un Scaffold que es el widget.
    return Scaffold(
      // aqui determinamos una funcion en la cual construimos el
      // AppBar de la pantalla. esto lo hago para separar un poco el codigo
      appBar: toolBar(),
      backgroundColor: AppColors.primary,
      // aqui hago lo mismo quqe en el AppBar pero en este caso
      // construyo el body de la pantalla.
      // esto lo hago para separar un poco el codigo y hacerlo mas legible.s
      body: contentBody(context, calcImc),
    );
  }

  // aqui creo una funcion que me permitira construir el body de la pantalla.
  // lo hago de esta manera para separar un poco el codigo y hacerlo mas legible.
  // ademas le paso como parametro el context y el imc que es el resultado
  Padding contentBody(BuildContext context, double imc) {
    // aqui creamos la view del body de la pantalla.
    // en este caso se retorna un Padding que contiene una columna.
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Tu resultado :", style: AppTextStyles.titleResult),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 22,
                  bottom: 22,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTypeByImc(imc),
                      style: TextStyle(
                        color: getColorByImc(imc),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //"${weight / ((height / 100) * (height / 100))}"
                    Text(
                      imc.toStringAsFixed(2),
                      style: AppTextStyles.resultIMC,
                    ),
                    Text(
                      getDescriptionByImc(imc),
                      style: AppTextStyles.description,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.quinary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Finalizar",
                  style: AppTextStyles.genderTitleSeleted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // aqui funcion en la cual armo la toolBar de la pantalla
  AppBar toolBar() {
    return AppBar(
      title: const Text('Resultado'),
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.quaternary,
    );
  }

  // Aqui armo la funcion por la cual en base al valor calculado
  // del imc se le asigna un color a la pantalla.
  Color getColorByImc(double imc) {
    return switch (imc) {
      < 18.5 => AppColors.imcBlue,
      < 24.9 => AppColors.imcGreen,
      < 29.9 => AppColors.imcOrange,
      _ => AppColors.imcRed,
    };
  }

  // aqui armo la funcion por la cual en base al valor calculado
  // del imc se le asigna un tipo a la pantalla.
  String getTypeByImc(double imc) {
    return switch (imc) {
      < 18.5 => "Bajo peso",
      < 24.9 => "Normal",
      < 29.9 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  // aqui armo la funcion por la cual en base al valor calculado
  // del imc se le asigna una descripcion a la pantalla.
  String getDescriptionByImc(double imc) {
    return switch (imc) {
      < 18.5 => "Debes comer más",
      < 24.9 => "Estás en tu peso ideal",
      < 29.9 => "Debes hacer ejercicio",
      _ => "Debes ir al médico",
    };
  }
}

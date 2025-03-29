// aqui las librerias necesarias para armar este wdiget
import 'package:flutter/material.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/app_text_styles.dart';

// aqui creo esta clase para definir el widget que voy a crear
// y le digo que es un StatefulWidget porque el valor va a cambiar.
// la gran diferencia en este widget que es creado de manera generica para
// que el mismo pueda ser utilizado en diferente funcionalidades
// por ejemplo para el caso de peso y edad
class NumberSelector extends StatefulWidget {
  // aqui variables definidas para el widget
  final String title;
  final int value;
  // funcion por la cual vamos a incrementar el valor
  final Function() onIncrement;
  // funcion por la cual vamos a restar el valor
  final Function() onDecrement;
  // aqui constructor el cual le definimos los parametros que obligatoriamente
  // tenemos que pasarle al widget para que funcione.
  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  //
  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

// aqui declaro la clase privada que va a manejar el estado del widget
// esta clase es la que va a manejar el estado del widget y va a ser la encargada
// de construir el widget.
class _NumberSelectorState extends State<NumberSelector> {
  // aqui construyo el widget y lo retorno
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.quinary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(widget.title, style: AppTextStyles.genderTitleSeleted),
            Text(
              // aqui utilizo ell valor pasado por parametro
              widget.value.toString(),
              style: AppTextStyles.genderTitleSeleted,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // boton de restar
                FloatingActionButton(
                  onPressed: () {
                    // aqui llamo a la funcion que le pase por parametro
                    // con esta vamos a realizar la resta del valor
                    widget.onDecrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.tertiary,
                  child: Icon(Icons.remove, color: AppColors.quaternary),
                ),
                SizedBox(width: 16),
                // boton de sumar
                FloatingActionButton(
                  onPressed: () {
                    // aqui llamo a la funcion que le pase por parametro
                    // con esta vamos a realizar la suma del valor
                    widget.onIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.tertiary,
                  child: Icon(Icons.add, color: AppColors.quaternary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

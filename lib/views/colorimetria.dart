import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colorimetria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Colorimetria"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(174, 217, 224, 1),
          fontFamily: "Pacifico",
          fontSize: 20,
        ),
        backgroundColor: Color.fromRGBO(250, 243, 221, 1),
      ),
      backgroundColor: Color.fromRGBO(250, 243, 221, 1),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            child: Image.asset("Assets/colorimetria.jpg"),
          ),
          const SizedBox(height: 20),
          const Text(
            "El color es una sensación “subjetiva” experimentada por un observador, es la reacción a un estímulo físico. Para que exista color debe haber tres elementos: una fuente de iluminación, un objeto coloreado y un observador.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "La colorimetría es la ciencia que estudia la evaluación y cuantificación del color, en el humano se refiere a la percepción física del color (evaluación visual), mientras que instrumentalmente nos referimos a la cuantificación o medición de color utilizando un instrumento de medición llamado espectrocolorímetro (evaluación instrumental).",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Al ser el color una sensación subjetiva y su interpretación estar en función de la iluminación, material, formas, acabado y presentación de un producto, lo que realmente evaluamos es la apariencia de color, de ahí las frases como: “lo veo rojo subido”, “tiene un color muy vivo”, “se me figura como el de ayer pero con menos fuerza”; frases coloquiales muy comunes en las industrias donde la característica “color” es un control de calidad. Precisamente para eliminar estas frases coloquiales, la colorimetría ha definido los atributos del color: Tono (rojo, verde, amarillo, etc.), Saturación (cromaticidad) y Caridad (qué tan claro u obscuro es un tono). La CIE (Comission Internationale de l´Eclairage) nombre francés de la Comisión Internacional de la Iluminación, desde 1931 ha desarrollado diferentes sistemas para la cuantificación y especificación de estímulos cromáticos en función de: valores triestímulos (X, Y y Z), un observador estándar y diferentes fuentes de iluminación.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

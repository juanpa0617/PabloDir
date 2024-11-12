import 'package:flutter/material.dart';


class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5, bottom: 5),
      child: const Text(
        "Iso. El agente chino Iso es un neutralizador a sueldo que entra en estado de fluidez para desmantelar a sus oponentes. Reconfigura la energía ambiental para convertirla en una protección a prueba de balas y avanza con determinación hacia su próximo duelo a muerte.",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}



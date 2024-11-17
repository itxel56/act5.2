import 'dart:io';

void main() {
  var platillos = {
    'Pasta': 30,
    'Omelet': 50,
    'Chilaquiles': 50,
    'Milanesa de pollo': 60,
    'Lasania': 40
  };

  var opc = 0;
  var inicio = true;
  while (inicio) {
    print(
        "--- Opciones del menú ---\n1. Menú de platillos\n2. Buscar platillo\n3. Modificar precio\n4. Salir");
    stdout.write("Elija una opción: ");
    opc = int.parse(stdin.readLineSync()!);

    switch (opc) {
      case 1:
        print("--- Menú de platillos ---\nPlatillo:Precio");
        mostrarPlatillos(platillos);
        break;
      case 2:
        print("--- Buscar un platillo ---");
        stdout.write("Escriba el nombre del platillo: ");
        String nomPlatillo = stdin.readLineSync()!;
        buscarPlatillo(nomPlatillo, platillos);
        break;
      case 3:
        print("--- Modificar precio de un platillo ---");
        stdout.write("Ingrese el nombre del platillo: ");
        String platilloMod = stdin.readLineSync()!;
        stdout.write("Ingrese el nuevo precio: ");
        int nuevoPrecio = int.parse(stdin.readLineSync()!);
        modificarPrecio(platilloMod, nuevoPrecio, platillos);
        break;
      case 4:
        print("Saliendo...");
        inicio = false;
    }
  }
}

void mostrarPlatillos(Map<String, int> platillos) {
  platillos.forEach((key, value) {
    print("$key : $value");
  });
}

void buscarPlatillo(String nomPlatillo, Map<String, int> platillos) {
  if (platillos.containsKey(nomPlatillo)) {
    print(
        "El platillo que busca es:\n$nomPlatillo : ${platillos[nomPlatillo]}");
  } else {
    print("No se encontró el platillo $nomPlatillo");
  }
}

void modificarPrecio(
    String nomPlatillo, int nuevoPrecio, Map<String, int> platillos) {
  if (platillos.containsKey(nomPlatillo)) {
    print(
        "El platillo $nomPlatillo actualmente tiene el precio ${platillos[nomPlatillo]}\nModificando precio...");
    platillos[nomPlatillo] = nuevoPrecio;
    print("Modificado con éxito");
    print(
        "El precio nuevo del platillo $nomPlatillo es ${platillos[nomPlatillo]}");
  } else {
    print("No se encontró el platillo $nomPlatillo");
  }
}

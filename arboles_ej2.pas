program arboles_ej2;

uses uBinarySearchTree;

var
  a, b: tBinarySearchTree;

// Crea un árbol binario de búsqueda con los siguientes valores:
//                10
//              /    \
//             5      15
//            / \     / \
//           3   7   16  20
procedure crear_arbol1(var a: tBinarySearchTree);
begin
    initialize(a);
    add(a, 10);
    add(a, 5);
    add(a, 15);
    add(a, 3);
    add(a, 7);
    add(a, 20);
    add(a, 16);
end;

// Crea un árbol binario de búsqueda con los siguientes valores:
//               8
//              / \
//             4   12
//            / \    \
//           2   6    14
//          /         / \
//         1        13  16
procedure crear_arbol2(var b: tBinarySearchTree);
begin
  initialize(b);
    add(b, 8);
    add(b, 4);
    add(b, 12);
    add(b, 2);
    add(b, 6);
    add(b, 14);
    add(b, 1);
    add(b, 13);
    add(b, 16);

end;

// Test para el ejercicio 2.1
procedure test_mismos_nodos_izq_y_der(a: tBinarySearchTree);
var
  resultado: boolean;
begin
  resultado := mismos_nodos_izq_y_der(a);
  if resultado then
    writeln('Ejercicio 2.1: El árbol tiene la misma cantidad de nodos en los subárboles izquierdo y derecho.')
  else
    writeln('Ejercicio 2.1: El árbol NO tiene la misma cantidad de nodos en los subárboles izquierdo y derecho.');
end;

// Test para el ejercicio 2.2
procedure test_niveles_completos(a: tBinarySearchTree);
var
  resultado: boolean;
begin
  resultado := niveles_completos(a);
  if resultado then
    writeln('Ejercicio 2.2: El árbol tiene todos sus niveles completos.')
  else
    writeln('Ejercicio 2.2: El árbol NO tiene todos sus niveles completos.');
end;

// Test para el ejercicio 2.3
procedure test_add_tree(var a: tBinarySearchTree; b: tBinarySearchTree);
begin
  writeln('Ejercicio 2.3: Añadiendo los nodos del árbol b al árbol a...');
  add_tree(a, b);
  writeln('Recorrido en inorden del árbol resultante:');
  inorder(a);
end;

begin
  // Crear los árboles
  crear_arbol1(b);
  crear_arbol2(a);

  // Test para el ejercicio 2.1
  test_mismos_nodos_izq_y_der(a);

  // Test para el ejercicio 2.2
  test_niveles_completos(a);

  // Test para el ejercicio 2.3
  test_add_tree(a, b);

end.
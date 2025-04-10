program arboles_ej3;

uses uBinarySearchTree;

var
  a: tBinarySearchTree;

// Crea un árbol binario de búsqueda con los siguientes valores y multiplicidades:
//                10 (2)
//              /      \
//           5 (1)    15 (1)
//          /   \         \
//       3 (1)  7 (1)    20 (1)
procedure crear_arbol(var a: tBinarySearchTree);
begin
  initialize(a);
  add(a, 10);
  add(a, 5);
  add(a, 15);
  add(a, 3);
  add(a, 7);
  add(a, 20);
  add(a, 10); // Incrementa la multiplicidad de 10
end;

// Test para el procedimiento `add` y la multiplicidad
procedure test_add_multiplicidad(var a: tBinarySearchTree);
begin
  writeln('Ejercicio 3.1 y 3.2: Probando add y multiplicidad...');
  writeln('Recorrido en inorden del árbol:');
  inorder(a);
  writeln('   Multiplicidad del nodo con valor 10: ', get_multiplicidad(a, 10));
  writeln('   Multiplicidad del nodo con valor 5: ', get_multiplicidad(a, 5));
  writeln('   Multiplicidad del nodo con valor 15: ', get_multiplicidad(a, 15));
end;

// Test para el procedimiento `remove` con multiplicidad
procedure test_remove_multiplicidad(var a: tBinarySearchTree);
begin
  writeln('Ejercicio 3.3: Probando remove con multiplicidad...');
  writeln('Eliminando un nodo con valor 10 (decrementa multiplicidad):');
  remove(a, 10);
  writeln('Multiplicidad del nodo con valor 10 después de eliminar: ', get_multiplicidad(a, 10));
  writeln('Eliminando nuevamente el nodo con valor 10 (debería eliminar el nodo):');
  remove(a, 10);
  writeln('Multiplicidad del nodo con valor 10 después de eliminar completamente: ', get_multiplicidad(a, 10));
  writeln('Recorrido en inorden del árbol resultante:');
  inorder(a);
end;

begin
  // Crear el árbol
  crear_arbol(a);

  // Test para `add` y multiplicidad
  test_add_multiplicidad(a);

  // Test para `remove` con multiplicidad
  test_remove_multiplicidad(a);
end.
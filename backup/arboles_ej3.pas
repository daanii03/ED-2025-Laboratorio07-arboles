program OrdenarPilaTest;

uses
  uPilaChar, uBinaryCharSearchTree,Windows;

var
  pila: tPilaChars;
  elemento: char;

{ Ejercicio 3 }
procedure mostrar_pila_en_orden(var p: tPilaChars);
var
   a:tBinarySearchTree;
   paux:tPilaChars;
begin
   uBinaryCharSearchTree.initialize(a);
   uPilaChar.initialize(paux);
   while not isEmpty(p) do
   begin
        push(paux,peek(p));
        pop(p)
   end;
   while not isEmpty(paux) do
   begin
        push(p);
        add(a,peek(paux));
        pop(paux);
   end;
   inorder(a);
end;


begin
  // Inicializar la pila
  SetConsoleOutputCP(65001);
  uPilaChar.initialize(pila);

  // Agregar elementos desordenados a la pila
  push(pila, 'd');
  push(pila, 'a');
  push(pila, 'c');
  push(pila, 'b');

  // Mostrar pila antes de ordenar
  writeln('Pila antes de ordenar: ', toString(pila));

  mostrar_pila_en_orden(pila);

  // Mostrar pila después de ordenar
  writeln('Pila después de ordenar: ', toString(pila));
  readln;
end.

program OrdenarPilaTest;

uses
  uPilaChar, uBinaryCharSearchTree;

var
  pila: tPilaChars;
  elemento: char;

{ Ejercicio 3 }
procedure mostrar_pila_en_orden(var p: tPilaChars);
begin
  writeln('No implementado');
end;


begin
  // Inicializar la pila
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
end.
program OrdenarPilaTest;

uses
  uPilaChar, uBinaryCharSearchTree;

var
  pila: tPilaChars;
  elemento: char;

begin
  // Inicializar la pila
  uPilaChar.initialize(pila);

  // Agregar elementos desordenados a la pila
  writeln('Agregando elementos desordenados a la pila...');
  push(pila, 'd');
  push(pila, 'a');
  push(pila, 'c');
  push(pila, 'b');

  // Mostrar pila antes de ordenar
  writeln('Pila antes de ordenar: ', toString(pila));

  // Ordenar la pila
  ordenar_pila(pila);

  // Mostrar pila después de ordenar
  writeln('Pila después de ordenar: ', toString(pila));

  writeln('Peek del tope de la pila: ', peek(pila));
end.
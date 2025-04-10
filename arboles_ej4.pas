program TestTreeMap;

uses
    uTreeMap, uListaEnlazadaSimple;

var
    tree: tTreeMap;
    lista: tListaSimple;
    key: integer;

begin
    // Inicializar el árbol
    uTreeMap.initialize(tree);
    writeln('Árbol inicializado.');

    // Comprobar si el árbol está vacío
    if uTreeMap.is_empty(tree) then
        writeln('El árbol está vacío.')
    else
        writeln('El árbol no está vacío.');

    // Insertar elementos en el árbol
    writeln('Insertando elementos...');
    add(tree, 'hola');  // Clave 4
    add(tree, 'casa');  // Clave 4
    add(tree, 'adios'); // Clave 5
    add(tree, 'sol');   // Clave 3
    add(tree, 'luz');   // Clave 3
    writeln('Elementos insertados.');

    // Recorridos del árbol
    writeln('Recorrido en inorden:');
    inorder(tree);

    // Comprobar si una clave está en el árbol
    key := 4;
    if contains(tree, key) then
        writeln('La clave ', key, ' está en el árbol.')
    else
        writeln('La clave ', key, ' no está en el árbol.');

    // Obtener los valores asociados a una clave
    get(tree, 4, lista);
    writeln('Valores asociados a la clave 4:');
    writeln('    ', uListaEnlazadaSimple.to_string(lista));

    // Añadir más valores a una clave existente
    add(tree, 'hola'); // Clave 4
    writeln('Valores asociados a la clave 4 después de añadir "hola" nuevamente:');
    get(tree, 4, lista);
    writeln('    ', uListaEnlazadaSimple.to_string(lista));

    // Eliminar un valor específico de una clave
    writeln('Eliminando el valor "casa" de la clave 4...');
    remove_value(tree, 'casa');
    get(tree, 4, lista);
    writeln('Valores asociados a la clave 4 después de eliminar "casa":');
    writeln('    ', uListaEnlazadaSimple.to_string(lista));

    // Eliminar todos los valores de una clave
    writeln('Eliminando todos los valores de la clave 4...');
    remove_value(tree, 'hola');
    remove_value(tree, 'hola'); // Segunda ocurrencia de "hola"
    get(tree, 4, lista);
    if contains(tree, 4) then
        writeln('La clave 4 no se ha eliminado del árbol.')
    else
        writeln('La clave 4 se ha eliminado del árbol.');

    // Eliminar un nodo completo
    writeln('Eliminando la clave 3...');
    remove(tree, 3);
    if contains(tree, 3) then
        writeln('La clave 3 no se ha eliminado del árbol.')
    else
        writeln('La clave 3 se ha eliminado del árbol.');

    // Recorrido en inorden después de las eliminaciones
    writeln('Recorrido en inorden después de las eliminaciones:');
    inorder(tree);

    // Comprobar si el árbol está vacío
    if uTreeMap.is_empty(tree) then
        writeln('El árbol está vacío.')
    else
        writeln('El árbol no está vacío.');

    writeln('Programa finalizado.');
end.
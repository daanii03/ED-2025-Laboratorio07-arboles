program TestTreeMap;

uses
    uTreeMap, uListaEnlazadaSimple;

var
    tree: tTreeMap;
    lista: tListaSimple;
    key: integer;
    value: string;

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
    add(tree, 10, 'Valor10');
    add(tree, 5, 'Valor5');
    add(tree, 15, 'Valor15');
    add(tree, 3, 'Valor3');
    add(tree, 7, 'Valor7');
    writeln('Elementos insertados.');

        // Recorridos del árbol
    writeln('Recorrido en inorden:');
    inorder(tree);

    // Comprobar si una clave está en el árbol
    key := 7;
    if contains(tree, key) then
    writeln('La clave ', key, ' está en el árbol.')
    else
    writeln('La clave ', key, ' no está en el árbol.');

    // Añadimos más valores a la clave 7
    add(tree, 7, 'Valor7_1');
    add(tree, 7, 'Valor7_2');
    add(tree, 7, 'Valor7_3');
    writeln('Valores asociados a la clave 7:');
    get(tree, 7, lista);
    writeln('    ', uListaEnlazadaSimple.to_string(lista));

    // Eliminamos todos los valores asociados a la clave 7 y comprobamos que se elimina la clave
    writeln('Eliminando valores asociados a la clave 7...');
    remove_value(tree, 7, 'Valor7_1');
    remove_value(tree, 7, 'Valor7_2');
    remove_value(tree, 7, 'Valor7_3');    
    remove_value(tree, 7, 'Valor7');
    if contains(tree, 7) then
    writeln('La clave 7 no se ha eliminado del árbol.')
    else
    writeln('La clave 7 se ha eliminado del árbol.');



    // Obtener el valor asociado a una clave
    key := 10;
    get(tree, key, lista);
    writeln('Valores asociados a la clave ', key, ':');
    writeln('    ', uListaEnlazadaSimple.to_string(lista));



    // Eliminar un nodo del árbol
    writeln('Eliminando la clave 5...');
    remove(tree, 5);
    if contains(tree, 5) then
    writeln('La clave no se ha eliminado del árbol.')
    else
    writeln('La clave 5 se ha eliminado del árbol.');

    // Recorrido en inorden después de la eliminación
    writeln('Recorrido en inorden después de la eliminación:');
    inorder(tree);

    // Comprobar si el árbol está vacío
    if uTreeMap.is_empty(tree) then
    writeln('El árbol está vacío.')
    else
    writeln('El árbol no está vacío.');

    writeln('Programa finalizado.');
end.
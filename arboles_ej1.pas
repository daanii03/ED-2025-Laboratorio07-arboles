program arboles_ej1;

uses uBinaryTree;

var
    a: tbinaryTree;
    arbol: integer;

// Vamos a crear el siguiente árbol binario:
//               5
//              / \
//             3   8
//            / \   \
//           1   4   9
procedure crear_arbol(var a: tbinaryTree);
begin
    initialize(a);
    add(a, 5);
    add(a, 3);
    add(a, 8);
    add(a, 1);
    add(a, 4);
    add(a, 9);
end;

// Vamos a crear el siguiente árbol binario:
//                10
//              /    \
//             5     20
//            / \    / \
//           3   8 15  25
//          / \
//         1   4
procedure crear_arbol2(var a: tbinaryTree);
begin
    initialize(a);
    add(a, 10);
    add(a, 5);
    add(a, 20);
    add(a, 3);
    add(a, 8);
    add(a, 15);
    add(a, 25);
    add(a, 1);
    add(a, 4);
end;


procedure test_recorridos_1_1(a: tbinaryTree);
begin
    writeln('Preorden:');
    preorder(a);
    writeln('Inorden:');
    inorder(a);
    writeln('Postorden:');
    postorder(a);
    WriteLn('Ejercicio 1.1: Inorden inverso:');
    inorder_inverse(a);
end;

procedure test_profunidad_max_1_2(a: tbinaryTree);
var
    profundidad: integer;
begin
    profundidad := profundidad_max(a);
    WriteLn('Ejercicio 1.2: Profundidad máxima: ', profundidad);
end;

procedure test_contar_nodos_1_3(a: tbinaryTree);
var
    cantidad: integer;
begin
    cantidad := node_count(a);
    WriteLn('Ejercicio 1.3: Cantidad de nodos: ', cantidad);
end;

procedure test_contar_hojas_1_4(a: tbinaryTree);
var
    cantidad: integer;
begin
    cantidad := leafs_count(a);
    WriteLn('Ejercicio 1.4: Cantidad de hojas: ', cantidad);
end;

procedure test_contar_nodos_internos_1_5(a: tbinaryTree);
var
    cantidad: integer;
begin
    cantidad := internal_nodes_count(a);
    WriteLn('Ejercicio 1.5: Cantidad de nodos internos: ', cantidad);
end;

procedure test_es_completo_1_6(a: tbinaryTree);
var
    completo: boolean;
begin
    completo := is_full(a);
    if completo then
        WriteLn('Ejercicio 1.6: El árbol es completo.')
    else
        WriteLn('Ejercicio 1.6: El árbol no es completo.');
end;

procedure test_mayor_hoja_1_7(a: tbinaryTree);
var
    mayor: integer;
begin
    mayor := max_hoja(a);
    WriteLn('Ejercicio 1.7: Mayor hoja: ', mayor);
end;

procedure test_suma_hoja_1_8(a: tbinaryTree);
var
    suma: integer;
begin
    suma := sum_hoja(a);
    WriteLn('Ejercicio 1.8: Suma de hojas: ', suma);
end;


procedure test_num_pares_1_9(a: tbinaryTree);
var
    suma: integer;
begin
    suma := num_pares(a);
    WriteLn('Ejercicio 1.9: Cantidad de nodos pares: ', suma);
end;

procedure test_num_nodos_en_nivel_1_10(a: tbinaryTree; nivel: integer);
var
    cantidad: integer;
begin
    cantidad := num_nodos_en_nivel(a, nivel);
    WriteLn('Ejercicio 1.10: Cantidad de nodos en el nivel ', nivel, ': ', cantidad);
end;


procedure crear_arbol(var a: tbinaryTree; arbol : integer);
begin
    initialize(a);
    if arbol = 1 then
        crear_arbol(a)
    else
        crear_arbol2(a);
end;

begin
    arbol := 2;
    crear_arbol(a, arbol);
    test_recorridos_1_1(a); 
    test_profunidad_max_1_2(a); 
    test_contar_nodos_1_3(a); 
    test_contar_hojas_1_4(a); 
    test_contar_nodos_internos_1_5(a);
    test_es_completo_1_6(a); 
    test_mayor_hoja_1_7(a);
    test_suma_hoja_1_8(a);
    test_num_pares_1_9(a);
    test_num_nodos_en_nivel_1_10(a, 4);
end.



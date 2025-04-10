unit uBinarySearchTree;

interface

type
  tTreeMap = ^tnode;
  tnode = record
    info: integer;
    hi, hd: tTreeMap;
  end;

  // Basic methods
  procedure initialize(var a: tTreeMap);
  function is_empty(a: tTreeMap): boolean;
  procedure add(var a: tTreeMap; key: integer; value: string);
  procedure get(a: tTreeMap; key: integer; var value: tListaSimple);
  function contains(a: tTreeMap; key: integer): boolean;
  procedure remove(var a: tTreeMap; x: integer);
  procedure remove_value(var a: tTreeMap; x: integer; value: string);

  // Traversal algorithms
  procedure preorder(a: tTreeMap);
  procedure inorder(a: tTreeMap);
  procedure postorder(a: tTreeMap);

  // Other methods
  procedure get_hi(a: tTreeMap; var b: tTreeMap);
  procedure get_hd(a: tTreeMap; var b: tTreeMap);

implementation

uses
  Math;

procedure initialize(var a: tTreeMap);
begin
  a := NIL;
end;

function is_empty(a: tTreeMap): boolean;
begin
  is_empty := a = NIL;
end;

function in_tree(a: tTreeMap; clave: integer): boolean;
begin
  if a = NIL then
    in_tree := FALSE
  else if a^.info < clave then
    in_tree := in_tree(a^.hd, clave)
  else if a^.info > clave then
    in_tree := in_tree(a^.hi, clave)
  else
    in_tree := TRUE;
end;

procedure add(var a: tTreeMap; clave: integer);
begin
  if a = NIL then
  begin
    new(a);
    a^.info := clave;
    a^.hi := NIL;
    a^.hd := NIL;
  end
  else if a^.info < clave then
    add(a^.hd, clave)
  else if a^.info > clave then
    add(a^.hi, clave);
end;

procedure remove(var a: tTreeMap; x: integer);
var
  aux, ant: tTreeMap;
begin
  if a <> NIL then
    if a^.info < x then
      remove(a^.hd, x)
    else if a^.info > x then
      remove(a^.hi, x)
    else
    begin
      aux := a;
      if a^.hi = NIL then
        a := a^.hd
      else if a^.hd = NIL then
        a := a^.hi
      else
      begin
        aux := a^.hi;
        while aux^.hd <> NIL do
        begin
          ant := aux;
          aux := aux^.hd;
        end;
        if a^.hi = aux then
          a^.hi := aux^.hi
        else
          ant^.hd := NIL;
        a^.info := aux^.info;
      end;
      dispose(aux);
    end;
end;

// Traversal algorithms

procedure visit(x: integer);
begin
  writeln(x);
end;

procedure preorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    visit(a^.info);
    preorder(a^.hi);
    preorder(a^.hd);
  end;
end;

procedure inorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    inorder(a^.hi);
    visit(a^.info);
    inorder(a^.hd);
  end;
end;

procedure postorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    postorder(a^.hi);
    postorder(a^.hd);
    visit(a^.info);
  end;
end;

// Other methods

function get_info(a: tTreeMap): integer;
begin
  get_info := a^.info;
end;

procedure get_hi(a: tTreeMap; var b: tTreeMap);
var
  hi: tTreeMap;
begin
  if a = nil then
    b := nil
  else
  begin
    hi := a^.hi;
    new(b);
    b^.info := hi^.info;
    b^.hi := hi^.hi;
    b^.hd := hi^.hd;
  end;
end;

procedure get_hd(a: tTreeMap; var b: tTreeMap);
var
  hd: tTreeMap;
begin
  if a = nil then
    b := nil
  else
  begin
    hd := a^.hd;
    new(b);
    b^.info := hd^.info;
    b^.hi := hd^.hi;
    b^.hd := hd^.hd;
  end;
end;


end.

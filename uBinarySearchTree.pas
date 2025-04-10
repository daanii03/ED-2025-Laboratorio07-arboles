unit uBinarySearchTree;

interface

type
  tBinarySearchTree = ^tnode;
  tnode = record
    info: integer;
    hi, hd: tBinarySearchTree;
  end;

  // Basic methods
  procedure initialize(var a: tBinarySearchTree);
  function is_empty(a: tBinarySearchTree): boolean;
  procedure add(var a: tBinarySearchTree; clave: integer);
  function in_tree(a: tBinarySearchTree; clave: integer): boolean;
  procedure remove(var a: tBinarySearchTree; x: integer);

  // Traversal algorithms
  procedure preorder(a: tBinarySearchTree);
  procedure inorder(a: tBinarySearchTree);
  procedure postorder(a: tBinarySearchTree);

  // Other methods
  procedure get_hi(a: tBinarySearchTree; var b: tBinarySearchTree);
  procedure get_hd(a: tBinarySearchTree; var b: tBinarySearchTree);

implementation

uses
  Math;

procedure initialize(var a: tBinarySearchTree);
begin
  a := NIL;
end;

function is_empty(a: tBinarySearchTree): boolean;
begin
  is_empty := a = NIL;
end;

function in_tree(a: tBinarySearchTree; clave: integer): boolean;
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

procedure add(var a: tBinarySearchTree; clave: integer);
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

procedure remove(var a: tBinarySearchTree; x: integer);
var
  aux, ant: tBinarySearchTree;
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

procedure preorder(a: tBinarySearchTree);
begin
  if (a <> NIL) then
  begin
    visit(a^.info);
    preorder(a^.hi);
    preorder(a^.hd);
  end;
end;

procedure inorder(a: tBinarySearchTree);
begin
  if (a <> NIL) then
  begin
    inorder(a^.hi);
    visit(a^.info);
    inorder(a^.hd);
  end;
end;

procedure postorder(a: tBinarySearchTree);
begin
  if (a <> NIL) then
  begin
    postorder(a^.hi);
    postorder(a^.hd);
    visit(a^.info);
  end;
end;

// Other methods

function get_info(a: tBinarySearchTree): integer;
begin
  get_info := a^.info;
end;

procedure get_hi(a: tBinarySearchTree; var b: tBinarySearchTree);
var
  hi: tBinarySearchTree;
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

procedure get_hd(a: tBinarySearchTree; var b: tBinarySearchTree);
var
  hd: tBinarySearchTree;
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

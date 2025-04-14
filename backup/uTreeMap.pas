unit uTreeMap;

interface

uses
  Math, uListaEnlazadaSimple;

type
  tTreeMap = ^tnode;
  tnode = record
    key: integer;
    value: tListaSimple;
    hi, hd: tTreeMap;
  end;

  // Basic methods
  procedure initialize(var a: tTreeMap);
  function is_empty(a: tTreeMap): boolean;
  procedure add(var a: tTreeMap; value: string);
  procedure get(a: tTreeMap; key: integer; var value: tListaSimple);
  function contains(a: tTreeMap; key: integer): boolean;
  procedure remove(var a: tTreeMap; key: integer);
  procedure remove_value(var a: tTreeMap; value: string);

  // Traversal algorithms
  procedure preorder(a: tTreeMap);
  procedure inorder(a: tTreeMap);
  procedure postorder(a: tTreeMap);

  // Other methods
  function get_info(a: tTreeMap): tListaSimple;
  procedure get_hi(a: tTreeMap; var b: tTreeMap);
  procedure get_hd(a: tTreeMap; var b: tTreeMap);

implementation
procedure initialize(var a: tTreeMap);
begin
  a := NIL;
end;

function is_empty(a: tTreeMap): boolean;
begin
  is_empty := a = NIL;
end;


procedure add(var a: tTreeMap;value: string);
begin
  if a = NIL then
  begin
    new(a);
    uListaEnlazadaSimple.initialize(a^.value);
    insert_at_end(a^.value,value);
    a^.key:= length(value);
    a^.hi := NIL;
    a^.hd := NIL;
  end
  else if a^.key = length(value) then
       insert_at_end(a^.value,value)
  else if a^.key < length(value) then
    add(a^.hd,value)
  else if a^.key > length(value) then
    add(a^.hi,value);
end;

procedure get(a: tTreeMap; key: integer; var value: tListaSimple);
begin
     if a = nil then
        writeln('NO HAY ELEMENTOS');
     else if a^.key = key then
        value:= get_info(a)
     else if key < a^.key then
         get(a^.hi,key, value)
     else if key > a^.key then
          get(a^.hd,key, value)
end;

function contains(a: tTreeMap; key: integer): boolean;
begin
     if a = nil then
        contains:= False
     else
     begin
          if a^.key = key then
             contains:= True
          else if a^.key <> key then
             contains:= contains(a^.hi,key) or contains(a^.hd,key);
     end;
end;

procedure remove(var a: tTreeMap;key: integer);
var
  aux, ant: tTreeMap;
begin
  if a <> NIL then
    if a^.key < key then
      remove(a^.hd, key)
    else if a^.key > key then
      remove(a^.hi, key)
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
        a^.value:= aux^.value;
        a^.key:= aux^.key;
      end;
      dispose(aux);
    end;
end;

procedure remove_value(var a: tTreeMap; value: string);
begin
     if a^.key = length(value) then
     begin
        uListaEnlazadaSimple.delete(a^.value,value);
        if uListaEnlazadaSimple.is_empty(a^.value) then
           remove(a, length(value));
     end
     else if length(value) < a^.key then
         remove_value(a^.hi, value)
     else if length(value) > a^.key then
          remove_value(a^.hd, value);
end;

// Traversal algorithms

procedure visit(x: tListaSimple);
begin
  writeln(uListaEnlazadaSimple.to_string(x));
end;

procedure preorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    visit(a^.value);
    preorder(a^.hi);
    preorder(a^.hd);
  end;
end;

procedure inorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    inorder(a^.hi);
    visit(a^.value);
    inorder(a^.hd);
  end;
end;

procedure postorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    postorder(a^.hi);
    postorder(a^.hd);
    visit(a^.value);
  end;
end;

// Other methods

function get_info(a: tTreeMap): tListaSimple;
begin
  get_info := a^.value;
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
    b^.value := hi^.value;
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
    b^.value := hd^.value;
    b^.hi := hd^.hi;
    b^.hd := hd^.hd;
  end;
end;

end.

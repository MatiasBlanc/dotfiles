-- ============================================
-- Snippets personalizados para Python
-- ============================================

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Función
  s("def", fmt([[
def {}({}):
    {}
]], {
    i(1, "nombre_funcion"),
    i(2, ""),
    i(0, "pass"),
  })),

  -- Función con docstring
  s("defd", fmt([[
def {}({}):
    """{}"""
    {}
]], {
    i(1, "nombre_funcion"),
    i(2, ""),
    i(3, "Descripción de la función"),
    i(0, "pass"),
  })),

  -- Función con tipo de retorno
  s("deft", fmt([[
def {}({}{}) -> {}:
    {}
]], {
    i(1, "nombre_funcion"),
    i(2, ""),
    c(3, { t(""), t(" ") }),
    i(4, "None"),
    i(0, "pass"),
  })),

  -- Lambda
  s("lam", fmt([[lambda {}: {}]], {
    i(1, "x"),
    i(2, "x"),
  })),

  -- Print
  s("pr", fmt([[print({})]], { i(1, "") })),

  -- Print f-string
  s("prf", fmt([[print(f"{}")]], { i(1, "") })),

  -- Print debug
  s("prd", fmt([[print(f"DEBUG {}: {{{}}}")]], {
    i(1, "Variable"),
    i(2, "variable"),
  })),

  -- Print con formato
  s("prs", fmt([[print("{}: {}".format({}, {}))]], {
    i(1, "Etiqueta"),
    i(2, "{}"),
    i(3, "valor"),
    i(4, ""),
  })),

  -- If
  s("if", fmt([[
if {}:
    {}
]], {
    i(1, "condición"),
    i(0, "pass"),
  })),

  -- If/Else
  s("ife", fmt([[
if {}:
    {}
else:
    {}
]], {
    i(1, "condición"),
    i(2, "pass"),
    i(3, "pass"),
  })),

  -- If/Elif/Else
  s("ifee", fmt([[
if {}:
    {}
elif {}:
    {}
else:
    {}
]], {
    i(1, "condición1"),
    i(2, "pass"),
    i(3, "condición2"),
    i(4, "pass"),
    i(5, "pass"),
  })),

  -- For loop
  s("for", fmt([[
for {} in {}:
    {}
]], {
    i(1, "item"),
    i(2, "iterable"),
    i(0, "pass"),
  })),

  -- For con range
  s("forr", fmt([[
for {} in range({}):
    {}
]], {
    i(1, "i"),
    i(2, "n"),
    i(0, "pass"),
  })),

  -- For con enumerate
  s("fore", fmt([[
for {}, {} in enumerate({}):
    {}
]], {
    i(1, "i"),
    i(2, "item"),
    i(3, "iterable"),
    i(0, "pass"),
  })),

  -- While
  s("wh", fmt([[
while {}:
    {}
]], {
    i(1, "condición"),
    i(0, "pass"),
  })),

  -- List comprehension
  s("lc", fmt([[{} = [{} for {} in {}] ]], {
    i(1, "result"),
    i(2, "item"),
    i(3, "item"),
    i(4, "iterable"),
  })),

  -- Dict comprehension
  s("dc", fmt([[{} = {{{}: {} for {} in {}}}]], {
    i(1, "result"),
    i(2, "key"),
    i(3, "value"),
    i(4, "item"),
    i(5, "iterable"),
  })),

  -- Try/Except
  s("try", fmt([[
try:
    {}
except {}:
    {}
]], {
    i(1, "pass"),
    i(2, "Exception"),
    i(3, "pass"),
  })),

  -- Try/Except/Finally
  s("tryf", fmt([[
try:
    {}
except {}:
    {}
finally:
    {}
]], {
    i(1, "pass"),
    i(2, "Exception"),
    i(3, "pass"),
    i(4, "pass"),
  })),

  -- With open
  s("with", fmt([[
with open("{}", "{}") as {}:
    {}
]], {
    i(1, "archivo.txt"),
    c(2, { t("r"), t("w"), t("a"), t("r+") }),
    i(3, "f"),
    i(0, "contenido = f.read()"),
  })),

  -- With open UTF-8
  s("withu", fmt([[
with open("{}", "{}", encoding="utf-8") as {}:
    {}
]], {
    i(1, "archivo.txt"),
    c(2, { t("r"), t("w"), t("a"), t("r+") }),
    i(3, "f"),
    i(0, "contenido = f.read()"),
  })),

  -- Clase
  s("class", fmt([[
class {}({}):
    """{}"""

    def __init__(self{}):
        {}
]], {
    i(1, "NombreClase"),
    c(2, { t(""), t("object") }),
    i(3, "Descripción de la clase"),
    i(4, ""),
    i(0, "pass"),
  })),

  -- Método __init__
  s("init", fmt([[
def __init__(self{}):
    {}
]], {
    i(1, ""),
    i(0, "pass"),
  })),

  -- Método __str__
  s("strm", fmt([[
def __str__(self):
    return f"{}"
]], {
    i(1, "Clase({self.atributo})"),
  })),

  -- Método __repr__
  s("reprm", fmt([[
def __repr__(self):
    return f"{}"
]], {
    i(1, "Clase(atributo={self.atributo})"),
  })),

  -- Property
  s("prop", fmt([[
@property
def {}(self):
    return self._{}
]], {
    i(1, "nombre"),
    i(2, "nombre"),
  })),

  -- Setter
  s("setter", fmt([[
@{}.setter
def {}(self, {}):
    self._{} = {}
]], {
    i(1, "propiedad"),
    i(2, "propiedad"),
    i(3, "valor"),
    i(4, "propiedad"),
    i(5, "valor"),
  })),

  -- Dataclass
  s("dclass", fmt([[
from dataclasses import dataclass

@dataclass
class {}:
    {}
]], {
    i(1, "NombreClase"),
    i(2, "atributo: tipo"),
  })),

  -- Dataclass con métodos
  s("dclassm", fmt([[
from dataclasses import dataclass

@dataclass
class {}:
    {}

    def {}(self):
        {}
]], {
    i(1, "NombreClase"),
    i(2, "atributo: tipo"),
    i(3, "metodo"),
    i(0, "pass"),
  })),

  -- if __name__ == "__main__"
  s("main", fmt([[
if __name__ == "__main__":
    {}
]], {
    i(0, "main()"),
  })),

  -- Argparse
  s("argp", fmt([[
import argparse

def parse_args():
    parser = argparse.ArgumentParser(description="{}")
    parser.add_argument("{}", help="{}")
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    {}
]], {
    i(1, "Descripción del script"),
    i(2, "input"),
    i(3, "Descripción del argumento"),
    i(0, "main(args)"),
  })),

  -- Logging
  s("log", fmt([[
import logging

logging.basicConfig(level=logging.{})
logger = logging.getLogger(__name__)

logger.{}("{}")
]], {
    c(1, { t("INFO"), t("DEBUG"), t("WARNING"), t("ERROR") }),
    c(2, { t("info"), t("debug"), t("warning"), t("error") }),
    i(3, "Mensaje"),
  })),

  -- Type hints comunes
  s("typ", fmt([[{}: {}]], {
    i(1, "variable"),
    c(2, { t("str"), t("int"), t("float"), t("bool"), t("list"), t("dict"), t("Optional[str]") }),
  })),

  -- Unión de tipos
  s("union", fmt([[Union[{}, {}]]], {
    i(1, "str"),
    i(2, "int"),
  })),

  -- TypedDict
  s("tdict", fmt([[
from typing import TypedDict

class {}(TypedDict):
    {}: {}
]], {
    i(1, "NombreDict"),
    i(2, "campo"),
    i(3, "str"),
  })),

  -- ABC abstract class
  s("abc", fmt([[
from abc import ABC, abstractmethod

class {}(ABC):
    @abstractmethod
    def {}(self):
        pass
]], {
    i(1, "NombreClase"),
    i(2, "metodo_abstracto"),
  })),

  -- Decorador personalizado
  s("deco", fmt([[
def {}(func):
    def wrapper(*args, **kwargs):
        {}
        return func(*args, **kwargs)
    return wrapper
]], {
    i(1, "nombre_decorador"),
    i(2, "# pre-procesamiento"),
  })),
}

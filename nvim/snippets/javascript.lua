-- ============================================
-- Snippets personalizados para JavaScript
-- ============================================

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Función flecha
  s("af", fmt([[
const {} = ({}) => {{
  {}
}};
]], {
    i(1, "nombreFuncion"),
    i(2, ""),
    i(0),
  })),

  -- Función flecha async
  s("afa", fmt([[
const {} = async ({}) => {{
  {}
}};
]], {
    i(1, "nombreFuncion"),
    i(2, ""),
    i(0),
  })),

  -- Función clásica
  s("fn", fmt([[
function {}({}) {{
  {}
}}
]], {
    i(1, "nombreFuncion"),
    i(2, ""),
    i(0),
  })),

  -- Console.log
  s("cl", fmt([[console.log({})]], { i(1, "") })),

  -- Console.log con etiqueta
  s("cll", fmt([[console.log("{}:", {})]], {
    i(1, "Variable"),
    i(2, "variable"),
  })),

  -- Console.error
  s("ce", fmt([[console.error({})]], { i(1, "") })),

  -- Console.table
  s("ct", fmt([[console.table({})]], { i(1, "") })),

  -- Try/Catch
  s("tc", fmt([[
try {{
  {}
}} catch ({}) {{
  {}
}}
]], {
    i(1, "// código"),
    i(2, "error"),
    i(3, "console.error(error)"),
  })),

  -- Try/Catch async
  s("tca", fmt([[
try {{
  {}
}} catch ({}) {{
  {}
}}
]], {
    i(1, "// código async"),
    i(2, "error"),
    i(3, "console.error(error)"),
  })),

  -- If/Else
  s("ife", fmt([[
if ({}) {{
  {}
}} else {{
  {}
}}
]], {
    i(1, "condición"),
    i(2, "// verdadero"),
    i(3, "// falso"),
  })),

  -- Ternario
  s("ter", fmt([[({}) ? {} : {}]], {
    i(1, "condición"),
    i(2, "verdadero"),
    i(3, "falso"),
  })),

  -- setTimeout
  s("st", fmt([[
setTimeout(() => {{
  {}
}}, {});
]], {
    i(1, "// código"),
    i(2, "1000"),
  })),

  -- setInterval
  s("si", fmt([[
setInterval(() => {{
  {}
}}, {});
]], {
    i(1, "// código"),
    i(2, "1000"),
  })),

  -- addEventListener
  s("ael", fmt([[
{}.addEventListener("{}", ({}) => {{
  {}
}});
]], {
    i(1, "element"),
    i(2, "click"),
    i(3, "e"),
    i(0),
  })),

  -- Fetch API
  s("fetch", fmt([[
const response = await fetch("{}", {{
  method: "{}",
  headers: {{
    "Content-Type": "application/json",
  }},
  {}
}});
const data = await response.json();
]], {
    i(1, "/api/endpoint"),
    c(2, { t("GET"), t("POST"), t("PUT"), t("DELETE") }),
    i(0),
  })),

  -- Map
  s("map", fmt([[{}.map(({}) => {})]], {
    i(1, "array"),
    i(2, "item"),
    i(3, "item"),
  })),

  -- Filter
  s("filter", fmt([[{}.filter(({}) => {})]], {
    i(1, "array"),
    i(2, "item"),
    i(3, "item.length > 0"),
  })),

  -- Reduce
  s("reduce", fmt([[{}.reduce(({}, {}) => {})]], {
    i(1, "array"),
    i(2, "acc"),
    i(3, "item"),
    i(4, "acc + item"),
  })),

  -- Desestructuración de objeto
  s("dest", fmt([[const {{ {} }} = {};]], {
    i(1, "prop1, prop2"),
    i(2, "objeto"),
  })),

  -- Spread operator
  s("spr", fmt([[const {} = {{ ...{}, {} }};]], {
    i(1, "nuevoObjeto"),
    i(2, "objetoOriginal"),
    i(3, "nuevaProp: valor"),
  })),

  -- Class
  s("class", fmt([[
class {} {{
  constructor({}) {{
    {}
  }}

  {}
}}
]], {
    i(1, "NombreClase"),
    i(2, ""),
    i(3, "// inicialización"),
    i(0),
  })),

  -- Export default
  s("exp", fmt([[export default {};]], { i(1, "nombre") })),

  -- Export named
  s("exn", fmt([[export {{ {} }};]], { i(1, "nombre") })),

  -- Import
  s("imp", fmt([[import {} from "{}";]], {
    i(1, "modulo"),
    i(2, "paquete"),
  })),

  -- Import destructurado
  s("impd", fmt([[import {{ {} }} from "{}";]], {
    i(1, "componente"),
    i(2, "paquete"),
  })),
}

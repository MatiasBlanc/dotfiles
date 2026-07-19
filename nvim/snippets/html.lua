-- ============================================
-- Snippets personalizados para HTML
-- ============================================

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Estructura HTML5 básica
  s("html5", fmt([[
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{}</title>
  {}
</head>
<body>
  {}
</body>
</html>
]], {
    i(1, "Título"),
    i(2, ""),
    i(0),
  })),

  -- Enlace CSS
  s("css", fmt([[<link rel="stylesheet" href="{}">]], {
    i(1, "styles.css"),
  })),

  -- Script JS
  s("js", fmt([[<script src="{}"></script>]], {
    i(1, "script.js"),
  })),

  -- Imagen responsiva
  s("img", fmt([[<img src="{}" alt="{}" {}>]], {
    i(1, "imagen.jpg"),
    i(2, "Descripción"),
    i(0),
  })),

  -- Meta tags SEO
  s("seo", fmt([[
<meta name="description" content="{}">
<meta name="keywords" content="{}">
<meta name="author" content="{}">
]], {
    i(1, "Descripción de la página"),
    i(2, "keyword1, keyword2"),
    i(3, "Autor"),
  })),

  -- Formulario básico
  s("form", fmt([[
<form action="{}" method="{}">
  <div class="form-group">
    <label for="{}">{}</label>
    <input type="{}" id="{}" name="{}" required>
  </div>
  <button type="submit">{}</button>
</form>
]], {
    i(1, "/submit"),
    c(2, { t("POST"), t("GET") }),
    i(3, "campo"),
    i(4, "Campo"),
    i(5, "text"),
    f(function(args) return args[1][1] end, { 3 }),
    f(function(args) return args[1][1] end, { 3 }),
    i(6, "Enviar"),
  })),

  -- Tarjeta Bootstrap
  s("card", fmt([[
<div class="card">
  <img src="{}" class="card-img-top" alt="{}">
  <div class="card-body">
    <h5 class="card-title">{}</h5>
    <p class="card-text">{}</p>
    <a href="{}" class="btn btn-primary">{}</a>
  </div>
</div>
]], {
    i(1, "imagen.jpg"),
    i(2, "Alt"),
    i(3, "Título"),
    i(4, "Contenido..."),
    i(5, "#"),
    i(6, "Ver más"),
  })),
}

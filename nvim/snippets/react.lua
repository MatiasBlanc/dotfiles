-- ============================================
-- Snippets personalizados para React (JSX/TSX)
-- ============================================

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Componente funcional
  s("rfc", fmt([[
const {} = () => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
    i(1, "ComponentName"),
    i(0),
    f(function(args) return args[1][1] end, { 1 }),
  })),

  -- Componente con props
  s("rfcp", fmt([[
const {} = ({{ {} }}) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
    i(1, "ComponentName"),
    i(2, "props"),
    i(0),
    f(function(args) return args[1][1] end, { 1 }),
  })),

  -- Componente con TypeScript
  s("rfcts", fmt([[
interface {}Props {{
  {}
}}

const {} = ({{ {} }}: {}Props) => {{
  return (
    <div>
      {}
    </div>
  );
}};

export default {};
]], {
    i(1, "ComponentName"),
    i(2, "// props aquí"),
    f(function(args) return args[1][1] end, { 1 }),
    f(function(args) return args[2][1] end, { 2 }),
    f(function(args) return args[1][1] end, { 1 }),
    i(0),
    f(function(args) return args[1][1] end, { 1 }),
  })),

  -- useState
  s("us", fmt([[const [{}, set{}] = useState({});]], {
    i(1, "state"),
    f(function(args)
      local str = args[1][1]
      return str:sub(1, 1):upper() .. str:sub(2)
    end, { 1 }),
    i(2, "initialValue"),
  })),

  -- useEffect
  s("ue", fmt([[
useEffect(() => {{
  {}
}}, [{}]);
]], {
    i(1, "// efecto"),
    i(2, "dependencias"),
  })),

  -- useEffect con cleanup
  s("uec", fmt([[
useEffect(() => {{
  {}

  return () => {{
    {}
  }};
}}, [{}]);
]], {
    i(1, "// efecto"),
    i(2, "// cleanup"),
    i(3, "dependencias"),
  })),

  -- useContext
  s("uctx", fmt([[const {} = useContext({});]], {
    i(1, "contextValue"),
    i(2, "ContextName"),
  })),

  -- useRef
  s("ur", fmt([[const {} = useRef({});]], {
    i(1, "ref"),
    i(2, "null"),
  })),

  -- useMemo
  s("um", fmt([[const {} = useMemo(() => {{
  {}
}}, [{}]);
]], {
    i(1, "memoized"),
    i(2, "return value"),
    i(3, "dependencias"),
  })),

  -- useCallback
  s("ucb", fmt([[const {} = useCallback(({}) => {{
  {}
}}, [{}]);
]], {
    i(1, "callback"),
    i(2, "args"),
    i(3, "// cuerpo"),
    i(4, "dependencias"),
  })),

  -- Custom Hook
  s("hook", fmt([[
const use{} = ({}) => {{
  {}

  return {{ {} }};
}};
]], {
    i(1, "HookName"),
    i(2, "params"),
    i(3, "// lógica"),
    i(4, "values"),
  })),

  -- JSX Map
  s("jmap", fmt([[
{{{0}.map(({}) => (
  <{1} key={{}} key={{1}}>{2}</{1}>
))}}
]], {
    i(1, "items"),
    i(2, "item"),
    i(3, "div"),
    i(4, "item.id"),
    i(0),
  })),

  -- JSX Conditional
  s("jcond", fmt([[{{{} && (
  {}
)}}]], {
    i(1, "condition"),
    i(0),
  })),

  -- JSX Ternary
  s("jtern", fmt([[{{{} ? (
  {}
) : (
  {}
)}}]], {
    i(1, "condition"),
    i(2, "verdadero"),
    i(3, "falso"),
  })),

  -- Fragment
  s("frag", fmt([[
<>
  {}
</>
]], { i(0) })),

  -- Event Handler
  s("handler", fmt([[
const handle{} = ({}) => {{
  {}
}};
]], {
    i(1, "EventName"),
    i(2, "e"),
    i(0),
  })),

  -- Form con state
  s("form", fmt([[
const [{0}, set{0}] = useState({{
  {1}
}});

const handleChange = (e) => {{
  set{0}({{
    ...{0},
    [e.target.name]: e.target.value,
  }});
}};

const handleSubmit = (e) => {{
  e.preventDefault();
  {2}
}};
]], {
    i(1, "formData"),
    i(2, "field: ''"),
    i(0),
  })),

  -- Style inline object
  s("styobj", fmt([[const styles = {{
  {}: {{ {} }}
}};
]], {
    i(1, "container"),
    i(2, "display: 'flex'"),
  })),

  -- Prop Types (legacy)
  s("pt", fmt([[
{}.propTypes = {{
  {}: PropTypes.{},
}};
]], {
    i(1, "Component"),
    i(2, "propName"),
    c(3, { t("string"), t("number"), t("bool"), t("func"), t("object"), t("array") }),
  })),
}

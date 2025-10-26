local line_begin = require("luasnip.extras.expand_conditions").line_begin

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end

return {
    -- formatting
    s({trig = "it"},
      fmta(
        [[\textit{<>}]],
        { i(1) }
      )
    ),
    s({trig = "bf"},
      fmta(
        [[\textbf{<>}]],
        { i(1) }
      )
    ),
    s({trig = "em"},
      fmta(
        [[\emph{<>}]],
        { d(1, get_visual) }
      )
    ),
    s({trig = "ul"},
      fmta(
        [[\underline{<>}]],
        { i(1) }
      )
    ),
    s({trig = "tc"},
      fmta(
        [[\textcolor{<>}{<>}]],
        { i(1), i(2) }
      )
    ),

    -- Greek letters
    s(
        { trig = ";a", snippetType="autosnippet",  wordTrig=false },
        { t("\\alpha") }
    ),
    s(
        { trig = ";A", snippetType="autosnippet",  wordTrig=false },
        { t("\\Alpha") }
    ),
    s(
        { trig = ";b", snippetType="autosnippet", wordTrig=false },
        { t("\\beta") }
    ),
    s(
        { trig = ";B", snippetType="autosnippet", wordTrig=false },
        { t("\\Beta") }
    ),
    s(
        { trig = ";g", snippetType="autosnippet", wordTrig=false },
        { t("\\gamma") }
    ),
    s(
        { trig = ";G", snippetType="autosnippet", wordTrig=false },
        { t("\\Gamma") }
    ),
    s(
        { trig = ";d", snippetType="autosnippet", wordTrig=false },
        { t("\\delta") }
    ),
    s(
        { trig = ";D", snippetType="autosnippet", wordTrig=false },
        { t("\\Delta") }
    ),
    s(
        { trig = ";e", snippetType="autosnippet", wordTrig=false },
        { t("\\epsilon") }
    ),
    s(
        { trig = ";E", snippetType="autosnippet", wordTrig=false },
        { t("\\Epsilon") }
    ),
    s(
        { trig = ";n", snippetType="autosnippet", wordTrig=false },
        { t("\\eta") }
    ),
    s(
        { trig = ";N", snippetType="autosnippet", wordTrig=false },
        { t("\\Eta") }
    ),
    s(
        { trig = ";f", snippetType="autosnippet", wordTrig=false },
        { t("\\phi") }
    ),
    s(
        { trig = ";F", snippetType="autosnippet", wordTrig=false },
        { t("\\Phi") }
    ),
    s(
        { trig = ";l", snippetType="autosnippet", wordTrig=false },
        { t("\\lambda") }
    ),
    s(
        { trig = ";L", snippetType="autosnippet", wordTrig=false },
        { t("\\Lambda") }
    ),
    s(
        { trig = ";w", snippetType="autosnippet", wordTrig=false },
        { t("\\omega") }
    ),
    s(
        { trig = ";W", snippetType="autosnippet", wordTrig=false },
        { t("\\Omega") }
    ),
    s(
        { trig = ";p", snippetType="autosnippet", wordTrig=false },
        { t("\\pi") }
    ),
    s(
        { trig = ";P", snippetType="autosnippet", wordTrig=false },
        { t("\\Pi") }
    ),
    s(
        { trig = ";m", snippetType="autosnippet", wordTrig=false },
        { t("\\mu") }
    ),
    s(
        { trig = ";M", snippetType="autosnippet", wordTrig=false },
        { t("\\Mu") }
    ),
    s(
        { trig = ";r", snippetType="autosnippet", wordTrig=false },
        { t("\\rho") }
    ),
    s(
        { trig = ";R", snippetType="autosnippet", wordTrig=false },
        { t("\\Rho") }
    ),
    s(
        { trig = ";s", snippetType="autosnippet", wordTrig=false },
        { t("\\sigma") }
    ),
    s(
        { trig = ";S", snippetType="autosnippet", wordTrig=false },
        { t("\\Sigma") }
    ),
    s(
        { trig = ";v", snippetType="autosnippet", wordTrig=false },
        { t("\\nu") }
    ),
    s(
        { trig = ";V", snippetType="autosnippet", wordTrig=false },
        { t("\\Nu") }
    ),
    s(
        { trig = ";x", snippetType="autosnippet", wordTrig=false },
        { t("\\chi") }
    ),
    s(
        { trig = ";X", snippetType="autosnippet", wordTrig=false },
        { t("\\Chi") }
    ),
    s(
        { trig = ";t", snippetType="autosnippet", wordTrig=false },
        { t("\\tau") }
    ),
    s(
        { trig = ";T", snippetType="autosnippet", wordTrig=false },
        { t("\\Tau") }
    ),
    s(
        { trig = ";k", snippetType="autosnippet", wordTrig=false },
        { t("\\kappa") }
    ),
    s(
        { trig = ";K", snippetType="autosnippet", wordTrig=false },
        { t("\\Kappa") }
    ),
    s(
        { trig = ";z", snippetType="autosnippet", wordTrig=false },
        { t("\\zeta") }
    ),
    s(
        { trig = ";Z", snippetType="autosnippet", wordTrig=false },
        { t("\\Zeta") }
    ),
    s(
        { trig = ";o", snippetType="autosnippet", wordTrig=false },
        { t("\\theta") }
    ),
    s(
        { trig = ";O", snippetType="autosnippet", wordTrig=false },
        { t("\\Theta") }
    ),

    -- math
    s(
        { trig = "jwt"},
        { t("j\\omega t") }
    ),
    s(
        { trig = "tanh" },
        { t("\\tanh") }
    ),
    s(
        { trig = ";_", snippetType="autosnippet", wordTrig=false },
        { t("_{}") }
    ),
    s(
        { trig = ";^", snippetType="autosnippet", wordTrig=false },
        { t("^{}") }
    ),


    -- sections
    s({trig = "h1", condition = line_begin },
        fmta(
            [[\section{<>}]],
            { d(1, get_visual) }
        )
    ),
    s({trig = "h2", condition = line_begin },
        fmta(
            [[\subsection{<>}]],
            { d(1, get_visual) }
        )
    ),
    s({trig = "h3", condition = line_begin },
        fmta(
            [[\subsubsection{<>}]],
            { d(1, get_visual) }
        )
    ),

    -- environments
    s({trig = 'ff'},
        fmta(
            [[\frac{<>}{<>}]],
            {
              i(1),
              i(2)
            }
        )
    ),
    s({trig = 'ii'},
        fmta(
            [[\item <> ]],
            {
              i(1),
            }
        )
    ),
    s({trig="new", condition = line_begin},
        fmta(
            [[
              \begin{<>}
                  <>
              \end{<>}
            ]],
            {
              i(1),
              i(2),
              rep(1),
            }
        )
    ),
    s({trig="neweq", condition = line_begin},
        fmta(
            [[
              \begin{equation}\label{}
                  <>
              \end{equation}
            ]],
            {
              i(1),
            }
        )
    ),
    s({trig="newfig", condition = line_begin},
        fmta(
            [[
                \begin{figure}[h]
                    \centering
                    \includegraphics[width=<>\textwidth]{<>}
                    \caption{<>}
                    \label{fig_<>}
                \end{figure}
            ]],
            {i(1), i(2), i(3), i(4)}
        )
    ),
    s({trig="graph", condition = line_begin},
        fmta(
            [[
                \includegraphics[width=<>\textwidth]{<>}
            ]],
            {i(1), i(2)}
        )
    ),

}

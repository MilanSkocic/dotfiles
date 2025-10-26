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
    s({trig = "df"},
      fmta(
        [[
            def <>(*args, **kwargs):
                <>
                return None
        ]],
        { i(1), i(2) }
      )
    ),
    s({trig = "lda"},
      fmta(
        [[
            lambda <>: <>
        ]],
        { i(1), i(2) }
      )
    ),

    s(
        { trig = ";m", snippetType="autosnippet",  wordTrig=false },
        { t("if __name__ == \"__main__\":") }
    ),
}

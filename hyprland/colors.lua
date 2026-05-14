hl.config({
    general = {
        col = {
            active_border   = { colors = { "rgba(ADC7FFEE)", "rgba(DEBCDFEE)" } },
            inactive_border = { colors = { "rgba(11131866)" } },
        },
    },
    misc = {
        background_color = "rgba(111318FF)",
    },
})

hl.window_rule({
    match        = { pin = 1 },
    border_color = { colors = { "rgba(BFC6DCAA)", "rgba(BFC6DC77)" } },
})

--[[
    se supone que este archivo es para crear una ventana
    con las "Gracias especiales" por parte de donadores,
    pero no sé cómo hacerla .·´¯`(>▂<)´¯`·. 
]]
local paruMod = SMODS.current_mod

G.FUNCS.show_special_thanks = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu(
        {
            definition = {
                n = G.UIT.ROOT,
                config = {
                    align = "cm",
                    padding = 0.2,
                    colour = G.C.BLACK,
                    r = 0.1,
                    emboss = 0.05,
                    minw = 6,
                    minh = 4
                },
                nodes = {
                    -- Title
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0.1},
                        nodes = {
                            {
                                n = G.UIT.T,
                                config = {
                                    text = localize("paru_special_thanks"),
                                    scale = 1.1,
                                    colour = G.C.EDITION,
                                    shadow = true
                                }
                            }
                        }
                    },
                    -- Content
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0.2},
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = 0.1},
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("paru_donators"),
                                            scale = 1.0,
                                            colour = G.C.DARK_EDITION
                                        }
                                    }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {align = "cm", padding = 0.1},
                                nodes = {
                                    {
                                        n = G.UIT.T,
                                        config = {
                                            text = localize("paru_donators2"),
                                            scale = 0.4,
                                            colour = G.C.UI.TEXT_LIGHT
                                        }
                                    }
                                }
                            }
                        }
                    },
                    -- OK Button
                    {
                        n = G.UIT.R,
                        config = {align = "cm", padding = 0.2},
                        nodes = {
                            UIBox_button(
                                {
                                    label = {localize("b_paru_ok")},
                                    button = "exit_overlay_menu",
                                    minw = 3,
                                    minh = 0.8
                                }
                            )
                        }
                    }
                }
            }
        }
    )
end

G.FUNCS.open_kofi = function(e)
    love.system.openURL("https://ko-fi.com/laparaguas")
end

paruMod.custom_ui = function(modNodes)
    table.insert(
        modNodes,
        {
            n = G.UIT.R,
            config = {align = "cm", padding = 0.2},
            nodes = {
                UIBox_button(
                    {
                        label = {"Gracias especiales"},
                        button = "show_special_thanks",
                        minw = 3.5,
                        colour = G.C.EDITION
                    }
                ),
                UIBox_button(
                    {
                        label = {"Ko-fi"},
                        button = "open_kofi",
                        minw = 3,
                        colour = G.C.DARK_EDITION
                    }
                )
            }
        }
    )
end

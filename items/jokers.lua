--[[

acá está el código de todos los comodines.
¿Por qué no hice este archivo al principio?
No lo sé, pero al menos lo puedo llenar de porquería
sin problemas. Y además, es más facil ponerle más cosas
al mod sin problemas.

Atentamente, La Paraguas (Amanda). :D
]]
--- Paru (no es el primer comodín que hice xd)

SMODS.Atlas {
    key = "paru",
    path = "stupidjoker.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "stupidjoker",
    atlas = "paru",
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    demicoloncompat = true,
    pos = {x = 0, y = 0},
    config = {extra = {mult = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    check_for_unlock = function(self, args)
        if args.type == "stupidjoker" then
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = ":)",
                colour = G.C.RED
            }
        end
    end
}

--- Adobe After Effects

SMODS.Atlas {
    key = "afterfx",
    path = "afterfx.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "afterfx",
    atlas = "afterfx",
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 4, chance = 4, roundssince = 0}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                G.GAME.probabilities.normal,
                card.ability.extra.chance
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = "X"..card.ability.extra.Xmult.." multi",
                colour = G.C.RED
            }
        end

        if context.end_of_round then
            if pseudorandom("afterfx") < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                destroyCard(card) return {message = "chao conchetumare"}
            end
        end
    end
}

--- TRanSP4R$ENiæ

SMODS.Atlas {
    key = "transparceny",
    path = "TRanSPARCENy.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "transparceny",
    atlas = "transparceny",
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {mult = 24, chance = 4, roundssince = 0}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.chance
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if pseudorandom("transparceny") < (G.GAME.probabilities.normal / card.ability.extra.chance) then
            if context.joker_main then
                return {mult_mod = card.ability.extra.mult, message = "+" .. card.ability.extra.mult .. " multi"}
            end
        end
    end
}

--- Con mucho amor, Amanda <3

SMODS.Atlas {
    key = "withluv",
    path = "withluv.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "withluvamanda",
    atlas = "withluv",
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {chips = 60, Xmult = 2, suit = "Hearts"}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.Xmult,
                card.ability.extra.suit
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    chip_mod = card.ability.extra.chips,
                    Xmult_mod = card.ability.extra.Xmult,
                    colour = G.C.RED,
                    message = "<3"
                }
            end
        end
    end
}

--- Comodín de la suerte

SMODS.Atlas {
    key = "luckyjoker", path = "luckyjoker.png",
    px = 71, py = 96
}

SMODS.Joker {
    key = "luckyclub",
    atlas = "luckyjoker",
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {chips = 45, chance = 2, roundssince = 0, suit = "Clubs"}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                G.GAME.probabilities.normal,
                card.ability.extra.chance,
                card.ability.extra.suit
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if pseudorandom('luckyjoker') < (G.GAME.probabilities.normal / card.ability.extra.chance) then
            if context.individual and context.cardarea == G.play then
                if context.other_card:is_suit(card.ability.extra.suit) then
                    return {
                        message = "*message*",
                        colour = G.C.BLUE,
                        chips_mod = card.ability.extra.chip
                    }
                end
            end
        end
    end
}

--- Amo los diamantes

SMODS.Atlas {
    key = "iluvdiamonds",
    path = "iluvdiamonds.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "iluvdiamonds",
    atlas = "iluvdiamonds",
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 1.5, suit = "Diamonds"}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.suit
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    message = "X" .. card.ability.extra.Xmult .. " multi",
                    colour = G.C.DIAMOND,
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end
    end
}

--- LAS CHICAS TRANS SON CLAVE

SMODS.Atlas {
    key = "transcard",
    path = "transcard.png",
    px = 74,
    py = 100 --- ima fuckin dumb ahh bitch!
}

SMODS.Joker {
    key = "transcard",
    atlas = "transcard",
    rarity = 4,
    cost = 30,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    demicoloncompat = true,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {Xmult = 16, chips = 9999}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.chips}} --#1# is replaced with card.ability.extra.Xmult
    end,
    check_for_unlock = function(self, args)
        if args.type == "transcardlol" then
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                card = card,
                chip_mod = card.ability.extra.chips,
                Xmult_mod = card.ability.extra.Xmult,
                message = localize("TRANS RIGHTS!")
            }
        end
    end
}

--- :3

SMODS.Atlas {
    key = "cutejoker",
    path = "cutejoker.png",
    px = 74,
    py = 100
}

SMODS.Joker {
    key = "cutejkr",
    atlas = "cutejoker",
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    demicoloncompat = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            Xmult = 2,
            additional = 0.5,
            currentquip = 0,
            Xquips = {
                ":3",
                "UwU",
                "nwn",
                ">w<",
                "^w^",
                "owo",
                "°w°",
                "OwO"
            }
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.Xmult,
                card.ability.extra.additional,
                card.ability.extra.currentquip,
                card.ability.extra.Xquips
            }
        }
    end,
    update = function(self, card, dt)
        if G.jokers then
            local threeamount = G.playing_cards and calculate_three_amount() or 0
            Xmult_mod = (card.ability.extra.additional * threeamount)
            card.ability.extra.Xmult = Xmult_mod
        end
    end,
    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.currentquip = card.ability.extra.currentquip + 1
            if card.ability.extra.currentquip > 8 then
                card.ability.extra.currentquip = 1
            end
            return {
                Xmult = Xmult_mod,
                message = card.ability.extra.Xquips[card.ability.extra.currentquip]
            }
        end
    end
}

--- Tha Savior

SMODS.Atlas {
    key = "thasavior",
    path = "thasavior.png",
    px = 74,
    py = 100
}

SMODS.Joker {
    key = "thasavior",
    atlas = "thasavior",
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {
        extra = {
            chips = 650,
            Xmult = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.chips, card.ability.extra.Xmult}
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round and G.GAME.current_round.hands_left == 0 then
                return {
                    card = card,
                    chip_mod = card.ability.extra.chips,
                    Xmult_mod = card.ability.extra.Xmult,
                    message = localize("paru_saved"),
                    colour = G.C.MULT
                }
            end
        end
    end
}

--- </3

SMODS.Atlas {
    key = "brokenheart",
    path = "brokenheart.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "brknheart",
    atlas = "brokenheart",
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 3}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local has_heart = false
            local has_wild = false
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    if c.base.suit == "Hearts" then
                        has_heart = true
                    end
                    if c.ability and c.ability.name == "Wild Card" then
                        has_wild = true
                    end
                    if has_heart or has_wild then
                        break
                    end
                end
            end

            if not has_heart and not has_wild then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = "X" .. card.ability.extra.Xmult .. " multi",
                    colour = G.C.MULT
                }
            end
        end
    end
}

--- EL GUERRERO PARU XVIII

SMODS.Atlas {
    key = "paruxviii",
    path = "elguerrero.png",
    px = 72,
    py = 97
}

SMODS.Joker {
    key = "paruxviii",
    atlas = "paruxviii",
    rarity = 4,
    cost = 30,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {}},
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            local original_chips = G.GAME.blind.chips
            local new_chips = math.floor(original_chips / 2)
            G.GAME.blind.chips = new_chips
            G.GAME.blind.chip_text = new_chips
            return {
                card = card,
                blind_mod = 0.5,
                G.GAME.blind:disable(),
                card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("ph_boss_disabled")})
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        -- idk
    end,
    -- tocó hacer copia y pega para que amarre XDDDDDDDDDD

    calculate = function(self, card, context)
        if context.setting_blind and (G.GAME.blind:get_type() == "Boss") then
            local original_chips = G.GAME.blind.chips
            local new_chips = math.floor(original_chips / 2)
            G.GAME.blind.chips = new_chips
            G.GAME.blind.chip_text = new_chips
            return {
                card = card,
                blind_mod = 0.5,
                G.GAME.blind:disable(),
                message = localize("ph_boss_disabled"),
                colour = G.C.NEGATIVE
            }
        end
    end
}

--- La Realeza

SMODS.Atlas {
    key = "tharoyalty",
    path = "tharoyalty.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "tharoyalty",
    atlas = "tharoyalty",
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 6}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.poker_hands then
            if
                (context.poker_hands["Straight Flush"] and next(context.poker_hands["Straight Flush"])) or
                    (context.poker_hands["Royal Flush"] and next(context.poker_hands["Royal Flush"]))
             then
                return {
                    message = localize("paru_royalty"),
                    colour = G.C.GOLD,
                    Xmult_mod = card.ability.extra.Xmult
                }
            end
        end

        if context.forcetrigger then
            return {
                message = localize("paru_royalty"),
                colour = G.C.GOLD,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end
}

--- What the Helly?

SMODS.Atlas {
    key = "whthelly",
    path = "whthelly.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "whthehelly",
    atlas = "whthelly",
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                card = card,
                message = localize("paru_wtf"),
                colour = G.C.MULT,
                Xmult_mod = card.ability.extra.Xmult
            }
        end
    end
}

--- 67
SMODS.Atlas {
    key = "sixtyseven",
    path = "67.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "sixseven",
    atlas = "sixtyseven",
    rarity = 3,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {Xmult = 6.7}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.Xmult}}
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local has_six = false
            local has_seven = false
            if context.scoring_hand then
                for _, c in ipairs(context.scoring_hand) do
                    if c.base.value == "6" then
                        has_six = true
                    end
                    if c.base.value == "7" then
                        has_seven = true
                    end
                    if has_six and has_seven then
                        break
                    end
                end
            end

            if has_six and has_seven then
                return {
                    card = card,
                    Xmult_mod = card.ability.extra.Xmult,
                    message = "67",
                    colour = G.C.MULT
                }
            end
        end
    end
}

--- Gold Paru

SMODS.Atlas {
    key = "goldparu",
    path = "goldparu.png",
    px = 72,
    py = 97
}

SMODS.Joker {
    key = "goldparu",
    atlas = "goldparu",
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {money_per_gold = 2}},
    loc_vars = function(self, info_queue, card)
        local gold_cards = calculate_gold_amount()
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
        return {vars = {card.ability.extra.money_per_gold, gold_cards * card.ability.extra.money_per_gold}}
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
            local gold_cards = calculate_gold_amount()
            if gold_cards > 0 then
                local money_earned = gold_cards * card.ability.extra.money_per_gold
                G.E_MANAGER:add_event(
                    Event(
                        {
                            func = function()
                                ease_dollars(money_earned)
                                return true
                            end
                        }
                    )
                )
                return {
                    message = "+" .. money_earned .. "$",
                    colour = G.C.GOLD
                }
            end
        end
    end
}

--- La hechicera Bri

SMODS.Atlas {
    key = "witchbri",
    path = "witchbri.png",
    px = 72,
    py = 97
}

SMODS.Joker {
    key = "witchbri",
    atlas = "witchbri",
    rarity = 4,
    cost = 30,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {active = true}},
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {key = "e_negative_consumable", set = "Edition", config = {extra = 1}}
        return {vars = {card.ability.extra.active}}
    end,
    active = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.active = true

            if not card.ability.extra.active then
                return
            end

            local _planet = nil
            if G.GAME.current_round and G.GAME.current_round.most_played_poker_hand then
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == G.GAME.current_round.most_played_poker_hand then
                        _planet = v.key
                        break
                    end
                end
            end

            if not _planet then
                local first_key = next(G.P_CENTER_POOLS.Planet)
                if first_key then
                    _planet = first_key
                end
            end

            if not _planet then
            --- erorr
            end

            if G.GAME.blind:get_type() ~= "Boss" then
                for i = 1, 6 do
                    local new_card = create_card(nil, G.consumeables, nil, nil, nil, nil, _planet, "witchbri")
                    new_card:set_edition({negative = true}, true) -- Tu sintaxis que funciona
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                end
                card.ability.extra.active = false
                return {message = localize("paru_witchbri1")}
            else
                for i = 1, 3 do
                    local new_card = create_card(nil, G.consumeables, nil, nil, nil, nil, "c_black_hole", "witchbri")
                    new_card:set_edition({negative = true}, true)
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                end
                card.ability.extra.active = false
                return {message = localize("paru_witchbri2")}
            end
        end
    end
}

SMODS.Atlas {
    key = "kingalex",
    path = "alex.png",
    px = 72,
    py = 97
}

SMODS.Joker {
    key = "kingalex",
    atlas = "kingalex",
    rarity = 4,
    cost = 30,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {Xmult = 4, xchips = 4, additional = 1, currentquip = 0}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.xchips, card.ability.extra.additional}}
    end,
    update = function(self, card, dt)
        if G.jokers then
            local king_amount = G.playing_cards and calculate_king_amount() or 0
            Xmult_mod = (card.ability.extra.additional * king_amount)
            card.ability.extra.Xmult = Xmult_mod
            xchip_mod = (card.ability.extra.additional * king_amount)
            card.ability.extra.xchips = xchip_mod
        end
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.currentquip = card.ability.extra.currentquip + 1
            if card.ability.extra.currentquip > 8 then
                card.ability.extra.currentquip = 1
            end
            return {
                Xmult = Xmult_mod,
                x_chips = xchip_mod,
                message = "^w^",
                colour = G.C.MULT
            }
        end
    end
}

--- Las novias

SMODS.Atlas {
    key = "happycouple",
    path = "lasnovias.png",
    px = 71,
    py = 97
}

SMODS.Joker {
    key = "happycouple",
    atlas = "happycouple",
    rarity = 3,
    cost = 9,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    demicoloncompat = true,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {Xmult = 2, additional = 2, currentquip = 0}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = {card.ability.extra.Xmult, card.ability.extra.additional, card.ability.extra.currentquip}}
    end,
    update = function(self, card, dt)
        if G.jokers then
            local wildamount = G.playing_cards and calculate_wild_amount() or 0
            Xmult_mod = (card.ability.extra.additional * wildamount)
            card.ability.extra.Xmult = Xmult_mod
        end
    end,
    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.currentquip = card.ability.extra.currentquip + 1
            if card.ability.extra.currentquip > 8 then
                card.ability.extra.currentquip = 1
            end
            return {
                Xmult = Xmult_mod,
                message = "X" .. card.ability.extra.Xmult .. " multi",
                colour = G.C.MULT
            }
        end
    end
}

--- Comodín roto

SMODS.Atlas {
    key = "brokenjkr",
    path = "brokenjoker.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "brokenjoker",
    atlas = "brokenjkr",
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {chips = 600, idk = 2}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.idk
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.idk)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.idk)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips,
                message = ":P",
                colour = G.C.blue
            }
        end
    end
}

--- Paru 8-bits

SMODS.Atlas {
    key = "8bitparu",
    path = "8bitparu.png",
    px = 71,
    py = 97
    --[[acá tuve un error con el sprite
	haciendo que tenga que sumar un 1 (96+1 lol) a las dimensiones
	debido a que era mi primera vez usando Aseprite xd]]
}

SMODS.Joker {
    key = "8bitparu",
    atlas = "8bitparu",
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    config = {extra = {mult = 4, chips = 15}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chip_mod = card.ability.extra.chips,
                message = ":D",
                colour = G.C.blue
            }
        end
    end
}

--- CaRÁ DéMÄCRæD4

SMODS.Atlas {
    key = "awflfc",
    path = "awfulface.png",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "awfulface",
    atlas = "awflfc",
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {mult = 25, chance = 128, roundssince = 0}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.chance
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.end_of_round then
            if pseudorandom("awfulface") < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                destroyCard(card)
                return {message = localize("paru_destroyed")}
            end
        end
    end
}

--- ERROR 666

SMODS.Atlas {
    key = "error666",
    path = "ERROR666.PNG",
    px = 71,
    py = 96
}

SMODS.Joker {
    key = "error666",
    atlas = "error666",
    rarity = 2,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 0, y = 0},
    config = {extra = {chips = 175, Xmult = 3, chance = 1024, roundssince = 0}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.Xmult,
                G.GAME.probabilities.normal,
                card.ability.extra.chance
            }
        }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                card = card,
                chip_mod = card.ability.extra.chips,
                Xmult_mod = card.ability.extra.Xmult,
                message = "X" .. card.ability.extra.Xmult .. " multi",
                colour = G.C.MULT
            }
        end

        if context.end_of_round then
            if pseudorandom("error666") < (G.GAME.probabilities.normal / card.ability.extra.chance) then
                destroyCard(card)
                return {message = localize("paru_destroyed")}
            end
        end
    end
}

--- functions lmao
--[[ no mamen, banda, casi todo esto
son funciones para calcular cuántas cartas
hay en la baraja xdddddd

y no mamen, casi todo esto es Ctrl+C Ctrl+V
xdddddddddd
]]
function calculate_three_amount()
    local count = 0
    for _, card in ipairs(G.playing_cards) do
        local rank = card.base.value
        if rank == "3" then
            count = count + 1
        end
    end
    return count
end

function calculate_king_amount()
    local count = 0
    for _, card in ipairs(G.playing_cards) do
        local rank = card.base.value
        if rank == "King" then
            count = count + 1
        end
    end
    return count
end

function calculate_gold_amount()
    local count = 0
    -- acá se inspeccionan todas las pinches cartas en la baraja y en la mano
    if G.deck and G.deck.cards then
        for i, card in ipairs(G.deck.cards) do
            local has_gold_seal = SMODS.has_enhancement(card, "m_gold") and "sí" or "no"
            local card_name = card.ability and card.ability.name or "desconocida"
            if SMODS.has_enhancement(card, "m_gold") then
                count = count + 1
            end
        end
    else
        --- idk
    end
    if G.hand and G.hand.cards then
        for i, card in ipairs(G.hand.cards) do
            local has_gold_seal = SMODS.has_enhancement(card, "m_gold") and "sí" or "no"
            local card_name = card.ability and card.ability.name or "desconocida"
            if SMODS.has_enhancement(card, "m_gold") then
                count = count + 1
            end
        end
    else
        --- erorr
    end
    return count
end
--- acá pues lo mismo de las cartas de oros, pero esta vez son las "wild" o versátiles
function calculate_wild_amount()
    local count = 0
    if G.deck and G.deck.cards then
        for i, card in ipairs(G.deck.cards) do
            local has_wild_seal = SMODS.has_enhancement(card, "m_wild") and "sí" or "no"
            local card_name = card.ability and card.ability.name or "desconocida"
            if SMODS.has_enhancement(card, "m_wild") then
                count = count + 1
            end
        end
    else
        --- idk
    end
    if G.hand and G.hand.cards then
        for i, card in ipairs(G.hand.cards) do
            local has_wild_seal = SMODS.has_enhancement(card, "m_wild") and "sí" or "no"
            local card_name = card.ability and card.ability.name or "desconocida"
            if SMODS.has_enhancement(card, "m_wild") then
                count = count + 1
            end
        end
    else
        --- erorr
    end
    return count
end

function destroyCard(card)
    --[[ Tuve que hacer esto
    porque no sé cómo destruir comodines
    de forma segura y
    sin que el pinche juego
    dé error .·´¯`(>▂<)´¯`·. ]]
    play_sound("tarot1")
    card:remove()
    card = nil
end

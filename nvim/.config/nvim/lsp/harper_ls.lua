return {
  settings = {
    ["harper-ls"] = {
      diagnosticSeverity = "hint",
      dialect = "American",
      linters = {
        SpellCheck = false,                   -- Prefer nvim's spellchecker with spellwarn
        SentenceCapitalization = false,       -- Capitalize start of sentences
        SemicolonApostrophe = false,          -- Corrects semicolons to apostrophes, but may be wrong
        BoringWords = true,                   -- Warns about boring words, TODO: see if is good
        AvoidCurses = false,                  -- Warns about swearing
        ToDoHyphen = false,                   -- Hyphenates to-do
        -- Word expansions
        ExpandStandardInputAndOutput = false, -- Expands stdin, stdout, and stderr
        ExpandTimeShorthands = false,         -- Expands things like 'hrs' to 'hours'
        ExpandArgument = false,               -- Expands arg to argument, don't want that
        ExpandDependencies = false,           -- Expands deps to dependencies
        ExpandMinimum = false,                -- Expands min to miniumum
        -- Initialism expansions
        BeRightBack = false,                  -- BRB to "be right back"
        ByTheWay = false,                     -- BTW to "by the way"
        TalkToYouLater = false,               -- TTYL to "talk to you later"
        OhMyGod = false,                      -- OMG to "oh my god"
        AsFarAsIKnow = false,                 -- AFAIK to "as far as I know"
        InMyOpinion = false,                  -- IMO to "in my opinion"
        InMyHumbleOpinion = false,            -- IMHO to "in my humble opinion"
        AsSoonAsPossible = false,             -- ASAP to "as soon as possible"
        NeverMind = false,                    -- NVM to "nevermind"
        ToBeHonest = false,                   -- TBH to "to be honest"
        ForYourInformation = false,           -- FYI to "for your information"
      }
    }
  }
}

-- TODO: might want different settings for markdown, such as SentenceCapitalization enabled

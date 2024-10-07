local Translations = {
    Notification = {
        info = "Informatie",
        warning = "Waarschuwing",
        success = "Succes",
        error = "Fout",
    },
    info = {

    },
    warning = {

    },
    success = {

    },
    error = {

    },
    prog = {
        name = "Munitie Uitpakken",
        cancelled = "Geannuleerd",
    },
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
    })
end

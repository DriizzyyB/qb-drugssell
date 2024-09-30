-- File: qb-drugs/config.lua
Config = {}

Config.DiscordWebhook = 'https://discord.com/api/webhooks/1260580916707725332/a42qJno2SLagsDYZ5DWUiAXcj1EGwiW6XR11iXRttUP4pMx1XELZNkf2HAsXdJ0VP5QT'

Config.Drugs = {
    weed = {
        displayName = 'Weed',
        rawDisplayName = 'Raw Weed',
        raw = 'weed_whitewidow_seed',
        processed = 'weed_whitewidow',
        price = { min = 25, max = 100 },
        farmAmount = { min = 1, max = 10 },
        processAmount = { min = 1, max = 10 },
        sellAmount = { min = 1, max = 5 },
        locations = {
            farm = { x = 2808.28, y = -709.25, z = 2.70 },
            process = { x = 1299.77, y = -1740.72, z = 54.28 },
            sell = { x = 92.48, y = -1956.76, z = 20.69 }
        }
    },
    coke = {
        displayName = 'Cocaine',
        rawDisplayName = 'Raw Cocaine',
        raw = 'acetone',
        processed = 'cokebaggy',
        price = { min = 50, max = 250 },
        farmAmount = { min = 1, max = 5 },
        processAmount = { min = 1, max = 5 },
        sellAmount = { min = 1, max = 4 },
        locations = {
            farm = { x = 545.34, y = 2664.34, z = 42.16 },
            process = { x = 1033.26, y = 2430.89, z = 45.33 },
            sell = { x = 111.17, y = -1959.91, z = 20.65 }
        }
    },
    meth = {
        displayName = 'Meth',
        rawDisplayName = 'Raw Meth',
        raw = 'ephedrine',
        processed = 'meth',
        price = { min = 250, max = 500 },
        farmAmount = { min = 1, max = 3 },
        processAmount = { min = 1, max = 3 },
        sellAmount = { min = 1, max = 2 },
        locations = {
            --farm = { x = 545.34, y = 2664.34, z = 42.16 },
            process = { x = 2461.89, y = 1576.00, z = 33.11 },
            sell = { x = 117.16, y = -1922.92, z = 20.89 }
        }
    },
    heroin = {
        displayName = 'Heroin',
        rawDisplayName = 'Raw Heroin',
        raw = 'raw_heroin',
        processed = 'heroin',
        price = { min = 120, max = 360 },
        farmAmount = { min = 1, max = 3 },
        processAmount = { min = 1, max = 2 },
        sellAmount = { min = 1, max = 2 },
        locations = {
            farm = { x = -1202.86, y = 23.96, z = 49.64 },
            process = { x = -492.83, y = -2685.50, z = 20.68 },
            sell = { x = 59.24, y = -1925.04, z = 22.10 }
        }
    },
    lean = {
        displayName = 'Lean',
        rawDisplayName = 'Cough Syrup',
        raw = 'coughsyrup',
        processed = 'lean',
        price = { min = 75, max = 225 },
        farmAmount = { min = 1, max = 5 },
        processAmount = { min = 1, max = 5 },
        sellAmount = { min = 1, max = 5 },
        locations = {
            --farm = { x = -1102.16, y = -1645.08, z = 4.52 },
            process = { x = -2312.69, y = 326.00, z = 169.60 },
            sell = { x = 41.93, y = -1910.18, z = 22.10 }
        }
    },
    perc30 = {
        displayName = 'Perc 30',
        rawDisplayName = 'Fentanyl',
        raw = 'fentanyl',
        processed = 'perc30',
        price = { min = 500, max = 1500 },
        farmAmount = { min = 1, max = 2 },
        processAmount = { min = 1, max = 4 },
        sellAmount = { min = 1, max = 10 },
        locations = {
            --farm = { x = 200.0, y = -1500.0, z = 29.0 },
            process = { x = -34.38, y = -1684.70, z = 29.39 },
            sell = { x = 53.53, y = -1874.78, z = 22.42 }
        }
    }
}
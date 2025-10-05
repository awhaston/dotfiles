-- Utility functions
M = {
    oct2bin = {
        ['0'] = '000',
        ['1'] = '001',
        ['2'] = '010',
        ['3'] = '011',
        ['4'] = '100',
        ['5'] = '101',
        ['6'] = '110',
        ['7'] = '111'
    },
    getOct2bin = function(a) return M.oct2bin[a] end,
    convertBin = function(n)
        local s = string.format('%o', n)
        s = s:gsub('.', M.getOct2bin)
        return s
    end,
}

return M

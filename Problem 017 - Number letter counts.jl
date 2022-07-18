#=
Number letter counts

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
=#
function genDigitDicts()
    modular(x, dict, code) = Dict(x .=> [dict[n] * " " * code for n in x])
    x = 0:9
    ## Single digits
    digits = Dict(x .=> ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"])
    ## Teens
    teens = Dict(x .=> ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"])
    ## Tens
    tens = Dict(x .=> ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"])
    ## Hundreds
    hundreds = modular(x, digits, "hundred")
    hundreds[0] = ""
    ## Thousands
    thousands = modular(x, digits, "thousand")
    thousands[0] = ""
    digits, teens, tens, hundreds, thousands
end

function toString(n::Integer)
    digits, teens, tens, hundreds, thousands = genDigitDicts()
    toInt(n::Char) = parse(Int, n)
    splitDigits(n::Integer) = n |> string |> collect .|> toInt
    function convertTens(n::Integer)
        v = n |> splitDigits
        if n < 10
            digits[n]
        elseif n < 20
            teens[v[2]]
        elseif n < 100
            tens[v[1]] * " " * digits[v[2]]
        end
    end
    if n > 1000
        error("n must be 1000 or less")
    end
    if n < 100
        n |> convertTens
    elseif n < 1000
        r = n % 100
        if r == 0
            hundreds[splitDigits(n)[1]]
        else
            hundreds[splitDigits(n)[1]] * " and " * convertTens(r)
        end
    else
        thousands[1]
    end
end

function countString(n::String)
    filterSpace(n) = filter(χ -> χ != ' ', n)
    n |> collect |> filterSpace |> length
end

1:1000 .|> toString .|> countString |> sum
# 21124

90:101 .|> toString |> print

1000 |> toString |> countString

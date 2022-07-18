#=
Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
=#

function rebase(x, base = 10)
    len = length(x)
    function rebaseRev(x, base = base, len = len, index = 1)
        if x[index] >= base
            x[index] = x[index] % base
            if index == len
                append!(x, 1)
                x
            else
                x[index + 1] += 1
                rebaseRev(x, base, len, index + 1)
            end
        else
            if index == len
                x
            else
                rebaseRev(x, base, len, index + 1)
            end
        end
    end
    rebaseRev(reverse(x), base, len) |> reverse
end

function toDen(base, pow, dec = [1])
    dec = rebase(dec .* base, 10)
    if pow == 1
        dec
    else
        toDen(base, pow - 1, dec)
    end
end

toDen(2, 1000) |> sum
# 1366

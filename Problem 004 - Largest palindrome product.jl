#=
A palindromic number reads the same both ways.

The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

# From largest palindrome downwards, check if product of two and stop if so

largest = 999 * 999
toDenary(N, pad = 1) = digits(N, base = 10, pad = pad) |> reverse

function isPalindrome(N)
    δ = toDenary(N)
    n = length(δ)
    index = 1:floor(Int, n / 2)
    all(δ[i] == δ[n + 1 - i] for i in index)
end

function factor2(N, nDigits = 2, start = 2)
    limit = floor(Int, N ^ 0.5)
    if (N % start == 0)
        p = start
        q = floor(Int, N / p)
        testDigit(p) = (p >= 10 ^ (nDigits - 1)) & (p < 10 ^ nDigits)
        if testDigit(p) & testDigit(q)
            [p, q]
        end
    elseif start < limit
        factor2(N, nDigits, start + 1)
    else
        false
    end
end

function getBiggestPalindrome(nDigits = 3)
    cap = (10 ^ nDigits - 1) ^ 2
    function searchPalindromes(start)
        factors = factor2(start, nDigits)
        if isPalindrome(start) & (factors isa Vector{Int64})
            if all(length(x) == nDigits for x in factors)
                Dict("p" => start, "f" => factors)
            end
        end
        searchPalindromes(start - 1)
    end
    searchPalindromes(cap)
end

getBiggestPalindrome(2)

isPalindrome(91019)
factor2(9009)
(n + 1) % 2

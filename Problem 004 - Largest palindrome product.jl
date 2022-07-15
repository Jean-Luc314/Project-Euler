#=
A palindromic number reads the same both ways.

The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=#

# From largest palindrome downwards, check if product of two and stop if so

toDenary(N, pad = 1) = digits(N, base = 10, pad = pad) |> reverse

function isPalindrome(N)
    δ = toDenary(N)
    n = length(δ)
    index = 1:floor(Int, n / 2)
    all(δ[i] == δ[n + 1 - i] for i in index)
end

function factor2(N::Integer, nDigits::Integer = 2, start::Integer = 2)
    limit = floor(Int, N ^ 0.5)
    if start > limit
        false
    else
        if N % start == 0
            p = start
            q = floor(Int, N / p)
            testDigit(p) = (p >= 10 ^ (nDigits - 1)) & (p < 10 ^ nDigits)
            if testDigit(p) & testDigit(q)
                p, q
            else
                factor2(N, nDigits, start + 1)
            end
        else
            factor2(N, nDigits, start + 1)
        end
    end
end

function largestPal(nDigits)
    min = (10 ^ (nDigits - 1)) ^ 2
    max = (10 ^ nDigits - 1) * 10 ^ nDigits
    palindromes = filter(isPalindrome, min:max)
    # Could have built the palindromes
    p, q = last(filter(n -> n != false, map(n -> factor2(n, nDigits), palindromes)))
    Dict("Palindrome" => p * q, "p" => p, "q" => q)
end

largestPal(3)

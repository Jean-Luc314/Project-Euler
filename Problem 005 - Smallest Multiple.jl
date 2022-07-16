#=
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=#

primeList = [2, 3, 5, 7, 11, 13, 17, 19]

function getExp(n, p, count = 0)
    if n % p == 0
        getExp(floor(Int, n / p), p, count + 1)
    else
        count
    end
end

primeFactor(n) = [getExp(n, p) for p in primeList]

maxExp(v, w) = map((x, y) -> maximum([x, y]), v, w)

factors = map(primeFactor, 2:20)

exponents = reduce(maxExp, factors)

θ = reduce(*, map(^, primeList, exponents))
# 232792560

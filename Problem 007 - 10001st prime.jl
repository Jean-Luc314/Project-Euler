#=
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=#

# Sieve of Eratosthenes
function isFactor(f)
    function isDivisible(n)
        n % f == 0
    end
    isDivisible
end
# Recursion implementation depth become too large, while loop instead
function sieve(N)
    N = 2:N
    index = 2
    primes = []
    while index < last(N)
        if index in N
            append!(primes, index)
            N = filter(!isFactor(index), N)
        end
        index += 1
    end
    primes
end
sieve(110000)[10001]
# 104743

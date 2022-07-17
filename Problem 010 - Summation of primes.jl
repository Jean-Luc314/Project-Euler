#=
Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=#
include("Problem 007 - 10001st prime.jl")
N = 2e6
sum(sieve(N))
# 142913828922

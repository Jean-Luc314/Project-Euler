## Problem 1

#=
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.

The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=#

N = 10

function findMultiples(N, multList)
  intList = 1:(N - 1)
  isDivisible(n::Integer, m::Integer) = n // m == n / m
  orList(x, y) = x .|| y
  divisibleList = map(m -> map(n -> isDivisible(n, m), intList), multList)
  divisibleList = reduce(orList, divisibleList)
  intList[divisibleList]
end

mults = findMultiples(1000, [3, 5])
sum(mults)
# 233168

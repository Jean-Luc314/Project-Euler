#=
Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#

N = 1000
θ = 1:N - 2
X = [x for x in θ for y in θ]
Y = [y for x in θ for y in θ]
Z = (X .^ 2 + Y .^ 2) .^ 0.5

cond = map((a, b, c) -> a + b + c == N, X, Y, Z)

triple = [(X[cond][i], Y[cond][i], Z[cond][i]) for i in 1:sum(cond)]

prod(triple[1])

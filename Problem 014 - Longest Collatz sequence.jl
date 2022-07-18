#=
Longest Collatz sequence

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
=#

function f(n::Integer)::Integer
    if Bool(n % 2)
        3 * n + 1
    else
        Int(n / 2)
    end
end
# Potential way to reduce computation with memoization in `seen`
function appendPath!(path::Vector{Int64}, seen::Vector{Int64}, start::Integer)::Vector{Int64}
    index = 1:length(seen)
    lookup = Dict(seen .=> index)
    append!(path, seen[lookup[start]:end])
    path
end

function chain(start, path = [], seen = [])
    if start == 1
        append!(path, start)
        path
    elseif start in seen
        appendPath!(path, seen, start)
        path
    else
        append!(path, start)
        chain(f(start), path, seen)
    end
end

chain(1 * 10 ^ 6 - 1)

limit = 10 ^ 6 - 1

chains = [chain(n) for n in 1:limit]

len = map(length, chains)

lenMax = len |> maximum

filter(n -> length(n) == lenMax, chains)[1][1]
# 837799

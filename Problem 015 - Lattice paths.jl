#=
Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=#

# Count the paths from (0, 0) -> (N, N)
# Steps are x = (1, 0) and y = (0, 1)
# The paths are a bijection over Nx + Ny
# So, there is total length 2N = N + N
# and there are choose(2N, (N, N)) ways to select N x's and N y's
N = 20
binomial(2N, N)
# 137846528820

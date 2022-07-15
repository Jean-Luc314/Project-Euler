#=
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=#

N = 600851475143
isMultiple(x, X) = x % X == 0
function isPrime(x::Integer)
  if x == 1
    false
  else
    maxTest = floor(Int, x ^ 0.5)
    function testPrime(obs, x)
      if obs == 1
        true
      elseif isMultiple(x, obs)
        false
      else
        testPrime(obs - 1, x)
      end
    end
    testPrime(maxTest, x)
  end
end

function getSmallestPrime(n::Integer, start = 2)
  if isPrime(start) & isMultiple(n, start)
    start
  else
    getSmallestPrime(n, start + 1)
  end
end

function getExponent(N, p, e = 0)
  if isMultiple(N, p)
    getExponent(floor(Int, N / p), p, e + 1)
  else
    [N, e]
  end
end

function factor(N, primes = [], exponents = [])
  if N == 1
    return Dict("p" => primes, "e" => exponents)
  else
    p = getSmallestPrime(N)
    ans = getExponent(N, p)
    N = ans[1]
    e = ans[2]
    append!(primes, p)
    append!(exponents, e)
    factor(N, primes, exponents)
  end
end

primeFactorrs = factor(N)

last(primeFactorrs["p"])

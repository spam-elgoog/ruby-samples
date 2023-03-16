require 'openssl'

def is_prime_simple(n)
  if n <= 1
    return false
  elsif n <= 3
    return true
  elsif n % 2 == 0 || n % 3 == 0
    return false
  end

  i = 5
  while i * i <= n
    if n % i == 0 || n % (i + 2) == 0
      return false
    end
    i += 6
  end

  return true
end

# complex
def is_prime(n)
  if n <= 1
    return false
  elsif n <= 3
    return true
  elsif n % 2 == 0 || n % 3 == 0
    return false
  end

  # Perform the Baillie-PSW test
  miller_test_result = miller_rabin_test(n)
  # lucas_test_result = lucas_pseudoprime_test(n)
  p "Miller test result: #{miller_test_result}"
  p "Lucas test result: #{lucas_test_result}"
  return miller_test_result # && lucas_test_result
end

def miller_rabin_test(n)
  # Use OpenSSL's built-in primality test for small values of n
  if n < 341_550_071_728_321
    return OpenSSL::BN.new(n).prime?
  end

  # Compute s and d such that n-1 = 2^s * d
  s = 0
  d = n - 1
  while d % 2 == 0
    s += 1
    d /= 2
  end

  # Perform the Miller-Rabin test with k=20 random bases
  k = 20
  k.times do
    a = rand(2..(n-2))
    x = a.mod_exp(d, n)
    next if x == 1 || x == n - 1
    (s-1).times do
      x = x.mod_exp(2, n)
      return false if x == 1
      break if x == n - 1
    end
    return false if x != n - 1
  end

  return true
end

def lucas_pseudoprime_test(n)
  # Use the Baillie-PSW sequence to test for primality
  # See: https://en.wikipedia.org/wiki/Baillie%E2%80%93PSW_primality_test
  d = 5
  while true
    if jacobi_symbol(d, n) == -1
      return false
    end
    s = 0
    t = n - 1
    while t % 2 == 0
      s += 1
      t /= 2
    end
    u = lucas_sequence(d, n, t)
    if u == 0 || u == 2**(s+1)
      return true
    end
    d = (d**2 - 2) % n
  end
end

def jacobi_symbol(a, n)
  # Compute the Jacobi symbol (a/n) using the law of quadratic reciprocity
  # See: https://en.wikipedia.org/wiki/Jacobi_symbol#Calculating_the_Jacobi_symbol
  if a == 0
    return 0
  elsif a == 1
    return 1
  elsif a % 2 == 0
    return jacobi_symbol(a/2, n) * (((n**2 - 1) % 8 == 0) ? 1 : -1)
  elsif a >= n
    return jacobi_symbol(a % n, n)
  elsif a % 4 == 3 && n % 4 == 3
    return -jacobi_symbol(n, a)
  else
    return jacobi_symbol(n % a, a) * (((a-1)*(n-1) % 8 == 0) ? 1 : -1)
  end
end

# recursive
# def lucas_sequence(p, q, n)
#   # Compute the n-th Lucas sequence number modulo the prime p
#   # See: https://en.wikipedia.org/wiki/Lucas_sequence#Definition
#   if n == 0
#     return 2 % p
#   elsif n == 1
#     return q % p
#   else
#     a = lucas_sequence(p, q, n-1)
#     b = lucas_sequence(p, q, n-2)
#     return (p + q)*(a + b) % p
#   end
# end

def lucas_sequence(p, q, n)
  # Compute the n-th Lucas sequence number modulo the prime p
  # See: https://en.wikipedia.org/wiki/Lucas_sequence#Definition
  if n == 0
    return 2 % p
  elsif n == 1
    return q % p
  else
    a = 2 % p
    b = q % p
    (2..n).each do |i|
      c = (p + q) % p
      d = (q * a) % p
      a = c
      b = d
    end
    return b
  end
end
# 100_000_000_637
input1 = 100_000_000_637
input1b = 100_000_000_699
input2 = 1_000_000_087 
input2b = 1000000033 # optimized: false, simple: true
input3 = 10_000_000_097 # returns false  huh
large_input = 341_550_071_728_321
#p is_prime(large_input)
# p "simple: #{is_prime_simple(input2b)}"

def me(n)
  d = n - 1
  while (d % 2 == 0) do
    d /= 2
  end
  a = rand(OpenSSL::BN.new(2)..(OpenSSL::BN.new(n-2)))
  a.mod_exp(8, 341_550_071_728_321)
end

puts me(large_input)

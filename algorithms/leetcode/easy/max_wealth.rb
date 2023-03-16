# long version
def maximum_wealth(accounts)
  i, max = -1, 0
  while (i+=1) < accounts.size do
      j, total = -1, 0
      while (j+=1) < accounts[i].size do total += accounts[i][j] end
      max = total if total > max
  end
  max
end

# one liner
def maximum_wealth2(accounts)
  accounts.map(&:sum).max
end

input = [[2,8,7],[7,1,3],[1,9,5]]
# output: 17
puts maximum_wealth input
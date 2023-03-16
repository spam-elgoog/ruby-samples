result=  [
  {
    "range_id": 18,
    "id": 1,
    "start": 1863,
    "end": 1875,
  },
  {
    "range_id": 12,
    "id": 2,
    "start": 1820,
    "end": 1844,
  },
  {
    "range_id": 19,
    "id": 3,
    "start": 1875,
    "end": 1887,
  },
  {
    "range_id": 12,
    "id": 4,
    "start": 1844,
    "end": 1856,
  },
  {
    "range_id": 18,
    "id": 5,
    "start": 1887,
    "end": 1899,
  },
  {
    "range_id": 12,
    "id": 6,
    "start": 1856,
    "end": 1868,
  }
]

# me = result.map.select { |a| (a % 3) >= 1}.sum(init = 0) { |a| a["range_id"] }
# me = result.sum(init = 0) { |a| a["range_id"] }
# result.select { |a|
#     a.in?(result.filter {|b| a['range_id'] == b['range_id']})
# }.each do 
#     # something
# end
puts result.first[:'range_id'].to_s.to_sym


result.select do |a|
	result.select do |b|
		if a == b
			# puts a,b 
			next false
		end
		b[:'range_id'] == a[:'range_id']
	end.size >= 3
end.each do |c|
	p c
	# do something with each
	# {:range_id=>12, :id=>2, :start=>1820, :end=>1844}
	# {:range_id=>12, :id=>4, :start=>1844, :end=>1856}
	# {:range_id=>12, :id=>6, :start=>1856, :end=>1868}
end
require 'set'
# alternatively store your data like so
obj =   {
	"range_id": 18,
	"id": 1,
	"start": 1863,
	"end": 1875,
}
result2 = {}

result.each do |obj|
	result2.store(
		obj[:'range_id'], result2.fetch(obj[:'range_id'], Set.new).add(obj)
	)
end
p result2.as_json




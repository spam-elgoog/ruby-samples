funny = [
{
    :name=>"cf_shank_1",
    :required=>true,
    :choices=>[
        [
            "firsttttt",
            "firsttttt"
        ],
        [
            "seconddd",
            "seconddd"
        ],
        [
            "thirddd",
            "thirddd"
        ],
        [
            "fourthhh",
            "fourthhh"
        ],
        [
            "otherrrr",
            "otherrrr"
        ]
      ],
    :sections=>[
        {
            :name=>"firsttttt",
            :fields=>[
                {
                    :name=>"cf_first_kano_1",
                    :required=>false
                }
            ]
        },
        {
            :name=>"thirddd",
            :fields=>[
                {
                    :name=>"multiselect_1",
                    :required=>true
                }
            ]
        }
    ]
}]

mandatory_item_fields_name = []

section = funny.first[:sections]
  .find {|a| a[:name] == "thirddd"}

# !!section | mandatory_item_fields_name += section[:fields].map do |a| 
#   a[:name] if a[:required]
# end.compact
mandatory_item_fields_name += if section
   section[:fields].map {|a| a[:name] if a[:required]}.compact
end

# section && mandatory_item_fields_name += section[:fields].map do |a| 
#   a[:name] if a[:required]
# end.compact

    

# p mandatory_item_fields_name.concat(me)
p mandatory_item_fields_name

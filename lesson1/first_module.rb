#!/usr/bin/ruby -w
require 'rest-client'
module Generic
    include Comparable
    @names_arr = ['rock', 'paper', 'scissors', 'lizard', 'spock']
    @nums_arr = [1,2,3,4,5,6,7,8,9,10]
    
    class Person

        attr_accessor :first_name, :last_name, :gender

        def initialize(first, last, g)
            @first_name = first
            @last_name = last
            @gender = g
        end


    end
end
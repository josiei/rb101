arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

newarr =  arr.map do |subarr|
            subarr.select {|num| num % 3 == 0}   
          end

p newarr
ret = catch(:x) {
        (1..10).each do |i|
          (1..10).each do |j|
             if i==5 and j==6
               throw :x, "i=#{i}, j=#{6}"
             end
          end
        end 
      }
puts ret

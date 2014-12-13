require 'benchmark'


Benchmark.bm do |x|

  x.report("em c: ") { 
    dir = File.dirname __FILE__
    %x(cd #{dir} && gcc -o collatz collatz.c)
    puts `cd #{dir} && ./collatz 1000000`

  }

  x.report("em ruby com cache: ") { 

    @cache = {}
     
    def calc value
      return @cache[value] if @cache[value]
      return 1 if value < 2
      calc = value.even? ? value >> 1 : value * 3 + 1
      part = @cache[calc] || calc(calc)
     
      @cache[value] = part + 1
    end
     
    max_steps = 0
    max_number = -1
     

    (1..1_000_000).each do |value|
      if (cc = calc(value)) > max_steps
        max_steps = cc
        max_number = value
      end
    end
    puts "#{max_number} => #{max_steps}"

  }

  x.report("em ruby sem cache: ") { 

     
    def calc value
      return 1 if value < 2
      calc = value.even? ? value >> 1 : value * 3 + 1
      part = calc(calc)
     
      part + 1
    end
     
    max_steps = 0
    max_number = -1
     

    (1..1_000_000).each do |value|
      if (cc = calc(value)) > max_steps
        max_steps = cc
        max_number = value
      end
    end
    puts "#{max_number} => #{max_steps}"

  }


end
!SLIDE bullets
# The Ruby Way #
* _A language that doesn’t affect the way you think about programming is not worth knowing_ — **Alan Perlis**

!SLIDE smbullets code small incremental
# Convenções #

* ClassNames
* method\_names and variable\_names
* methods\_asking\_a\_question?
* slightly\_dangerous\_methods!
* @instance\_variables
* $global\_variables
* SOME\_CONSTANTS or OtherConstants

!SLIDE bullets incremental
# Tudo é objeto #

* classes
* tipos primitivos
* null (nil)


!SLIDE smaller
# (Quase) tudo é uma mensagem #
	@@@ ruby
	string.index("x")  # Envia index com argumento "x"
	string.length      # Envia length sem argumentos
	run_status_reports # Envia run_status_reports para self , ele mesmo
	1 + 2              # Envia + com argumento 2 ao objeto 1
	array[i]           # Envia [] com argumento i para o array

!SLIDE smaller
# method\_missing #

	@@@ ruby
	class Gravador
	  def initialize
	    @mensagens = []
	  end

	  def method_missing(metodo, *args, &bloco)
	    @mensagens << [metodo, args, bloco]
	  end

	  def reproduza_a(obj)
	    @mensagens.each do |metodo, args, bloco|
	      obj.send(metodo, *args, &bloco)
	    end
	  end
	end

!SLIDE

	@@@ ruby
	require 'src/vcr'


	vcr = Gravador.new
	vcr.sub!(/Java/) { "Ruby" }
	vcr.upcase!
	vcr[11,5] = "Universe"
	vcr << "!"
	string = "Hello Java World"
	puts string
	vcr.reproduza_a(string)
	puts string

	# Hello Java World 
	# Hello RUBY Universe! 

!SLIDE

	@@@ ruby
	require 'builder'
	 
	b = Builder::XmlMarkup.new(:indent => 2)
	 
 	b.html {
	  b.head {
	    b.title "XML Builder Test"
   	  }

	  b.body {
	    b.h1 "Title of Page"
	    b.p "Sample paragraph text"
	  }
	}
 
	puts html

!SLIDE bullets small
# Mais dinâmica que Java #

* method\_missing
* reflection
* classes abertas
* métodos singleton
* ganchos (hooks)
* code evalutation


!SLIDE small
# Java Reflection: criação de um objeto #
	@@@ java
	public static Object create(Class c, String value)
	  throws Exception
	{
	  Constructor ctor = c.getConstructor(
	    new Class[] { String.class } );
	  return ctor.newInstance(
	    new Object[] { "Hello" } );
	}

	public static void main (String args[])
	  throws Exception
	{
	  Greeting g =
	    (Greeting) create(Greeting.class, "Hello");
	  g.show();	
	}

!SLIDE small
# Ruby Reflection: criação de um objeto #

	@@@ ruby

	def create(klass, value)
	  klass.new(value)
	end

	g = create(Greeting, "Hello")
	g.show

!SLIDE execute small
# Classes abertas (monkey patch) #
	@@@ ruby
	class Fixnum
	  def even?
	    (self % 2) == 0
	  end
	end

	(1..10).select { |n| n.even? }
	# => [2, 4, 6, 8, 10]


!SLIDE execute
# métodos singleton #

	@@@ ruby
	class Dog
	end

	rover = Dog.new
	fido = Dog.new

	def rover.speak
	  puts "Red Rover"
	end

	rover.speak  # => "Red Rover"
	fido.speak   # => NoMethodError

!SLIDE bullets
# Tipagem FORTE, não ESTÁTICA #

* Java tem tipos: Fortes, Estáticos, Explícitos
* Ruby tem tipos: Fortes, Dinâmicos, Implícitos


!SLIDE smaller
	@@@ java
	public class Fact {
	  static long factorial(long n) {
	    long result = 1;
	    for (long i=2; i<=n; i++) 
	      result *= i;
	    return result;
	  }
	  public static
	    void main (String args[]) {
	    System.out.println(factorial(20));  // 2432902008176640000
	    System.out.println(factorial(21));	// -4249290049419214848
	  }
	}


!SLIDE 
	@@@ ruby
	def factorial(n)
	  result = 1
	  (2..n).each do |i|
	    result *= i
	  end
	  result
	end

	puts factorial(20) # 2432902008176640000
	puts factorial(21) # 51090942171709440000

!SLIDE bullets
# Duck Typing #

* Se anda como um pato
* E fala como um pato
* Então, pqp, é um pato, e foda-se se não for

!SLIDE small
# Closures #


	@@@ ruby
	#iteração
	[1,2,3].each do |item|
	  puts item 
	end

	# fecha o arquivo no fim do bloco	
	file_contents = open(file_name) { |f| f.read }

	#callback
	widget.on_button_press { puts "Got Button Press" }

!SLIDE
# pare de escrever tanto código! #

!SLIDE center
# programar em Ruby é divertido #
![Divertido](divertido.jpg)

!SLIDE
# Rails #




def choose_number
while true
	$number = rand(100000)
		unless ($number.to_s.include?("0") || $number.to_s.length < 5 ) || ( $number.to_s.chars.uniq.length != 5 )
			break
		end
	end
end

def input
	while true
	$input = gets.chomp
		if $input.to_s.length != 5
			puts "Trebuie sa fie din 5 cifre"
		elsif  $input.to_s.include?("0")
			puts "Nu ai voie sa folosesti 0"
		elsif $input.to_s.chars.uniq.length != 5
			puts "Ai duplicate"
		else
			break
		end
	end
end

def potrivite
	$cont = []
	$input.chars.each_with_index do |l,index|
		#care e diferenta aici map_whit_index sau each_with_index?
		if make_array($number).include?(l)
			$cont << l
		end
	end
	# puts "Sunt #{$cont.length} potrivite"
	$cont
end

def ochite
	$matches = 0
	(0..4).each do |i|
		if make_array($number)[i] == make_array($input)[i]
		$matches += 1
		end
	end
	puts "Sunt #{ $matches} ochite"
end

def make_array(number)
	number.to_s.chars
end

def joaca
	reguli
	choose_number
	# puts"Numarul ales este: #{$number}"
	puts "Numarul ales de tine este:"
	while true
				input
				pot_ochit	
			if $number.to_s == $input.to_s
				puts "Ai castigat!!!!!!!!!!!!!!1"
				break
			end	
			puts "Incearca alta varianta:"		
	end
end

def reguli
	puts "Welcome to the Chiru's game :)"
	text = "Chiru o sa aleaga un numar(top secret)pentru tine. Dupa care tu o sa incerci sa-l ghicesti. Numarul trebuie musai sa fie din 5 cifre, fara 0 sau dubluri. Ea o sa iti spuna cate potriviri( daca in nr tau exista cifre care corespund cu cifrele din numaru ei) si cate ochite (daca exista cifre care sunt si pe aceasi pozitie) sunt. Ochitele sunt si potrivite, deci ele se scad din potrivite. Ajutandu-te de acestea trebuie sa ghicesti numarul. Jocul se termina cand cifrele tale au aceasi pozitie cu cifrele lui Chiru. Spor!"
	puts text.ljust(50)
end

def pot_ochit
	potrivite
	ochite
		if $matches != 0
 			pot = potrivite.length - $matches
 			puts "Sunt #{pot} potrivite"
 		else
 			puts "Sunt #{potrivite.length} potrivite"
 		end
end

 joaca
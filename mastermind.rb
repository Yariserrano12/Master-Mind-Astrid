require_relative 'gameboard.rb'
require_relative 'colorcode.rb'
require_relative 'hint.rb'
require_relative 'computer.rb'



class Mastermind
	attr_accessor :gameboard, :win, :turns, :color_spectrum, :player_mode, :computer

	def initialize
		@gameboard = GameBoard.new()
		@win = false
		@turns = 1
		@color_spectrum = ["red", "green", "yellow", "blue", "magenta", "cyan", "white"]
		@player_mode = true
		@computer = Computer.new()
		@nombre
	end

	def play
		instructions
		prompt_switch_mode
		set_solution if @player_mode == false
		start
	end

	def instructions
		puts "  MASTER MIND BY ASTRID "
		puts "_________________________________________________________\n\n" 
	    print "Ingresa tu nombre: "
		@nombre = gets.chomp
		puts "Hola #{@nombre} bienvenido al juego MasterMind"
		puts "Adivina el codigo!"
		puts "La computadora seleccionará un código de cuatro colores diferentes en un orden específico!"
		
		@gameboard.display
		puts "_________________________________________________________\n\n"
		puts "Verde para cada color en la posición correcta."
		puts "Roja para cada color en una posición incorrecta!" 
		puts "\nBuena Suerte #{@nombre}!"
		puts "_________________________________________________________\n\n"
	end

	def prompt_switch_mode
		puts "¿#{@nombre} quieres jugar tú o quieres que juegue la computadora? (yo/computadora)"
		mode = gets.chomp
		until mode == "computadora" || mode == "yo"
			mode = gets.chomp
		end
		puts ""
		@player_mode = false if mode == "computadora"
	end

	def set_solution
		puts "¿Cuál te gustaría que fuera tu solución?"
		puts "\nEscriba cuatro colores separados por espacios."
		print "Tus opciones son: \n> "
        @color_spectrum.each do |color|
            print color.colorize(color.to_sym) + " "
            end
		solution = get_player_guess
		@gameboard.solution = ColorCode.new(solution[0], solution[1], solution[2], solution[3])
	end

	def start
		make_guesses
		turns > 12 ? lose : win
	end

	def make_guesses
		while @win == false && @turns < 13
			prompt_guess
			guess = @player_mode ? get_player_guess : get_computer_guess
			add_guess(guess)
			@win = true if gameboard.guesses[12 - @turns].colors == gameboard.solution.colors
			@turns += 1 if @win == false
		end
	end

	def prompt_guess
		puts @player_mode ? "Es tu turno #{@turns} Adivina?" : "\nComputadora, es tu turno #{@turns} Adivina."
		puts "Escriba cuatro colores separados por espacios."
		print "Tus opciones son: \n> "
        @color_spectrum.each do |color|
             print color.colorize(color.to_sym) + " "
        end
	end

	def get_player_guess
		1.times do
			guess = gets.chomp.downcase.split(" ")

			if guess.length != 4
				print "\n¡Ingresaste la cantidad incorrecta de colores! Intentar otra vez:\n> "
				redo
			end

			if !@color_spectrum.include?(guess[0]) || !@color_spectrum.include?(guess[1]) || !@color_spectrum.include?(guess[2]) || !@color_spectrum.include?(guess[3])
				print "\n¡Solo puedes ingresar los colores especificados! Intentar otra vez:\n> "
				redo
			end

			if @player_mode == false
				if guess.uniq.length !=4
					print "\nDebes tener diferentes colores para la solución. Intentar otra vez:\n> "
					redo
				end
			end

			return guess
		end
	end


	def get_computer_guess
		@computer.guess(@gameboard.hints, @turns)
	end

	def add_guess(guess)
		gameboard.guesses[12 - @turns] = ColorCode.new(guess[0], guess[1], guess[2], guess[3])
		gameboard.refresh(12 - @turns)
	end

	def lose
		puts @player_mode ? "#{@nombre} no has podido resolver el rompecabezas. Está bien! simplemente no eres tan inteligente." : "No... he fallado."
		puts "La solución fue #{@gameboard.solution.colors}."
	end

	def win
		puts @player_mode ? "\n¡Has resuelto el código! Asombroso!" : "\n
		He resuelto el código, sorry humano. A continuación te destruiré!"
	end
end

game = Mastermind.new()
game.play
#===Clase matriz
class Matriz 

	attr_reader :fil, :col

	def initialize(fil, col)
		@fil=fil
		@col=col
		@mat = Array.new(fil){Array.new(col)}
	end
	#==Constructores
	#Constructir en el cual seleccionas el tipo de matriz	

	def Matriz.constructor(fil, col, tip)
		if(tip == 0)
			Matriz.new(fil, col)
		else
			MatrizDispersa.new(fil, col)
		end
	end
	#Constructor que crea una matriz a partir de otra(Densa)
	def Matriz.constructorcop(matrix)
		aux = 0
		for i in(0...matrix.fil)
			for j in(0...matrix.col)
				if(matrix[i,j] == 0)
				aux = aux+1
				end
			end	
		end
		#Calcula el numero de 0 de la matriz y los almacena en aux
		if(aux > (matrix.fil*matrix.col)/2)
		#Si el valor de aux es mayor que la mitad de la capacidad de la matriz, se crea una matriz dispersa, si no, se crea una densa
			a = MatrizDispersa.new(matrix.fil, matrix.col)
			for i in(0...matrix.fil)
				for j in(0...matrix.col)
					a[i,j] = matrix[i,j]
				end
			end	
		else
			return matrix
		end

	end

	#Construye una matriz a partir de un vector de elementos
	def Matriz.constructorvec(fil, col, vector)
		aux = 0
		for i in(0...vector.size)#Comprueba el numero de 0 de la matriz
				if(vector[i] == 0)
				aux = aux+1
				end
		end
		#Si e numeor de 0 es mayor que la mitad de la capacidad de la matriz se crea una matriz dispersa, en caso contrario, densa.
		if(aux > (fil*col)/2)
			a = MatrizDispersa.new(fil,col)
			for i in(0...fil)
				for j in(0...col)
					a[i,j] = vector[fil*i + j]
				end
			end	
			return a
		else
			b = Matriz.new(fil, col)
			for i in(0...fil)
				for j in(0...col)
					b[i,j] = vector[fil*i + j]
				end
			end	
			return b
		end

	end
	
	#==Metodos de acceso
	#Metodo de acceso a una posicion de la matriz
	def[](i,j)
		return @mat[i][j]
	end	
	
	#Metodo de asignacion para una posicion de la matriz
	def[]=(i,j,num)
		@mat[i][j]=num 
	end	

	#== Sobrecarga del metodo de comparacion ==
	def ==(other)
		#Si tienen las mismas filas y columnas para todos los elementos de las filas y las columnas si no hay ninguno diferente, la matriz es igual
		if(self.fil == other.fil && self.col == other.col)
			for i in(0...self.fil)
					for j in(0...self.col)
						if(self[i,j] != other[i,j])
							return false
						end
					end
			end	
			return true
		end
		return false

	end
	#==Metodo insertar
	#Inserta un elemento en una posicion de la matriz
	def insertar(i, j, num)
		self[i,j] = num
	end
	#==Metodo maximo
	#Calcula el mayor elemento de una matriz
	def maximo
		aux = self[0,0]
		for i in(0...@fil)
			for j in(0...@col)
				if(self[i,j] > aux)
				aux = self[i,j]
				end
			end	
		end	
		return aux
	end
	#==Metodo minimo
	#Calcula el menor elemento de una matriz
	def minimo
		aux = self[0,0]
		for i in(0...@fil)
			for j in(0...@col)
				if(self[i,j] < aux)
				aux = self[i,j]
				end
			end	
		end	
		return aux
	end

	#==Metodo mostrar
	#Muestra todos los elementos de la matriz con formato
	def mostrar
		for i in 0...@fil
			for j in 0...@col
				print self[i,j]
				print " "
			end 
			puts "\n"
		end
	end
	
	#==Metodo suma
	#Suma dos matrices, ya sean densas o dispersas
	def +(other)
		
		if(@fil == other.fil && @col == other.col)
		aux = Matriz.new(@fil,@col)
			 @fil.times do |i| 
				@col.times do |j|
				aux[i,j]=(self[i,j] + other[i,j])
				end
			end
		end	
		return Matriz.constructorcop(aux)
	end


	#==Metodo multiplicacion
	#Multiplica dos matrices  ya sean densas o dispersas
	def *(other)
		if(@fil == other.col)
			mult = Matriz.new(@fil, other.col)
			mult.fil.times do |i|
				mult.col.times do |j|
					mult[i,j]= 0
				end
			end

			@fil.times do |i| 
				@col.times do |j| 
					@col.times do |k| 
						mult[i,j] = mult[i,j] + (self[i,k] * other[k,j])
					
					end
				end
			end
		end
		return Matriz.constructorcop(mult)
	end
	#==Metodo rellenar aleatorio
	#Rellena la matriz con numeros aleatorios entre 0 y 9
	def rellenarAleatorio
		for i in 0...@fil
			for j in 0...@col
				self[i,j] = rand(10)
			end
		end
	end 

	def encontrar()
		@fil.times do |i|
			@col.times do |j|
				value=self[i,j]
				if(yield(value))
					return [i,j]
				end
			end
			
		end 
		return nil
	end
	
	#==Metodo coerce
	#Metodo de conversion implicita
	def coerce(object)
		[self, object]
	end

end





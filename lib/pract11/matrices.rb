class Matriz 

	attr_reader :fil, :col

	def initialize(fil, col)
		@fil=fil
		@col=col
		@mat = Array.new(fil){Array.new(col)}
	end
	
	def Matriz.constructor(fil, col, tip)
		if(tip == 0)
			Matriz.new(fil, col)
		else
			MatrizDispersa.new(fil, col)
		end
	end

	def Matriz.constructorcop(matrix)
		aux = 0
		for i in(0...matrix.fil)
			for j in(0...matrix.col)
				if(matrix[i,j] == 0)
				aux = aux+1
				end
			end	
		end

		if(aux > (matrix.fil*matrix.col)/2)
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


	def Matriz.constructorvec(fil, col, vector)
		aux = 0
		for i in(0...vector.size)
				if(vector[i] == 0)
				aux = aux+1
				end
		end

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
	
	
	def[](i,j)
		return @mat[i][j]
	end	
	
	def[]=(i,j,num)
		@mat[i][j]=num 
	end	

	def ==(other)
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
	

	def insertar(i, j, num)
		self[i,j] = num
	end

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

	

	def mostrar
		for i in 0...@fil
			for j in 0...@col
				print self[i,j]
				print " "
			end 
			puts "\n"
		end
	end
	

	def +(other)
		
		if(@fil == other.fil && @col == other.col)
		aux = Matriz.new(@fil,@col)
			# for i in (0...@fil)
			 @fil.times do |i| 
				#for j in (0...@col)
				@col.times do |j|
				aux[i,j]=(self[i,j] + other[i,j])
				end
			end
		end	
		return Matriz.constructorcop(aux)
	end


	
	def *(other)
		if(@fil == other.col)
			mult = Matriz.new(@fil, other.col)
			# for i in (0...mult.fil)
			mult.fil.times do |i|
				#for j in (0...mult.col)
				mult.col.times do |j|
					mult[i,j]= 0
				end
			end

			#for i in (0... @fil)
			@fil.times do |i| 
				#for j in (0... other.col)
				@col.times do |j| 
					#for k in (0... other.col)
					@col.times do |k| 
						mult[i,j] = mult[i,j] + (self[i,k] * other[k,j])
					
					end
				end
			end
		end
		return Matriz.constructorcop(mult)
	end
	
	
	def rellenarAleatorio
		for i in 0...@fil
			for j in 0...@col
				self[i,j] = rand(10)
			end
		end
	end 

	def coerce(object)
		[self, object]
	end

end




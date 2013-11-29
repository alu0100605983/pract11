
class Fraccion #Clase Fraccion

	attr_reader :num, :den #Se obtienen los valores numerador y denominador
	
	def initialize(num, den) # Inicializamos las variables y las reducimos a su minima expresion
		aux = mcd(num,den)
		@num = num / aux
		@den = den / aux
	end
	
	
	def num	#Metodo get para el numerador
		@num
	end

	def den	#Metodo get para el denominador
		@den
	end

	def mcd(u,v)	#Metodo del minimo comun divisor
		u,v = u.abs, v.abs #Pasamos u y v a valor absoluto
		while v != 0	
			u, v = v, u % v
		end
		return u
	end

	def simpl(other) #Metodo para simplificar las fracciones
		return Fraccion.new(other.num/mcd(other.num, other.den), other.den/mcd(other.num, other.den))
	end

	def to_s	#Metodo para convertir a string
		return "#{num}/#{den}"
	end

	def flotante	#Muestra las fracciones en punto flotante
		a = @num.to_f
		b = @den.to_f
		return a/b
	end
	
	def ==(other) #Compara si dos fracciones son iguales
		
		if(other.instance_of?(Fraccion) ==true)
			if other.num == @num
				if other.den == @den
					return true
				end
			end		
		else
			if(@den == 1)
				if(@num = other)
					return true
				end
			end
		end
		return false
	end
	
	def absoluto #Muestra la fraccion en valor absoluto
		if(@num < 0)
			@num = -@num
		end
		if(@den < 0)
			@den = -@den
		end
	end

	def reciproco #Calcula el reciproco de una fraccion
		aux=@num
		@num=@den
		@den=aux
	end
	
	def opuesto # Calcula el opuesto de una fraccion
		@num = -@num
	end
	

	def +(other) #Suma de fracciones
		if(other.instance_of?(Fraccion) ==true)
				return simpl(Fraccion.new(self.num * other.den + other.num * self.den, self.den * other.den))		
		else
				return simpl(Fraccion.new(self.num + other * self.den, self.den))
		end
		
	end
 
   
	def -(other) # Resta de fracciones
		if(other.instance_of?(Fraccion) ==true)
			return simpl(Fraccion.new(@num * other.den - other.num * @den, @den * other.den))
		else
			return simpl(Fraccion.new(self.num - other * self.den, self.den))
		end
	end

	
	def * (other) #Multiplicacion de fracciones
		if(other.instance_of?(Fraccion) ==true)
			return simpl(Fraccion.new(@num*other.num, @den*other.den)) 
		else
			return simpl(Fraccion.new(@num*other, @den)) 
		end                                             
	end 

        
        
	def / (other)  # Division de fracciones   
		if(other.instance_of?(Fraccion) ==true)                
			if(other.num == 0)
				return Fraccion.new(0,1) #La division da como resultado 0
			else                     
				simpl(Fraccion.new(@num*other.den, @den*other.num))
			end   
		else
			if(other == 0)
				return Fraccion.new(0,1) #La division da como resultado 0
			else                     
				simpl(Fraccion.new(@num, @den*other))
			end 
		end                                                                        
	end

	def % (other) # Calcular el resto de fracciones                                      
		a = (self / other)
		b = Fraccion.new(1,1)
		c=b-a
		return c                                                                  
	end
        
	def < (other) #Compara si una fraccion es menor que otra
		x = other.flotante
		a = @num.to_f
		b = @den.to_f
		if (a/b < x)
			return true
		end
		return false
	end

	def > (other) #Compara si una fraccion es mayor que otra
		x = other.flotante
		a = @num.to_f
		b = @den.to_f

		if(a/b > x)
			return true
		end
		return false
	end


	def <= (other) #Compara si una fraccion es menor o igual que otra
		x = other.flotante
		a = @num.to_f
		b = @den.to_f
		if (a/b <= x)
			return true
		end
		return false
	end

	def >= (other) #Compara si una fraccion es mayor o igual que otra
		x = other.flotante
		a = @num.to_f
		b = @den.to_f

		if(a/b >= x)
			return true
		end
		return false
	end

	 def <=> (object)
        	  self.flotante<=>object.flotante    
    	 end
	def coerce(object)
		[self, object]
	end
		
end

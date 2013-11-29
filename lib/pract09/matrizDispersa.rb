class MatrizDispersa < Matriz

 	def initialize(filas, columnas)
                super(filas, columnas)
                @vval= Array.new 
                @vfil= Array.new
                @vcol = Array.new
        end
	
	def maximo
		aux = @vval[0]
		for i in(0...@vval.size)
			if(@vval[i] > aux)
				aux = @vval[i]
			end	
		end	
		return aux
	end

	def minimo
		aux = @vval[0]
		for i in(0...@vval.size)
			if(@vval[i] < aux)
				aux = @vval[i]
			end	
		end	
		return aux
	end

        def [](i,j)
		for a in(0...@vval.size)
               		if (@vfil[a] == i && @vcol[a] == j)
                               return @vval[a]
                        end
                end
                return 0 
        end
          
        def []= (i,j, num) 
                insertado = false
		if(num == 0)
			for a in(0...@fil.size)
               			if (@vfil[a] == i && @vcol[a] == j)
                        	        @vfil.delete_at(a)
                        	        @vcol.delete_at(a)
					@vval.delete_at(a)
					insertado = true
                        	end
			end
		else
			for a in(0...@fil.size)
               			if (@vfil[a] == i && @vcol[a] == j) 
                	                @vval[a]=num
					insertado = true
                		end
                	end
		end
		if(insertado == false)
			@vval.push num
                        @vfil.push i
			@vcol.push j
		end
	end
end

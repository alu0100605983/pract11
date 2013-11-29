load 'lib/pract09.rb' 

describe Matriz do
        before :each do       
				
                @m1=Matriz.constructorvec(3,3,[1,2,3,4,5,6,7,8,9])
                @m2=Matriz.constructorvec(3,3,[1,2,3,4,5,6,7,8,9])
                @m3=Matriz.constructorvec(3,3,[Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4),Fraccion.new(1,2),Fraccion.new(1,3),Fraccion.new(1,4)])
                @m4=Matriz.constructorvec(2,2,[Fraccion.new(1,2),Fraccion.new(2,3),Fraccion.new(3,4),Fraccion.new(4,5)])
        end

#Initialize
        describe "#Inicializar la matriz" do
                it "Se accede a los elementos" do
                        @m1[0,2].should eq(3)
                        @m1[2,2].should eq(9)
                        @m2[2,1].should eq(8) 
                end
        end

#Comprobacion de maximos y minimos
		describe "Maximos y minimos" do
			it "Minimo elemento de una matriz" do
				x = @m1.minimo
				x.should eq(1)
			end
			
			it "Maximo elemento de una matriz" do
				x = @m1.maximo
				x.should eq(9)
			end
		end


#Prueba de matrices densas y dispersas. 
	describe "Operaciones" do
                it "Suma de matrices" do
                        x=@m1+@m2
			x.should eq(Matriz.constructorvec(3,3,[2,4,6,8,10,12,14,16,18]))
                end                

                it "Suma de fracciones con enteros" do
                        (@m1+@m3).should eq(Matriz.constructorvec(3,3,[Fraccion.new(3,2), Fraccion.new(7,3), Fraccion.new(13,4),Fraccion.new(9,2), Fraccion.new(16,3), Fraccion.new(25,4),Fraccion.new(15,2), Fraccion.new(25,3), Fraccion.new(37,4)]))
                end   
        end
end


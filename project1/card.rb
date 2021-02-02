/* describe the possible attributes 
in each category of number, color, shapes ,and shading. */
class Cards
  number=[1,2,3]
  color=['R','G','P']
  shapes=['*','0','~']
  shading=[' ','<','/'
          ]
  /*create a accessor to access the variable. */
  attr_accessor :number, :color,:shapes, :shading

  /* initialize the value of number, color, shading, and shapes.
In this case, each variable only contain one element. 
For exmaple, @number is one of (1,2,3)
@color is one of (R,G,P) 
and same for shading and shapes. */
def initialize(number, color,shading, shapes)
  @number=number
  @color=color
  @shapes=shapes
  @shading=shading
end
end

/*Utilize .sample(i) to randomly return a value from each array to create string of the card. */
def return_card
  "#{number.sample(1)} #{color.sample(1)} #{shading.sample(1)}, #{shapes.sample(1)}"
end
/*since somebody says there inbuild instrument can be used in some later version of Ruby, I'm not pretty sure if there will be any problem in grading. */

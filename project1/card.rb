# describe the possible attributes 
# in each category of number, color, shapes ,and shading. 
class Card
  @@numbers=[1,2,3]
  @@colors=['R','G','P']
  @@shapes=['*','0','~']
  @@shadingTypes=[" ","<","/"]
  #create a accessor to access the variable. 
  attr_reader :number, :color,:shape, :shading

  # initialize the value of number, color, shading, and shapes.
# In this case, each variable only contain one element. 
#For exmaple, @number is one of (1,2,3)
#@color is one of (R,G,P) 
#and same for shading and shapes.
def initialize(number, color,shading, shape)
  @number=number
  @color=color
  @shape=shape
  @shading=shading
end

#getter to get numbers array
def self.getNumbers
  @@numbers
end

#getter to get color array
def self.getColors
  @@colors
end

#getter to get shapes array
def self.getShapes
  @@shapes
end

#getter to get shading array
def self.getShadingTypes
  @@shadingTypes
end

#return attributes formatted for printing purposes
def return_card
  "#{@number}#{@color}#{@shading.clone.insert(1, @shape)}"
end
#since somebody says there inbuild instrument can be used in some later version of Ruby, I'm not pretty sure if there will be any problem in grading. 
end

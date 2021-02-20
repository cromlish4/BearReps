// describe the possible attributes in each category of number, color, shapes ,and shading. 
class Card(){
    var numbers=[1,2,3];
    var colors=['R','G','P'];
    var shapes=['*','0','~'];
    var shadingTypes=["-","<","/"];
}

  /* initialize the value of number, color, shading, and shapes.
In this case, each variable only contain one element. 
For exmaple, @number is one of (1,2,3)
@color is one of (R,G,P) 
and same for shading and shapes.*/
private Card(var color, var shape, var fill, var num) {
        this.colors = colors;
        this.shapes = shapes;
        this.shadingTypes = shadingTypes;
        this.numbers = numbers;
    }

#getter to get numbers array
    var getNumber(){
	return this.numbers;
    }

#getter to get color array
 var getcolors(){
     return this.colors;
 }
    

#getter to get shapes array
 var getshapes(){
     return this.shapes;
 }
#getter to get shading array
 var getshadingTypes(){
     return this.shadingTypes;
 }
#return attributes formatted for printing purposes
function return_card(){
    printf(this.number+ this.color+this.shadingTypes+this.shapes);
}


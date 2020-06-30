//Arreglo de objetos gota
Drop[] drops = new Drop[500]; 

void setup(){
    //Función donde se declara la configuración inicial
    size(1360,760); // Tamaño de la ventana

    for(int i=0;i<drops.length;i++){
        //Recorre el arreglo para instanciar las gotas
        drops[i] = new Drop();
    }  

}
 
void draw(){
    background(230,230,250); //Color del fondo

    for(int i=0;i<drops.length;i++){
        //Recorre el arreglo para iniciar los metodos de las gotas
        drops[i].fall();
        drops[i].show();
    }  

}

//Clase Gota 
class Drop{
    //Atributos
    float x = random(width);        //Posición en x aleatoria 
    float y = random(-200, -100);   //Posición en y aleatoria
    float z = random(0, 20);
    float len = map(z,0,20,10,20);  //Tamaño en Y de la gota 
    float yspeed = map(z,0,20,4,10);


    //Métodos
    void fall(){
        y = y + yspeed; //Incremento de en 
        float grav  = map(z,0,20,0,0.2);
        yspeed = yspeed + grav; //Simulación de la acelaración de la gravedad

        if(y > height){ 
            //cuando la gota salga de la pantalla
            y = random(-200, -100);//Inicia en una posición aleatoria 
            yspeed = map(z,0,20,4,10); 
        }
    }

    void show(){
        float thick = map(z,0,20,1,3);
        strokeWeight(thick);
        stroke(#2B678C);  //Color del Cuerpo
        line(x,y,x,y+len);//
    }
}

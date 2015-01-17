//Square Class



//Title
class Square

//Variables
{
  float cX;
  int cY;
  int cWidth;
  int cHeight;
  int swtch;
  
  int i;
  int t;
  
  
  Square(float x, int y, int w, int h){
    cX = x;
    cY = y;
    cWidth = w;
    cHeight = h;
       
  }
 
  void update(){
    
    rect(random(cX,cX+60),cY,random(cWidth-50),cHeight);     
  i++;
  //println(i);
}   
   
   
    
   void bpm(float t, float p){
    if(i>p){
  i = 0;
}  
 if(i < mouseX){ 
  fill(random(mouseX,0));  
  swtch = 0;
} 
 if(i > mouseY){
   fill(random(mouseX,255),0,0);
   swtch = 1;
 }   
}
}


SinOsc s => JCRev rev =>  dac;

0.03 => rev.mix;

OscRecv recv; // Create Osc Receiver
12000 => recv.port; // use port 12000
recv.listen(); // start listening to OSC

// Create event listener
recv.event("/squares, i") @=> OscEvent squareEvent;

// global variables
int x, y;

fun void squarePoller()
{
    while( true )
    {
        squareEvent => now;
        if (squareEvent.nextMsg() != 0 )
        {
            squareEvent.getInt() => x;
           
            
            
        }   
    }
}

spork ~ squarePoller();


while( true )
{
    if(x == 0){
        50 => s.freq;
        0.09 => s.gain;
        50::ms => now;
        0.0 => s.gain;
        10::ms => now;
        
    }
    if(x == 1){
       
        4000 => s.freq;
        0.05 => s.gain;
        20::ms => now;
        0.00 => s.gain;
        20::ms => now;
    }
   
    10::ms => now;
   
}





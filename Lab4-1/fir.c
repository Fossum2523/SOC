#include "fir.h"



void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	//initial your fir
	
	for(counter_0=0;counter_0<N;counter_0++){
		inputbuffer[counter_0]=0;
		outputsignal[counter_0]=0;
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	//write down your fir
	
	

	for(counter_1=0;counter_1<N;counter_1++){
		
		for(counter_2=N-1;counter_2>=0;counter_2--){
			if(counter_2==0){
				inputbuffer[0]=inputsignal[counter_1];
				pre_data=inputsignal[counter_1];
			}else {
				inputbuffer[counter_2]=inputbuffer[counter_2-1];
				pre_data=inputbuffer[counter_2];
			}
			outputsignal[counter_1] += pre_data * taps[counter_2];
		
		}
		//outputsignal[counter_1]=5;
		//return outputsignal[counter_1];
		
	}
	return outputsignal;
}
		

#include <defs.h>
#include <user_uart.h>
#include <irq_vex.h>

#include "matmul.h"
#include "fir.h"
#include "qsort.h"

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write(int n)
{
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = n;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_char(char c)
{
	if (c == '\n')
		uart_write_char('\r');

    // wait until tx_full = 0
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = c;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_string(const char *s)
{
    while (*s)
        uart_write_char(*(s++));
}


char __attribute__ ( ( section ( ".mprj" ) ) ) uart_read_char()
{
	char num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}

int __attribute__ ( ( section ( ".mprj" ) ) ) uart_read()
{
    int num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	for(int i=0; i<N; i++) {
		inputbuffer[i] = 0;
		outputsignal[i] = 0;
	}
}

int __attribute__ ( ( section ( ".mprjram" ) ) ) firfilter(int inputsample){
	for(int i=N-1; i>0; i--){
		inputbuffer[i] = inputbuffer[i-1];
	}
	inputbuffer[0] = inputsample;
	
	int outputsample = 0;
	for(int i=0; i<N; i++){
		outputsample += taps[i]*inputbuffer[i];
	}
	return outputsample;
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	for(int i=0; i<N; i++){
		outputsignal[i] = firfilter(inputsignal[i]);
	}
	return outputsignal;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
	int pivot = qA[hi];
	int i = low-1,j;
	int temp;
	for(j = low;j<hi;j++){
		if(qA[j] < pivot){
			i = i+1;
			temp = qA[i];
			qA[i] = qA[j];
			qA[j] = temp;
		}
	}
	if(qA[hi] < qA[i+1]){
		temp = qA[i+1];
		qA[i+1] = qA[hi];
		qA[hi] = temp;
	}
	return i+1;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) sort(int low, int hi){
	if(low < hi){
		int p = partition(low, hi);
		sort(low,p-1);
		sort(p+1,hi);
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
	sort(0,SIZE-1);
	return qA;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZEM; i++){
		for (j=0; j<SIZEM; j++){
			sum = 0;
			for(k = 0;k<SIZEM;k++)
				sum += A[(i*SIZEM) + k] * B[(k*SIZEM) + j];
			result[(i*SIZEM) + j] = sum;
		}
	}
	return result;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////









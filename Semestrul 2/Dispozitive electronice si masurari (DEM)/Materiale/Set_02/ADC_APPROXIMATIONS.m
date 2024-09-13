%THIS PROGRAM SHOWS HOW AN SUCCESIVE APPROXIMATIONS TYPE ADC WORKS
%REFERENCE VOLTAGE > ANALOG INPUT VOLTAGE
clear all;
close all;
Uref=5; %Reference voltage set to 5V
Ux=1.616; %Analog input voltage
bits=10; %10 bit WORD LENGTH
Ucna=0; %we start the conversion with a voltage of 0V

for i= 1:bits
    
    Ucna_interm=0; %intermediary variable for voltage between steps
    Ucna_interm = Uref * (2^(-i)); %calculus of value to be added or substracted from Ucna variable 
    Ucna= Ucna + Ucna_interm;   %we increase the intermeary value by the contribution of Ucna        
    if Ucna > Ux  %if we overflow the analog input voltage, we substract the previously added value
        Ucna_print(i)=Ucna; %save value to be printed
        Nx(i) = 0; %bit D[i] is 0, following the mode of functioning for the successive approximations ADC
        Ucna = Ucna - Ucna_interm;  
    else %if we do not overflow the analog input voltage, we can proceed and add the next contribution
        Nx(i) = 1;
        Ucna_print(i)=Ucna;
    end
end

n=0;
Voltage_code = 0;
Nx = flip(Nx);
%Create data for figure printing
for j= 1:bits
    Ux_print(j)=Ux;
    n=j-1;
    Voltage_code = Voltage_code + Nx(j)*2^n;
end

Voltage_Input = ((Voltage_code+0.5)/(2^bits))*Uref

Ucna = round(Ucna,3); %round to 3 decimal places
Voltage_Input = round(Voltage_Input,3); %round to 3 decimal places
figure(1);
set(gcf,'Color',[1,1,1]);
plot(Ux_print,'--r','LineWidth',2);hold on;grid on;axis([1 bits 0 5]) 
stairs(Ucna_print,'-b','LineWidth',2);
xlabel('Pulse clocks');
ylabel('Volts Range');
title('ADC with successive approximations');
Nx_print=num2str(Nx);
Ucna_print=num2str(Ucna);
text(4.5,3.2,num2str(Ux));
text(2,3.2,' Input Voltage = ');
text(5,3,Nx_print);
text(2,3,' Nx (MSB...LSB) = '); 
text(2,2.8,' Ucna without correction = ');
text(5.5,2.8,Ucna_print);
text(2,2.5,' Ucna with correction = ');
text(5.5,2.5,num2str(Voltage_Input));


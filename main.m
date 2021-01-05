%%
a = arduino('COM10','Mega2560','libraries','ExampleLCD/LCDAddon','Trace',true);

%%
lcd = addon(a,'ExampleLCD/LCDAddon','RegisterSelectPin','D7','EnablePin','D6','DataPins',{'D5','D4','D3','D2'});

%%

initializeLCD(lcd);

printLCD(lcd,'Welcome'); pause(2); clearLCD(lcd)


arm = false;


while true
    button = readVoltage(a,'A0');
    disp("BUTTON VALUE:");
    disp(button);
    if (button > 3.3)
        arm = ~arm;
        pause(2);
    end
    % DISARM FUNCTIONS
    if arm == false 
        clearLCD(lcd);
        printLCD(lcd,'Disarmed');
        printLCD(lcd,'Press to arm');
        pause (1);
    % ARM FUNCTIONS 
    else if arm == true 
       clearLCD(lcd);
       printLCD(lcd,'Armed');
       
     motion = readDigitalPin(a,'D12')
    if motion == 1
        clearLCD(lcd);
        printLCD(lcd,'Motion Detected');
       lightDelay = 0.1
       writeDigitalPin(a,'D32',1);pause(lightDelay);writeDigitalPin(a,'D32',0)
       writeDigitalPin(a,'D30',1);pause(lightDelay);writeDigitalPin(a,'D30',0)
        writeDigitalPin(a,'D32',1);pause(lightDelay);writeDigitalPin(a,'D32',0)
       writeDigitalPin(a,'D30',1);pause(lightDelay);writeDigitalPin(a,'D30',0)
        writeDigitalPin(a,'D32',1);pause(lightDelay);writeDigitalPin(a,'D32',0)
       writeDigitalPin(a,'D30',1);pause(lightDelay);writeDigitalPin(a,'D30',0)
        writeDigitalPin(a,'D32',1);pause(lightDelay);writeDigitalPin(a,'D32',0)
       writeDigitalPin(a,'D30',1);pause(lightDelay);writeDigitalPin(a,'D30',0)
     
    else
        
        writeDigitalPin(a,'D32',0);
        writeDigitalPin(a,'D30',0);
    end
    
    end
    
    pause(0.005);
    end

end

    




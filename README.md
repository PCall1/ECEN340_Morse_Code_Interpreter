Welcome to our Morse Interpreter!

In this project we determined to have a computer (Basys 3 FPGA) interpret button presses as characters to dislpay, and to communicate the same information to another computer. 
We interpret a button press as a dit or dash based on how long the button was held. Each dit or dash progresses a finite state machine to a next state based on the previous 
state and the most recent dit or dash. Aside from the neutral initial state, each state represents a character which may be displayed. After a defined period of no input (no dit or 
dash), an event is triggered, causing an "inter-letter space" where the state machine returns to its initial state, shifts the display, and displays the new character. After a 
longer defined period of 1.6 seconds an "inter-word space" event is triggered so the display is shifted and no new character is displayed so a space is shown between words. Input 
and output pins are configured so that two FPGA's may be connected by serial, half-duplex, communication to send morse coded information and receive the decoded characters. 


About Contents:

Basys3_Master.xdc - constraints file includes configurations of input, output, and clock

ECEN340_Final_Report - pdf project report includes explanations, figures, and learning conclusions

Morse Code Table - docx includes morse code to encode letters into morse, and includes 7-segment interpretations of letters because not all characters display the same as english letters

Demo Video - includes a Google Drive link to a brief demonstration

Project Pin Definition - (view the png) shows what buttons and switches are used as input on the Basys 3 FPGA

Project Pin Definition - the docx version also details button press times and the respective events triggered, in addition to buttons and switches used

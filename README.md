# DIY Piano RGB LED Visualizer with Arduino and WS2812
## Youtube 14K Views: https://www.youtube.com/watch?v=mA_5OwJWiMQ&t=41s

This tutorial will guide you through creating a DIY Piano RGB LED Visualizer using Arduino and WS2812. No professional tools are required, making it a great project for beginners.

**Required Components:**

- Arduino UNO or Nano
- WS2812B-8 RGB LED strip (8 meters)
- Dupont wires
- Breadboard (optional)

**Software:**

- Processing IDE [https://processing.org/](https://processing.org/)
- Arduino IDE [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

**Code and Circuit:**

- Schematic and circuit diagram: [HERE](/circuit.png)
- Arduino UNO/Nano code: [HERE](/arduino/ws2812_arduino/)
- Processing code: [HERE](/processing_java/)

**_Circuit_**
![circuit](/circuit.png)

**Assembly:**

1. **Connect the Arduino and LED strip:**

   - Connect the data pin of the LED strip to pin 6 of the Arduino.
   - Connect the ground pin of the LED strip to the ground pin of the Arduino.
   - Connect the power pin of the LED strip to a 5V power supply.

2. **Upload the code:**

   - Open the Arduino IDE and upload the Arduino code to the Arduino board.
   - Open the Processing IDE and upload the Processing code, and run.

3. **Test the visualizer:**
   - Play a piano and observe the LEDs light up in response to the music while plugged both arduino and MIDI to your computer.

**Customization:**

- You can customize the code to change the colors and patterns of the LEDs.
- You can add more LEDs to extend the visualizer to cover more octaves of the piano.

**Troubleshooting:**

- If the LEDs are not lighting up, make sure that the connections are correct and that the power supply is working properly.
- If the LEDs are lighting up randomly, try uploading the code again.

**Additional Notes:**

- This project can be powered by a USB power supply or a battery pack.
- You can use a breadboard to make the connections more easily, but it is not necessary.

**I hope you enjoyed this tutorial! If you have any questions, please feel free to leave a comment below.**

**License:**

This tutorial is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. You are free to use and adapt this tutorial for any purpose, including commercial use, as long as you give appropriate credit and share any changes you make.

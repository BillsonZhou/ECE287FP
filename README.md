1. Home
   
Welcome to the wiki of our group ECE287 Final Project!

This project is from Jose Reyes Marin and Billson.

Pong is a classic arcade game that marked the beginning of the video game industry. It is a two-dimensional sports simulation game where players control paddles on either side of the screen. The objective is to score points by maneuvering a ball past the opponent's paddle.

2. Game Intro

   This project is designed to fit for both two players and one player. A DE2-115 board and a PS2 keyboard is necessary for this game. Two players will each control a paddle at one side of the screen and use the PS2 keyboard try to bounce the ball back to the opponent. The goal for this game is try to score points by maneuvering a ball past the opponent's paddle. The first player who gets three points will get the victory. In addition, an automatic tracking paddle mode is also provided. By using the Switch[1] on DE2-115, this mode will be activated. If you think the game is too slow, speed change for the ball we need to bounce is also possible by using Switch[0].

3. File Description

a. TopModule.v

This file combines and connects all the other files to make this project work.

b. Setting.v

This file defines and sets default values for the width and length for the paddles we use in the game. The size of the ball we need to bounce and the basic resolution ratio are also getting set up in this file. In addition, this file is the pre requirement of ball.v, Block.v, TrackingBlock.v, vga_display.v and vga_driver.v

c. ball.v

This file contains the game logic includes ball movement, collision detection with paddles, scoring, and game reset conditions based on the specified parameters and clock signals. The ball's position is updated based on its direction), and scoring is tracked. The game resets when either player reaches a specified score limit.

d. Keyboard.v

This Verilog module represents a PS/2 keyboard controller. It synchronizes the PS/2 clock and data signals, processes incoming keyboard scan codes, and identifies specific key presses, updating the corresponding key states and key codes. The module also includes functionality for clock division, keyboard initialization, and synchronization between different clock domains. The design employs finite state machines to handle key press events and manage the PS/2 communication protocol.

e. TrackingBlock.v and Block.v

The first Verilog module TrackingBlock.v, defines a block with VGA-related functionalities, including keyboard-controlled vertical movement and an optional tracking behavior based on the position of a ball. The tracking behavior is activated when ai_switch is set, and the block adjusts its position to align with the ball's vertical center.

The second Verilog module Block.v, Block, is similar but without the tracking functionality. It handles VGA-related functionalities, including keyboard-controlled vertical movement. The block's movement is determined by the keyboard inputs and is synchronized with the VGA clock.


f. vga_display.v and vga_driver.v

The first Verilog module vga_display.v, implements a VGA display controller that generates pixel data based on the positions of two blocks and a ball, as well as the scores. It receives inputs such as keyboard codes, game control signals, and start signals, and outputs pixel data for display.

The second Verilog module vga_driver.v, serves as a VGA driver that generates horizontal and vertical synchronization signals and controls the pixel data output based on the VGA clock. It also calculates the pixel position based on horizontal and vertical counters, allowing synchronization with the VGA display.

4. Bug (Reset Problem)

No matter when we trying to reset the game, it will have an approximately 30% chance to cause the ball to appear in a random pixel. We haven't figured out a solution to avoid this problem. The option we are using now is to keep resetting it when bug happens and it will work like nothing happened in the next few reset. This bug also appears in the live demo video.

5. References

Tic-Tac-Toe Game: https://github.com/Goldu/Tic-Tac-Toe-Game-using-Altera-DE2-115-board

Driving a VGA Monitor Using an FPGA: https://embeddedthoughts.com/2016/07/29/driving-a-vga-monitor-using-an-fpga/

Flappy_Bird: https://github.com/zefanxu/Flappy_Bird_on_DE2_115

FPGA_PONG: https://github.com/itvchi/FPGA_PONG

6. Live Demo Link

   Youtube video link: https://youtu.be/oz4pYGbtZ0E

7. Conclusion

In conclusion, this project is a recreation of the classic arcade game Pong using a DE2-115 board and a PS2 keyboard. The project accommodates both single-player and two-player modes, allowing players to control paddles and score points by maneuvering a ball past the opponent's paddle. Additional features include an automatic tracking paddle mode and the ability to adjust ball speed. This repository includes all the files you need for the game. Despite efforts to address this issue, a conclusive solution has not been found. This reset bug is acknowledged in the live demo video. Overall, the project showcases a collaborative effort in Verilog programming to recreate a classic video game.

// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(RunForever)
	@24576
	D = M;

	@BlackenScreen
	D; JNE

	@WhittenScreen
	D; JEQ

(WhittenScreen)
	@counter
	M = 0;

	@8192
	D = A;
	@totalScreenRegisters
	M = D;

	(ClearAllScreenBits)
		@SCREEN
		D = A;

		@counter
		A = D + M;
		M = 0;

		@counter 
		M = M + 1;
		D = M;

		@totalScreenRegisters
		D = D - M;
		@ClearAllScreenBits
		D;JNE

	@RunForever
	0; JEQ

(BlackenScreen)
	@counter
	M = 0;

	@8192
	D = A;
	@totalScreenRegisters
	M = D;

	(SetAllScreenBits)
		@SCREEN
		D = A;

		@counter
		A = D + M;
		M = -1;

		@counter 
		M = M + 1;
		D = M;

		@totalScreenRegisters
		D = D - M;
		@SetAllScreenBits
		D;JNE

	@RunForever
	0; JEQ
// Multiplies R0 and R1 and stores the result in R2. 
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Code:
	@R2
	M = 0
	@counter 
	M = 0
(LOOP)
	@R1
	D = M;
	@counter
	D = D - M
	@END
	D;JEQ
	
	@R0
	D = M
	@R2
	M = M + D;
	@counter
	M = M + 1;
	@LOOP
	0;JMP
(END)
	@END
	0;JMP
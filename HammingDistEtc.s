  .global isNumber
  .data
  .text
  
  isNumber:
  
  mov   r12,r13		// save stack pointer into register r12
  sub   sp,#32		// reserve 32 bytes of space for local variables 
  push  {lr}		// push link register onto stack  

  
  //r0=& of char
  //r1=stored value to compare
  //r2=retVal
  
  ldr r1, [r0]
  cmp r1, #57 //all characters above ASCII digit value 0x39 will branch to notNum
  bgt notNum
  ble numCheck


  notNum: //returns 0 since not a number
  mov r2, #0 
  b done1
  
  numCheck://will check if ASCII is below the 0x30-0x39 (digit) range
  cmp r1, #48 //compare with 0x30
  blt notNum  //if character - 0x30 (0) is less than 0, not a number
  mov r2, #1
  b done1
 
  
  done1:
  mov r0, r2



  pop {lr}			// pop link register from stack 
  mov sp,r12		// restore the stack pointer 
				 
  mov pc,lr			// return from the function by copying link register into  program counter

 

 
  .global compare
  .data
  // declare any global variables here
  .text
  compare:
  mov   r12,r13		// save stack pointer into register r12
  sub   sp,#32		// reserve 32 bytes of space for local variables 
  push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  //r0 = a
  //r1 = b
  //r2 = retVal

  mov r2, #1  //assuming a<b
  cmp r0, r1
  bgt done2
  moveq r2, #0
  movlt r2, #-1
  done2:
  mov r0, r2






  pop {lr}			// pop link register from stack 
  mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
					// value it had when you entered the function .  
  mov pc,lr			// return from the function by copying link register into  program counter

  
  .global countOnes
  .data
  // declare any global variables here
  .text
  countOnes:
  mov   r12,r13		// save stack pointer into register r12
  sub   sp,#32		// reserve 32 bytes of space for local variables 
  push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  //r0 = number to be counted
  //r1=index, when exceeds 32 goto done, check all 32 bits
  //r2 = count of ones in number
  //r3 stores temporary AND of r0 and #1
  mov r1, #0
  mov r2, #0
  ands r3, r0, #1
  addgt r2, #1
  add r1, #1
  
  loop:
  cmp r1, #32
  bgt done3
  lsr r0, #1 
  ands r3, r0, #1
  addgt r2, #1
  add r1, #1
  b loop

    
  done3:
  mov r0, r2

  pop {lr}			// pop link register from stack 
  mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
					// value it had when you entered the function .  
  mov pc,lr			// return from the function by copying link register into  program counter


  .global returnHammingDistance
  .data
  // declare any global variables here
  .text
  returnHammingDistance:
  
  mov   r12,r13		// save stack pointer into register r12
  sub   sp,#32		// reserve 32 bytes of space for local variables 
  push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  //r0=char1
  //r1=char2
  //r2 =  char1 xor char2

  eor r2, r0, r1     //XOR to find difference in bits
  mov r0, r2         //send XOR value to function
  bl countOnes   //call to countOnes function to count number of ones in XOR'ed value




  pop {lr}			// pop link register from stack 
  mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
					// value it had when you entered the function .  
  mov pc,lr			// return from the function by copying link register into  program counter


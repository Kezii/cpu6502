; Fibonacci calculator in 6502 asm
; by Pedro Franceschi (pedrohfranceschi@gmail.com)
; test it in http://www.6502asm.com/beta/index.html
; the accumulator in the end will hold the Nth fibonacci number

* = 8000
reset:
LDX #$01; x = 1
STX $00; stores x

SEC; clean carry;
LDY #10; calculates 7th fibonacci number (13 = D in hex) (CHANGE HERE IF YOU WANT TO CALCULATE ANOTHER NUMBER)
TYA; transfer y register to accumulator
SBC #$03; handles the algorithm iteration counting
TAY; transfer the accumulator to the y register

CLC; clean carry
LDA #$02; a = 2
STA $01; stores a

loop: LDX $01; x = a
      ADC $00; a += x
      STA $01; stores a
      STX $00; stores x
      DEY; y -= 1
      BNE loop; jumps back to loop if Z bit != 0 (y's decremention isn't zero yet)

end

* = $FFFC
.dsb (*-end), 0
* = $FFFC

.word reset
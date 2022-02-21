import sys
import time
import intel_jtag_uart

try:
    jtag_uart = intel_jtag_uart.intel_jtag_uart()

except Exception as e:
    print(e)
    sys.exit(0)

if len(sys.argv)>=2:
    instruction_file = open(sys.argv[1], "r")
else:
    instruction_file = open("rom.bin", "r")


if instruction_file:
    word_mask = 2**8 - 1

    for instruction in instruction_file:
        word = int(instruction, base=2)
        #print (instruction)
        #print (word)

        word_0 = word & word_mask
        #print (bytes(chr(word_0), 'utf8'))
        jtag_uart.write(bytes(chr(word_0), 'utf8'))
        
        word_1 = word >> 8
        #print (bytes(chr(word_1), 'utf8'))
        jtag_uart.write(bytes(chr(word_1), 'utf8'))
        #time.sleep(1)

else:
    print("Error opening file :(")

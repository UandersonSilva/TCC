import sys
import ply.yacc as yacc
import ply.lex as lex

#----------------------------LEXER----------------------------

# List of token names.   This is always required
tokens = [
    'HLT',
    'STO',
    'LD',
    'LDI',
    'ADD',
    'ADDI',
    'SUB',
    'SUBI',
    'BEQ',
    'BNE',
    'BGT',
    'BGE',
    'BLT',
    'BLE',
    'JMP',
    'VALUE',
    'EOF'
]

# Regular expression rules for simple tokens
t_HLT   =   r'HLT'
t_STO   =   r'STO'
t_LD    =   r'LD'
t_LDI   =   r'LDI'
t_ADD   =   r'ADD'
t_ADDI  =   r'ADDI'
t_SUB   =   r'SUB'
t_SUBI  =   r'SUBI'
t_BEQ   =   r'BEQ'
t_BNE   =   r'BNE'
t_BGT   =   r'BGT'
t_BGE   =   r'BGE'
t_BLT   =   r'BLT'
t_BLE   =   r'BLE'
t_JMP   =   r'JMP'

def t_VALUE(t):
    r'\d+'
    t.value = int(t.value)
    return t

# A string containing ignored characters (spaces and tabs)
t_ignore  = ' \t\n'

#----------------------------PARSER----------------------------

# Error handling rule
def t_ANY_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

def p_statement_list(p):
    ''' statement_list  :   statement
        statement_list  :   statement_list statement
        statement_list  :   statement_list EOF'''
    p[0]=[p[1]]
    if len(p)==3:
        p[0]=p[1]
        p[0].append(p[2])

def p_statement(p):
    ''' statement   :   command VALUE'''
    p[0]=[p[1],p[2]]

#def p_statement_HLT(p):
#    ''' statement   :   HLT'''
#   p[0]=[p[1]]

def p_command(p):
    ''' command     :   HLT
        command     :   STO
        command     :   LD
        command     :   LDI
        command     :   ADD
        command     :   ADDI
        command     :   SUB
        command     :   SUBI
        command     :   BEQ
        command     :   BNE
        command     :   BGT
        command     :   BGE
        command     :   BLT
        command     :   BLE
        command     :   JMP'''
    p[0]=p[1]

# Error rule for syntax errors
def p_error(p):
    print("Syntax error in input: ",p)

#----------------------------Code Generation----------------------------

def opcode(string):
    opcodes={   "HLT":format(0,'05b'),
                "STO":format(1,'05b'),
                "LD":format(2,'05b'),
                "LDI":format(3,'05b'),
                "ADD":format(4,'05b'),
                "ADDI":format(5,'05b'),
                "SUB":format(6,'05b'),
                "SUBI":format(7,'05b'),
                "BEQ":format(8,'05b'),
                "BNE":format(9,'05b'),
                "BGT":format(10,'05b'),
                "BGE":format(11,'05b'),
                "BLT":format(12,'05b'),
                "BLE":format(13,'05b'),
                "JMP":format(14,'05b')}
    return opcodes[string]

def process(path,result):
    file = open(path,"w")
    if file:
        for command in result:
            command[0]=opcode(command[0])
            if (command[0]=='00000' and command[1]==0): #len(command)==2:
                command[1]=format(command[1], '011b')
                file.write(str(command[0])+str(command[1]))
            else:
                command[1]=format(command[1], '011b')
                file.write(str(command[0])+str(command[1])+"\n")
                #file.write(str(command[0])+str(format(0,'011b')))
        file.close()
    else:
        print("Erro ao Criar Arquivo de Saida")

#-------------------------Builder/Main----------------------------
if __name__ == "__main__":
    # Build the lexer/parser
    lexer = lex.lex()
    parser = yacc.yacc()
    #Get the Input File
    if len(sys.argv)>=2:
        input_file = open(sys.argv[1], "r")
    else:
        input_file = open("main.txt", "r")
    file_text=input_file.read()
    input_file.close()

    if file_text:
        result = parser.parse(file_text)
        if result:
            if len(sys.argv)>3:
                process(sys.argv[2],result)
            else:
                process("rom.bin",result)
    else:
        print("Error opening file :(")

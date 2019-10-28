module decoder#(
        parameter DATA_WIDTH = 11
        parameter INSTRUCTION_WIDTH = 15
    )
    (
        input logic [INSTRUCTION_WIDTH - DATA_WIDTH:0] op_code;
	);
	
	input logic [INSTRUCTION_WIDTH - DATA_WIDTH:0] op_code;
	input logic clock, flag_Z_in, flag_Z_in, reset;
	output logic branch, sel_B, acc_wr, pc_wr, op, data_memory_wr;
	output logic status_wr, acc_reset, pc_reset, status_reset;
	output logic [1:0] sel_A; 
	
	localparam 
		_FETCH = 2'b00, 
		_DEC = 2'b01, 
		_EXEC = 2'b10,
		_RESET = 2'b11;
		
	localparam 
		_HLT = 5'b00000,
		_STO = 5'b00001,
		_LD = 5'b00010,
		_LDI = 5'b00011,
		_ADD = 5'b00100,
		_ADDI = 5'b00101,
		_SUB = 5'b00110,
		_SUBI = 5'b00111,
		_BEQ = 5'b01000,
		_BNE = 5'b01001,
		_BGT = 5'b01010,
		_BGE = 5'b01011,
		_BLT = 5'b01100,
		_BLE = 5'b01101,
		_JMP = 5'b01110;
		
	logic [1:0] current_stage;
	logic [1:0] next_stage;
	
	initial
	begin
		next_stage = _RESET;
	end
		
	always_ff @(posedge clock or negedge reset)
	begin
		if(reset==1'b0)
			current_stage = _RESET;
		else
			current_stage = next_stage;
	end
	
	always_comb @(current_stage)
	begin
		case(current_stage)
						
			_RESET:
			begin
				next_stage = _FETCH;
			end	
			
			_FETCH: 
			begin
				next_stage = _DEC;
			end
			
			_DEC:
			begin
				next_stage = _EXEC;
			end
			
			_EXEC:
			begin
				next_stage = _FETCH;
			end
		endcase
	end
	
	always_comb @(current_stage)
	begin
		case(current_stage)
			_RESET:
			begin
				branch = 1'b0;
				sel_A = 2'b00;
				sel_B = 1'b0;
				op = 1'b0;
				pc_wr = 1'b0;
				status_wr = 1'b0;
				acc_wr = 1'b0;
				data_memory_wr = 1'b0;
				acc_reset = 1'b1;
				pc_reset = 1'b1;
				status_reset = 1'b1;
			end
		
			_FETCH:
			begin
				branch = 1'b0;
				sel_A = 2'b00;
				sel_B = 1'b0;				
				op = 1'b0;
				pc_wr = 1'b0;
				status_wr = 1'b0;
				acc_wr = 1'b0;
				data_memory_wr = 1'b0;
				acc_reset = 1'b0;
				pc_reset = 1'b0;
				status_reset = 1'b0;
			end
			
			_DEC:
			begin
				case(op_code)
					_HLT:
					begin
						branch = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;						
						op = 1'b0;
					end
					
					_STO:
					begin
						branch = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;						
						op = 1'b0;
					end
					
					_LD:
					begin
						branch = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;						
						op = 1'b0;
					end
					
					_LDI:
					begin
						branch = 1'b0;
						sel_A = 2'b01;
						sel_B = 1'b0;						
						op = 1'b0;
					end
					
					_ADD:
					begin
						branch = 1'b0;
						op = 1'b0;
						sel_A = 2'b10;
						sel_B = 1'b0;						
					end
					
					_ADDI:
					begin
						branch = 1'b0;
						op = 1'b0;
						sel_A = 2'b10;
						sel_B = 1'b1;						
					end
					
					_SUB:
					begin
						branch = 1'b0;
						op = 1'b1;
						sel_A = 2'b10;
						sel_B = 1'b0;						
					end
					
					_SUBI:
					begin
						branch = 1'b0;
						op = 1'b1;
						sel_A = 2'b10;
						sel_B = 1'b1;						
					end
					
					_BEQ:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in==1)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end
					
					_BNE:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in==0)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end
					
					_BGT:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in==0 && flag_Z_in == 0)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end

					_BGE:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in == 0)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end
					
					_BLT:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in == 1)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end
					
					_BLE:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						if(flag_Z_in == 1 || flag_Z_in == 1)
						begin
							branch = 1'b1;							
						end
						else
						begin
							branch = 1'b0;							
						end
					end
					
					_JMP:
					begin
						op = 1'b0;
						sel_A = 2'b00;
						sel_B = 1'b0;
						branch = 1'b1;						
					end
				endcase
			end
			
			_EXEC:
			begin
				case(op_code)
					_HLT:
					begin
						pc_wr = 1'b0;
						acc_wr = 1'b0;
						data_memory_wr = 1'b0;
					end
					
					_STO:
					begin
						pc_wr = 1'b1;
						acc_wr = 1'b0;
						data_memory_wr = 1'b1;
					end
					
					_LD:
					begin
						pc_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;
					end
					
					_LDI:
					begin
						pc_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;
					end
					
					_ADD:
					begin
						pc_wr = 1'b1;
						status_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;						
					end
					
					_ADDI:
					begin
						pc_wr = 1'b1;
						status_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;						
					end	
	
					_SUB:
					begin
						pc_wr = 1'b1;
						status_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;						
					end
					
					_SUBI:
					begin
						pc_wr = 1'b1;
						status_wr = 1'b1;
						acc_wr = 1'b1;
						data_memory_wr = 1'b0;						
					end

					default:
					begin
						pc_wr = 1'b1;
						acc_wr = 1'b0;
						data_memory_wr = 1'b0;
					end
				endcase
			end
		endcase
	end
endmodule 
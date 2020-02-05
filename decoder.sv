module decoder#(
        parameter OPERAND_WIDTH = 11,
        parameter INSTRUCTION_WIDTH = 16
    )
    (
      	input logic [INSTRUCTION_WIDTH - OPERAND_WIDTH:0] op_code,
		input logic clock_in, status_Z_in, status_N_in, reset_in,
		output logic branch_out, sel_B_out, alu_op_out, data_memory_wr_out,  
		output logic acc_wr_out, pc_wr_out, status_wr_out, ir_wr_out,
		output logic acc_reset_out, pc_reset_out, status_reset_out, ir_reset_out,
		output logic [1:0] sel_A_out
	);
	
	 
	
	localparam 
		_FETCH = 2'b00, 
		//_DEC = 2'b01, 
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
		
	always_ff @(posedge clock_in or negedge reset_in)
	begin
		if(reset_in==1'b0)
			current_stage = _RESET;
		else
			current_stage = next_stage;
	end
	
	always @(current_stage)
	begin
		case(current_stage)			
			_RESET:
			begin
				next_stage = _FETCH;
			end	
			
			_FETCH: 
			begin
				next_stage = _EXEC;
			end
			/*
			_DEC:
			begin
				next_stage = _EXEC;
			end
			*/
			_EXEC:
			begin
				next_stage = _FETCH;
			end

			default:
			begin
				next_stage = _RESET;
			end
		endcase
	end
	
	always_comb
	begin
		case(current_stage)
			_RESET:
			begin
				branch_out = 1'b0;
				sel_A_out = 2'b00;
				sel_B_out = 1'b0;
				alu_op_out = 1'b0;
				pc_wr_out = 1'b0;
				status_wr_out = 1'b0;
				acc_wr_out = 1'b0;
				ir_wr_out = 1'b0;
				data_memory_wr_out = 1'b0;
				acc_reset_out = 1'b1;
				pc_reset_out = 1'b1;
				status_reset_out = 1'b1;
				ir_reset_out = 1'b1;
			end
		
			_FETCH:
			begin
				branch_out = 1'b0;
				sel_A_out = 2'b00;
				sel_B_out = 1'b0;				
				alu_op_out  = 1'b0;
				pc_wr_out = 1'b0;
				status_wr_out = 1'b0;
				acc_wr_out = 1'b0;
				ir_wr_out = 1'b1;
				data_memory_wr_out = 1'b0;
				acc_reset_out = 1'b0;
				pc_reset_out = 1'b0;
				status_reset_out = 1'b0;
				ir_reset_out = 1'b0;
			end
			/*
			_DEC:
			begin
				pc_wr_out = 1'b0;
				status_wr_out = 1'b0;
				acc_wr_out = 1'b0;
				ir_wr_out = 1'b0;
				data_memory_wr_out = 1'b0;
				acc_reset_out = 1'b0;
				pc_reset_out = 1'b0;
				status_reset_out = 1'b0;
				ir_reset_out = 1'b0;
				case(op_code)
					_HLT:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
					end
					
					_STO:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
					end
					
					_LD:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
					end
					
					_LDI:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b01;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
					end
					
					_ADD:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b0;
						sel_A_out = 2'b10;
						sel_B_out = 1'b0;						
					end
					
					_ADDI:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b0;
						sel_A_out = 2'b10;
						sel_B_out = 1'b1;						
					end
					
					_SUB:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b1;
						sel_A_out = 2'b10;
						sel_B_out = 1'b0;						
					end
					
					_SUBI:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b1;
						sel_A_out = 2'b10;
						sel_B_out = 1'b1;						
					end
					
					_BEQ:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end
					
					_BNE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end
					
					_BGT:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==0 && status_N_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end

					_BGE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_N_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end
					
					_BLT:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_N_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end
					
					_BLE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==1 || status_N_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
					end
					
					_JMP:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						branch_out = 1'b1;						
					end

					default:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
					end
				endcase
			end
			*/
			
			_EXEC:
			begin
				ir_wr_out = 1'b0;
				acc_reset_out = 1'b0;
				pc_reset_out = 1'b0;
				status_reset_out = 1'b0;
				ir_reset_out = 1'b0;
				case(op_code)
					_HLT:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
						pc_wr_out = 1'b0;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_STO:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b1;
					end
					
					_LD:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;
					end
					
					_LDI:
					begin
						branch_out = 1'b0;
						sel_A_out = 2'b01;
						sel_B_out = 1'b0;						
						alu_op_out  = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;
					end
					
					_ADD:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b0;
						sel_A_out = 2'b10;
						sel_B_out = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b1;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;						
					end
					
					_ADDI:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b0;
						sel_A_out = 2'b10;
						sel_B_out = 1'b1;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b1;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;						
					end	
	
					_SUB:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b1;
						sel_A_out = 2'b10;
						sel_B_out = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b1;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;						
					end
					
					_SUBI:
					begin
						branch_out = 1'b0;
						alu_op_out  = 1'b1;
						sel_A_out = 2'b10;
						sel_B_out = 1'b1;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b1;
						acc_wr_out = 1'b1;
						data_memory_wr_out = 1'b0;						
					end

					_BEQ:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_BNE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_BGT:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==0 && status_N_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end

					_BGE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_N_in==0)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_BLT:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_N_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_BLE:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						if(status_Z_in==1 || status_N_in==1)
						begin
							branch_out = 1'b1;							
						end
						else
						begin
							branch_out = 1'b0;							
						end
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
					
					_JMP:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						branch_out = 1'b1;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;						
					end


					default:
					begin
						alu_op_out  = 1'b0;
						sel_A_out = 2'b00;
						sel_B_out = 1'b0;
						branch_out = 1'b0;
						pc_wr_out = 1'b1;
						status_wr_out = 1'b0;
						acc_wr_out = 1'b0;
						data_memory_wr_out = 1'b0;
					end
				endcase
			end
			
			default:
				begin
					branch_out = 1'b0;
					sel_A_out = 2'b00;
					sel_B_out = 1'b0;				
					alu_op_out  = 1'b0;
					pc_wr_out = 1'b0;
					status_wr_out = 1'b0;
					acc_wr_out = 1'b0;
					ir_wr_out = 1'b0;
					data_memory_wr_out = 1'b0;
					acc_reset_out = 1'b0;
					pc_reset_out = 1'b0;
					status_reset_out = 1'b0;
					ir_reset_out = 1'b0;
				end
		endcase
	end
endmodule 

# parsetab.py
# This file is automatically generated. Do not edit.
# pylint: disable=W,C,R
_tabversion = '3.10'

_lr_method = 'LALR'

_lr_signature = 'ADD ADDI BEQ BGE BGT BLE BLT BNE EOF HLT JMP LD LDI STO SUB SUBI VALUE statement_list  :   statement\n        statement_list  :   statement_list statement\n        statement_list  :   statement_list EOF statement   :   command VALUE command     :   HLT\n        command     :   STO\n        command     :   LD\n        command     :   LDI\n        command     :   ADD\n        command     :   ADDI\n        command     :   SUB\n        command     :   SUBI\n        command     :   BEQ\n        command     :   BNE\n        command     :   BGT\n        command     :   BGE\n        command     :   BLT\n        command     :   BLE\n        command     :   JMP'
    
_lr_action_items = {'HLT':([0,1,2,19,20,21,],[4,4,-1,-2,-3,-4,]),'STO':([0,1,2,19,20,21,],[5,5,-1,-2,-3,-4,]),'LD':([0,1,2,19,20,21,],[6,6,-1,-2,-3,-4,]),'LDI':([0,1,2,19,20,21,],[7,7,-1,-2,-3,-4,]),'ADD':([0,1,2,19,20,21,],[8,8,-1,-2,-3,-4,]),'ADDI':([0,1,2,19,20,21,],[9,9,-1,-2,-3,-4,]),'SUB':([0,1,2,19,20,21,],[10,10,-1,-2,-3,-4,]),'SUBI':([0,1,2,19,20,21,],[11,11,-1,-2,-3,-4,]),'BEQ':([0,1,2,19,20,21,],[12,12,-1,-2,-3,-4,]),'BNE':([0,1,2,19,20,21,],[13,13,-1,-2,-3,-4,]),'BGT':([0,1,2,19,20,21,],[14,14,-1,-2,-3,-4,]),'BGE':([0,1,2,19,20,21,],[15,15,-1,-2,-3,-4,]),'BLT':([0,1,2,19,20,21,],[16,16,-1,-2,-3,-4,]),'BLE':([0,1,2,19,20,21,],[17,17,-1,-2,-3,-4,]),'JMP':([0,1,2,19,20,21,],[18,18,-1,-2,-3,-4,]),'$end':([1,2,19,20,21,],[0,-1,-2,-3,-4,]),'EOF':([1,2,19,20,21,],[20,-1,-2,-3,-4,]),'VALUE':([3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,],[21,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18,-19,]),}

_lr_action = {}
for _k, _v in _lr_action_items.items():
   for _x,_y in zip(_v[0],_v[1]):
      if not _x in _lr_action:  _lr_action[_x] = {}
      _lr_action[_x][_k] = _y
del _lr_action_items

_lr_goto_items = {'statement_list':([0,],[1,]),'statement':([0,1,],[2,19,]),'command':([0,1,],[3,3,]),}

_lr_goto = {}
for _k, _v in _lr_goto_items.items():
   for _x, _y in zip(_v[0], _v[1]):
       if not _x in _lr_goto: _lr_goto[_x] = {}
       _lr_goto[_x][_k] = _y
del _lr_goto_items
_lr_productions = [
  ("S' -> statement_list","S'",1,None,None,None),
  ('statement_list -> statement','statement_list',1,'p_statement_list','translator.py',61),
  ('statement_list -> statement_list statement','statement_list',2,'p_statement_list','translator.py',62),
  ('statement_list -> statement_list EOF','statement_list',2,'p_statement_list','translator.py',63),
  ('statement -> command VALUE','statement',2,'p_statement','translator.py',70),
  ('command -> HLT','command',1,'p_command','translator.py',78),
  ('command -> STO','command',1,'p_command','translator.py',79),
  ('command -> LD','command',1,'p_command','translator.py',80),
  ('command -> LDI','command',1,'p_command','translator.py',81),
  ('command -> ADD','command',1,'p_command','translator.py',82),
  ('command -> ADDI','command',1,'p_command','translator.py',83),
  ('command -> SUB','command',1,'p_command','translator.py',84),
  ('command -> SUBI','command',1,'p_command','translator.py',85),
  ('command -> BEQ','command',1,'p_command','translator.py',86),
  ('command -> BNE','command',1,'p_command','translator.py',87),
  ('command -> BGT','command',1,'p_command','translator.py',88),
  ('command -> BGE','command',1,'p_command','translator.py',89),
  ('command -> BLT','command',1,'p_command','translator.py',90),
  ('command -> BLE','command',1,'p_command','translator.py',91),
  ('command -> JMP','command',1,'p_command','translator.py',92),
]

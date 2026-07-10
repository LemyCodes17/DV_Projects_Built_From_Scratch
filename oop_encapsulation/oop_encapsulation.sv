class transaction;
  bit [31:0] data; // if this is local bit it throws an error
  int id;// if this is protected int it throws an error
  
  function new();
    data = 100;
    id =10;
  endfunction
    
    protected function void display(); // if this function is local or protected xrun will throw an error 
    $display("value of data = %0d id = %0d",data, id);
  endfunction
endclass


class child_trans extends transaction;
  bit [31:0] addr; //address property in the child class
  
  task calc_addr;
    addr = data * id;
    display(); //only allowed to be aceesd withing the child class
    $display("value of address = %0d", addr);
  endtask
endclass

module tb;
  child_trans tr; //transaction handle
  initial begin
  tr = new();
  tr.calc_addr();
    //tr.(display) throws an error because of unauthorized local access not insode the child class it's callinf it outside of the child class,  XRUN throws an error
  end
endmodule

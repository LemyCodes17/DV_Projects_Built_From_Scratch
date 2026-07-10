class parent_trans;
  int data;
  
  function void display();
    $display("Base: value of data = %0h", data);
  endfunction
endclass
             
class child_class extends parent_trans;
  int data;
  function void display();
  super.data = 5;
    super.display();
    $display("Child: value of data = %0d", data);
  endfunction
endclass
 
module tb;
initial begin
  child_class c_class;
  c_class = new();
  c_class.data = 300;
c_class.display();
end
endmodule

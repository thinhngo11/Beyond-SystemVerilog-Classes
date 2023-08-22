module tb;
class A;
  function int One();
    return 1;
  endfunction
endclass

class B;
  function int Two();
    return 2;
  endfunction
endclass

class C;
  A m_A = new();
  B m_B = new();
  function void printAB();
    $display("A.One = %d  B.Two = %d", m_A.One, m_B.Two);
  endfunction
endclass

class Base;
  virtual function int One(); endfunction
  virtual function int Two(); endfunction
endclass

class X extends Base;
  virtual function int One();
    return 1;
  endfunction
endclass

class Y extends Base;
  virtual function int Two();
    return 2;
  endfunction
endclass

initial begin
  C m_C = new();
  X m_X = new();
  Y m_Y = new();
  Base m_Z;
  
  m_C.printAB();
  
  m_Z = m_X;
  $display("X.One = %d", m_Z.One);
  m_Z = m_Y;  
  $display("Y.Two = %d", m_Z.Two);
end
  
endmodule

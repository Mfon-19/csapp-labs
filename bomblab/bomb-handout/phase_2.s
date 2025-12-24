   0x0000000000400efc <+0>:     push   %rbp // push base pointer
   0x0000000000400efd <+1>:     push   %rbx // callee saved, value=38 
   0x0000000000400efe <+2>:     sub    $0x28,%rsp // allocate 0x28 bytes on call stack
   0x0000000000400f02 <+6>:     mov    %rsp,%rsi  // move the inputs to rsi, pass to read_six_numbers
   0x0000000000400f05 <+9>:     call   0x40145c <read_six_numbers>
   0x0000000000400f0a <+14>:    cmpl   $0x1,(%rsp) 
   0x0000000000400f0e <+18>:    je     0x400f30 <phase_2+52> // if value in rsp is 1, jump to +52
   0x0000000000400f10 <+20>:    call   0x40143a <explode_bomb> // if value is not 1, explode!
   0x0000000000400f15 <+25>:    jmp    0x400f30 <phase_2+52> // jump to 52
   0x0000000000400f17 <+27>:    mov    -0x4(%rbx),%eax // eax=rbx - 4
   0x0000000000400f1a <+30>:    add    %eax,%eax // eax=eax * 2
   0x0000000000400f1c <+32>:    cmp    %eax,(%rbx)
   0x0000000000400f1e <+34>:    je     0x400f25 <phase_2+41> // if eax==val at rbx, jump to +41
   0x0000000000400f20 <+36>:    call   0x40143a <explode_bomb> // if not, explode!
   0x0000000000400f25 <+41>:    add    $0x4,%rbx // rbx=rbx + 4
   0x0000000000400f29 <+45>:    cmp    %rbp,%rbx
   0x0000000000400f2c <+48>:    jne    0x400f17 <phase_2+27> // if rbp != rbx, keep looping
   0x0000000000400f2e <+50>:    jmp    0x400f3c <phase_2+64>
   0x0000000000400f30 <+52>:    lea    0x4(%rsp),%rbx  // set rbx=rsp + 4
   0x0000000000400f35 <+57>:    lea    0x18(%rsp),%rbp // set rbp=rsp + 24
   0x0000000000400f3a <+62>:    jmp    0x400f17 <phase_2+27> // it then jumps up to continue. its a loop. jump-to-test/middle?
   0x0000000000400f3c <+64>:    add    $0x28,%rsp
   0x0000000000400f40 <+68>:    pop    %rbx
   0x0000000000400f41 <+69>:    pop    %rbp
   0x0000000000400f42 <+70>:    ret

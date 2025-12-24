   0x000000000040100c <+0>:     sub    $0x18,%rsp // allocate space on the stack
   0x0000000000401010 <+4>:     lea    0xc(%rsp),%rcx // second arg
   0x0000000000401015 <+9>:     lea    0x8(%rsp),%rdx // first arg
   0x000000000040101a <+14>:    mov    $0x4025cf,%esi // expects two integers
   0x000000000040101f <+19>:    mov    $0x0,%eax // clear eax
   0x0000000000401024 <+24>:    call   0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000401029 <+29>:    cmp    $0x2,%eax 
   0x000000000040102c <+32>:    jne    0x401035 <phase_4+41> // sscanf must read 2 digits. if not explode!
   0x000000000040102e <+34>:    cmpl   $0xe,0x8(%rsp) 
   0x0000000000401033 <+39>:    jbe    0x40103a <phase_4+46> // first arg must be 0 <= x <= 14. unsigned 
   0x0000000000401035 <+41>:    call   0x40143a <explode_bomb> // if 15 or greater, explode
   0x000000000040103a <+46>:    mov    $0xe,%edx // edx = 14
   0x000000000040103f <+51>:    mov    $0x0,%esi // esi = 0
   0x0000000000401044 <+56>:    mov    0x8(%rsp),%edi // first number in the line
   0x0000000000401048 <+60>:    call   0x400fce <func4> // call this func. we pass three args to it
   0x000000000040104d <+65>:    test   %eax,%eax
   0x000000000040104f <+67>:    jne    0x401058 <phase_4+76> // if eax is not zero, explode
   0x0000000000401051 <+69>:    cmpl   $0x0,0xc(%rsp) 
   0x0000000000401056 <+74>:    je     0x40105d <phase_4+81> // if second arg is zero, good
   0x0000000000401058 <+76>:    call   0x40143a <explode_bomb>
   0x000000000040105d <+81>:    add    $0x18,%rsp
   0x0000000000401061 <+85>:    ret

   // func4
   0x0000000000400fce <+0>:     sub    $0x8,%rsp // allocate 8 bytes for this function
   0x0000000000400fd2 <+4>:     mov    %edx,%eax // eax = 14
   0x0000000000400fd4 <+6>:     sub    %esi,%eax // esi=0, eax -= esi = 14 - 0 = 14
   0x0000000000400fd6 <+8>:     mov    %eax,%ecx // ecx = 14
   0x0000000000400fd8 <+10>:    shr    $0x1f,%ecx // ecx = 14 / 2^31. basically leaves the top bit = 0
   0x0000000000400fdb <+13>:    add    %ecx,%eax // eax = 14 + 0 = 14
   0x0000000000400fdd <+15>:    sar    $1,%eax // eax = 7
   0x0000000000400fdf <+17>:    lea    (%rax,%rsi,1),%ecx // ecx = rax + rsi * 1, 7 + 0 * 1 = 7
   0x0000000000400fe2 <+20>:    cmp    %edi,%ecx // edi=first number read on the line
   0x0000000000400fe4 <+22>:    jle    0x400ff2 <func4+36> // if ecx <= edi, jump. i.e. 7 <  <= z <= 14
   0x0000000000400fe6 <+24>:    lea    -0x1(%rcx),%edx // edx = rcx - 1. 14 = 21 - 1?
   0x0000000000400fe9 <+27>:    call   0x400fce <func4>
   0x0000000000400fee <+32>:    add    %eax,%eax
   0x0000000000400ff0 <+34>:    jmp    0x401007 <func4+57>
   0x0000000000400ff2 <+36>:    mov    $0x0,%eax // clear eax
   0x0000000000400ff7 <+41>:    cmp    %edi,%ecx // ecx here would be 7
   0x0000000000400ff9 <+43>:    jge    0x401007 <func4+57> // if ecx >= edi, jump. i.e. 7 >= edi, just ends
   0x0000000000400ffb <+45>:    lea    0x1(%rcx),%esi // esi = rcx + 1
   0x0000000000400ffe <+48>:    call   0x400fce <func4> // recurse
   0x0000000000401003 <+53>:    lea    0x1(%rax,%rax,1),%eax // eax = 1 + rax * 2
   0x0000000000401007 <+57>:    add    $0x8,%rsp
   0x000000000040100b <+61>:    ret



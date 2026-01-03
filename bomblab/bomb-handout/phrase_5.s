   0x0000000000401062 <+0>:     push   %rbx // save whatever was in rbx
   0x0000000000401063 <+1>:     sub    $0x20,%rsp // allocate 0x20 bytes on stack
   0x0000000000401067 <+5>:     mov    %rdi,%rbx // rbx = rdi = 0x63. rdi is caller saved 
   0x000000000040106a <+8>:     mov    %fs:0x28,%rax // canary value is 0x28
   0x0000000000401073 <+17>:    mov    %rax,0x18(%rsp) // store canary at offset 0x18 from stack pointer
   0x0000000000401078 <+22>:    xor    %eax,%eax // zero out eax
   0x000000000040107a <+24>:    call   0x40131b <string_length>
   0x000000000040107f <+29>:    cmp    $0x6,%eax
   0x0000000000401082 <+32>:    je     0x4010d2 <phase_5+112> // jump if string length is 6
   0x0000000000401084 <+34>:    call   0x40143a <explode_bomb> // if string length is not 6, explode
   0x0000000000401089 <+39>:    jmp    0x4010d2 <phase_5+112> // unreachable?
   0x000000000040108b <+41>:    movzbl (%rbx,%rax,1),%ecx // ecx = rbx + rax * 1. ecx = first char in the input string
   0x000000000040108f <+45>:    mov    %cl,(%rsp) // point rsp to the first character in the string
   0x0000000000401092 <+48>:    mov    (%rsp),%rdx // move that pointer to rdx
   0x0000000000401096 <+52>:    and    $0xf,%edx // keep only lowest 4 bits
   0x0000000000401099 <+55>:    movzbl 0x4024b0(%rdx),%edx // move addr + rdx into edx. 0x4024b0 points to a string
   0x00000000004010a0 <+62>:    mov    %dl,0x10(%rsp,%rax,1) // move lowest 8 bits into 10 + rsp + rax * 1
   0x00000000004010a4 <+66>:    add    $0x1,%rax // rax += 1
   0x00000000004010a8 <+70>:    cmp    $0x6,%rax
   0x00000000004010ac <+74>:    jne    0x40108b <phase_5+41> // if rax != 6, keep looping. ltr through the string
   0x00000000004010ae <+76>:    movb   $0x0,0x16(%rsp) // move 0 into offset 16
   0x00000000004010b3 <+81>:    mov    $0x40245e,%esi // esi = flyers
   0x00000000004010b8 <+86>:    lea    0x10(%rsp),%rdi // the string we copied into here before. move into rdi
   0x00000000004010bd <+91>:    call   0x401338 <strings_not_equal>
   0x00000000004010c2 <+96>:    test   %eax,%eax
   0x00000000004010c4 <+98>:    je     0x4010d9 <phase_5+119> // if they equal, jmp
   0x00000000004010c6 <+100>:   call   0x40143a <explode_bomb> // if esi != rdi, explode
   0x00000000004010cb <+105>:   nopl   0x0(%rax,%rax,1)
   0x00000000004010d0 <+110>:   jmp    0x4010d9 <phase_5+119>
   0x00000000004010d2 <+112>:   mov    $0x0,%eax // zero eax
   0x00000000004010d7 <+117>:   jmp    0x40108b <phase_5+41> // jump back up
   0x00000000004010d9 <+119>:   mov    0x18(%rsp),%rax // move the canary into rax
   0x00000000004010de <+124>:   xor    %fs:0x28,%rax
   0x00000000004010e7 <+133>:   je     0x4010ee <phase_5+140> // if canary untouched, jump
   0x00000000004010e9 <+135>:   call   0x400b30 <__stack_chk_fail@plt>
   0x00000000004010ee <+140>:   add    $0x20,%rsp
   0x00000000004010f2 <+144>:   pop    %rbx
   0x00000000004010f3 <+145>:   ret

   // string_length. i overcomplicated this so much lol. its just brilliant strlen(s)
   0x000000000040131b <+0>:     cmpb   $0x0,(%rdi)
   0x000000000040131e <+3>:     je     0x401332 <string_length+23> // if rdi=0, return 0
   0x0000000000401320 <+5>:     mov    %rdi,%rdx // rdx = rdi
   0x0000000000401323 <+8>:     add    $0x1,%rdx // rdx = rdi + 1 // start of loop
   0x0000000000401327 <+12>:    mov    %edx,%eax // eax = edx
   0x0000000000401329 <+14>:    sub    %edi,%eax // eax = edx - rdx
   0x000000000040132b <+16>:    cmpb   $0x0,(%rdx)
   0x000000000040132e <+19>:    jne    0x401323 <string_length+8> // if rdx != 0, keep looping
   0x0000000000401330 <+21>:    repz ret // if it equals zero, return
   0x0000000000401332 <+23>:    mov    $0x0,%eax
   0x0000000000401337 <+28>:    ret

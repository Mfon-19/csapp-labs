   0x0000000000400f43 <+0>:	sub    $0x18,%rsp // allocate 0x18 bytes on stack
   0x0000000000400f47 <+4>:	lea    0xc(%rsp),%rcx  // load offset 0xc into rcx
   0x0000000000400f4c <+9>:	lea    0x8(%rsp),%rdx  // load offset 0x8 into rdx
   0x0000000000400f51 <+14>:	mov    $0x4025cf,%esi  // first arg to sscanf. contains format "%d %d"
   0x0000000000400f56 <+19>:	mov    $0x0,%eax  // clear eax
   0x0000000000400f5b <+24>:	call   0x400bf0 <__isoc99_sscanf@plt>
   0x0000000000400f60 <+29>:	cmp    $0x1,%eax
   0x0000000000400f63 <+32>:	jg     0x400f6a <phase_3+39> // jump if eax > 1
   0x0000000000400f65 <+34>:	call   0x40143a <explode_bomb> // if eax <= 1, explode
   0x0000000000400f6a <+39>:	cmpl   $0x7,0x8(%rsp) 
   0x0000000000400f6f <+44>:	ja     0x400fad <phase_3+106> // jump if val at offset 8 > 7. unsigned. will explode
   0x0000000000400f71 <+46>:	mov    0x8(%rsp),%eax // move offset 8 into eax
   0x0000000000400f75 <+50>:	jmp    *0x402470(,%rax,8) // rax*8. array indexing into the jump table maybe
   0x0000000000400f7c <+57>:	mov    $0xcf,%eax  // move 207 into eax
   0x0000000000400f81 <+62>:	jmp    0x400fbe <phase_3+123> // jump to <+123>
   0x0000000000400f83 <+64>:	mov    $0x2c3,%eax // move 707 into eax, 500 more than before
   0x0000000000400f88 <+69>:	jmp    0x400fbe <phase_3+123> // seems all jumps go to <+123>
   0x0000000000400f8a <+71>:	mov    $0x100,%eax // move 256 into eax
   0x0000000000400f8f <+76>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f91 <+78>:	mov    $0x185,%eax // move 389 into eax
   0x0000000000400f96 <+83>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f98 <+85>:	mov    $0xce,%eax  // move 206 into eax
   0x0000000000400f9d <+90>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400f9f <+92>:	mov    $0x2aa,%eax // move 682 into eax
   0x0000000000400fa4 <+97>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400fa6 <+99>:	mov    $0x147,%eax // move 327 into eax
   0x0000000000400fab <+104>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400fad <+106>:	call   0x40143a <explode_bomb> // explodes! <+44>
   0x0000000000400fb2 <+111>:	mov    $0x0,%eax
   0x0000000000400fb7 <+116>:	jmp    0x400fbe <phase_3+123>
   0x0000000000400fb9 <+118>:	mov    $0x137,%eax
   0x0000000000400fbe <+123>:	cmp    0xc(%rsp),%eax 
   0x0000000000400fc2 <+127>:	je     0x400fc9 <phase_3+134> // if val in offset at 12 is equal to val in eax jump
   0x0000000000400fc4 <+129>:	call   0x40143a <explode_bomb> // if not, explode
   0x0000000000400fc9 <+134>:	add    $0x18,%rsp // deallocate space on the stack
   0x0000000000400fcd <+138>:	ret

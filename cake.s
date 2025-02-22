/* ASSEMBLE & LINK


                          (             )
                  )      (*)           (*)      (
                 (*)      |             |      (*)
                  |      |~|           |~|      |
                 |~|     | |           | |     |~|
                 | |     | |           | |     | |
                ,| |a@@@@| |@@@@@@@@@@@| |@@@@a| |.
           .,a@@@| |@@@@@| |@@@@@@@@@@@| |@@@@@| |@@@@a,.
         ,a@@@@@@| |@@@@@@@@@@@@.@@@@@@@@@@@@@@| |@@@@@@@a,
        a@@@@@@@@@@@@@@@@@@@@@' . `@@@@@@@@@@@@@@@@@@@@@@@@a
        ;`@@@@@@@@@@@@@@@@@@'   .   `@@@@@@@@@@@@@@@@@@@@@';
        ;@@@`@@@@@@@@@@@@@'     .     `@@@@@@@@@@@@@@@@'@@@;
        ;@@@;,.aaaaaaaaaa       .       aaaaa,,aaaaaaa,;@@@;
        ;;@;;;;@@@@@@@@;@      @.@      ;@@@;;;@@@@@@;;;;@@;
        ;;;;;;;@@@@;@@;;@    @@ . @@    ;;@;;;;@@;@@@;;;;;;;
        ;;;;;;;;@@;;;;;;;  @@   .   @@  ;;;;;;;;;;;@@;;;;@;;
        ;;;;;;;;;;;;;;;;;@@     .     @@;;;;;;;;;;;;;;;;@@@;
    ,%%%;;;;;;;;@;;;;;;;;       .       ;;;;;;;;;;;;;;;;@@;;%%%,
 .%%%%%%;;;;;;;@@;;;;;;;;     ,%%%,     ;;;;;;;;;;;;;;;;;;;;%%%%%%,
.%%%%%%%;;;;;;;@@;;;;;;;;   ,%%%%%%%,   ;;;;;;;;;;;;;;;;;;;;%%%%%%%,
%%%%%%%%`;;;;;;;;;;;;;;;;  %%%%%%%%%%%  ;;;;;;;;;;;;;;;;;;;'%%%%%%%%
%%%%%%%%%%%%`;;;;;;;;;;;;,%%%%%%%%%%%%%,;;;;;;;;;;;;;;;'%%%%%%%%%%%%
`%%%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%,,,,,,,%%%%%%%%%%%%%%%%%%%%'
  `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      `%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
             """"""""""""""`,,,,,,,,,'"""""""""""""""""
                            `%%%%%%%'
                             `%%%%%'
                               %%%
                              %%%%%
                           .,%%%%%%%,.
                      ,%%%%%%%%%%%%%%%%%%%
*/

        .section .data

encoded:
        .byte 0x42, 0x0B, 0x2C, 0x31, 0x36, 0x30, 0x78, 0x62, 0x0F, 0x27, 0x2C
        .byte 0x31, 0x23, 0x28, 0x27, 0x62, 0x01, 0x2B, 0x24, 0x30, 0x23, 0x26
        .byte 0x2D, 0x62, 0x6F, 0x7C, 0x62, 0x01, 0x23, 0x2F, 0x20, 0x2B, 0x23
        .byte 0x62, 0x2E, 0x23, 0x62, 0x21, 0x2E, 0x23, 0x34, 0x27, 0x6C, 0x62
        .byte 0x12, 0x2B, 0x31, 0x36, 0x23, 0x78, 0x62, 0x17, 0x31, 0x23, 0x62
        .byte 0x36, 0x37, 0x62, 0x27, 0x26, 0x23, 0x26, 0x6C, 0x48, 0x29, 0x29
        .byte 0x65, 0x46, 0x4F, 0x4A, 0x40, 0x4A, 0x47, 0x42, 0x47, 0x46, 0x50
        .byte 0x03, 0x72, 0x76, 0x6A, 0x72, 0x76, 0x66, 0x02, 0x29

encoded_len = . - encoded

        .section .text
        .global _start

_start:
        mov     r0, #1
        ldr     r1, =encoded
        ldr     r2, =encoded_len
        ldrb    r3, [r1]
        add     r1, r1, #1
        sub     r2, r2, #1
        mov     r4, #0

decrypt:
        cmp     r4, r2
        bge     show
        ldrb    r5, [r1, r4]
        eor     r5, r5, r3
        strb    r5, [r1, r4]
        add     r4, r4, #1
        b       decrypt

show:
        mov     r7, #4
        svc     #0
        mov     r0, #0
        mov     r7, #1
        svc     #0

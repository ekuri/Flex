/* 匹配ipv4地址并输出ip地址类型（A, B, C, D） */

/*
A --> 0.0.0.0-127.255.255.255
B --> 128.0.0.0-191.255.255.255
C --> 192.0.0.0-223.255.255.255
D --> 224.0.0.0-239.255.255.255
E --> 240.0.0.0-255.255.255.255
*/

%{
    #include <stdio.h>
%}

VALID_ONE_OR_TWO_NUMBERS [1-9]?[0-9]
VALID_THREE_NUMBERS (1[0-9]{2})|(2[0-4][0-9])|(25[0-5])

A_TYPE_HEAD {VALID_ONE_OR_TWO_NUMBERS}|1((1[0-9])|(2[0-7]))
VALID_A_TYPE_IP {A_TYPE_HEAD}(\.({VALID_ONE_OR_TWO_NUMBERS}|{VALID_THREE_NUMBERS})){3}\n?

B_TYPE_HEAD 1((2[89])|([3-8][0-9])|(9[01]))
VALID_B_TYPE_IP {B_TYPE_HEAD}(\.({VALID_ONE_OR_TWO_NUMBERS}|{VALID_THREE_NUMBERS})){3}\n?

C_TYPE_HEAD (1(9[2-9]))|(2([0-1][0-9]|2[0-3]))
VALID_C_TYPE_IP {C_TYPE_HEAD}(\.({VALID_ONE_OR_TWO_NUMBERS}|{VALID_THREE_NUMBERS})){3}\n?

D_TYPE_HEAD 2(2[4-9]|3[0-9])
VALID_D_TYPE_IP {D_TYPE_HEAD}(\.({VALID_ONE_OR_TWO_NUMBERS}|{VALID_THREE_NUMBERS})){3}\n?

E_TYPE_HEAD 2(4[0-9]|5[0-5])
VALID_E_TYPE_IP {E_TYPE_HEAD}(\.({VALID_ONE_OR_TWO_NUMBERS}|{VALID_THREE_NUMBERS})){3}\n?

INVAID_IP (.*|([0-9]+(\.[0-9]+)*))\n?
BLANK [\f\n\r\t\v\x20]+

%%

{VALID_A_TYPE_IP} {
    printf("A\n");
}

{VALID_B_TYPE_IP} {
    printf("B\n");
}

{VALID_C_TYPE_IP} {
    printf("C\n");
}

{VALID_D_TYPE_IP} {
    printf("D\n");
}

{VALID_E_TYPE_IP} {
    printf("E\n");
}

{INVAID_IP} {
    printf("Invalid\n");
}

{BLANK} {
    printf("Invalid\n");
}

%%

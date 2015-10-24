/* 匹配DOT语法并输出token */
/*1. 关键词，大小写不敏感
STRICT
GRAPH
DIGRAPH
SUBGRAPH
NODE
EDGE

2. Entity
ID
STRING
NUMBER

3. 分隔符
;
,
{
}
[
]

4. 其它符号
--
->
=

5. WHITESPACE，忽略
*/
/*6. 注释，忽略
*/
/*//*/
/* */
/*#*/

%{
    #include <stdio.h>
%}

KEY_WORD_AND_ID [a-zA-Z_]+[0-9]*[a-zA-Z_]*
SYMBOL ;|,|\{|\}|\[|\]|(--)|(->)|\=
STRING \".+\"
COMMENT (\/\/.*\n?)|(#.*\n?)|(\/\*[^(\*\/)]*\*\/)
NUMBER [+-]?(([0-9]+\.?[0-9]*)|([0-9]*\.?[0-9]+))
BLANK [\f\n\r\t\v\x20]+

%%

{KEY_WORD_AND_ID} {
    printf("%s\n", yytext);
}

{SYMBOL} {
    printf("%s\n", yytext);
}

{STRING} {
    printf("%s\n", yytext);
}

{COMMENT} {
    /*printf("found COMMENT: %s\n", yytext);*/
}

{NUMBER} {
    printf("%s\n", yytext);
}

{BLANK} {
}

%%

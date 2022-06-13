#lang one-v1/debug/parser-only

//@testcases, 500
//int, i

int i;
int n;

for i:=0 to n do
begin
 print i;
 i:= i+1;
end

//este é um comentario que será desconsiderado
//@float, entrada, 700
//veja, foi desconsiderado de novo.

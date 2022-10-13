# Envolution

## Binary to real number
### Formula 
* x is the real number
* B2D is the x in binary format
* UB is upper bound
* LB is lower bound
* L is the length of binary
```
x = B2D*(UB-LB)/(2^L-1)+LB
or 
(x - LB) / (UB - LB) = B2D / (2^L - 1)
```
#### Examples
Real number: 2000-10000
UB: 10000, LB: 2000, L: 15
if B2D is 1500 then x will be about 2366.2221137

#### case 01
If x is 2003 then B2D will be 12.287625
org 100h    

mov 100h, 97
mov 101h, 114
mov 102h, 116
mov 103h, 104
mov 104h, 117
mov 105h, 114
mov 106h, 32
mov 107h, 97
mov 108h, 108
mov 109h, 118
mov 10ah, 101
mov 10bh, 115
mov 10ch, 32
mov 10dh, 97
mov 10eh, 114
mov 10fh, 97
mov 110h, 117
mov 111h, 106
mov 112h, 111
mov 113h, 32
mov 114h, 102
mov 115h, 101
mov 116h, 114
mov 117h, 114
mov 118h, 101
mov 119h, 105
mov 11ah, 114
mov 11bh, 97
mov 11ch, 46
     
mov si, 100h
mov di, 11dh  
mov cx, 1dh 
rep movsb
 
mov si, 100h
mov di, 13ah  
mov cx, 1dh 
rep movsb

mov si, 100h
mov di, 157h  
mov cx, 1dh 
rep movsb

mov si, 100h
mov di, 174h  
mov cx, 1dh 
rep movsb

mov si, 100h
mov di, 191h  
mov cx, 1dh 
rep movsb
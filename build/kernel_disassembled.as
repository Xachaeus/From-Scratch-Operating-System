
./build/kernel.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
       0:	fa                   	cli    
       1:	e8 11 0b 00 00       	call   0xb17
       6:	fb                   	sti    
       7:	eb fe                	jmp    0x7
       9:	fa                   	cli    
       a:	f4                   	hlt    
       b:	8d 35 e0 57 03 00    	lea    esi,ds:0x357e0
      11:	bf a0 80 0b 00       	mov    edi,0xb80a0
      16:	fc                   	cld    
      17:	ac                   	lods   al,BYTE PTR ds:[esi]
      18:	08 c0                	or     al,al
      1a:	74 09                	je     0x25
      1c:	88 07                	mov    BYTE PTR [edi],al
      1e:	47                   	inc    edi
      1f:	c6 07 2f             	mov    BYTE PTR [edi],0x2f
      22:	47                   	inc    edi
      23:	eb f2                	jmp    0x17
      25:	fa                   	cli    
      26:	eb fe                	jmp    0x26
      28:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
      2d:	8a 44 24 08          	mov    al,BYTE PTR [esp+0x8]
      31:	ee                   	out    dx,al
      32:	c3                   	ret    
      33:	66 8b 54 24 04       	mov    dx,WORD PTR [esp+0x4]
      38:	31 c0                	xor    eax,eax
      3a:	ec                   	in     al,dx
      3b:	c3                   	ret    
      3c:	fb                   	sti    
      3d:	c3                   	ret    
      3e:	fa                   	cli    
      3f:	c3                   	ret    
      40:	55                   	push   ebp
      41:	89 e5                	mov    ebp,esp
      43:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      46:	0f 01 10             	lgdtd  [eax]
      49:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
      4c:	50                   	push   eax
      4d:	8d 05 55 00 03 00    	lea    eax,ds:0x30055
      53:	50                   	push   eax
      54:	cb                   	retf   
      55:	66 8b 45 10          	mov    ax,WORD PTR [ebp+0x10]
      59:	8e d8                	mov    ds,eax
      5b:	8e c0                	mov    es,eax
      5d:	8e e0                	mov    fs,eax
      5f:	8e e8                	mov    gs,eax
      61:	8e d0                	mov    ss,eax
      63:	89 ec                	mov    esp,ebp
      65:	5d                   	pop    ebp
      66:	c3                   	ret    
      67:	90                   	nop
      68:	55                   	push   ebp
      69:	89 e5                	mov    ebp,esp
      6b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
      6e:	0f 01 18             	lidtd  [eax]
      71:	89 ec                	mov    esp,ebp
      73:	5d                   	pop    ebp
      74:	c3                   	ret    
      75:	66 90                	xchg   ax,ax
      77:	90                   	nop
      78:	6a 00                	push   0x0
      7a:	6a 00                	push   0x0
      7c:	e9 36 0a 00 00       	jmp    0xab7
      81:	6a 00                	push   0x0
      83:	6a 01                	push   0x1
      85:	e9 2d 0a 00 00       	jmp    0xab7
      8a:	6a 00                	push   0x0
      8c:	6a 02                	push   0x2
      8e:	e9 24 0a 00 00       	jmp    0xab7
      93:	6a 00                	push   0x0
      95:	6a 03                	push   0x3
      97:	e9 1b 0a 00 00       	jmp    0xab7
      9c:	6a 00                	push   0x0
      9e:	6a 04                	push   0x4
      a0:	e9 12 0a 00 00       	jmp    0xab7
      a5:	6a 00                	push   0x0
      a7:	6a 05                	push   0x5
      a9:	e9 09 0a 00 00       	jmp    0xab7
      ae:	6a 00                	push   0x0
      b0:	6a 06                	push   0x6
      b2:	e9 00 0a 00 00       	jmp    0xab7
      b7:	6a 00                	push   0x0
      b9:	6a 07                	push   0x7
      bb:	e9 f7 09 00 00       	jmp    0xab7
      c0:	6a 08                	push   0x8
      c2:	e9 f0 09 00 00       	jmp    0xab7
      c7:	6a 00                	push   0x0
      c9:	6a 09                	push   0x9
      cb:	e9 e7 09 00 00       	jmp    0xab7
      d0:	6a 0a                	push   0xa
      d2:	e9 e0 09 00 00       	jmp    0xab7
      d7:	6a 0b                	push   0xb
      d9:	e9 d9 09 00 00       	jmp    0xab7
      de:	6a 0c                	push   0xc
      e0:	e9 d2 09 00 00       	jmp    0xab7
      e5:	6a 0d                	push   0xd
      e7:	e9 cb 09 00 00       	jmp    0xab7
      ec:	6a 0e                	push   0xe
      ee:	e9 c4 09 00 00       	jmp    0xab7
      f3:	6a 00                	push   0x0
      f5:	6a 0f                	push   0xf
      f7:	e9 bb 09 00 00       	jmp    0xab7
      fc:	6a 00                	push   0x0
      fe:	6a 10                	push   0x10
     100:	e9 b2 09 00 00       	jmp    0xab7
     105:	6a 11                	push   0x11
     107:	e9 ab 09 00 00       	jmp    0xab7
     10c:	6a 00                	push   0x0
     10e:	6a 12                	push   0x12
     110:	e9 a2 09 00 00       	jmp    0xab7
     115:	6a 00                	push   0x0
     117:	6a 13                	push   0x13
     119:	e9 99 09 00 00       	jmp    0xab7
     11e:	6a 00                	push   0x0
     120:	6a 14                	push   0x14
     122:	e9 90 09 00 00       	jmp    0xab7
     127:	6a 15                	push   0x15
     129:	e9 89 09 00 00       	jmp    0xab7
     12e:	6a 00                	push   0x0
     130:	6a 16                	push   0x16
     132:	e9 80 09 00 00       	jmp    0xab7
     137:	6a 00                	push   0x0
     139:	6a 17                	push   0x17
     13b:	e9 77 09 00 00       	jmp    0xab7
     140:	6a 00                	push   0x0
     142:	6a 18                	push   0x18
     144:	e9 6e 09 00 00       	jmp    0xab7
     149:	6a 00                	push   0x0
     14b:	6a 19                	push   0x19
     14d:	e9 65 09 00 00       	jmp    0xab7
     152:	6a 00                	push   0x0
     154:	6a 1a                	push   0x1a
     156:	e9 5c 09 00 00       	jmp    0xab7
     15b:	6a 00                	push   0x0
     15d:	6a 1b                	push   0x1b
     15f:	e9 53 09 00 00       	jmp    0xab7
     164:	6a 00                	push   0x0
     166:	6a 1c                	push   0x1c
     168:	e9 4a 09 00 00       	jmp    0xab7
     16d:	6a 1d                	push   0x1d
     16f:	e9 43 09 00 00       	jmp    0xab7
     174:	6a 1e                	push   0x1e
     176:	e9 3c 09 00 00       	jmp    0xab7
     17b:	6a 00                	push   0x0
     17d:	6a 1f                	push   0x1f
     17f:	e9 33 09 00 00       	jmp    0xab7
     184:	6a 00                	push   0x0
     186:	6a 20                	push   0x20
     188:	e9 2a 09 00 00       	jmp    0xab7
     18d:	6a 00                	push   0x0
     18f:	6a 21                	push   0x21
     191:	e9 21 09 00 00       	jmp    0xab7
     196:	6a 00                	push   0x0
     198:	6a 22                	push   0x22
     19a:	e9 18 09 00 00       	jmp    0xab7
     19f:	6a 00                	push   0x0
     1a1:	6a 23                	push   0x23
     1a3:	e9 0f 09 00 00       	jmp    0xab7
     1a8:	6a 00                	push   0x0
     1aa:	6a 24                	push   0x24
     1ac:	e9 06 09 00 00       	jmp    0xab7
     1b1:	6a 00                	push   0x0
     1b3:	6a 25                	push   0x25
     1b5:	e9 fd 08 00 00       	jmp    0xab7
     1ba:	6a 00                	push   0x0
     1bc:	6a 26                	push   0x26
     1be:	e9 f4 08 00 00       	jmp    0xab7
     1c3:	6a 00                	push   0x0
     1c5:	6a 27                	push   0x27
     1c7:	e9 eb 08 00 00       	jmp    0xab7
     1cc:	6a 00                	push   0x0
     1ce:	6a 28                	push   0x28
     1d0:	e9 e2 08 00 00       	jmp    0xab7
     1d5:	6a 00                	push   0x0
     1d7:	6a 29                	push   0x29
     1d9:	e9 d9 08 00 00       	jmp    0xab7
     1de:	6a 00                	push   0x0
     1e0:	6a 2a                	push   0x2a
     1e2:	e9 d0 08 00 00       	jmp    0xab7
     1e7:	6a 00                	push   0x0
     1e9:	6a 2b                	push   0x2b
     1eb:	e9 c7 08 00 00       	jmp    0xab7
     1f0:	6a 00                	push   0x0
     1f2:	6a 2c                	push   0x2c
     1f4:	e9 be 08 00 00       	jmp    0xab7
     1f9:	6a 00                	push   0x0
     1fb:	6a 2d                	push   0x2d
     1fd:	e9 b5 08 00 00       	jmp    0xab7
     202:	6a 00                	push   0x0
     204:	6a 2e                	push   0x2e
     206:	e9 ac 08 00 00       	jmp    0xab7
     20b:	6a 00                	push   0x0
     20d:	6a 2f                	push   0x2f
     20f:	e9 a3 08 00 00       	jmp    0xab7
     214:	6a 00                	push   0x0
     216:	6a 30                	push   0x30
     218:	e9 9a 08 00 00       	jmp    0xab7
     21d:	6a 00                	push   0x0
     21f:	6a 31                	push   0x31
     221:	e9 91 08 00 00       	jmp    0xab7
     226:	6a 00                	push   0x0
     228:	6a 32                	push   0x32
     22a:	e9 88 08 00 00       	jmp    0xab7
     22f:	6a 00                	push   0x0
     231:	6a 33                	push   0x33
     233:	e9 7f 08 00 00       	jmp    0xab7
     238:	6a 00                	push   0x0
     23a:	6a 34                	push   0x34
     23c:	e9 76 08 00 00       	jmp    0xab7
     241:	6a 00                	push   0x0
     243:	6a 35                	push   0x35
     245:	e9 6d 08 00 00       	jmp    0xab7
     24a:	6a 00                	push   0x0
     24c:	6a 36                	push   0x36
     24e:	e9 64 08 00 00       	jmp    0xab7
     253:	6a 00                	push   0x0
     255:	6a 37                	push   0x37
     257:	e9 5b 08 00 00       	jmp    0xab7
     25c:	6a 00                	push   0x0
     25e:	6a 38                	push   0x38
     260:	e9 52 08 00 00       	jmp    0xab7
     265:	6a 00                	push   0x0
     267:	6a 39                	push   0x39
     269:	e9 49 08 00 00       	jmp    0xab7
     26e:	6a 00                	push   0x0
     270:	6a 3a                	push   0x3a
     272:	e9 40 08 00 00       	jmp    0xab7
     277:	6a 00                	push   0x0
     279:	6a 3b                	push   0x3b
     27b:	e9 37 08 00 00       	jmp    0xab7
     280:	6a 00                	push   0x0
     282:	6a 3c                	push   0x3c
     284:	e9 2e 08 00 00       	jmp    0xab7
     289:	6a 00                	push   0x0
     28b:	6a 3d                	push   0x3d
     28d:	e9 25 08 00 00       	jmp    0xab7
     292:	6a 00                	push   0x0
     294:	6a 3e                	push   0x3e
     296:	e9 1c 08 00 00       	jmp    0xab7
     29b:	6a 00                	push   0x0
     29d:	6a 3f                	push   0x3f
     29f:	e9 13 08 00 00       	jmp    0xab7
     2a4:	6a 00                	push   0x0
     2a6:	6a 40                	push   0x40
     2a8:	e9 0a 08 00 00       	jmp    0xab7
     2ad:	6a 00                	push   0x0
     2af:	6a 41                	push   0x41
     2b1:	e9 01 08 00 00       	jmp    0xab7
     2b6:	6a 00                	push   0x0
     2b8:	6a 42                	push   0x42
     2ba:	e9 f8 07 00 00       	jmp    0xab7
     2bf:	6a 00                	push   0x0
     2c1:	6a 43                	push   0x43
     2c3:	e9 ef 07 00 00       	jmp    0xab7
     2c8:	6a 00                	push   0x0
     2ca:	6a 44                	push   0x44
     2cc:	e9 e6 07 00 00       	jmp    0xab7
     2d1:	6a 00                	push   0x0
     2d3:	6a 45                	push   0x45
     2d5:	e9 dd 07 00 00       	jmp    0xab7
     2da:	6a 00                	push   0x0
     2dc:	6a 46                	push   0x46
     2de:	e9 d4 07 00 00       	jmp    0xab7
     2e3:	6a 00                	push   0x0
     2e5:	6a 47                	push   0x47
     2e7:	e9 cb 07 00 00       	jmp    0xab7
     2ec:	6a 00                	push   0x0
     2ee:	6a 48                	push   0x48
     2f0:	e9 c2 07 00 00       	jmp    0xab7
     2f5:	6a 00                	push   0x0
     2f7:	6a 49                	push   0x49
     2f9:	e9 b9 07 00 00       	jmp    0xab7
     2fe:	6a 00                	push   0x0
     300:	6a 4a                	push   0x4a
     302:	e9 b0 07 00 00       	jmp    0xab7
     307:	6a 00                	push   0x0
     309:	6a 4b                	push   0x4b
     30b:	e9 a7 07 00 00       	jmp    0xab7
     310:	6a 00                	push   0x0
     312:	6a 4c                	push   0x4c
     314:	e9 9e 07 00 00       	jmp    0xab7
     319:	6a 00                	push   0x0
     31b:	6a 4d                	push   0x4d
     31d:	e9 95 07 00 00       	jmp    0xab7
     322:	6a 00                	push   0x0
     324:	6a 4e                	push   0x4e
     326:	e9 8c 07 00 00       	jmp    0xab7
     32b:	6a 00                	push   0x0
     32d:	6a 4f                	push   0x4f
     32f:	e9 83 07 00 00       	jmp    0xab7
     334:	6a 00                	push   0x0
     336:	6a 50                	push   0x50
     338:	e9 7a 07 00 00       	jmp    0xab7
     33d:	6a 00                	push   0x0
     33f:	6a 51                	push   0x51
     341:	e9 71 07 00 00       	jmp    0xab7
     346:	6a 00                	push   0x0
     348:	6a 52                	push   0x52
     34a:	e9 68 07 00 00       	jmp    0xab7
     34f:	6a 00                	push   0x0
     351:	6a 53                	push   0x53
     353:	e9 5f 07 00 00       	jmp    0xab7
     358:	6a 00                	push   0x0
     35a:	6a 54                	push   0x54
     35c:	e9 56 07 00 00       	jmp    0xab7
     361:	6a 00                	push   0x0
     363:	6a 55                	push   0x55
     365:	e9 4d 07 00 00       	jmp    0xab7
     36a:	6a 00                	push   0x0
     36c:	6a 56                	push   0x56
     36e:	e9 44 07 00 00       	jmp    0xab7
     373:	6a 00                	push   0x0
     375:	6a 57                	push   0x57
     377:	e9 3b 07 00 00       	jmp    0xab7
     37c:	6a 00                	push   0x0
     37e:	6a 58                	push   0x58
     380:	e9 32 07 00 00       	jmp    0xab7
     385:	6a 00                	push   0x0
     387:	6a 59                	push   0x59
     389:	e9 29 07 00 00       	jmp    0xab7
     38e:	6a 00                	push   0x0
     390:	6a 5a                	push   0x5a
     392:	e9 20 07 00 00       	jmp    0xab7
     397:	6a 00                	push   0x0
     399:	6a 5b                	push   0x5b
     39b:	e9 17 07 00 00       	jmp    0xab7
     3a0:	6a 00                	push   0x0
     3a2:	6a 5c                	push   0x5c
     3a4:	e9 0e 07 00 00       	jmp    0xab7
     3a9:	6a 00                	push   0x0
     3ab:	6a 5d                	push   0x5d
     3ad:	e9 05 07 00 00       	jmp    0xab7
     3b2:	6a 00                	push   0x0
     3b4:	6a 5e                	push   0x5e
     3b6:	e9 fc 06 00 00       	jmp    0xab7
     3bb:	6a 00                	push   0x0
     3bd:	6a 5f                	push   0x5f
     3bf:	e9 f3 06 00 00       	jmp    0xab7
     3c4:	6a 00                	push   0x0
     3c6:	6a 60                	push   0x60
     3c8:	e9 ea 06 00 00       	jmp    0xab7
     3cd:	6a 00                	push   0x0
     3cf:	6a 61                	push   0x61
     3d1:	e9 e1 06 00 00       	jmp    0xab7
     3d6:	6a 00                	push   0x0
     3d8:	6a 62                	push   0x62
     3da:	e9 d8 06 00 00       	jmp    0xab7
     3df:	6a 00                	push   0x0
     3e1:	6a 63                	push   0x63
     3e3:	e9 cf 06 00 00       	jmp    0xab7
     3e8:	6a 00                	push   0x0
     3ea:	6a 64                	push   0x64
     3ec:	e9 c6 06 00 00       	jmp    0xab7
     3f1:	6a 00                	push   0x0
     3f3:	6a 65                	push   0x65
     3f5:	e9 bd 06 00 00       	jmp    0xab7
     3fa:	6a 00                	push   0x0
     3fc:	6a 66                	push   0x66
     3fe:	e9 b4 06 00 00       	jmp    0xab7
     403:	6a 00                	push   0x0
     405:	6a 67                	push   0x67
     407:	e9 ab 06 00 00       	jmp    0xab7
     40c:	6a 00                	push   0x0
     40e:	6a 68                	push   0x68
     410:	e9 a2 06 00 00       	jmp    0xab7
     415:	6a 00                	push   0x0
     417:	6a 69                	push   0x69
     419:	e9 99 06 00 00       	jmp    0xab7
     41e:	6a 00                	push   0x0
     420:	6a 6a                	push   0x6a
     422:	e9 90 06 00 00       	jmp    0xab7
     427:	6a 00                	push   0x0
     429:	6a 6b                	push   0x6b
     42b:	e9 87 06 00 00       	jmp    0xab7
     430:	6a 00                	push   0x0
     432:	6a 6c                	push   0x6c
     434:	e9 7e 06 00 00       	jmp    0xab7
     439:	6a 00                	push   0x0
     43b:	6a 6d                	push   0x6d
     43d:	e9 75 06 00 00       	jmp    0xab7
     442:	6a 00                	push   0x0
     444:	6a 6e                	push   0x6e
     446:	e9 6c 06 00 00       	jmp    0xab7
     44b:	6a 00                	push   0x0
     44d:	6a 6f                	push   0x6f
     44f:	e9 63 06 00 00       	jmp    0xab7
     454:	6a 00                	push   0x0
     456:	6a 70                	push   0x70
     458:	e9 5a 06 00 00       	jmp    0xab7
     45d:	6a 00                	push   0x0
     45f:	6a 71                	push   0x71
     461:	e9 51 06 00 00       	jmp    0xab7
     466:	6a 00                	push   0x0
     468:	6a 72                	push   0x72
     46a:	e9 48 06 00 00       	jmp    0xab7
     46f:	6a 00                	push   0x0
     471:	6a 73                	push   0x73
     473:	e9 3f 06 00 00       	jmp    0xab7
     478:	6a 00                	push   0x0
     47a:	6a 74                	push   0x74
     47c:	e9 36 06 00 00       	jmp    0xab7
     481:	6a 00                	push   0x0
     483:	6a 75                	push   0x75
     485:	e9 2d 06 00 00       	jmp    0xab7
     48a:	6a 00                	push   0x0
     48c:	6a 76                	push   0x76
     48e:	e9 24 06 00 00       	jmp    0xab7
     493:	6a 00                	push   0x0
     495:	6a 77                	push   0x77
     497:	e9 1b 06 00 00       	jmp    0xab7
     49c:	6a 00                	push   0x0
     49e:	6a 78                	push   0x78
     4a0:	e9 12 06 00 00       	jmp    0xab7
     4a5:	6a 00                	push   0x0
     4a7:	6a 79                	push   0x79
     4a9:	e9 09 06 00 00       	jmp    0xab7
     4ae:	6a 00                	push   0x0
     4b0:	6a 7a                	push   0x7a
     4b2:	e9 00 06 00 00       	jmp    0xab7
     4b7:	6a 00                	push   0x0
     4b9:	6a 7b                	push   0x7b
     4bb:	e9 f7 05 00 00       	jmp    0xab7
     4c0:	6a 00                	push   0x0
     4c2:	6a 7c                	push   0x7c
     4c4:	e9 ee 05 00 00       	jmp    0xab7
     4c9:	6a 00                	push   0x0
     4cb:	6a 7d                	push   0x7d
     4cd:	e9 e5 05 00 00       	jmp    0xab7
     4d2:	6a 00                	push   0x0
     4d4:	6a 7e                	push   0x7e
     4d6:	e9 dc 05 00 00       	jmp    0xab7
     4db:	6a 00                	push   0x0
     4dd:	6a 7f                	push   0x7f
     4df:	e9 d3 05 00 00       	jmp    0xab7
     4e4:	6a 00                	push   0x0
     4e6:	68 80 00 00 00       	push   0x80
     4eb:	e9 c7 05 00 00       	jmp    0xab7
     4f0:	6a 00                	push   0x0
     4f2:	68 81 00 00 00       	push   0x81
     4f7:	e9 bb 05 00 00       	jmp    0xab7
     4fc:	6a 00                	push   0x0
     4fe:	68 82 00 00 00       	push   0x82
     503:	e9 af 05 00 00       	jmp    0xab7
     508:	6a 00                	push   0x0
     50a:	68 83 00 00 00       	push   0x83
     50f:	e9 a3 05 00 00       	jmp    0xab7
     514:	6a 00                	push   0x0
     516:	68 84 00 00 00       	push   0x84
     51b:	e9 97 05 00 00       	jmp    0xab7
     520:	6a 00                	push   0x0
     522:	68 85 00 00 00       	push   0x85
     527:	e9 8b 05 00 00       	jmp    0xab7
     52c:	6a 00                	push   0x0
     52e:	68 86 00 00 00       	push   0x86
     533:	e9 7f 05 00 00       	jmp    0xab7
     538:	6a 00                	push   0x0
     53a:	68 87 00 00 00       	push   0x87
     53f:	e9 73 05 00 00       	jmp    0xab7
     544:	6a 00                	push   0x0
     546:	68 88 00 00 00       	push   0x88
     54b:	e9 67 05 00 00       	jmp    0xab7
     550:	6a 00                	push   0x0
     552:	68 89 00 00 00       	push   0x89
     557:	e9 5b 05 00 00       	jmp    0xab7
     55c:	6a 00                	push   0x0
     55e:	68 8a 00 00 00       	push   0x8a
     563:	e9 4f 05 00 00       	jmp    0xab7
     568:	6a 00                	push   0x0
     56a:	68 8b 00 00 00       	push   0x8b
     56f:	e9 43 05 00 00       	jmp    0xab7
     574:	6a 00                	push   0x0
     576:	68 8c 00 00 00       	push   0x8c
     57b:	e9 37 05 00 00       	jmp    0xab7
     580:	6a 00                	push   0x0
     582:	68 8d 00 00 00       	push   0x8d
     587:	e9 2b 05 00 00       	jmp    0xab7
     58c:	6a 00                	push   0x0
     58e:	68 8e 00 00 00       	push   0x8e
     593:	e9 1f 05 00 00       	jmp    0xab7
     598:	6a 00                	push   0x0
     59a:	68 8f 00 00 00       	push   0x8f
     59f:	e9 13 05 00 00       	jmp    0xab7
     5a4:	6a 00                	push   0x0
     5a6:	68 90 00 00 00       	push   0x90
     5ab:	e9 07 05 00 00       	jmp    0xab7
     5b0:	6a 00                	push   0x0
     5b2:	68 91 00 00 00       	push   0x91
     5b7:	e9 fb 04 00 00       	jmp    0xab7
     5bc:	6a 00                	push   0x0
     5be:	68 92 00 00 00       	push   0x92
     5c3:	e9 ef 04 00 00       	jmp    0xab7
     5c8:	6a 00                	push   0x0
     5ca:	68 93 00 00 00       	push   0x93
     5cf:	e9 e3 04 00 00       	jmp    0xab7
     5d4:	6a 00                	push   0x0
     5d6:	68 94 00 00 00       	push   0x94
     5db:	e9 d7 04 00 00       	jmp    0xab7
     5e0:	6a 00                	push   0x0
     5e2:	68 95 00 00 00       	push   0x95
     5e7:	e9 cb 04 00 00       	jmp    0xab7
     5ec:	6a 00                	push   0x0
     5ee:	68 96 00 00 00       	push   0x96
     5f3:	e9 bf 04 00 00       	jmp    0xab7
     5f8:	6a 00                	push   0x0
     5fa:	68 97 00 00 00       	push   0x97
     5ff:	e9 b3 04 00 00       	jmp    0xab7
     604:	6a 00                	push   0x0
     606:	68 98 00 00 00       	push   0x98
     60b:	e9 a7 04 00 00       	jmp    0xab7
     610:	6a 00                	push   0x0
     612:	68 99 00 00 00       	push   0x99
     617:	e9 9b 04 00 00       	jmp    0xab7
     61c:	6a 00                	push   0x0
     61e:	68 9a 00 00 00       	push   0x9a
     623:	e9 8f 04 00 00       	jmp    0xab7
     628:	6a 00                	push   0x0
     62a:	68 9b 00 00 00       	push   0x9b
     62f:	e9 83 04 00 00       	jmp    0xab7
     634:	6a 00                	push   0x0
     636:	68 9c 00 00 00       	push   0x9c
     63b:	e9 77 04 00 00       	jmp    0xab7
     640:	6a 00                	push   0x0
     642:	68 9d 00 00 00       	push   0x9d
     647:	e9 6b 04 00 00       	jmp    0xab7
     64c:	6a 00                	push   0x0
     64e:	68 9e 00 00 00       	push   0x9e
     653:	e9 5f 04 00 00       	jmp    0xab7
     658:	6a 00                	push   0x0
     65a:	68 9f 00 00 00       	push   0x9f
     65f:	e9 53 04 00 00       	jmp    0xab7
     664:	6a 00                	push   0x0
     666:	68 a0 00 00 00       	push   0xa0
     66b:	e9 47 04 00 00       	jmp    0xab7
     670:	6a 00                	push   0x0
     672:	68 a1 00 00 00       	push   0xa1
     677:	e9 3b 04 00 00       	jmp    0xab7
     67c:	6a 00                	push   0x0
     67e:	68 a2 00 00 00       	push   0xa2
     683:	e9 2f 04 00 00       	jmp    0xab7
     688:	6a 00                	push   0x0
     68a:	68 a3 00 00 00       	push   0xa3
     68f:	e9 23 04 00 00       	jmp    0xab7
     694:	6a 00                	push   0x0
     696:	68 a4 00 00 00       	push   0xa4
     69b:	e9 17 04 00 00       	jmp    0xab7
     6a0:	6a 00                	push   0x0
     6a2:	68 a5 00 00 00       	push   0xa5
     6a7:	e9 0b 04 00 00       	jmp    0xab7
     6ac:	6a 00                	push   0x0
     6ae:	68 a6 00 00 00       	push   0xa6
     6b3:	e9 ff 03 00 00       	jmp    0xab7
     6b8:	6a 00                	push   0x0
     6ba:	68 a7 00 00 00       	push   0xa7
     6bf:	e9 f3 03 00 00       	jmp    0xab7
     6c4:	6a 00                	push   0x0
     6c6:	68 a8 00 00 00       	push   0xa8
     6cb:	e9 e7 03 00 00       	jmp    0xab7
     6d0:	6a 00                	push   0x0
     6d2:	68 a9 00 00 00       	push   0xa9
     6d7:	e9 db 03 00 00       	jmp    0xab7
     6dc:	6a 00                	push   0x0
     6de:	68 aa 00 00 00       	push   0xaa
     6e3:	e9 cf 03 00 00       	jmp    0xab7
     6e8:	6a 00                	push   0x0
     6ea:	68 ab 00 00 00       	push   0xab
     6ef:	e9 c3 03 00 00       	jmp    0xab7
     6f4:	6a 00                	push   0x0
     6f6:	68 ac 00 00 00       	push   0xac
     6fb:	e9 b7 03 00 00       	jmp    0xab7
     700:	6a 00                	push   0x0
     702:	68 ad 00 00 00       	push   0xad
     707:	e9 ab 03 00 00       	jmp    0xab7
     70c:	6a 00                	push   0x0
     70e:	68 ae 00 00 00       	push   0xae
     713:	e9 9f 03 00 00       	jmp    0xab7
     718:	6a 00                	push   0x0
     71a:	68 af 00 00 00       	push   0xaf
     71f:	e9 93 03 00 00       	jmp    0xab7
     724:	6a 00                	push   0x0
     726:	68 b0 00 00 00       	push   0xb0
     72b:	e9 87 03 00 00       	jmp    0xab7
     730:	6a 00                	push   0x0
     732:	68 b1 00 00 00       	push   0xb1
     737:	e9 7b 03 00 00       	jmp    0xab7
     73c:	6a 00                	push   0x0
     73e:	68 b2 00 00 00       	push   0xb2
     743:	e9 6f 03 00 00       	jmp    0xab7
     748:	6a 00                	push   0x0
     74a:	68 b3 00 00 00       	push   0xb3
     74f:	e9 63 03 00 00       	jmp    0xab7
     754:	6a 00                	push   0x0
     756:	68 b4 00 00 00       	push   0xb4
     75b:	e9 57 03 00 00       	jmp    0xab7
     760:	6a 00                	push   0x0
     762:	68 b5 00 00 00       	push   0xb5
     767:	e9 4b 03 00 00       	jmp    0xab7
     76c:	6a 00                	push   0x0
     76e:	68 b6 00 00 00       	push   0xb6
     773:	e9 3f 03 00 00       	jmp    0xab7
     778:	6a 00                	push   0x0
     77a:	68 b7 00 00 00       	push   0xb7
     77f:	e9 33 03 00 00       	jmp    0xab7
     784:	6a 00                	push   0x0
     786:	68 b8 00 00 00       	push   0xb8
     78b:	e9 27 03 00 00       	jmp    0xab7
     790:	6a 00                	push   0x0
     792:	68 b9 00 00 00       	push   0xb9
     797:	e9 1b 03 00 00       	jmp    0xab7
     79c:	6a 00                	push   0x0
     79e:	68 ba 00 00 00       	push   0xba
     7a3:	e9 0f 03 00 00       	jmp    0xab7
     7a8:	6a 00                	push   0x0
     7aa:	68 bb 00 00 00       	push   0xbb
     7af:	e9 03 03 00 00       	jmp    0xab7
     7b4:	6a 00                	push   0x0
     7b6:	68 bc 00 00 00       	push   0xbc
     7bb:	e9 f7 02 00 00       	jmp    0xab7
     7c0:	6a 00                	push   0x0
     7c2:	68 bd 00 00 00       	push   0xbd
     7c7:	e9 eb 02 00 00       	jmp    0xab7
     7cc:	6a 00                	push   0x0
     7ce:	68 be 00 00 00       	push   0xbe
     7d3:	e9 df 02 00 00       	jmp    0xab7
     7d8:	6a 00                	push   0x0
     7da:	68 bf 00 00 00       	push   0xbf
     7df:	e9 d3 02 00 00       	jmp    0xab7
     7e4:	6a 00                	push   0x0
     7e6:	68 c0 00 00 00       	push   0xc0
     7eb:	e9 c7 02 00 00       	jmp    0xab7
     7f0:	6a 00                	push   0x0
     7f2:	68 c1 00 00 00       	push   0xc1
     7f7:	e9 bb 02 00 00       	jmp    0xab7
     7fc:	6a 00                	push   0x0
     7fe:	68 c2 00 00 00       	push   0xc2
     803:	e9 af 02 00 00       	jmp    0xab7
     808:	6a 00                	push   0x0
     80a:	68 c3 00 00 00       	push   0xc3
     80f:	e9 a3 02 00 00       	jmp    0xab7
     814:	6a 00                	push   0x0
     816:	68 c4 00 00 00       	push   0xc4
     81b:	e9 97 02 00 00       	jmp    0xab7
     820:	6a 00                	push   0x0
     822:	68 c5 00 00 00       	push   0xc5
     827:	e9 8b 02 00 00       	jmp    0xab7
     82c:	6a 00                	push   0x0
     82e:	68 c6 00 00 00       	push   0xc6
     833:	e9 7f 02 00 00       	jmp    0xab7
     838:	6a 00                	push   0x0
     83a:	68 c7 00 00 00       	push   0xc7
     83f:	e9 73 02 00 00       	jmp    0xab7
     844:	6a 00                	push   0x0
     846:	68 c8 00 00 00       	push   0xc8
     84b:	e9 67 02 00 00       	jmp    0xab7
     850:	6a 00                	push   0x0
     852:	68 c9 00 00 00       	push   0xc9
     857:	e9 5b 02 00 00       	jmp    0xab7
     85c:	6a 00                	push   0x0
     85e:	68 ca 00 00 00       	push   0xca
     863:	e9 4f 02 00 00       	jmp    0xab7
     868:	6a 00                	push   0x0
     86a:	68 cb 00 00 00       	push   0xcb
     86f:	e9 43 02 00 00       	jmp    0xab7
     874:	6a 00                	push   0x0
     876:	68 cc 00 00 00       	push   0xcc
     87b:	e9 37 02 00 00       	jmp    0xab7
     880:	6a 00                	push   0x0
     882:	68 cd 00 00 00       	push   0xcd
     887:	e9 2b 02 00 00       	jmp    0xab7
     88c:	6a 00                	push   0x0
     88e:	68 ce 00 00 00       	push   0xce
     893:	e9 1f 02 00 00       	jmp    0xab7
     898:	6a 00                	push   0x0
     89a:	68 cf 00 00 00       	push   0xcf
     89f:	e9 13 02 00 00       	jmp    0xab7
     8a4:	6a 00                	push   0x0
     8a6:	68 d0 00 00 00       	push   0xd0
     8ab:	e9 07 02 00 00       	jmp    0xab7
     8b0:	6a 00                	push   0x0
     8b2:	68 d1 00 00 00       	push   0xd1
     8b7:	e9 fb 01 00 00       	jmp    0xab7
     8bc:	6a 00                	push   0x0
     8be:	68 d2 00 00 00       	push   0xd2
     8c3:	e9 ef 01 00 00       	jmp    0xab7
     8c8:	6a 00                	push   0x0
     8ca:	68 d3 00 00 00       	push   0xd3
     8cf:	e9 e3 01 00 00       	jmp    0xab7
     8d4:	6a 00                	push   0x0
     8d6:	68 d4 00 00 00       	push   0xd4
     8db:	e9 d7 01 00 00       	jmp    0xab7
     8e0:	6a 00                	push   0x0
     8e2:	68 d5 00 00 00       	push   0xd5
     8e7:	e9 cb 01 00 00       	jmp    0xab7
     8ec:	6a 00                	push   0x0
     8ee:	68 d6 00 00 00       	push   0xd6
     8f3:	e9 bf 01 00 00       	jmp    0xab7
     8f8:	6a 00                	push   0x0
     8fa:	68 d7 00 00 00       	push   0xd7
     8ff:	e9 b3 01 00 00       	jmp    0xab7
     904:	6a 00                	push   0x0
     906:	68 d8 00 00 00       	push   0xd8
     90b:	e9 a7 01 00 00       	jmp    0xab7
     910:	6a 00                	push   0x0
     912:	68 d9 00 00 00       	push   0xd9
     917:	e9 9b 01 00 00       	jmp    0xab7
     91c:	6a 00                	push   0x0
     91e:	68 da 00 00 00       	push   0xda
     923:	e9 8f 01 00 00       	jmp    0xab7
     928:	6a 00                	push   0x0
     92a:	68 db 00 00 00       	push   0xdb
     92f:	e9 83 01 00 00       	jmp    0xab7
     934:	6a 00                	push   0x0
     936:	68 dc 00 00 00       	push   0xdc
     93b:	e9 77 01 00 00       	jmp    0xab7
     940:	6a 00                	push   0x0
     942:	68 dd 00 00 00       	push   0xdd
     947:	e9 6b 01 00 00       	jmp    0xab7
     94c:	6a 00                	push   0x0
     94e:	68 de 00 00 00       	push   0xde
     953:	e9 5f 01 00 00       	jmp    0xab7
     958:	6a 00                	push   0x0
     95a:	68 df 00 00 00       	push   0xdf
     95f:	e9 53 01 00 00       	jmp    0xab7
     964:	6a 00                	push   0x0
     966:	68 e0 00 00 00       	push   0xe0
     96b:	e9 47 01 00 00       	jmp    0xab7
     970:	6a 00                	push   0x0
     972:	68 e1 00 00 00       	push   0xe1
     977:	e9 3b 01 00 00       	jmp    0xab7
     97c:	6a 00                	push   0x0
     97e:	68 e2 00 00 00       	push   0xe2
     983:	e9 2f 01 00 00       	jmp    0xab7
     988:	6a 00                	push   0x0
     98a:	68 e3 00 00 00       	push   0xe3
     98f:	e9 23 01 00 00       	jmp    0xab7
     994:	6a 00                	push   0x0
     996:	68 e4 00 00 00       	push   0xe4
     99b:	e9 17 01 00 00       	jmp    0xab7
     9a0:	6a 00                	push   0x0
     9a2:	68 e5 00 00 00       	push   0xe5
     9a7:	e9 0b 01 00 00       	jmp    0xab7
     9ac:	6a 00                	push   0x0
     9ae:	68 e6 00 00 00       	push   0xe6
     9b3:	e9 ff 00 00 00       	jmp    0xab7
     9b8:	6a 00                	push   0x0
     9ba:	68 e7 00 00 00       	push   0xe7
     9bf:	e9 f3 00 00 00       	jmp    0xab7
     9c4:	6a 00                	push   0x0
     9c6:	68 e8 00 00 00       	push   0xe8
     9cb:	e9 e7 00 00 00       	jmp    0xab7
     9d0:	6a 00                	push   0x0
     9d2:	68 e9 00 00 00       	push   0xe9
     9d7:	e9 db 00 00 00       	jmp    0xab7
     9dc:	6a 00                	push   0x0
     9de:	68 ea 00 00 00       	push   0xea
     9e3:	e9 cf 00 00 00       	jmp    0xab7
     9e8:	6a 00                	push   0x0
     9ea:	68 eb 00 00 00       	push   0xeb
     9ef:	e9 c3 00 00 00       	jmp    0xab7
     9f4:	6a 00                	push   0x0
     9f6:	68 ec 00 00 00       	push   0xec
     9fb:	e9 b7 00 00 00       	jmp    0xab7
     a00:	6a 00                	push   0x0
     a02:	68 ed 00 00 00       	push   0xed
     a07:	e9 ab 00 00 00       	jmp    0xab7
     a0c:	6a 00                	push   0x0
     a0e:	68 ee 00 00 00       	push   0xee
     a13:	e9 9f 00 00 00       	jmp    0xab7
     a18:	6a 00                	push   0x0
     a1a:	68 ef 00 00 00       	push   0xef
     a1f:	e9 93 00 00 00       	jmp    0xab7
     a24:	6a 00                	push   0x0
     a26:	68 f0 00 00 00       	push   0xf0
     a2b:	e9 87 00 00 00       	jmp    0xab7
     a30:	6a 00                	push   0x0
     a32:	68 f1 00 00 00       	push   0xf1
     a37:	eb 7e                	jmp    0xab7
     a39:	6a 00                	push   0x0
     a3b:	68 f2 00 00 00       	push   0xf2
     a40:	eb 75                	jmp    0xab7
     a42:	6a 00                	push   0x0
     a44:	68 f3 00 00 00       	push   0xf3
     a49:	eb 6c                	jmp    0xab7
     a4b:	6a 00                	push   0x0
     a4d:	68 f4 00 00 00       	push   0xf4
     a52:	eb 63                	jmp    0xab7
     a54:	6a 00                	push   0x0
     a56:	68 f5 00 00 00       	push   0xf5
     a5b:	eb 5a                	jmp    0xab7
     a5d:	6a 00                	push   0x0
     a5f:	68 f6 00 00 00       	push   0xf6
     a64:	eb 51                	jmp    0xab7
     a66:	6a 00                	push   0x0
     a68:	68 f7 00 00 00       	push   0xf7
     a6d:	eb 48                	jmp    0xab7
     a6f:	6a 00                	push   0x0
     a71:	68 f8 00 00 00       	push   0xf8
     a76:	eb 3f                	jmp    0xab7
     a78:	6a 00                	push   0x0
     a7a:	68 f9 00 00 00       	push   0xf9
     a7f:	eb 36                	jmp    0xab7
     a81:	6a 00                	push   0x0
     a83:	68 fa 00 00 00       	push   0xfa
     a88:	eb 2d                	jmp    0xab7
     a8a:	6a 00                	push   0x0
     a8c:	68 fb 00 00 00       	push   0xfb
     a91:	eb 24                	jmp    0xab7
     a93:	6a 00                	push   0x0
     a95:	68 fc 00 00 00       	push   0xfc
     a9a:	eb 1b                	jmp    0xab7
     a9c:	6a 00                	push   0x0
     a9e:	68 fd 00 00 00       	push   0xfd
     aa3:	eb 12                	jmp    0xab7
     aa5:	6a 00                	push   0x0
     aa7:	68 fe 00 00 00       	push   0xfe
     aac:	eb 09                	jmp    0xab7
     aae:	6a 00                	push   0x0
     ab0:	68 ff 00 00 00       	push   0xff
     ab5:	eb 00                	jmp    0xab7
     ab7:	60                   	pusha  
     ab8:	31 c0                	xor    eax,eax
     aba:	66 8c d8             	mov    ax,ds
     abd:	50                   	push   eax
     abe:	66 b8 10 00          	mov    ax,0x10
     ac2:	8e d8                	mov    ds,eax
     ac4:	8e c0                	mov    es,eax
     ac6:	8e e0                	mov    fs,eax
     ac8:	8e e8                	mov    gs,eax
     aca:	54                   	push   esp
     acb:	e8 8d 3d 00 00       	call   0x485d
     ad0:	83 c4 04             	add    esp,0x4
     ad3:	58                   	pop    eax
     ad4:	8e d8                	mov    ds,eax
     ad6:	8e c0                	mov    es,eax
     ad8:	8e e0                	mov    fs,eax
     ada:	8e e8                	mov    gs,eax
     adc:	61                   	popa   
     add:	83 c4 08             	add    esp,0x8
     ae0:	cf                   	iret   
     ae1:	66 90                	xchg   ax,ax
     ae3:	90                   	nop
     ae4:	66 ba 43 00          	mov    dx,0x43
     ae8:	b0 34                	mov    al,0x34
     aea:	ee                   	out    dx,al
     aeb:	66 ba 40 00          	mov    dx,0x40
     aef:	66 b8 55 02          	mov    ax,0x255
     af3:	ee                   	out    dx,al
     af4:	88 e0                	mov    al,ah
     af6:	ee                   	out    dx,al
     af7:	c3                   	ret    
     af8:	55                   	push   ebp
     af9:	89 e5                	mov    ebp,esp
     afb:	90                   	nop
     afc:	5d                   	pop    ebp
     afd:	c3                   	ret    
     afe:	55                   	push   ebp
     aff:	89 e5                	mov    ebp,esp
     b01:	83 ec 08             	sub    esp,0x8
     b04:	83 ec 0c             	sub    esp,0xc
     b07:	68 f4 01 00 00       	push   0x1f4
     b0c:	e8 9c 03 00 00       	call   0xead
     b11:	83 c4 10             	add    esp,0x10
     b14:	90                   	nop
     b15:	c9                   	leave  
     b16:	c3                   	ret    
     b17:	55                   	push   ebp
     b18:	89 e5                	mov    ebp,esp
     b1a:	83 ec 18             	sub    esp,0x18
     b1d:	83 ec 0c             	sub    esp,0xc
     b20:	6a 02                	push   0x2
     b22:	e8 e7 01 00 00       	call   0xd0e
     b27:	83 c4 10             	add    esp,0x10
     b2a:	83 ec 08             	sub    esp,0x8
     b2d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     b30:	68 c0 4e 03 00       	push   0x34ec0
     b35:	e8 fb 05 00 00       	call   0x1135
     b3a:	83 c4 10             	add    esp,0x10
     b3d:	83 ec 0c             	sub    esp,0xc
     b40:	68 fc 4e 03 00       	push   0x34efc
     b45:	e8 eb 05 00 00       	call   0x1135
     b4a:	83 c4 10             	add    esp,0x10
     b4d:	83 ec 08             	sub    esp,0x8
     b50:	68 f8 0a 03 00       	push   0x30af8
     b55:	6a 00                	push   0x0
     b57:	e8 0d 28 00 00       	call   0x3369
     b5c:	83 c4 10             	add    esp,0x10
     b5f:	e8 2e 1e 00 00       	call   0x2992
     b64:	83 ec 0c             	sub    esp,0xc
     b67:	68 14 4f 03 00       	push   0x34f14
     b6c:	e8 c4 05 00 00       	call   0x1135
     b71:	83 c4 10             	add    esp,0x10
     b74:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     b77:	83 ec 0c             	sub    esp,0xc
     b7a:	50                   	push   eax
     b7b:	e8 f1 1f 00 00       	call   0x2b71
     b80:	83 c4 10             	add    esp,0x10
     b83:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
     b86:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
     b89:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
     b8c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
     b8f:	0f ac d0 0c          	shrd   eax,edx,0xc
     b93:	c1 ea 0c             	shr    edx,0xc
     b96:	83 ec 0c             	sub    esp,0xc
     b99:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
     b9c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
     b9f:	52                   	push   edx
     ba0:	50                   	push   eax
     ba1:	68 3c 4f 03 00       	push   0x34f3c
     ba6:	e8 8a 05 00 00       	call   0x1135
     bab:	83 c4 20             	add    esp,0x20
     bae:	83 ec 08             	sub    esp,0x8
     bb1:	68 fe 0a 03 00       	push   0x30afe
     bb6:	6a 00                	push   0x0
     bb8:	e8 ac 27 00 00       	call   0x3369
     bbd:	83 c4 10             	add    esp,0x10
     bc0:	83 ec 08             	sub    esp,0x8
     bc3:	68 99 2a 03 00       	push   0x32a99
     bc8:	6a 01                	push   0x1
     bca:	e8 9a 27 00 00       	call   0x3369
     bcf:	83 c4 10             	add    esp,0x10
     bd2:	e8 bc 03 00 00       	call   0xf93
     bd7:	83 ec 0c             	sub    esp,0xc
     bda:	6a db                	push   0xffffffdb
     bdc:	e8 d0 03 00 00       	call   0xfb1
     be1:	83 c4 10             	add    esp,0x10
     be4:	83 ec 0c             	sub    esp,0xc
     be7:	68 87 4f 03 00       	push   0x34f87
     bec:	e8 44 05 00 00       	call   0x1135
     bf1:	83 c4 10             	add    esp,0x10
     bf4:	83 ec 08             	sub    esp,0x8
     bf7:	8d 45 ec             	lea    eax,[ebp-0x14]
     bfa:	50                   	push   eax
     bfb:	68 98 4f 03 00       	push   0x34f98
     c00:	e8 d5 08 00 00       	call   0x14da
     c05:	83 c4 10             	add    esp,0x10
     c08:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
     c0b:	83 ec 0c             	sub    esp,0xc
     c0e:	50                   	push   eax
     c0f:	e8 81 23 00 00       	call   0x2f95
     c14:	83 c4 10             	add    esp,0x10
     c17:	eb cb                	jmp    0xbe4
     c19:	55                   	push   ebp
     c1a:	89 e5                	mov    ebp,esp
     c1c:	83 ec 14             	sub    esp,0x14
     c1f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     c22:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
     c26:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     c29:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
     c2c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     c2f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
     c32:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
     c38:	eb 22                	jmp    0xc5c
     c3a:	0f b7 55 fe          	movzx  edx,WORD PTR [ebp-0x2]
     c3e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     c41:	01 d0                	add    eax,edx
     c43:	0f b7 4d fe          	movzx  ecx,WORD PTR [ebp-0x2]
     c47:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
     c4a:	01 ca                	add    edx,ecx
     c4c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     c4f:	88 02                	mov    BYTE PTR [edx],al
     c51:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     c55:	83 c0 01             	add    eax,0x1
     c58:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
     c5c:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     c60:	66 3b 45 ec          	cmp    ax,WORD PTR [ebp-0x14]
     c64:	72 d4                	jb     0xc3a
     c66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     c69:	c9                   	leave  
     c6a:	c3                   	ret    
     c6b:	55                   	push   ebp
     c6c:	89 e5                	mov    ebp,esp
     c6e:	83 ec 14             	sub    esp,0x14
     c71:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     c74:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
     c78:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     c7b:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
     c7e:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
     c84:	eb 19                	jmp    0xc9f
     c86:	0f b7 55 fe          	movzx  edx,WORD PTR [ebp-0x2]
     c8a:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     c8d:	01 d0                	add    eax,edx
     c8f:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
     c92:	88 10                	mov    BYTE PTR [eax],dl
     c94:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     c98:	83 c0 01             	add    eax,0x1
     c9b:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
     c9f:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     ca3:	66 3b 45 ec          	cmp    ax,WORD PTR [ebp-0x14]
     ca7:	72 dd                	jb     0xc86
     ca9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     cac:	c9                   	leave  
     cad:	c3                   	ret    
     cae:	55                   	push   ebp
     caf:	89 e5                	mov    ebp,esp
     cb1:	83 ec 14             	sub    esp,0x14
     cb4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
     cb7:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
     cbb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     cbe:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
     cc1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     cc4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
     cc7:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
     ccd:	eb 2e                	jmp    0xcfd
     ccf:	0f b7 55 fe          	movzx  edx,WORD PTR [ebp-0x2]
     cd3:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     cd6:	01 d0                	add    eax,edx
     cd8:	0f b6 10             	movzx  edx,BYTE PTR [eax]
     cdb:	0f b7 4d fe          	movzx  ecx,WORD PTR [ebp-0x2]
     cdf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     ce2:	01 c8                	add    eax,ecx
     ce4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     ce7:	38 c2                	cmp    dl,al
     ce9:	74 07                	je     0xcf2
     ceb:	b8 01 00 00 00       	mov    eax,0x1
     cf0:	eb 1a                	jmp    0xd0c
     cf2:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     cf6:	83 c0 01             	add    eax,0x1
     cf9:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
     cfd:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
     d01:	66 3b 45 ec          	cmp    ax,WORD PTR [ebp-0x14]
     d05:	72 c8                	jb     0xccf
     d07:	b8 00 00 00 00       	mov    eax,0x0
     d0c:	c9                   	leave  
     d0d:	c3                   	ret    
     d0e:	55                   	push   ebp
     d0f:	89 e5                	mov    ebp,esp
     d11:	83 ec 18             	sub    esp,0x18
     d14:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     d17:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
     d1a:	0f b6 45 f4          	movzx  eax,BYTE PTR [ebp-0xc]
     d1e:	83 ec 08             	sub    esp,0x8
     d21:	50                   	push   eax
     d22:	68 00 59 03 00       	push   0x35900
     d27:	e8 02 1a 00 00       	call   0x272e
     d2c:	83 c4 10             	add    esp,0x10
     d2f:	0f b6 45 f4          	movzx  eax,BYTE PTR [ebp-0xc]
     d33:	68 9c 4f 03 00       	push   0x34f9c
     d38:	50                   	push   eax
     d39:	6a 17                	push   0x17
     d3b:	6a 4e                	push   0x4e
     d3d:	6a 01                	push   0x1
     d3f:	6a 01                	push   0x1
     d41:	68 00 59 03 00       	push   0x35900
     d46:	68 20 59 03 00       	push   0x35920
     d4b:	e8 a4 0f 00 00       	call   0x1cf4
     d50:	83 c4 20             	add    esp,0x20
     d53:	c7 05 48 5a 03 00 20 	mov    DWORD PTR ds:0x35a48,0x35920
     d5a:	59 03 00 
     d5d:	90                   	nop
     d5e:	c9                   	leave  
     d5f:	c3                   	ret    
     d60:	55                   	push   ebp
     d61:	89 e5                	mov    ebp,esp
     d63:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     d68:	5d                   	pop    ebp
     d69:	c3                   	ret    
     d6a:	55                   	push   ebp
     d6b:	89 e5                	mov    ebp,esp
     d6d:	b8 60 5a 03 00       	mov    eax,0x35a60
     d72:	5d                   	pop    ebp
     d73:	c3                   	ret    
     d74:	55                   	push   ebp
     d75:	89 e5                	mov    ebp,esp
     d77:	b8 60 5c 03 00       	mov    eax,0x35c60
     d7c:	5d                   	pop    ebp
     d7d:	c3                   	ret    
     d7e:	55                   	push   ebp
     d7f:	89 e5                	mov    ebp,esp
     d81:	b8 80 5c 03 00       	mov    eax,0x35c80
     d86:	5d                   	pop    ebp
     d87:	c3                   	ret    
     d88:	55                   	push   ebp
     d89:	89 e5                	mov    ebp,esp
     d8b:	83 ec 10             	sub    esp,0x10
     d8e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     d91:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
     d94:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     d97:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
     d9a:	eb 13                	jmp    0xdaf
     d9c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     d9f:	0f b6 10             	movzx  edx,BYTE PTR [eax]
     da2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
     da5:	88 10                	mov    BYTE PTR [eax],dl
     da7:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
     dab:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
     daf:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     db2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     db5:	84 c0                	test   al,al
     db7:	75 e3                	jne    0xd9c
     db9:	90                   	nop
     dba:	90                   	nop
     dbb:	c9                   	leave  
     dbc:	c3                   	ret    
     dbd:	55                   	push   ebp
     dbe:	89 e5                	mov    ebp,esp
     dc0:	83 ec 10             	sub    esp,0x10
     dc3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
     dca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     dcd:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
     dd0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
     dd3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
     dd6:	eb 17                	jmp    0xdef
     dd8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     ddb:	0f b6 10             	movzx  edx,BYTE PTR [eax]
     dde:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     de1:	88 10                	mov    BYTE PTR [eax],dl
     de3:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
     de7:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
     deb:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
     def:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
     df2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
     df5:	84 c0                	test   al,al
     df7:	75 df                	jne    0xdd8
     df9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
     dfc:	c9                   	leave  
     dfd:	c3                   	ret    
     dfe:	55                   	push   ebp
     dff:	89 e5                	mov    ebp,esp
     e01:	83 ec 18             	sub    esp,0x18
     e04:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     e09:	83 ec 08             	sub    esp,0x8
     e0c:	68 60 5a 03 00       	push   0x35a60
     e11:	50                   	push   eax
     e12:	e8 85 18 00 00       	call   0x269c
     e17:	83 c4 10             	add    esp,0x10
     e1a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
     e21:	eb 0f                	jmp    0xe32
     e23:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     e26:	05 60 5a 03 00       	add    eax,0x35a60
     e2b:	c6 00 00             	mov    BYTE PTR [eax],0x0
     e2e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
     e32:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [ebp-0xc],0x1ff
     e39:	7e e8                	jle    0xe23
     e3b:	66 c7 05 80 5e 03 00 	mov    WORD PTR ds:0x35e80,0x0
     e42:	00 00 
     e44:	90                   	nop
     e45:	c9                   	leave  
     e46:	c3                   	ret    
     e47:	55                   	push   ebp
     e48:	89 e5                	mov    ebp,esp
     e4a:	83 ec 10             	sub    esp,0x10
     e4d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
     e54:	eb 0f                	jmp    0xe65
     e56:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
     e59:	05 60 5c 03 00       	add    eax,0x35c60
     e5e:	c6 00 00             	mov    BYTE PTR [eax],0x0
     e61:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
     e65:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [ebp-0x4],0x1ff
     e6c:	7e e8                	jle    0xe56
     e6e:	66 c7 05 82 5e 03 00 	mov    WORD PTR ds:0x35e82,0x0
     e75:	00 00 
     e77:	90                   	nop
     e78:	c9                   	leave  
     e79:	c3                   	ret    
     e7a:	55                   	push   ebp
     e7b:	89 e5                	mov    ebp,esp
     e7d:	83 ec 10             	sub    esp,0x10
     e80:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
     e87:	eb 0f                	jmp    0xe98
     e89:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
     e8c:	05 80 5c 03 00       	add    eax,0x35c80
     e91:	c6 00 00             	mov    BYTE PTR [eax],0x0
     e94:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
     e98:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [ebp-0x4],0x1ff
     e9f:	7e e8                	jle    0xe89
     ea1:	66 c7 05 84 5e 03 00 	mov    WORD PTR ds:0x35e84,0x0
     ea8:	00 00 
     eaa:	90                   	nop
     eab:	c9                   	leave  
     eac:	c3                   	ret    
     ead:	55                   	push   ebp
     eae:	89 e5                	mov    ebp,esp
     eb0:	83 ec 08             	sub    esp,0x8
     eb3:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     eb8:	83 ec 08             	sub    esp,0x8
     ebb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
     ebe:	50                   	push   eax
     ebf:	e8 f5 0d 00 00       	call   0x1cb9
     ec4:	83 c4 10             	add    esp,0x10
     ec7:	90                   	nop
     ec8:	c9                   	leave  
     ec9:	c3                   	ret    
     eca:	55                   	push   ebp
     ecb:	89 e5                	mov    ebp,esp
     ecd:	83 ec 28             	sub    esp,0x28
     ed0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     ed3:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
     ed6:	80 7d e4 08          	cmp    BYTE PTR [ebp-0x1c],0x8
     eda:	75 2f                	jne    0xf0b
     edc:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     ee3:	66 85 c0             	test   ax,ax
     ee6:	74 10                	je     0xef8
     ee8:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     eef:	83 e8 01             	sub    eax,0x1
     ef2:	66 a3 82 5e 03 00    	mov    ds:0x35e82,ax
     ef8:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     eff:	0f b7 c0             	movzx  eax,ax
     f02:	c6 80 60 5c 03 00 00 	mov    BYTE PTR [eax+0x35c60],0x0
     f09:	eb 24                	jmp    0xf2f
     f0b:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     f12:	0f b7 c0             	movzx  eax,ax
     f15:	0f b6 55 e4          	movzx  edx,BYTE PTR [ebp-0x1c]
     f19:	88 90 60 5c 03 00    	mov    BYTE PTR [eax+0x35c60],dl
     f1f:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     f26:	83 c0 01             	add    eax,0x1
     f29:	66 a3 82 5e 03 00    	mov    ds:0x35e82,ax
     f2f:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
     f36:	66 3d fe 01          	cmp    ax,0x1fe
     f3a:	76 3e                	jbe    0xf7a
     f3c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
     f43:	eb 1c                	jmp    0xf61
     f45:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
     f48:	83 c0 01             	add    eax,0x1
     f4b:	0f b6 80 60 5c 03 00 	movzx  eax,BYTE PTR [eax+0x35c60]
     f52:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
     f55:	81 c2 60 5c 03 00    	add    edx,0x35c60
     f5b:	88 02                	mov    BYTE PTR [edx],al
     f5d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
     f61:	81 7d f4 fd 01 00 00 	cmp    DWORD PTR [ebp-0xc],0x1fd
     f68:	7e db                	jle    0xf45
     f6a:	c6 05 5f 5e 03 00 00 	mov    BYTE PTR ds:0x35e5f,0x0
     f71:	66 c7 05 82 5e 03 00 	mov    WORD PTR ds:0x35e82,0x1fe
     f78:	fe 01 
     f7a:	0f be 55 e4          	movsx  edx,BYTE PTR [ebp-0x1c]
     f7e:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     f83:	83 ec 08             	sub    esp,0x8
     f86:	52                   	push   edx
     f87:	50                   	push   eax
     f88:	e8 41 14 00 00       	call   0x23ce
     f8d:	83 c4 10             	add    esp,0x10
     f90:	90                   	nop
     f91:	c9                   	leave  
     f92:	c3                   	ret    
     f93:	55                   	push   ebp
     f94:	89 e5                	mov    ebp,esp
     f96:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     f9b:	c6 40 14 01          	mov    BYTE PTR [eax+0x14],0x1
     f9f:	90                   	nop
     fa0:	5d                   	pop    ebp
     fa1:	c3                   	ret    
     fa2:	55                   	push   ebp
     fa3:	89 e5                	mov    ebp,esp
     fa5:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     faa:	c6 40 14 00          	mov    BYTE PTR [eax+0x14],0x0
     fae:	90                   	nop
     faf:	5d                   	pop    ebp
     fb0:	c3                   	ret    
     fb1:	55                   	push   ebp
     fb2:	89 e5                	mov    ebp,esp
     fb4:	83 ec 04             	sub    esp,0x4
     fb7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     fba:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
     fbd:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
     fc2:	0f b6 55 fc          	movzx  edx,BYTE PTR [ebp-0x4]
     fc6:	88 50 15             	mov    BYTE PTR [eax+0x15],dl
     fc9:	90                   	nop
     fca:	c9                   	leave  
     fcb:	c3                   	ret    
     fcc:	55                   	push   ebp
     fcd:	89 e5                	mov    ebp,esp
     fcf:	83 ec 04             	sub    esp,0x4
     fd2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
     fd5:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
     fd8:	0f b7 05 80 5e 03 00 	movzx  eax,WORD PTR ds:0x35e80
     fdf:	0f b7 c0             	movzx  eax,ax
     fe2:	0f b6 55 fc          	movzx  edx,BYTE PTR [ebp-0x4]
     fe6:	88 90 60 5a 03 00    	mov    BYTE PTR [eax+0x35a60],dl
     fec:	0f b7 05 80 5e 03 00 	movzx  eax,WORD PTR ds:0x35e80
     ff3:	83 c0 01             	add    eax,0x1
     ff6:	66 a3 80 5e 03 00    	mov    ds:0x35e80,ax
     ffc:	90                   	nop
     ffd:	c9                   	leave  
     ffe:	c3                   	ret    
     fff:	55                   	push   ebp
    1000:	89 e5                	mov    ebp,esp
    1002:	eb 16                	jmp    0x101a
    1004:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1007:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    100a:	0f be c0             	movsx  eax,al
    100d:	50                   	push   eax
    100e:	e8 b9 ff ff ff       	call   0xfcc
    1013:	83 c4 04             	add    esp,0x4
    1016:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    101a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    101d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1020:	84 c0                	test   al,al
    1022:	75 e0                	jne    0x1004
    1024:	90                   	nop
    1025:	90                   	nop
    1026:	c9                   	leave  
    1027:	c3                   	ret    
    1028:	55                   	push   ebp
    1029:	89 e5                	mov    ebp,esp
    102b:	57                   	push   edi
    102c:	56                   	push   esi
    102d:	53                   	push   ebx
    102e:	83 ec 4c             	sub    esp,0x4c
    1031:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1034:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
    1037:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    103a:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
    103d:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
    1044:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1047:	89 c1                	mov    ecx,eax
    1049:	89 c3                	mov    ebx,eax
    104b:	c1 fb 1f             	sar    ebx,0x1f
    104e:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
    1051:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
    1054:	53                   	push   ebx
    1055:	51                   	push   ecx
    1056:	52                   	push   edx
    1057:	50                   	push   eax
    1058:	e8 23 3d 00 00       	call   0x4d80
    105d:	83 c4 10             	add    esp,0x10
    1060:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
    1063:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
    1066:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1069:	99                   	cdq    
    106a:	52                   	push   edx
    106b:	50                   	push   eax
    106c:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
    106f:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
    1072:	e8 e9 3b 00 00       	call   0x4c60
    1077:	83 c4 10             	add    esp,0x10
    107a:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
    107d:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
    1080:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1083:	8d 50 01             	lea    edx,[eax+0x1]
    1086:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    1089:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    108c:	81 c2 ac 4f 03 00    	add    edx,0x34fac
    1092:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    1095:	88 54 05 b8          	mov    BYTE PTR [ebp+eax*1-0x48],dl
    1099:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
    109c:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
    109f:	89 c6                	mov    esi,eax
    10a1:	89 d7                	mov    edi,edx
    10a3:	89 f8                	mov    eax,edi
    10a5:	09 f0                	or     eax,esi
    10a7:	85 c0                	test   eax,eax
    10a9:	75 99                	jne    0x1044
    10ab:	eb 1a                	jmp    0x10c7
    10ad:	8d 55 b8             	lea    edx,[ebp-0x48]
    10b0:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    10b3:	01 d0                	add    eax,edx
    10b5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    10b8:	0f be c0             	movsx  eax,al
    10bb:	83 ec 0c             	sub    esp,0xc
    10be:	50                   	push   eax
    10bf:	e8 08 ff ff ff       	call   0xfcc
    10c4:	83 c4 10             	add    esp,0x10
    10c7:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
    10cb:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
    10cf:	79 dc                	jns    0x10ad
    10d1:	90                   	nop
    10d2:	90                   	nop
    10d3:	8d 65 f4             	lea    esp,[ebp-0xc]
    10d6:	5b                   	pop    ebx
    10d7:	5e                   	pop    esi
    10d8:	5f                   	pop    edi
    10d9:	5d                   	pop    ebp
    10da:	c3                   	ret    
    10db:	55                   	push   ebp
    10dc:	89 e5                	mov    ebp,esp
    10de:	83 ec 18             	sub    esp,0x18
    10e1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    10e4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    10e7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    10ea:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    10ed:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
    10f1:	79 29                	jns    0x111c
    10f3:	6a 2d                	push   0x2d
    10f5:	e8 d2 fe ff ff       	call   0xfcc
    10fa:	83 c4 04             	add    esp,0x4
    10fd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1100:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    1103:	f7 d8                	neg    eax
    1105:	83 d2 00             	adc    edx,0x0
    1108:	f7 da                	neg    edx
    110a:	83 ec 04             	sub    esp,0x4
    110d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    1110:	52                   	push   edx
    1111:	50                   	push   eax
    1112:	e8 11 ff ff ff       	call   0x1028
    1117:	83 c4 10             	add    esp,0x10
    111a:	eb 16                	jmp    0x1132
    111c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    111f:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
    1122:	83 ec 04             	sub    esp,0x4
    1125:	ff 75 10             	push   DWORD PTR [ebp+0x10]
    1128:	52                   	push   edx
    1129:	50                   	push   eax
    112a:	e8 f9 fe ff ff       	call   0x1028
    112f:	83 c4 10             	add    esp,0x10
    1132:	90                   	nop
    1133:	c9                   	leave  
    1134:	c3                   	ret    
    1135:	55                   	push   ebp
    1136:	89 e5                	mov    ebp,esp
    1138:	83 ec 28             	sub    esp,0x28
    113b:	8d 45 0c             	lea    eax,[ebp+0xc]
    113e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
    1141:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    1148:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
    114f:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
    1156:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
    115a:	c6 45 ea 00          	mov    BYTE PTR [ebp-0x16],0x0
    115e:	e9 c9 02 00 00       	jmp    0x142c
    1163:	83 7d f4 04          	cmp    DWORD PTR [ebp-0xc],0x4
    1167:	0f 87 bb 02 00 00    	ja     0x1428
    116d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1170:	c1 e0 02             	shl    eax,0x2
    1173:	05 c0 4f 03 00       	add    eax,0x34fc0
    1178:	8b 00                	mov    eax,DWORD PTR [eax]
    117a:	ff e0                	jmp    eax
    117c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    117f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1182:	0f be c0             	movsx  eax,al
    1185:	83 f8 25             	cmp    eax,0x25
    1188:	75 09                	jne    0x1193
    118a:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [ebp-0xc],0x1
    1191:	eb 13                	jmp    0x11a6
    1193:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1196:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1199:	0f be c0             	movsx  eax,al
    119c:	50                   	push   eax
    119d:	e8 2a fe ff ff       	call   0xfcc
    11a2:	83 c4 04             	add    esp,0x4
    11a5:	90                   	nop
    11a6:	e9 7d 02 00 00       	jmp    0x1428
    11ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    11ae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    11b1:	0f be c0             	movsx  eax,al
    11b4:	83 f8 68             	cmp    eax,0x68
    11b7:	74 07                	je     0x11c0
    11b9:	83 f8 6c             	cmp    eax,0x6c
    11bc:	74 12                	je     0x11d0
    11be:	eb 62                	jmp    0x1222
    11c0:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [ebp-0x10],0x2
    11c7:	c7 45 f4 02 00 00 00 	mov    DWORD PTR [ebp-0xc],0x2
    11ce:	eb 0f                	jmp    0x11df
    11d0:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [ebp-0x10],0x3
    11d7:	c7 45 f4 03 00 00 00 	mov    DWORD PTR [ebp-0xc],0x3
    11de:	90                   	nop
    11df:	e9 44 02 00 00       	jmp    0x1428
    11e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    11e7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    11ea:	3c 68                	cmp    al,0x68
    11ec:	75 30                	jne    0x121e
    11ee:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [ebp-0x10],0x1
    11f5:	c7 45 f4 04 00 00 00 	mov    DWORD PTR [ebp-0xc],0x4
    11fc:	e9 27 02 00 00       	jmp    0x1428
    1201:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1204:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1207:	3c 6c                	cmp    al,0x6c
    1209:	75 16                	jne    0x1221
    120b:	c7 45 f0 04 00 00 00 	mov    DWORD PTR [ebp-0x10],0x4
    1212:	c7 45 f4 04 00 00 00 	mov    DWORD PTR [ebp-0xc],0x4
    1219:	e9 0a 02 00 00       	jmp    0x1428
    121e:	90                   	nop
    121f:	eb 01                	jmp    0x1222
    1221:	90                   	nop
    1222:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1225:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1228:	0f be c0             	movsx  eax,al
    122b:	83 f8 25             	cmp    eax,0x25
    122e:	74 5f                	je     0x128f
    1230:	83 f8 25             	cmp    eax,0x25
    1233:	0f 8c a6 00 00 00    	jl     0x12df
    1239:	83 f8 78             	cmp    eax,0x78
    123c:	0f 8f 9d 00 00 00    	jg     0x12df
    1242:	83 f8 58             	cmp    eax,0x58
    1245:	0f 8c 94 00 00 00    	jl     0x12df
    124b:	83 e8 58             	sub    eax,0x58
    124e:	83 f8 20             	cmp    eax,0x20
    1251:	0f 87 88 00 00 00    	ja     0x12df
    1257:	8b 04 85 d4 4f 03 00 	mov    eax,DWORD PTR [eax*4+0x34fd4]
    125e:	ff e0                	jmp    eax
    1260:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1263:	8d 50 04             	lea    edx,[eax+0x4]
    1266:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    1269:	8b 00                	mov    eax,DWORD PTR [eax]
    126b:	0f be c0             	movsx  eax,al
    126e:	50                   	push   eax
    126f:	e8 58 fd ff ff       	call   0xfcc
    1274:	83 c4 04             	add    esp,0x4
    1277:	eb 67                	jmp    0x12e0
    1279:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    127c:	8d 50 04             	lea    edx,[eax+0x4]
    127f:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    1282:	8b 00                	mov    eax,DWORD PTR [eax]
    1284:	50                   	push   eax
    1285:	e8 75 fd ff ff       	call   0xfff
    128a:	83 c4 04             	add    esp,0x4
    128d:	eb 51                	jmp    0x12e0
    128f:	6a 25                	push   0x25
    1291:	e8 36 fd ff ff       	call   0xfcc
    1296:	83 c4 04             	add    esp,0x4
    1299:	eb 45                	jmp    0x12e0
    129b:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
    12a2:	c6 45 eb 01          	mov    BYTE PTR [ebp-0x15],0x1
    12a6:	c6 45 ea 01          	mov    BYTE PTR [ebp-0x16],0x1
    12aa:	eb 34                	jmp    0x12e0
    12ac:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
    12b3:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
    12b7:	c6 45 ea 01          	mov    BYTE PTR [ebp-0x16],0x1
    12bb:	eb 23                	jmp    0x12e0
    12bd:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [ebp-0x14],0x10
    12c4:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
    12c8:	c6 45 ea 01          	mov    BYTE PTR [ebp-0x16],0x1
    12cc:	eb 12                	jmp    0x12e0
    12ce:	c7 45 ec 08 00 00 00 	mov    DWORD PTR [ebp-0x14],0x8
    12d5:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
    12d9:	c6 45 ea 01          	mov    BYTE PTR [ebp-0x16],0x1
    12dd:	eb 01                	jmp    0x12e0
    12df:	90                   	nop
    12e0:	80 7d ea 00          	cmp    BYTE PTR [ebp-0x16],0x0
    12e4:	0f 84 20 01 00 00    	je     0x140a
    12ea:	80 7d eb 00          	cmp    BYTE PTR [ebp-0x15],0x0
    12ee:	0f 84 91 00 00 00    	je     0x1385
    12f4:	83 7d f0 04          	cmp    DWORD PTR [ebp-0x10],0x4
    12f8:	74 68                	je     0x1362
    12fa:	83 7d f0 04          	cmp    DWORD PTR [ebp-0x10],0x4
    12fe:	0f 8f 06 01 00 00    	jg     0x140a
    1304:	83 7d f0 02          	cmp    DWORD PTR [ebp-0x10],0x2
    1308:	7f 0b                	jg     0x1315
    130a:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    130e:	79 10                	jns    0x1320
    1310:	e9 f5 00 00 00       	jmp    0x140a
    1315:	83 7d f0 03          	cmp    DWORD PTR [ebp-0x10],0x3
    1319:	74 26                	je     0x1341
    131b:	e9 ea 00 00 00       	jmp    0x140a
    1320:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1323:	8d 50 04             	lea    edx,[eax+0x4]
    1326:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    1329:	8b 00                	mov    eax,DWORD PTR [eax]
    132b:	99                   	cdq    
    132c:	83 ec 04             	sub    esp,0x4
    132f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1332:	52                   	push   edx
    1333:	50                   	push   eax
    1334:	e8 a2 fd ff ff       	call   0x10db
    1339:	83 c4 10             	add    esp,0x10
    133c:	e9 c9 00 00 00       	jmp    0x140a
    1341:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1344:	8d 50 04             	lea    edx,[eax+0x4]
    1347:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    134a:	8b 00                	mov    eax,DWORD PTR [eax]
    134c:	99                   	cdq    
    134d:	83 ec 04             	sub    esp,0x4
    1350:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1353:	52                   	push   edx
    1354:	50                   	push   eax
    1355:	e8 81 fd ff ff       	call   0x10db
    135a:	83 c4 10             	add    esp,0x10
    135d:	e9 a8 00 00 00       	jmp    0x140a
    1362:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1365:	8d 50 08             	lea    edx,[eax+0x8]
    1368:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    136b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    136e:	8b 00                	mov    eax,DWORD PTR [eax]
    1370:	83 ec 04             	sub    esp,0x4
    1373:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    1376:	52                   	push   edx
    1377:	50                   	push   eax
    1378:	e8 5e fd ff ff       	call   0x10db
    137d:	83 c4 10             	add    esp,0x10
    1380:	e9 85 00 00 00       	jmp    0x140a
    1385:	83 7d f0 04          	cmp    DWORD PTR [ebp-0x10],0x4
    1389:	74 60                	je     0x13eb
    138b:	83 7d f0 04          	cmp    DWORD PTR [ebp-0x10],0x4
    138f:	7f 79                	jg     0x140a
    1391:	83 7d f0 02          	cmp    DWORD PTR [ebp-0x10],0x2
    1395:	7f 08                	jg     0x139f
    1397:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
    139b:	79 0a                	jns    0x13a7
    139d:	eb 6b                	jmp    0x140a
    139f:	83 7d f0 03          	cmp    DWORD PTR [ebp-0x10],0x3
    13a3:	74 24                	je     0x13c9
    13a5:	eb 63                	jmp    0x140a
    13a7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    13aa:	8d 50 04             	lea    edx,[eax+0x4]
    13ad:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    13b0:	8b 00                	mov    eax,DWORD PTR [eax]
    13b2:	ba 00 00 00 00       	mov    edx,0x0
    13b7:	83 ec 04             	sub    esp,0x4
    13ba:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    13bd:	52                   	push   edx
    13be:	50                   	push   eax
    13bf:	e8 64 fc ff ff       	call   0x1028
    13c4:	83 c4 10             	add    esp,0x10
    13c7:	eb 41                	jmp    0x140a
    13c9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    13cc:	8d 50 04             	lea    edx,[eax+0x4]
    13cf:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    13d2:	8b 00                	mov    eax,DWORD PTR [eax]
    13d4:	ba 00 00 00 00       	mov    edx,0x0
    13d9:	83 ec 04             	sub    esp,0x4
    13dc:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    13df:	52                   	push   edx
    13e0:	50                   	push   eax
    13e1:	e8 42 fc ff ff       	call   0x1028
    13e6:	83 c4 10             	add    esp,0x10
    13e9:	eb 1f                	jmp    0x140a
    13eb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    13ee:	8d 50 08             	lea    edx,[eax+0x8]
    13f1:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
    13f4:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    13f7:	8b 00                	mov    eax,DWORD PTR [eax]
    13f9:	83 ec 04             	sub    esp,0x4
    13fc:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
    13ff:	52                   	push   edx
    1400:	50                   	push   eax
    1401:	e8 22 fc ff ff       	call   0x1028
    1406:	83 c4 10             	add    esp,0x10
    1409:	90                   	nop
    140a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    1411:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
    1418:	c7 45 ec 0a 00 00 00 	mov    DWORD PTR [ebp-0x14],0xa
    141f:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
    1423:	c6 45 ea 00          	mov    BYTE PTR [ebp-0x16],0x0
    1427:	90                   	nop
    1428:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    142c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    142f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1432:	84 c0                	test   al,al
    1434:	0f 85 29 fd ff ff    	jne    0x1163
    143a:	e8 bf f9 ff ff       	call   0xdfe
    143f:	90                   	nop
    1440:	c9                   	leave  
    1441:	c3                   	ret    
    1442:	55                   	push   ebp
    1443:	89 e5                	mov    ebp,esp
    1445:	83 ec 04             	sub    esp,0x4
    1448:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    144b:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
    144e:	0f be 45 fc          	movsx  eax,BYTE PTR [ebp-0x4]
    1452:	83 e8 30             	sub    eax,0x30
    1455:	83 f8 36             	cmp    eax,0x36
    1458:	77 79                	ja     0x14d3
    145a:	8b 04 85 58 50 03 00 	mov    eax,DWORD PTR [eax*4+0x35058]
    1461:	ff e0                	jmp    eax
    1463:	b8 00 00 00 00       	mov    eax,0x0
    1468:	eb 6e                	jmp    0x14d8
    146a:	b8 01 00 00 00       	mov    eax,0x1
    146f:	eb 67                	jmp    0x14d8
    1471:	b8 02 00 00 00       	mov    eax,0x2
    1476:	eb 60                	jmp    0x14d8
    1478:	b8 03 00 00 00       	mov    eax,0x3
    147d:	eb 59                	jmp    0x14d8
    147f:	b8 04 00 00 00       	mov    eax,0x4
    1484:	eb 52                	jmp    0x14d8
    1486:	b8 05 00 00 00       	mov    eax,0x5
    148b:	eb 4b                	jmp    0x14d8
    148d:	b8 06 00 00 00       	mov    eax,0x6
    1492:	eb 44                	jmp    0x14d8
    1494:	b8 07 00 00 00       	mov    eax,0x7
    1499:	eb 3d                	jmp    0x14d8
    149b:	b8 08 00 00 00       	mov    eax,0x8
    14a0:	eb 36                	jmp    0x14d8
    14a2:	b8 09 00 00 00       	mov    eax,0x9
    14a7:	eb 2f                	jmp    0x14d8
    14a9:	b8 0a 00 00 00       	mov    eax,0xa
    14ae:	eb 28                	jmp    0x14d8
    14b0:	b8 0b 00 00 00       	mov    eax,0xb
    14b5:	eb 21                	jmp    0x14d8
    14b7:	b8 0c 00 00 00       	mov    eax,0xc
    14bc:	eb 1a                	jmp    0x14d8
    14be:	b8 0d 00 00 00       	mov    eax,0xd
    14c3:	eb 13                	jmp    0x14d8
    14c5:	b8 0e 00 00 00       	mov    eax,0xe
    14ca:	eb 0c                	jmp    0x14d8
    14cc:	b8 0f 00 00 00       	mov    eax,0xf
    14d1:	eb 05                	jmp    0x14d8
    14d3:	b8 ff ff ff ff       	mov    eax,0xffffffff
    14d8:	c9                   	leave  
    14d9:	c3                   	ret    
    14da:	55                   	push   ebp
    14db:	89 e5                	mov    ebp,esp
    14dd:	57                   	push   edi
    14de:	56                   	push   esi
    14df:	53                   	push   ebx
    14e0:	83 ec 3c             	sub    esp,0x3c
    14e3:	8d 45 0c             	lea    eax,[ebp+0xc]
    14e6:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
    14e9:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    14ee:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    14f2:	0f b7 c8             	movzx  ecx,ax
    14f5:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    14fa:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    14fe:	0f b7 d0             	movzx  edx,ax
    1501:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    1506:	8b 1d 48 5a 03 00    	mov    ebx,DWORD PTR ds:0x35a48
    150c:	83 ec 04             	sub    esp,0x4
    150f:	51                   	push   ecx
    1510:	52                   	push   edx
    1511:	50                   	push   eax
    1512:	e8 67 06 00 00       	call   0x1b7e
    1517:	83 c4 10             	add    esp,0x10
    151a:	66 89 43 16          	mov    WORD PTR [ebx+0x16],ax
    151e:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1525:	66 85 c0             	test   ax,ax
    1528:	74 f4                	je     0x151e
    152a:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1531:	0f b7 c0             	movzx  eax,ax
    1534:	83 e8 01             	sub    eax,0x1
    1537:	0f b6 80 60 5c 03 00 	movzx  eax,BYTE PTR [eax+0x35c60]
    153e:	3c 0a                	cmp    al,0xa
    1540:	75 dc                	jne    0x151e
    1542:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1549:	0f b7 c0             	movzx  eax,ax
    154c:	83 e8 01             	sub    eax,0x1
    154f:	c6 80 60 5c 03 00 00 	mov    BYTE PTR [eax+0x35c60],0x0
    1556:	90                   	nop
    1557:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
    155e:	c7 45 e0 60 5c 03 00 	mov    DWORD PTR [ebp-0x20],0x35c60
    1565:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    156c:	c6 45 db 00          	mov    BYTE PTR [ebp-0x25],0x0
    1570:	c6 45 da 00          	mov    BYTE PTR [ebp-0x26],0x0
    1574:	e9 01 05 00 00       	jmp    0x1a7a
    1579:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
    157d:	74 0b                	je     0x158a
    157f:	83 7d dc 01          	cmp    DWORD PTR [ebp-0x24],0x1
    1583:	74 40                	je     0x15c5
    1585:	e9 ec 04 00 00       	jmp    0x1a76
    158a:	c6 45 db 00          	mov    BYTE PTR [ebp-0x25],0x0
    158e:	c6 45 da 00          	mov    BYTE PTR [ebp-0x26],0x0
    1592:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1595:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1598:	3c 25                	cmp    al,0x25
    159a:	75 0c                	jne    0x15a8
    159c:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
    15a3:	e9 ce 04 00 00       	jmp    0x1a76
    15a8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    15ab:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    15ae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    15b1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    15b4:	38 c2                	cmp    dl,al
    15b6:	0f 85 ce 04 00 00    	jne    0x1a8a
    15bc:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    15c0:	e9 b1 04 00 00       	jmp    0x1a76
    15c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    15c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    15cb:	0f be c0             	movsx  eax,al
    15ce:	83 e8 25             	sub    eax,0x25
    15d1:	83 f8 53             	cmp    eax,0x53
    15d4:	0f 87 d0 04 00 00    	ja     0x1aaa
    15da:	8b 04 85 34 51 03 00 	mov    eax,DWORD PTR [eax*4+0x35134]
    15e1:	ff e0                	jmp    eax
    15e3:	0f b6 45 db          	movzx  eax,BYTE PTR [ebp-0x25]
    15e7:	83 c0 01             	add    eax,0x1
    15ea:	88 45 db             	mov    BYTE PTR [ebp-0x25],al
    15ed:	e9 84 04 00 00       	jmp    0x1a76
    15f2:	0f b6 45 da          	movzx  eax,BYTE PTR [ebp-0x26]
    15f6:	83 c0 01             	add    eax,0x1
    15f9:	88 45 da             	mov    BYTE PTR [ebp-0x26],al
    15fc:	e9 75 04 00 00       	jmp    0x1a76
    1601:	0f b6 45 db          	movzx  eax,BYTE PTR [ebp-0x25]
    1605:	2a 45 da             	sub    al,BYTE PTR [ebp-0x26]
    1608:	83 c0 02             	add    eax,0x2
    160b:	88 45 c7             	mov    BYTE PTR [ebp-0x39],al
    160e:	80 7d c7 04          	cmp    BYTE PTR [ebp-0x39],0x4
    1612:	0f 87 95 04 00 00    	ja     0x1aad
    1618:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    161b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    161e:	3c 2d                	cmp    al,0x2d
    1620:	75 0d                	jne    0x162f
    1622:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
    1629:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    162d:	eb 07                	jmp    0x1636
    162f:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
    1636:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1639:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    163c:	3c 2f                	cmp    al,0x2f
    163e:	0f 8e 49 04 00 00    	jle    0x1a8d
    1644:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1647:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    164a:	3c 39                	cmp    al,0x39
    164c:	0f 8f 3b 04 00 00    	jg     0x1a8d
    1652:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
    1659:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
    1660:	eb 56                	jmp    0x16b8
    1662:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1665:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1668:	3c 2f                	cmp    al,0x2f
    166a:	0f 8e 20 04 00 00    	jle    0x1a90
    1670:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1673:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1676:	3c 39                	cmp    al,0x39
    1678:	0f 8f 12 04 00 00    	jg     0x1a90
    167e:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    1681:	6b d0 0a             	imul   edx,eax,0xa
    1684:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    1687:	6b c0 00             	imul   eax,eax,0x0
    168a:	8d 0c 02             	lea    ecx,[edx+eax*1]
    168d:	b8 0a 00 00 00       	mov    eax,0xa
    1692:	f7 65 d0             	mul    DWORD PTR [ebp-0x30]
    1695:	01 d1                	add    ecx,edx
    1697:	89 ca                	mov    edx,ecx
    1699:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
    169c:	0f b6 09             	movzx  ecx,BYTE PTR [ecx]
    169f:	0f be c9             	movsx  ecx,cl
    16a2:	83 e9 30             	sub    ecx,0x30
    16a5:	89 cb                	mov    ebx,ecx
    16a7:	c1 fb 1f             	sar    ebx,0x1f
    16aa:	01 c8                	add    eax,ecx
    16ac:	11 da                	adc    edx,ebx
    16ae:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
    16b1:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
    16b4:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    16b8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    16bb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    16be:	3c 20                	cmp    al,0x20
    16c0:	74 14                	je     0x16d6
    16c2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    16c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    16c8:	84 c0                	test   al,al
    16ca:	74 0a                	je     0x16d6
    16cc:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    16cf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    16d2:	3c 09                	cmp    al,0x9
    16d4:	75 8c                	jne    0x1662
    16d6:	83 7d cc 00          	cmp    DWORD PTR [ebp-0x34],0x0
    16da:	74 0a                	je     0x16e6
    16dc:	f7 5d d0             	neg    DWORD PTR [ebp-0x30]
    16df:	83 55 d4 00          	adc    DWORD PTR [ebp-0x2c],0x0
    16e3:	f7 5d d4             	neg    DWORD PTR [ebp-0x2c]
    16e6:	0f b6 45 c7          	movzx  eax,BYTE PTR [ebp-0x39]
    16ea:	83 f8 04             	cmp    eax,0x4
    16ed:	74 51                	je     0x1740
    16ef:	83 f8 04             	cmp    eax,0x4
    16f2:	7f 63                	jg     0x1757
    16f4:	83 f8 03             	cmp    eax,0x3
    16f7:	7f 5e                	jg     0x1757
    16f9:	83 f8 02             	cmp    eax,0x2
    16fc:	7d 30                	jge    0x172e
    16fe:	85 c0                	test   eax,eax
    1700:	74 07                	je     0x1709
    1702:	83 f8 01             	cmp    eax,0x1
    1705:	74 14                	je     0x171b
    1707:	eb 4e                	jmp    0x1757
    1709:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    170c:	8d 50 04             	lea    edx,[eax+0x4]
    170f:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1712:	8b 00                	mov    eax,DWORD PTR [eax]
    1714:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    1717:	88 10                	mov    BYTE PTR [eax],dl
    1719:	eb 3c                	jmp    0x1757
    171b:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    171e:	8d 50 04             	lea    edx,[eax+0x4]
    1721:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1724:	8b 00                	mov    eax,DWORD PTR [eax]
    1726:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    1729:	66 89 10             	mov    WORD PTR [eax],dx
    172c:	eb 29                	jmp    0x1757
    172e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1731:	8d 50 04             	lea    edx,[eax+0x4]
    1734:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1737:	8b 00                	mov    eax,DWORD PTR [eax]
    1739:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    173c:	89 10                	mov    DWORD PTR [eax],edx
    173e:	eb 17                	jmp    0x1757
    1740:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1743:	8d 50 04             	lea    edx,[eax+0x4]
    1746:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1749:	8b 08                	mov    ecx,DWORD PTR [eax]
    174b:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    174e:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
    1751:	89 01                	mov    DWORD PTR [ecx],eax
    1753:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
    1756:	90                   	nop
    1757:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    175b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    1762:	e9 0f 03 00 00       	jmp    0x1a76
    1767:	0f b6 45 db          	movzx  eax,BYTE PTR [ebp-0x25]
    176b:	2a 45 da             	sub    al,BYTE PTR [ebp-0x26]
    176e:	83 c0 02             	add    eax,0x2
    1771:	88 45 c7             	mov    BYTE PTR [ebp-0x39],al
    1774:	80 7d c7 04          	cmp    BYTE PTR [ebp-0x39],0x4
    1778:	0f 87 32 03 00 00    	ja     0x1ab0
    177e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1781:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1784:	3c 2f                	cmp    al,0x2f
    1786:	0f 8e 07 03 00 00    	jle    0x1a93
    178c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    178f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1792:	3c 39                	cmp    al,0x39
    1794:	0f 8f f9 02 00 00    	jg     0x1a93
    179a:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
    17a1:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
    17a8:	eb 60                	jmp    0x180a
    17aa:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    17ad:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    17b0:	3c 30                	cmp    al,0x30
    17b2:	7e 0e                	jle    0x17c2
    17b4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    17b7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    17ba:	3c 38                	cmp    al,0x38
    17bc:	0f 8e d4 02 00 00    	jle    0x1a96
    17c2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    17c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    17c8:	3c 61                	cmp    al,0x61
    17ca:	0f 8f c6 02 00 00    	jg     0x1a96
    17d0:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    17d3:	6b d0 0a             	imul   edx,eax,0xa
    17d6:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    17d9:	6b c0 00             	imul   eax,eax,0x0
    17dc:	8d 0c 02             	lea    ecx,[edx+eax*1]
    17df:	b8 0a 00 00 00       	mov    eax,0xa
    17e4:	f7 65 d0             	mul    DWORD PTR [ebp-0x30]
    17e7:	01 d1                	add    ecx,edx
    17e9:	89 ca                	mov    edx,ecx
    17eb:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
    17ee:	0f b6 09             	movzx  ecx,BYTE PTR [ecx]
    17f1:	0f be c9             	movsx  ecx,cl
    17f4:	83 e9 30             	sub    ecx,0x30
    17f7:	89 cb                	mov    ebx,ecx
    17f9:	c1 fb 1f             	sar    ebx,0x1f
    17fc:	01 c8                	add    eax,ecx
    17fe:	11 da                	adc    edx,ebx
    1800:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
    1803:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
    1806:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    180a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    180d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1810:	3c 20                	cmp    al,0x20
    1812:	74 14                	je     0x1828
    1814:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1817:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    181a:	84 c0                	test   al,al
    181c:	74 0a                	je     0x1828
    181e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1821:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1824:	3c 09                	cmp    al,0x9
    1826:	75 82                	jne    0x17aa
    1828:	0f b6 45 c7          	movzx  eax,BYTE PTR [ebp-0x39]
    182c:	83 f8 04             	cmp    eax,0x4
    182f:	74 51                	je     0x1882
    1831:	83 f8 04             	cmp    eax,0x4
    1834:	7f 63                	jg     0x1899
    1836:	83 f8 03             	cmp    eax,0x3
    1839:	7f 5e                	jg     0x1899
    183b:	83 f8 02             	cmp    eax,0x2
    183e:	7d 30                	jge    0x1870
    1840:	85 c0                	test   eax,eax
    1842:	74 07                	je     0x184b
    1844:	83 f8 01             	cmp    eax,0x1
    1847:	74 14                	je     0x185d
    1849:	eb 4e                	jmp    0x1899
    184b:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    184e:	8d 50 04             	lea    edx,[eax+0x4]
    1851:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1854:	8b 00                	mov    eax,DWORD PTR [eax]
    1856:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    1859:	88 10                	mov    BYTE PTR [eax],dl
    185b:	eb 3c                	jmp    0x1899
    185d:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1860:	8d 50 04             	lea    edx,[eax+0x4]
    1863:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1866:	8b 00                	mov    eax,DWORD PTR [eax]
    1868:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    186b:	66 89 10             	mov    WORD PTR [eax],dx
    186e:	eb 29                	jmp    0x1899
    1870:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1873:	8d 50 04             	lea    edx,[eax+0x4]
    1876:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1879:	8b 00                	mov    eax,DWORD PTR [eax]
    187b:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    187e:	89 10                	mov    DWORD PTR [eax],edx
    1880:	eb 17                	jmp    0x1899
    1882:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1885:	8d 50 04             	lea    edx,[eax+0x4]
    1888:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    188b:	8b 08                	mov    ecx,DWORD PTR [eax]
    188d:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    1890:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
    1893:	89 01                	mov    DWORD PTR [ecx],eax
    1895:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
    1898:	90                   	nop
    1899:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    189d:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    18a4:	e9 cd 01 00 00       	jmp    0x1a76
    18a9:	0f b6 45 db          	movzx  eax,BYTE PTR [ebp-0x25]
    18ad:	2a 45 da             	sub    al,BYTE PTR [ebp-0x26]
    18b0:	83 c0 02             	add    eax,0x2
    18b3:	88 45 c7             	mov    BYTE PTR [ebp-0x39],al
    18b6:	80 7d c7 04          	cmp    BYTE PTR [ebp-0x39],0x4
    18ba:	0f 87 f3 01 00 00    	ja     0x1ab3
    18c0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    18c3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    18c6:	0f be c0             	movsx  eax,al
    18c9:	83 ec 0c             	sub    esp,0xc
    18cc:	50                   	push   eax
    18cd:	e8 70 fb ff ff       	call   0x1442
    18d2:	83 c4 10             	add    esp,0x10
    18d5:	85 c0                	test   eax,eax
    18d7:	0f 88 bc 01 00 00    	js     0x1a99
    18dd:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
    18e4:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
    18eb:	eb 52                	jmp    0x193f
    18ed:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    18f0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    18f3:	0f be c0             	movsx  eax,al
    18f6:	83 ec 0c             	sub    esp,0xc
    18f9:	50                   	push   eax
    18fa:	e8 43 fb ff ff       	call   0x1442
    18ff:	83 c4 10             	add    esp,0x10
    1902:	85 c0                	test   eax,eax
    1904:	0f 88 92 01 00 00    	js     0x1a9c
    190a:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    190d:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
    1910:	0f a4 c2 04          	shld   edx,eax,0x4
    1914:	c1 e0 04             	shl    eax,0x4
    1917:	89 c6                	mov    esi,eax
    1919:	89 d7                	mov    edi,edx
    191b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    191e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1921:	0f be c0             	movsx  eax,al
    1924:	83 ec 0c             	sub    esp,0xc
    1927:	50                   	push   eax
    1928:	e8 15 fb ff ff       	call   0x1442
    192d:	83 c4 10             	add    esp,0x10
    1930:	99                   	cdq    
    1931:	01 f0                	add    eax,esi
    1933:	11 fa                	adc    edx,edi
    1935:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
    1938:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
    193b:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    193f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1942:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1945:	3c 20                	cmp    al,0x20
    1947:	74 14                	je     0x195d
    1949:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    194c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    194f:	84 c0                	test   al,al
    1951:	74 0a                	je     0x195d
    1953:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1956:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1959:	3c 09                	cmp    al,0x9
    195b:	75 90                	jne    0x18ed
    195d:	0f b6 45 c7          	movzx  eax,BYTE PTR [ebp-0x39]
    1961:	83 f8 04             	cmp    eax,0x4
    1964:	74 51                	je     0x19b7
    1966:	83 f8 04             	cmp    eax,0x4
    1969:	7f 63                	jg     0x19ce
    196b:	83 f8 03             	cmp    eax,0x3
    196e:	7f 5e                	jg     0x19ce
    1970:	83 f8 02             	cmp    eax,0x2
    1973:	7d 30                	jge    0x19a5
    1975:	85 c0                	test   eax,eax
    1977:	74 07                	je     0x1980
    1979:	83 f8 01             	cmp    eax,0x1
    197c:	74 14                	je     0x1992
    197e:	eb 4e                	jmp    0x19ce
    1980:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1983:	8d 50 04             	lea    edx,[eax+0x4]
    1986:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1989:	8b 00                	mov    eax,DWORD PTR [eax]
    198b:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    198e:	88 10                	mov    BYTE PTR [eax],dl
    1990:	eb 3c                	jmp    0x19ce
    1992:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1995:	8d 50 04             	lea    edx,[eax+0x4]
    1998:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    199b:	8b 00                	mov    eax,DWORD PTR [eax]
    199d:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    19a0:	66 89 10             	mov    WORD PTR [eax],dx
    19a3:	eb 29                	jmp    0x19ce
    19a5:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    19a8:	8d 50 04             	lea    edx,[eax+0x4]
    19ab:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    19ae:	8b 00                	mov    eax,DWORD PTR [eax]
    19b0:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    19b3:	89 10                	mov    DWORD PTR [eax],edx
    19b5:	eb 17                	jmp    0x19ce
    19b7:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    19ba:	8d 50 04             	lea    edx,[eax+0x4]
    19bd:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    19c0:	8b 08                	mov    ecx,DWORD PTR [eax]
    19c2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    19c5:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
    19c8:	89 01                	mov    DWORD PTR [ecx],eax
    19ca:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
    19cd:	90                   	nop
    19ce:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    19d2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    19d9:	e9 98 00 00 00       	jmp    0x1a76
    19de:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    19e5:	e9 8c 00 00 00       	jmp    0x1a76
    19ea:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    19ed:	8d 50 04             	lea    edx,[eax+0x4]
    19f0:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    19f3:	8b 00                	mov    eax,DWORD PTR [eax]
    19f5:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
    19f8:	0f b6 12             	movzx  edx,BYTE PTR [edx]
    19fb:	88 10                	mov    BYTE PTR [eax],dl
    19fd:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    1a01:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    1a05:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    1a0c:	eb 68                	jmp    0x1a76
    1a0e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
    1a11:	8d 50 04             	lea    edx,[eax+0x4]
    1a14:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
    1a17:	8b 00                	mov    eax,DWORD PTR [eax]
    1a19:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
    1a1c:	eb 13                	jmp    0x1a31
    1a1e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1a21:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    1a24:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
    1a27:	88 10                	mov    BYTE PTR [eax],dl
    1a29:	83 45 c8 01          	add    DWORD PTR [ebp-0x38],0x1
    1a2d:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    1a31:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1a34:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1a37:	3c 20                	cmp    al,0x20
    1a39:	74 14                	je     0x1a4f
    1a3b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1a3e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1a41:	84 c0                	test   al,al
    1a43:	74 0a                	je     0x1a4f
    1a45:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1a48:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1a4b:	3c 09                	cmp    al,0x9
    1a4d:	75 cf                	jne    0x1a1e
    1a4f:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    1a53:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    1a5a:	eb 1a                	jmp    0x1a76
    1a5c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    1a5f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1a62:	3c 25                	cmp    al,0x25
    1a64:	75 39                	jne    0x1a9f
    1a66:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
    1a6a:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
    1a6e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    1a75:	90                   	nop
    1a76:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    1a7a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1a7d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    1a80:	84 c0                	test   al,al
    1a82:	0f 85 f1 fa ff ff    	jne    0x1579
    1a88:	eb 16                	jmp    0x1aa0
    1a8a:	90                   	nop
    1a8b:	eb 13                	jmp    0x1aa0
    1a8d:	90                   	nop
    1a8e:	eb 10                	jmp    0x1aa0
    1a90:	90                   	nop
    1a91:	eb 0d                	jmp    0x1aa0
    1a93:	90                   	nop
    1a94:	eb 0a                	jmp    0x1aa0
    1a96:	90                   	nop
    1a97:	eb 07                	jmp    0x1aa0
    1a99:	90                   	nop
    1a9a:	eb 04                	jmp    0x1aa0
    1a9c:	90                   	nop
    1a9d:	eb 01                	jmp    0x1aa0
    1a9f:	90                   	nop
    1aa0:	e8 a2 f3 ff ff       	call   0xe47
    1aa5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    1aa8:	eb 14                	jmp    0x1abe
    1aaa:	90                   	nop
    1aab:	eb 07                	jmp    0x1ab4
    1aad:	90                   	nop
    1aae:	eb 04                	jmp    0x1ab4
    1ab0:	90                   	nop
    1ab1:	eb 01                	jmp    0x1ab4
    1ab3:	90                   	nop
    1ab4:	e8 8e f3 ff ff       	call   0xe47
    1ab9:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1abe:	8d 65 f4             	lea    esp,[ebp-0xc]
    1ac1:	5b                   	pop    ebx
    1ac2:	5e                   	pop    esi
    1ac3:	5f                   	pop    edi
    1ac4:	5d                   	pop    ebp
    1ac5:	c3                   	ret    
    1ac6:	55                   	push   ebp
    1ac7:	89 e5                	mov    ebp,esp
    1ac9:	53                   	push   ebx
    1aca:	83 ec 14             	sub    esp,0x14
    1acd:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    1ad2:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    1ad6:	0f b7 c8             	movzx  ecx,ax
    1ad9:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    1ade:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    1ae2:	0f b7 d0             	movzx  edx,ax
    1ae5:	a1 48 5a 03 00       	mov    eax,ds:0x35a48
    1aea:	8b 1d 48 5a 03 00    	mov    ebx,DWORD PTR ds:0x35a48
    1af0:	83 ec 04             	sub    esp,0x4
    1af3:	51                   	push   ecx
    1af4:	52                   	push   edx
    1af5:	50                   	push   eax
    1af6:	e8 83 00 00 00       	call   0x1b7e
    1afb:	83 c4 10             	add    esp,0x10
    1afe:	66 89 43 16          	mov    WORD PTR [ebx+0x16],ax
    1b02:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1b09:	66 85 c0             	test   ax,ax
    1b0c:	74 f4                	je     0x1b02
    1b0e:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1b15:	0f b7 c0             	movzx  eax,ax
    1b18:	83 e8 01             	sub    eax,0x1
    1b1b:	0f b6 80 60 5c 03 00 	movzx  eax,BYTE PTR [eax+0x35c60]
    1b22:	3c 0a                	cmp    al,0xa
    1b24:	75 dc                	jne    0x1b02
    1b26:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1b2d:	0f b7 c0             	movzx  eax,ax
    1b30:	83 e8 01             	sub    eax,0x1
    1b33:	c6 80 60 5c 03 00 00 	mov    BYTE PTR [eax+0x35c60],0x0
    1b3a:	90                   	nop
    1b3b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    1b42:	eb 18                	jmp    0x1b5c
    1b44:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1b47:	05 60 5c 03 00       	add    eax,0x35c60
    1b4c:	0f b6 10             	movzx  edx,BYTE PTR [eax]
    1b4f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1b52:	88 10                	mov    BYTE PTR [eax],dl
    1b54:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
    1b58:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    1b5c:	0f b7 05 82 5e 03 00 	movzx  eax,WORD PTR ds:0x35e82
    1b63:	0f b7 d0             	movzx  edx,ax
    1b66:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1b69:	39 c2                	cmp    edx,eax
    1b6b:	0f 4e c2             	cmovle eax,edx
    1b6e:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
    1b71:	7c d1                	jl     0x1b44
    1b73:	e8 cf f2 ff ff       	call   0xe47
    1b78:	90                   	nop
    1b79:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1b7c:	c9                   	leave  
    1b7d:	c3                   	ret    
    1b7e:	55                   	push   ebp
    1b7f:	89 e5                	mov    ebp,esp
    1b81:	83 ec 18             	sub    esp,0x18
    1b84:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1b87:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    1b8a:	66 89 55 ec          	mov    WORD PTR [ebp-0x14],dx
    1b8e:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
    1b92:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1b95:	0f b7 48 08          	movzx  ecx,WORD PTR [eax+0x8]
    1b99:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
    1b9d:	ba 00 00 00 00       	mov    edx,0x0
    1ba2:	66 f7 f1             	div    cx
    1ba5:	66 89 55 ec          	mov    WORD PTR [ebp-0x14],dx
    1ba9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1bac:	0f b7 48 0a          	movzx  ecx,WORD PTR [eax+0xa]
    1bb0:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
    1bb4:	ba 00 00 00 00       	mov    edx,0x0
    1bb9:	66 f7 f1             	div    cx
    1bbc:	66 89 55 e8          	mov    WORD PTR [ebp-0x18],dx
    1bc0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1bc3:	0f b7 50 18          	movzx  edx,WORD PTR [eax+0x18]
    1bc7:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
    1bcb:	01 d0                	add    eax,edx
    1bcd:	83 c0 01             	add    eax,0x1
    1bd0:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
    1bd4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1bd7:	0f b7 50 1a          	movzx  edx,WORD PTR [eax+0x1a]
    1bdb:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
    1bdf:	01 d0                	add    eax,edx
    1be1:	83 c0 01             	add    eax,0x1
    1be4:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
    1be8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1beb:	8b 00                	mov    eax,DWORD PTR [eax]
    1bed:	0f b7 00             	movzx  eax,WORD PTR [eax]
    1bf0:	66 0f af 45 fc       	imul   ax,WORD PTR [ebp-0x4]
    1bf5:	89 c2                	mov    edx,eax
    1bf7:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1bfb:	01 d0                	add    eax,edx
    1bfd:	c9                   	leave  
    1bfe:	c3                   	ret    
    1bff:	55                   	push   ebp
    1c00:	89 e5                	mov    ebp,esp
    1c02:	83 ec 10             	sub    esp,0x10
    1c05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c08:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    1c0c:	0f b7 d0             	movzx  edx,ax
    1c0f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c12:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    1c16:	0f b7 c0             	movzx  eax,ax
    1c19:	52                   	push   edx
    1c1a:	50                   	push   eax
    1c1b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1c1e:	e8 5b ff ff ff       	call   0x1b7e
    1c23:	83 c4 0c             	add    esp,0xc
    1c26:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
    1c2a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c2d:	0f b6 40 14          	movzx  eax,BYTE PTR [eax+0x14]
    1c31:	84 c0                	test   al,al
    1c33:	74 5e                	je     0x1c93
    1c35:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c38:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
    1c3b:	3d 2f 57 05 00       	cmp    eax,0x5572f
    1c40:	77 2c                	ja     0x1c6e
    1c42:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1c46:	01 c0                	add    eax,eax
    1c48:	8d 90 00 80 0b 00    	lea    edx,[eax+0xb8000]
    1c4e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c51:	0f b6 40 15          	movzx  eax,BYTE PTR [eax+0x15]
    1c55:	88 02                	mov    BYTE PTR [edx],al
    1c57:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1c5b:	01 c0                	add    eax,eax
    1c5d:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    1c63:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c66:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    1c6a:	88 02                	mov    BYTE PTR [edx],al
    1c6c:	eb 48                	jmp    0x1cb6
    1c6e:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1c72:	01 c0                	add    eax,eax
    1c74:	05 00 80 0b 00       	add    eax,0xb8000
    1c79:	c6 00 00             	mov    BYTE PTR [eax],0x0
    1c7c:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1c80:	01 c0                	add    eax,eax
    1c82:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    1c88:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1c8b:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    1c8f:	88 02                	mov    BYTE PTR [edx],al
    1c91:	eb 23                	jmp    0x1cb6
    1c93:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1c97:	01 c0                	add    eax,eax
    1c99:	05 00 80 0b 00       	add    eax,0xb8000
    1c9e:	c6 00 3c             	mov    BYTE PTR [eax],0x3c
    1ca1:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    1ca5:	01 c0                	add    eax,eax
    1ca7:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    1cad:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1cb0:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    1cb4:	88 02                	mov    BYTE PTR [edx],al
    1cb6:	90                   	nop
    1cb7:	c9                   	leave  
    1cb8:	c3                   	ret    
    1cb9:	55                   	push   ebp
    1cba:	89 e5                	mov    ebp,esp
    1cbc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1cbf:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
    1cc2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    1cc5:	8d 0c 02             	lea    ecx,[edx+eax*1]
    1cc8:	ba 2d 57 bd bf       	mov    edx,0xbfbd572d
    1ccd:	89 c8                	mov    eax,ecx
    1ccf:	f7 e2                	mul    edx
    1cd1:	89 d0                	mov    eax,edx
    1cd3:	c1 e8 13             	shr    eax,0x13
    1cd6:	69 d0 60 ae 0a 00    	imul   edx,eax,0xaae60
    1cdc:	89 c8                	mov    eax,ecx
    1cde:	29 d0                	sub    eax,edx
    1ce0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    1ce3:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
    1ce6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1ce9:	e8 11 ff ff ff       	call   0x1bff
    1cee:	83 c4 04             	add    esp,0x4
    1cf1:	90                   	nop
    1cf2:	c9                   	leave  
    1cf3:	c3                   	ret    
    1cf4:	55                   	push   ebp
    1cf5:	89 e5                	mov    ebp,esp
    1cf7:	56                   	push   esi
    1cf8:	53                   	push   ebx
    1cf9:	83 ec 30             	sub    esp,0x30
    1cfc:	8b 75 10             	mov    esi,DWORD PTR [ebp+0x10]
    1cff:	8b 5d 14             	mov    ebx,DWORD PTR [ebp+0x14]
    1d02:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
    1d05:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
    1d08:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
    1d0b:	66 89 75 e4          	mov    WORD PTR [ebp-0x1c],si
    1d0f:	66 89 5d e0          	mov    WORD PTR [ebp-0x20],bx
    1d13:	66 89 4d dc          	mov    WORD PTR [ebp-0x24],cx
    1d17:	66 89 55 d8          	mov    WORD PTR [ebp-0x28],dx
    1d1b:	88 45 d4             	mov    BYTE PTR [ebp-0x2c],al
    1d1e:	66 83 7d dc 04       	cmp    WORD PTR [ebp-0x24],0x4
    1d23:	76 07                	jbe    0x1d2c
    1d25:	66 83 7d d8 02       	cmp    WORD PTR [ebp-0x28],0x2
    1d2a:	77 0e                	ja     0x1d3a
    1d2c:	83 ec 0c             	sub    esp,0xc
    1d2f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1d32:	e8 97 09 00 00       	call   0x26ce
    1d37:	83 c4 10             	add    esp,0x10
    1d3a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d3d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    1d40:	89 10                	mov    DWORD PTR [eax],edx
    1d42:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d45:	0f b7 55 dc          	movzx  edx,WORD PTR [ebp-0x24]
    1d49:	66 89 50 04          	mov    WORD PTR [eax+0x4],dx
    1d4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d50:	0f b7 55 d8          	movzx  edx,WORD PTR [ebp-0x28]
    1d54:	66 89 50 06          	mov    WORD PTR [eax+0x6],dx
    1d58:	0f b7 45 dc          	movzx  eax,WORD PTR [ebp-0x24]
    1d5c:	8d 50 fe             	lea    edx,[eax-0x2]
    1d5f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d62:	66 89 50 08          	mov    WORD PTR [eax+0x8],dx
    1d66:	0f b7 45 d8          	movzx  eax,WORD PTR [ebp-0x28]
    1d6a:	8d 50 fe             	lea    edx,[eax-0x2]
    1d6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d70:	66 89 50 0a          	mov    WORD PTR [eax+0xa],dx
    1d74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d77:	0f b7 55 e4          	movzx  edx,WORD PTR [ebp-0x1c]
    1d7b:	66 89 50 18          	mov    WORD PTR [eax+0x18],dx
    1d7f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d82:	0f b7 55 e0          	movzx  edx,WORD PTR [ebp-0x20]
    1d86:	66 89 50 1a          	mov    WORD PTR [eax+0x1a],dx
    1d8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d8d:	66 c7 40 0c 00 00    	mov    WORD PTR [eax+0xc],0x0
    1d93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d96:	66 c7 40 0e 00 00    	mov    WORD PTR [eax+0xe],0x0
    1d9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1d9f:	c6 40 15 3c          	mov    BYTE PTR [eax+0x15],0x3c
    1da3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1da6:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
    1dad:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1db0:	c6 40 14 01          	mov    BYTE PTR [eax+0x14],0x1
    1db4:	83 ec 04             	sub    esp,0x4
    1db7:	6a 00                	push   0x0
    1db9:	6a 00                	push   0x0
    1dbb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1dbe:	e8 bb fd ff ff       	call   0x1b7e
    1dc3:	83 c4 10             	add    esp,0x10
    1dc6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    1dc9:	66 89 42 16          	mov    WORD PTR [edx+0x16],ax
    1dcd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1dd0:	0f b6 55 d4          	movzx  edx,BYTE PTR [ebp-0x2c]
    1dd4:	88 50 1c             	mov    BYTE PTR [eax+0x1c],dl
    1dd7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1dda:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
    1ddd:	89 50 20             	mov    DWORD PTR [eax+0x20],edx
    1de0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    1de7:	eb 12                	jmp    0x1dfb
    1de9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    1dec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1def:	01 d0                	add    eax,edx
    1df1:	83 c0 24             	add    eax,0x24
    1df4:	c6 00 00             	mov    BYTE PTR [eax],0x0
    1df7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    1dfb:	81 7d f4 ff 00 00 00 	cmp    DWORD PTR [ebp-0xc],0xff
    1e02:	7e e5                	jle    0x1de9
    1e04:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e07:	c6 80 24 01 00 00 00 	mov    BYTE PTR [eax+0x124],0x0
    1e0e:	83 ec 0c             	sub    esp,0xc
    1e11:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1e14:	e8 19 00 00 00       	call   0x1e32
    1e19:	83 c4 10             	add    esp,0x10
    1e1c:	83 ec 0c             	sub    esp,0xc
    1e1f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    1e22:	e8 a1 00 00 00       	call   0x1ec8
    1e27:	83 c4 10             	add    esp,0x10
    1e2a:	90                   	nop
    1e2b:	8d 65 f8             	lea    esp,[ebp-0x8]
    1e2e:	5b                   	pop    ebx
    1e2f:	5e                   	pop    esi
    1e30:	5d                   	pop    ebp
    1e31:	c3                   	ret    
    1e32:	55                   	push   ebp
    1e33:	89 e5                	mov    ebp,esp
    1e35:	53                   	push   ebx
    1e36:	83 ec 14             	sub    esp,0x14
    1e39:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e3c:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    1e40:	0f b7 c0             	movzx  eax,ax
    1e43:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    1e46:	eb 5e                	jmp    0x1ea6
    1e48:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e4b:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
    1e4f:	0f b7 c0             	movzx  eax,ax
    1e52:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
    1e55:	eb 30                	jmp    0x1e87
    1e57:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
    1e5a:	0f b7 d8             	movzx  ebx,ax
    1e5d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    1e60:	0f b7 c8             	movzx  ecx,ax
    1e63:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e66:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    1e6a:	0f b6 d0             	movzx  edx,al
    1e6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e70:	8b 00                	mov    eax,DWORD PTR [eax]
    1e72:	83 ec 0c             	sub    esp,0xc
    1e75:	53                   	push   ebx
    1e76:	51                   	push   ecx
    1e77:	52                   	push   edx
    1e78:	6a 00                	push   0x0
    1e7a:	50                   	push   eax
    1e7b:	e8 75 09 00 00       	call   0x27f5
    1e80:	83 c4 20             	add    esp,0x20
    1e83:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
    1e87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e8a:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
    1e8e:	0f b7 d0             	movzx  edx,ax
    1e91:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1e94:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
    1e98:	0f b7 c0             	movzx  eax,ax
    1e9b:	01 d0                	add    eax,edx
    1e9d:	39 45 f0             	cmp    DWORD PTR [ebp-0x10],eax
    1ea0:	7c b5                	jl     0x1e57
    1ea2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    1ea6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ea9:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    1ead:	0f b7 d0             	movzx  edx,ax
    1eb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1eb3:	0f b7 40 04          	movzx  eax,WORD PTR [eax+0x4]
    1eb7:	0f b7 c0             	movzx  eax,ax
    1eba:	01 d0                	add    eax,edx
    1ebc:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
    1ebf:	7c 87                	jl     0x1e48
    1ec1:	90                   	nop
    1ec2:	90                   	nop
    1ec3:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    1ec6:	c9                   	leave  
    1ec7:	c3                   	ret    
    1ec8:	55                   	push   ebp
    1ec9:	89 e5                	mov    ebp,esp
    1ecb:	56                   	push   esi
    1ecc:	53                   	push   ebx
    1ecd:	83 ec 20             	sub    esp,0x20
    1ed0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ed3:	0f b7 40 18          	movzx  eax,WORD PTR [eax+0x18]
    1ed7:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
    1edb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ede:	0f b7 40 1a          	movzx  eax,WORD PTR [eax+0x1a]
    1ee2:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
    1ee6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ee9:	0f b7 40 04          	movzx  eax,WORD PTR [eax+0x4]
    1eed:	66 89 45 e2          	mov    WORD PTR [ebp-0x1e],ax
    1ef1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1ef4:	0f b7 40 06          	movzx  eax,WORD PTR [eax+0x6]
    1ef8:	66 89 45 e0          	mov    WORD PTR [ebp-0x20],ax
    1efc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1eff:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    1f03:	88 45 df             	mov    BYTE PTR [ebp-0x21],al
    1f06:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    1f0a:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
    1f0e:	eb 61                	jmp    0x1f71
    1f10:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    1f14:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
    1f18:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    1f1c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1f1f:	8b 00                	mov    eax,DWORD PTR [eax]
    1f21:	83 ec 0c             	sub    esp,0xc
    1f24:	53                   	push   ebx
    1f25:	51                   	push   ecx
    1f26:	52                   	push   edx
    1f27:	68 cd 00 00 00       	push   0xcd
    1f2c:	50                   	push   eax
    1f2d:	e8 c3 08 00 00       	call   0x27f5
    1f32:	83 c4 20             	add    esp,0x20
    1f35:	0f b7 55 e4          	movzx  edx,WORD PTR [ebp-0x1c]
    1f39:	0f b7 45 e0          	movzx  eax,WORD PTR [ebp-0x20]
    1f3d:	01 d0                	add    eax,edx
    1f3f:	83 e8 01             	sub    eax,0x1
    1f42:	0f b7 d8             	movzx  ebx,ax
    1f45:	0f b7 4d f6          	movzx  ecx,WORD PTR [ebp-0xa]
    1f49:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    1f4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1f50:	8b 00                	mov    eax,DWORD PTR [eax]
    1f52:	83 ec 0c             	sub    esp,0xc
    1f55:	53                   	push   ebx
    1f56:	51                   	push   ecx
    1f57:	52                   	push   edx
    1f58:	68 cd 00 00 00       	push   0xcd
    1f5d:	50                   	push   eax
    1f5e:	e8 92 08 00 00       	call   0x27f5
    1f63:	83 c4 20             	add    esp,0x20
    1f66:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
    1f6a:	83 c0 01             	add    eax,0x1
    1f6d:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
    1f71:	0f b7 55 f6          	movzx  edx,WORD PTR [ebp-0xa]
    1f75:	0f b7 4d e6          	movzx  ecx,WORD PTR [ebp-0x1a]
    1f79:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    1f7d:	01 c8                	add    eax,ecx
    1f7f:	39 c2                	cmp    edx,eax
    1f81:	7c 8d                	jl     0x1f10
    1f83:	0f b7 45 e4          	movzx  eax,WORD PTR [ebp-0x1c]
    1f87:	66 89 45 f4          	mov    WORD PTR [ebp-0xc],ax
    1f8b:	eb 61                	jmp    0x1fee
    1f8d:	0f b7 5d f4          	movzx  ebx,WORD PTR [ebp-0xc]
    1f91:	0f b7 4d e6          	movzx  ecx,WORD PTR [ebp-0x1a]
    1f95:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    1f99:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1f9c:	8b 00                	mov    eax,DWORD PTR [eax]
    1f9e:	83 ec 0c             	sub    esp,0xc
    1fa1:	53                   	push   ebx
    1fa2:	51                   	push   ecx
    1fa3:	52                   	push   edx
    1fa4:	68 ba 00 00 00       	push   0xba
    1fa9:	50                   	push   eax
    1faa:	e8 46 08 00 00       	call   0x27f5
    1faf:	83 c4 20             	add    esp,0x20
    1fb2:	0f b7 5d f4          	movzx  ebx,WORD PTR [ebp-0xc]
    1fb6:	0f b7 55 e6          	movzx  edx,WORD PTR [ebp-0x1a]
    1fba:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    1fbe:	01 d0                	add    eax,edx
    1fc0:	83 e8 01             	sub    eax,0x1
    1fc3:	0f b7 c8             	movzx  ecx,ax
    1fc6:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    1fca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    1fcd:	8b 00                	mov    eax,DWORD PTR [eax]
    1fcf:	83 ec 0c             	sub    esp,0xc
    1fd2:	53                   	push   ebx
    1fd3:	51                   	push   ecx
    1fd4:	52                   	push   edx
    1fd5:	68 ba 00 00 00       	push   0xba
    1fda:	50                   	push   eax
    1fdb:	e8 15 08 00 00       	call   0x27f5
    1fe0:	83 c4 20             	add    esp,0x20
    1fe3:	0f b7 45 f4          	movzx  eax,WORD PTR [ebp-0xc]
    1fe7:	83 c0 01             	add    eax,0x1
    1fea:	66 89 45 f4          	mov    WORD PTR [ebp-0xc],ax
    1fee:	0f b7 55 f4          	movzx  edx,WORD PTR [ebp-0xc]
    1ff2:	0f b7 4d e4          	movzx  ecx,WORD PTR [ebp-0x1c]
    1ff6:	0f b7 45 e0          	movzx  eax,WORD PTR [ebp-0x20]
    1ffa:	01 c8                	add    eax,ecx
    1ffc:	39 c2                	cmp    edx,eax
    1ffe:	7c 8d                	jl     0x1f8d
    2000:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    2004:	0f b7 4d e6          	movzx  ecx,WORD PTR [ebp-0x1a]
    2008:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    200c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    200f:	8b 00                	mov    eax,DWORD PTR [eax]
    2011:	83 ec 0c             	sub    esp,0xc
    2014:	53                   	push   ebx
    2015:	51                   	push   ecx
    2016:	52                   	push   edx
    2017:	68 c9 00 00 00       	push   0xc9
    201c:	50                   	push   eax
    201d:	e8 d3 07 00 00       	call   0x27f5
    2022:	83 c4 20             	add    esp,0x20
    2025:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    2029:	0f b7 55 e6          	movzx  edx,WORD PTR [ebp-0x1a]
    202d:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    2031:	01 d0                	add    eax,edx
    2033:	83 e8 01             	sub    eax,0x1
    2036:	0f b7 c8             	movzx  ecx,ax
    2039:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    203d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2040:	8b 00                	mov    eax,DWORD PTR [eax]
    2042:	83 ec 0c             	sub    esp,0xc
    2045:	53                   	push   ebx
    2046:	51                   	push   ecx
    2047:	52                   	push   edx
    2048:	68 bb 00 00 00       	push   0xbb
    204d:	50                   	push   eax
    204e:	e8 a2 07 00 00       	call   0x27f5
    2053:	83 c4 20             	add    esp,0x20
    2056:	0f b7 55 e4          	movzx  edx,WORD PTR [ebp-0x1c]
    205a:	0f b7 45 e0          	movzx  eax,WORD PTR [ebp-0x20]
    205e:	01 d0                	add    eax,edx
    2060:	83 e8 01             	sub    eax,0x1
    2063:	0f b7 d8             	movzx  ebx,ax
    2066:	0f b7 4d e6          	movzx  ecx,WORD PTR [ebp-0x1a]
    206a:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    206e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2071:	8b 00                	mov    eax,DWORD PTR [eax]
    2073:	83 ec 0c             	sub    esp,0xc
    2076:	53                   	push   ebx
    2077:	51                   	push   ecx
    2078:	52                   	push   edx
    2079:	68 c8 00 00 00       	push   0xc8
    207e:	50                   	push   eax
    207f:	e8 71 07 00 00       	call   0x27f5
    2084:	83 c4 20             	add    esp,0x20
    2087:	0f b7 55 e4          	movzx  edx,WORD PTR [ebp-0x1c]
    208b:	0f b7 45 e0          	movzx  eax,WORD PTR [ebp-0x20]
    208f:	01 d0                	add    eax,edx
    2091:	83 e8 01             	sub    eax,0x1
    2094:	0f b7 d8             	movzx  ebx,ax
    2097:	0f b7 55 e6          	movzx  edx,WORD PTR [ebp-0x1a]
    209b:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    209f:	01 d0                	add    eax,edx
    20a1:	83 e8 01             	sub    eax,0x1
    20a4:	0f b7 c8             	movzx  ecx,ax
    20a7:	0f b6 55 df          	movzx  edx,BYTE PTR [ebp-0x21]
    20ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    20ae:	8b 00                	mov    eax,DWORD PTR [eax]
    20b0:	83 ec 0c             	sub    esp,0xc
    20b3:	53                   	push   ebx
    20b4:	51                   	push   ecx
    20b5:	52                   	push   edx
    20b6:	68 bc 00 00 00       	push   0xbc
    20bb:	50                   	push   eax
    20bc:	e8 34 07 00 00       	call   0x27f5
    20c1:	83 c4 20             	add    esp,0x20
    20c4:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
    20c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    20cb:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    20ce:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
    20d1:	eb 0e                	jmp    0x20e1
    20d3:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    20d7:	83 c0 01             	add    eax,0x1
    20da:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
    20dd:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
    20e1:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    20e4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    20e7:	84 c0                	test   al,al
    20e9:	75 e8                	jne    0x20d3
    20eb:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    20ef:	8d 50 fe             	lea    edx,[eax-0x2]
    20f2:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    20f6:	83 c0 02             	add    eax,0x2
    20f9:	39 c2                	cmp    edx,eax
    20fb:	0f 4e c2             	cmovle eax,edx
    20fe:	88 45 de             	mov    BYTE PTR [ebp-0x22],al
    2101:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    2105:	83 e8 02             	sub    eax,0x2
    2108:	0f b6 55 de          	movzx  edx,BYTE PTR [ebp-0x22]
    210c:	29 d0                	sub    eax,edx
    210e:	89 c2                	mov    edx,eax
    2110:	c1 ea 1f             	shr    edx,0x1f
    2113:	01 d0                	add    eax,edx
    2115:	d1 f8                	sar    eax,1
    2117:	88 45 dd             	mov    BYTE PTR [ebp-0x23],al
    211a:	0f b6 55 dd          	movzx  edx,BYTE PTR [ebp-0x23]
    211e:	0f b7 45 e6          	movzx  eax,WORD PTR [ebp-0x1a]
    2122:	01 d0                	add    eax,edx
    2124:	83 c0 01             	add    eax,0x1
    2127:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
    212b:	c6 45 e9 00          	mov    BYTE PTR [ebp-0x17],0x0
    212f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2132:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    2135:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
    2138:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    213c:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
    2140:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    2144:	c1 e0 04             	shl    eax,0x4
    2147:	89 c2                	mov    edx,eax
    2149:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    214d:	c0 e8 04             	shr    al,0x4
    2150:	09 d0                	or     eax,edx
    2152:	0f b6 d0             	movzx  edx,al
    2155:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2158:	8b 00                	mov    eax,DWORD PTR [eax]
    215a:	83 ec 0c             	sub    esp,0xc
    215d:	53                   	push   ebx
    215e:	51                   	push   ecx
    215f:	52                   	push   edx
    2160:	6a 20                	push   0x20
    2162:	50                   	push   eax
    2163:	e8 8d 06 00 00       	call   0x27f5
    2168:	83 c4 20             	add    esp,0x20
    216b:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
    216f:	83 c0 01             	add    eax,0x1
    2172:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
    2176:	eb 63                	jmp    0x21db
    2178:	0f b7 75 e4          	movzx  esi,WORD PTR [ebp-0x1c]
    217c:	0f b7 5d ea          	movzx  ebx,WORD PTR [ebp-0x16]
    2180:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    2184:	c1 e0 04             	shl    eax,0x4
    2187:	89 c2                	mov    edx,eax
    2189:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    218d:	c0 e8 04             	shr    al,0x4
    2190:	09 d0                	or     eax,edx
    2192:	0f b6 c8             	movzx  ecx,al
    2195:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2198:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    219b:	0f b6 d0             	movzx  edx,al
    219e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    21a1:	8b 00                	mov    eax,DWORD PTR [eax]
    21a3:	83 ec 0c             	sub    esp,0xc
    21a6:	56                   	push   esi
    21a7:	53                   	push   ebx
    21a8:	51                   	push   ecx
    21a9:	52                   	push   edx
    21aa:	50                   	push   eax
    21ab:	e8 45 06 00 00       	call   0x27f5
    21b0:	83 c4 20             	add    esp,0x20
    21b3:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
    21b7:	83 c0 01             	add    eax,0x1
    21ba:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
    21be:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
    21c2:	0f b6 45 e9          	movzx  eax,BYTE PTR [ebp-0x17]
    21c6:	83 c0 01             	add    eax,0x1
    21c9:	88 45 e9             	mov    BYTE PTR [ebp-0x17],al
    21cc:	0f b6 55 e9          	movzx  edx,BYTE PTR [ebp-0x17]
    21d0:	0f b6 45 de          	movzx  eax,BYTE PTR [ebp-0x22]
    21d4:	83 e8 01             	sub    eax,0x1
    21d7:	39 c2                	cmp    edx,eax
    21d9:	74 0c                	je     0x21e7
    21db:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    21de:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    21e1:	84 c0                	test   al,al
    21e3:	75 93                	jne    0x2178
    21e5:	eb 01                	jmp    0x21e8
    21e7:	90                   	nop
    21e8:	0f b6 55 e9          	movzx  edx,BYTE PTR [ebp-0x17]
    21ec:	0f b6 45 de          	movzx  eax,BYTE PTR [ebp-0x22]
    21f0:	83 e8 01             	sub    eax,0x1
    21f3:	39 c2                	cmp    edx,eax
    21f5:	75 3e                	jne    0x2235
    21f7:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    21fb:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
    21ff:	83 e8 01             	sub    eax,0x1
    2202:	0f b7 c8             	movzx  ecx,ax
    2205:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    2209:	c1 e0 04             	shl    eax,0x4
    220c:	89 c2                	mov    edx,eax
    220e:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    2212:	c0 e8 04             	shr    al,0x4
    2215:	09 d0                	or     eax,edx
    2217:	0f b6 d0             	movzx  edx,al
    221a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    221d:	8b 00                	mov    eax,DWORD PTR [eax]
    221f:	83 ec 0c             	sub    esp,0xc
    2222:	53                   	push   ebx
    2223:	51                   	push   ecx
    2224:	52                   	push   edx
    2225:	68 af 00 00 00       	push   0xaf
    222a:	50                   	push   eax
    222b:	e8 c5 05 00 00       	call   0x27f5
    2230:	83 c4 20             	add    esp,0x20
    2233:	eb 33                	jmp    0x2268
    2235:	0f b7 5d e4          	movzx  ebx,WORD PTR [ebp-0x1c]
    2239:	0f b7 4d ea          	movzx  ecx,WORD PTR [ebp-0x16]
    223d:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    2241:	c1 e0 04             	shl    eax,0x4
    2244:	89 c2                	mov    edx,eax
    2246:	0f b6 45 df          	movzx  eax,BYTE PTR [ebp-0x21]
    224a:	c0 e8 04             	shr    al,0x4
    224d:	09 d0                	or     eax,edx
    224f:	0f b6 d0             	movzx  edx,al
    2252:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2255:	8b 00                	mov    eax,DWORD PTR [eax]
    2257:	83 ec 0c             	sub    esp,0xc
    225a:	53                   	push   ebx
    225b:	51                   	push   ecx
    225c:	52                   	push   edx
    225d:	6a 20                	push   0x20
    225f:	50                   	push   eax
    2260:	e8 90 05 00 00       	call   0x27f5
    2265:	83 c4 20             	add    esp,0x20
    2268:	90                   	nop
    2269:	8d 65 f8             	lea    esp,[ebp-0x8]
    226c:	5b                   	pop    ebx
    226d:	5e                   	pop    esi
    226e:	5d                   	pop    ebp
    226f:	c3                   	ret    
    2270:	55                   	push   ebp
    2271:	89 e5                	mov    ebp,esp
    2273:	83 ec 20             	sub    esp,0x20
    2276:	e9 38 01 00 00       	jmp    0x23b3
    227b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
    2282:	e9 99 00 00 00       	jmp    0x2320
    2287:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
    228e:	eb 79                	jmp    0x2309
    2290:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    2293:	0f b7 d0             	movzx  edx,ax
    2296:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    2299:	0f b7 c0             	movzx  eax,ax
    229c:	52                   	push   edx
    229d:	50                   	push   eax
    229e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    22a1:	e8 d8 f8 ff ff       	call   0x1b7e
    22a6:	83 c4 0c             	add    esp,0xc
    22a9:	66 89 45 f0          	mov    WORD PTR [ebp-0x10],ax
    22ad:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    22b0:	83 c0 01             	add    eax,0x1
    22b3:	0f b7 d0             	movzx  edx,ax
    22b6:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    22b9:	0f b7 c0             	movzx  eax,ax
    22bc:	52                   	push   edx
    22bd:	50                   	push   eax
    22be:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    22c1:	e8 b8 f8 ff ff       	call   0x1b7e
    22c6:	83 c4 0c             	add    esp,0xc
    22c9:	66 89 45 ee          	mov    WORD PTR [ebp-0x12],ax
    22cd:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    22d1:	01 c0                	add    eax,eax
    22d3:	05 00 80 0b 00       	add    eax,0xb8000
    22d8:	0f b7 55 f0          	movzx  edx,WORD PTR [ebp-0x10]
    22dc:	01 d2                	add    edx,edx
    22de:	81 c2 00 80 0b 00    	add    edx,0xb8000
    22e4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    22e7:	88 02                	mov    BYTE PTR [edx],al
    22e9:	0f b7 45 ee          	movzx  eax,WORD PTR [ebp-0x12]
    22ed:	01 c0                	add    eax,eax
    22ef:	05 01 80 0b 00       	add    eax,0xb8001
    22f4:	0f b7 55 f0          	movzx  edx,WORD PTR [ebp-0x10]
    22f8:	01 d2                	add    edx,edx
    22fa:	81 c2 01 80 0b 00    	add    edx,0xb8001
    2300:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    2303:	88 02                	mov    BYTE PTR [edx],al
    2305:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
    2309:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    230c:	0f b7 40 08          	movzx  eax,WORD PTR [eax+0x8]
    2310:	0f b7 c0             	movzx  eax,ax
    2313:	39 45 f8             	cmp    DWORD PTR [ebp-0x8],eax
    2316:	0f 8c 74 ff ff ff    	jl     0x2290
    231c:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
    2320:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2323:	0f b7 40 0a          	movzx  eax,WORD PTR [eax+0xa]
    2327:	0f b7 c0             	movzx  eax,ax
    232a:	83 e8 01             	sub    eax,0x1
    232d:	39 45 fc             	cmp    DWORD PTR [ebp-0x4],eax
    2330:	0f 8c 51 ff ff ff    	jl     0x2287
    2336:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    233d:	eb 4b                	jmp    0x238a
    233f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2342:	0f b7 40 0a          	movzx  eax,WORD PTR [eax+0xa]
    2346:	83 e8 01             	sub    eax,0x1
    2349:	0f b7 d0             	movzx  edx,ax
    234c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    234f:	0f b7 c0             	movzx  eax,ax
    2352:	52                   	push   edx
    2353:	50                   	push   eax
    2354:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2357:	e8 22 f8 ff ff       	call   0x1b7e
    235c:	83 c4 0c             	add    esp,0xc
    235f:	66 89 45 f2          	mov    WORD PTR [ebp-0xe],ax
    2363:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
    2367:	01 c0                	add    eax,eax
    2369:	05 00 80 0b 00       	add    eax,0xb8000
    236e:	c6 00 00             	mov    BYTE PTR [eax],0x0
    2371:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
    2375:	01 c0                	add    eax,eax
    2377:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    237d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2380:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    2384:	88 02                	mov    BYTE PTR [edx],al
    2386:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    238a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    238d:	0f b7 40 08          	movzx  eax,WORD PTR [eax+0x8]
    2391:	0f b7 c0             	movzx  eax,ax
    2394:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
    2397:	7c a6                	jl     0x233f
    2399:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    239c:	66 c7 40 0c 00 00    	mov    WORD PTR [eax+0xc],0x0
    23a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23a5:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    23a9:	8d 50 ff             	lea    edx,[eax-0x1]
    23ac:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23af:	66 89 50 0e          	mov    WORD PTR [eax+0xe],dx
    23b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23b6:	0f b7 50 0e          	movzx  edx,WORD PTR [eax+0xe]
    23ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23bd:	0f b7 40 0a          	movzx  eax,WORD PTR [eax+0xa]
    23c1:	66 39 c2             	cmp    dx,ax
    23c4:	0f 83 b1 fe ff ff    	jae    0x227b
    23ca:	90                   	nop
    23cb:	90                   	nop
    23cc:	c9                   	leave  
    23cd:	c3                   	ret    
    23ce:	55                   	push   ebp
    23cf:	89 e5                	mov    ebp,esp
    23d1:	83 ec 38             	sub    esp,0x38
    23d4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    23d7:	88 45 d4             	mov    BYTE PTR [ebp-0x2c],al
    23da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23dd:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    23e1:	0f b7 d0             	movzx  edx,ax
    23e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    23e7:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    23eb:	0f b7 c0             	movzx  eax,ax
    23ee:	52                   	push   edx
    23ef:	50                   	push   eax
    23f0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    23f3:	e8 86 f7 ff ff       	call   0x1b7e
    23f8:	83 c4 0c             	add    esp,0xc
    23fb:	66 89 45 ea          	mov    WORD PTR [ebp-0x16],ax
    23ff:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
    2403:	01 c0                	add    eax,eax
    2405:	05 00 80 0b 00       	add    eax,0xb8000
    240a:	c6 00 00             	mov    BYTE PTR [eax],0x0
    240d:	0f b7 45 ea          	movzx  eax,WORD PTR [ebp-0x16]
    2411:	01 c0                	add    eax,eax
    2413:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    2419:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    241c:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    2420:	88 02                	mov    BYTE PTR [edx],al
    2422:	80 7d d4 0a          	cmp    BYTE PTR [ebp-0x2c],0xa
    2426:	75 2a                	jne    0x2452
    2428:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    242b:	66 c7 40 0c 00 00    	mov    WORD PTR [eax+0xc],0x0
    2431:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2434:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    2438:	8d 50 01             	lea    edx,[eax+0x1]
    243b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    243e:	66 89 50 0e          	mov    WORD PTR [eax+0xe],dx
    2442:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2445:	e8 26 fe ff ff       	call   0x2270
    244a:	83 c4 04             	add    esp,0x4
    244d:	e9 2f 02 00 00       	jmp    0x2681
    2452:	80 7d d4 0d          	cmp    BYTE PTR [ebp-0x2c],0xd
    2456:	75 0e                	jne    0x2466
    2458:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    245b:	66 c7 40 0c 00 00    	mov    WORD PTR [eax+0xc],0x0
    2461:	e9 1b 02 00 00       	jmp    0x2681
    2466:	80 7d d4 09          	cmp    BYTE PTR [ebp-0x2c],0x9
    246a:	75 28                	jne    0x2494
    246c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    2473:	eb 14                	jmp    0x2489
    2475:	83 ec 08             	sub    esp,0x8
    2478:	6a 20                	push   0x20
    247a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    247d:	e8 4c ff ff ff       	call   0x23ce
    2482:	83 c4 10             	add    esp,0x10
    2485:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    2489:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
    248d:	7e e6                	jle    0x2475
    248f:	e9 ed 01 00 00       	jmp    0x2681
    2494:	80 7d d4 08          	cmp    BYTE PTR [ebp-0x2c],0x8
    2498:	0f 85 40 01 00 00    	jne    0x25de
    249e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24a1:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    24a5:	66 89 45 e6          	mov    WORD PTR [ebp-0x1a],ax
    24a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24ac:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    24b0:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
    24b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24b7:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    24bb:	66 85 c0             	test   ax,ax
    24be:	74 16                	je     0x24d6
    24c0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24c3:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    24c7:	8d 50 ff             	lea    edx,[eax-0x1]
    24ca:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24cd:	66 89 50 0c          	mov    WORD PTR [eax+0xc],dx
    24d1:	e9 90 00 00 00       	jmp    0x2566
    24d6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24d9:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    24dd:	66 85 c0             	test   ax,ax
    24e0:	0f 84 80 00 00 00    	je     0x2566
    24e6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24e9:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    24ed:	8d 50 ff             	lea    edx,[eax-0x1]
    24f0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    24f3:	66 89 50 0e          	mov    WORD PTR [eax+0xe],dx
    24f7:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
    24fb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
    2502:	eb 45                	jmp    0x2549
    2504:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2507:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    250b:	0f b7 d0             	movzx  edx,ax
    250e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    2511:	0f b7 c0             	movzx  eax,ax
    2514:	83 ec 04             	sub    esp,0x4
    2517:	52                   	push   edx
    2518:	50                   	push   eax
    2519:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    251c:	e8 5d f6 ff ff       	call   0x1b7e
    2521:	83 c4 10             	add    esp,0x10
    2524:	66 89 45 e2          	mov    WORD PTR [ebp-0x1e],ax
    2528:	0f b7 45 e2          	movzx  eax,WORD PTR [ebp-0x1e]
    252c:	01 c0                	add    eax,eax
    252e:	05 00 80 0b 00       	add    eax,0xb8000
    2533:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    2536:	88 45 e1             	mov    BYTE PTR [ebp-0x1f],al
    2539:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    253c:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
    253f:	80 7d e1 00          	cmp    BYTE PTR [ebp-0x1f],0x0
    2543:	74 15                	je     0x255a
    2545:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
    2549:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    254c:	0f b7 40 08          	movzx  eax,WORD PTR [eax+0x8]
    2550:	0f b7 c0             	movzx  eax,ax
    2553:	39 45 ec             	cmp    DWORD PTR [ebp-0x14],eax
    2556:	7c ac                	jl     0x2504
    2558:	eb 01                	jmp    0x255b
    255a:	90                   	nop
    255b:	0f b6 55 f3          	movzx  edx,BYTE PTR [ebp-0xd]
    255f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2562:	66 89 50 0c          	mov    WORD PTR [eax+0xc],dx
    2566:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2569:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    256d:	0f b7 d0             	movzx  edx,ax
    2570:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2573:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    2577:	0f b7 c0             	movzx  eax,ax
    257a:	83 ec 04             	sub    esp,0x4
    257d:	52                   	push   edx
    257e:	50                   	push   eax
    257f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2582:	e8 f7 f5 ff ff       	call   0x1b7e
    2587:	83 c4 10             	add    esp,0x10
    258a:	66 89 45 de          	mov    WORD PTR [ebp-0x22],ax
    258e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2591:	0f b7 40 16          	movzx  eax,WORD PTR [eax+0x16]
    2595:	66 39 45 de          	cmp    WORD PTR [ebp-0x22],ax
    2599:	72 28                	jb     0x25c3
    259b:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
    259f:	01 c0                	add    eax,eax
    25a1:	05 00 80 0b 00       	add    eax,0xb8000
    25a6:	c6 00 00             	mov    BYTE PTR [eax],0x0
    25a9:	0f b7 45 de          	movzx  eax,WORD PTR [ebp-0x22]
    25ad:	01 c0                	add    eax,eax
    25af:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    25b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    25b8:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    25bc:	88 02                	mov    BYTE PTR [edx],al
    25be:	e9 be 00 00 00       	jmp    0x2681
    25c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    25c6:	0f b7 55 e6          	movzx  edx,WORD PTR [ebp-0x1a]
    25ca:	66 89 50 0c          	mov    WORD PTR [eax+0xc],dx
    25ce:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    25d1:	0f b7 55 e4          	movzx  edx,WORD PTR [ebp-0x1c]
    25d5:	66 89 50 0e          	mov    WORD PTR [eax+0xe],dx
    25d9:	e9 a3 00 00 00       	jmp    0x2681
    25de:	83 ec 0c             	sub    esp,0xc
    25e1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    25e4:	e8 87 fc ff ff       	call   0x2270
    25e9:	83 c4 10             	add    esp,0x10
    25ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    25ef:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    25f3:	0f b7 d0             	movzx  edx,ax
    25f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    25f9:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    25fd:	0f b7 c0             	movzx  eax,ax
    2600:	83 ec 04             	sub    esp,0x4
    2603:	52                   	push   edx
    2604:	50                   	push   eax
    2605:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2608:	e8 71 f5 ff ff       	call   0x1b7e
    260d:	83 c4 10             	add    esp,0x10
    2610:	66 89 45 e8          	mov    WORD PTR [ebp-0x18],ax
    2614:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
    2618:	01 c0                	add    eax,eax
    261a:	8d 90 00 80 0b 00    	lea    edx,[eax+0xb8000]
    2620:	0f b6 45 d4          	movzx  eax,BYTE PTR [ebp-0x2c]
    2624:	88 02                	mov    BYTE PTR [edx],al
    2626:	0f b7 45 e8          	movzx  eax,WORD PTR [ebp-0x18]
    262a:	01 c0                	add    eax,eax
    262c:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    2632:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2635:	0f b6 40 1c          	movzx  eax,BYTE PTR [eax+0x1c]
    2639:	88 02                	mov    BYTE PTR [edx],al
    263b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    263e:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    2642:	8d 50 01             	lea    edx,[eax+0x1]
    2645:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2648:	66 89 50 0c          	mov    WORD PTR [eax+0xc],dx
    264c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    264f:	0f b7 40 0c          	movzx  eax,WORD PTR [eax+0xc]
    2653:	0f b7 d0             	movzx  edx,ax
    2656:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2659:	0f b7 40 04          	movzx  eax,WORD PTR [eax+0x4]
    265d:	0f b7 c0             	movzx  eax,ax
    2660:	83 e8 02             	sub    eax,0x2
    2663:	39 c2                	cmp    edx,eax
    2665:	7c 1a                	jl     0x2681
    2667:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    266a:	66 c7 40 0c 00 00    	mov    WORD PTR [eax+0xc],0x0
    2670:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2673:	0f b7 40 0e          	movzx  eax,WORD PTR [eax+0xe]
    2677:	8d 50 01             	lea    edx,[eax+0x1]
    267a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    267d:	66 89 50 0e          	mov    WORD PTR [eax+0xe],dx
    2681:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2684:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
    268b:	83 ec 0c             	sub    esp,0xc
    268e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2691:	e8 69 f5 ff ff       	call   0x1bff
    2696:	83 c4 10             	add    esp,0x10
    2699:	90                   	nop
    269a:	c9                   	leave  
    269b:	c3                   	ret    
    269c:	55                   	push   ebp
    269d:	89 e5                	mov    ebp,esp
    269f:	83 ec 08             	sub    esp,0x8
    26a2:	eb 1c                	jmp    0x26c0
    26a4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    26a7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    26aa:	0f be c0             	movsx  eax,al
    26ad:	83 ec 08             	sub    esp,0x8
    26b0:	50                   	push   eax
    26b1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    26b4:	e8 15 fd ff ff       	call   0x23ce
    26b9:	83 c4 10             	add    esp,0x10
    26bc:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
    26c0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    26c3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    26c6:	84 c0                	test   al,al
    26c8:	75 da                	jne    0x26a4
    26ca:	90                   	nop
    26cb:	90                   	nop
    26cc:	c9                   	leave  
    26cd:	c3                   	ret    
    26ce:	55                   	push   ebp
    26cf:	89 e5                	mov    ebp,esp
    26d1:	83 ec 18             	sub    esp,0x18
    26d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    26d7:	8b 00                	mov    eax,DWORD PTR [eax]
    26d9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    26dc:	83 ec 04             	sub    esp,0x4
    26df:	6a 00                	push   0x0
    26e1:	6a 00                	push   0x0
    26e3:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    26e6:	e8 6a 01 00 00       	call   0x2855
    26eb:	83 c4 10             	add    esp,0x10
    26ee:	83 ec 04             	sub    esp,0x4
    26f1:	6a 4f                	push   0x4f
    26f3:	68 84 52 03 00       	push   0x35284
    26f8:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    26fb:	e8 0e 02 00 00       	call   0x290e
    2700:	83 c4 10             	add    esp,0x10
    2703:	eb fe                	jmp    0x2703
    2705:	55                   	push   ebp
    2706:	89 e5                	mov    ebp,esp
    2708:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    270b:	66 c7 40 0c 01 00    	mov    WORD PTR [eax+0xc],0x1
    2711:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2714:	66 c7 40 0e 01 00    	mov    WORD PTR [eax+0xe],0x1
    271a:	eb fe                	jmp    0x271a
    271c:	55                   	push   ebp
    271d:	89 e5                	mov    ebp,esp
    271f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2722:	c1 e0 04             	shl    eax,0x4
    2725:	89 c2                	mov    edx,eax
    2727:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    272a:	09 d0                	or     eax,edx
    272c:	5d                   	pop    ebp
    272d:	c3                   	ret    
    272e:	55                   	push   ebp
    272f:	89 e5                	mov    ebp,esp
    2731:	83 ec 18             	sub    esp,0x18
    2734:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2737:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
    273a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    273d:	66 c7 00 50 00       	mov    WORD PTR [eax],0x50
    2742:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2745:	66 c7 40 02 19 00    	mov    WORD PTR [eax+0x2],0x19
    274b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    274e:	0f b6 55 f4          	movzx  edx,BYTE PTR [ebp-0xc]
    2752:	88 50 08             	mov    BYTE PTR [eax+0x8],dl
    2755:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2758:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
    275f:	83 ec 0c             	sub    esp,0xc
    2762:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2765:	e8 0a 00 00 00       	call   0x2774
    276a:	83 c4 10             	add    esp,0x10
    276d:	b8 00 00 00 00       	mov    eax,0x0
    2772:	c9                   	leave  
    2773:	c3                   	ret    
    2774:	55                   	push   ebp
    2775:	89 e5                	mov    ebp,esp
    2777:	83 ec 10             	sub    esp,0x10
    277a:	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
    2780:	eb 63                	jmp    0x27e5
    2782:	66 c7 45 fc 00 00    	mov    WORD PTR [ebp-0x4],0x0
    2788:	eb 43                	jmp    0x27cd
    278a:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
    278e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2791:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2794:	0f b7 c0             	movzx  eax,ax
    2797:	0f af d0             	imul   edx,eax
    279a:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    279e:	01 d0                	add    eax,edx
    27a0:	01 c0                	add    eax,eax
    27a2:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
    27a5:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    27a8:	05 00 80 0b 00       	add    eax,0xb8000
    27ad:	c6 00 00             	mov    BYTE PTR [eax],0x0
    27b0:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    27b3:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    27b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27bc:	0f b6 40 08          	movzx  eax,BYTE PTR [eax+0x8]
    27c0:	88 02                	mov    BYTE PTR [edx],al
    27c2:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    27c6:	83 c0 01             	add    eax,0x1
    27c9:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
    27cd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27d0:	0f b7 40 02          	movzx  eax,WORD PTR [eax+0x2]
    27d4:	66 39 45 fc          	cmp    WORD PTR [ebp-0x4],ax
    27d8:	72 b0                	jb     0x278a
    27da:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
    27de:	83 c0 01             	add    eax,0x1
    27e1:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
    27e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    27e8:	0f b7 00             	movzx  eax,WORD PTR [eax]
    27eb:	66 39 45 fe          	cmp    WORD PTR [ebp-0x2],ax
    27ef:	72 91                	jb     0x2782
    27f1:	90                   	nop
    27f2:	90                   	nop
    27f3:	c9                   	leave  
    27f4:	c3                   	ret    
    27f5:	55                   	push   ebp
    27f6:	89 e5                	mov    ebp,esp
    27f8:	53                   	push   ebx
    27f9:	83 ec 20             	sub    esp,0x20
    27fc:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
    27ff:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
    2802:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
    2805:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
    2808:	88 5d e8             	mov    BYTE PTR [ebp-0x18],bl
    280b:	88 4d e4             	mov    BYTE PTR [ebp-0x1c],cl
    280e:	66 89 55 e0          	mov    WORD PTR [ebp-0x20],dx
    2812:	66 89 45 dc          	mov    WORD PTR [ebp-0x24],ax
    2816:	0f b7 55 dc          	movzx  edx,WORD PTR [ebp-0x24]
    281a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    281d:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2820:	0f b7 c0             	movzx  eax,ax
    2823:	0f af d0             	imul   edx,eax
    2826:	0f b7 45 e0          	movzx  eax,WORD PTR [ebp-0x20]
    282a:	01 d0                	add    eax,edx
    282c:	01 c0                	add    eax,eax
    282e:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
    2831:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    2834:	8d 90 00 80 0b 00    	lea    edx,[eax+0xb8000]
    283a:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
    283e:	88 02                	mov    BYTE PTR [edx],al
    2840:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
    2843:	8d 90 01 80 0b 00    	lea    edx,[eax+0xb8001]
    2849:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
    284d:	88 02                	mov    BYTE PTR [edx],al
    284f:	90                   	nop
    2850:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    2853:	c9                   	leave  
    2854:	c3                   	ret    
    2855:	55                   	push   ebp
    2856:	89 e5                	mov    ebp,esp
    2858:	83 ec 08             	sub    esp,0x8
    285b:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    285e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    2861:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
    2865:	66 89 45 f8          	mov    WORD PTR [ebp-0x8],ax
    2869:	0f b7 55 f8          	movzx  edx,WORD PTR [ebp-0x8]
    286d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2870:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2873:	0f b7 c0             	movzx  eax,ax
    2876:	0f af d0             	imul   edx,eax
    2879:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
    287d:	01 d0                	add    eax,edx
    287f:	89 c2                	mov    edx,eax
    2881:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2884:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
    2887:	90                   	nop
    2888:	c9                   	leave  
    2889:	c3                   	ret    
    288a:	55                   	push   ebp
    288b:	89 e5                	mov    ebp,esp
    288d:	83 ec 10             	sub    esp,0x10
    2890:	eb 6e                	jmp    0x2900
    2892:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2895:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    2898:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
    289b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    289e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    28a1:	3c 0a                	cmp    al,0xa
    28a3:	75 23                	jne    0x28c8
    28a5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    28a8:	0f b7 00             	movzx  eax,WORD PTR [eax]
    28ab:	0f b7 c8             	movzx  ecx,ax
    28ae:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    28b1:	99                   	cdq    
    28b2:	f7 f9                	idiv   ecx
    28b4:	8d 50 01             	lea    edx,[eax+0x1]
    28b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    28ba:	0f b7 00             	movzx  eax,WORD PTR [eax]
    28bd:	0f b7 c0             	movzx  eax,ax
    28c0:	0f af c2             	imul   eax,edx
    28c3:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
    28c6:	eb 2b                	jmp    0x28f3
    28c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    28cb:	0f b6 40 08          	movzx  eax,BYTE PTR [eax+0x8]
    28cf:	0f b6 c0             	movzx  eax,al
    28d2:	c1 e0 08             	shl    eax,0x8
    28d5:	89 c2                	mov    edx,eax
    28d7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    28da:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    28dd:	0f b6 c0             	movzx  eax,al
    28e0:	09 c2                	or     edx,eax
    28e2:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    28e5:	01 c0                	add    eax,eax
    28e7:	05 00 80 0b 00       	add    eax,0xb8000
    28ec:	66 89 10             	mov    WORD PTR [eax],dx
    28ef:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
    28f3:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    28f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    28f9:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
    28fc:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
    2900:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2903:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    2906:	84 c0                	test   al,al
    2908:	75 88                	jne    0x2892
    290a:	90                   	nop
    290b:	90                   	nop
    290c:	c9                   	leave  
    290d:	c3                   	ret    
    290e:	55                   	push   ebp
    290f:	89 e5                	mov    ebp,esp
    2911:	83 ec 14             	sub    esp,0x14
    2914:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
    2917:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
    291a:	eb 68                	jmp    0x2984
    291c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    291f:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
    2922:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
    2925:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2928:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    292b:	3c 0a                	cmp    al,0xa
    292d:	75 23                	jne    0x2952
    292f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2932:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2935:	0f b7 c8             	movzx  ecx,ax
    2938:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    293b:	99                   	cdq    
    293c:	f7 f9                	idiv   ecx
    293e:	8d 50 01             	lea    edx,[eax+0x1]
    2941:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2944:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2947:	0f b7 c0             	movzx  eax,ax
    294a:	0f af c2             	imul   eax,edx
    294d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
    2950:	eb 25                	jmp    0x2977
    2952:	0f b6 45 ec          	movzx  eax,BYTE PTR [ebp-0x14]
    2956:	c1 e0 08             	shl    eax,0x8
    2959:	89 c2                	mov    edx,eax
    295b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    295e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    2961:	0f b6 c0             	movzx  eax,al
    2964:	09 c2                	or     edx,eax
    2966:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
    2969:	01 c0                	add    eax,eax
    296b:	05 00 80 0b 00       	add    eax,0xb8000
    2970:	66 89 10             	mov    WORD PTR [eax],dx
    2973:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
    2977:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
    297a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    297d:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
    2980:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
    2984:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    2987:	0f b6 00             	movzx  eax,BYTE PTR [eax]
    298a:	84 c0                	test   al,al
    298c:	75 8e                	jne    0x291c
    298e:	90                   	nop
    298f:	90                   	nop
    2990:	c9                   	leave  
    2991:	c3                   	ret    
    2992:	55                   	push   ebp
    2993:	89 e5                	mov    ebp,esp
    2995:	83 ec 08             	sub    esp,0x8
    2998:	e8 3c 08 00 00       	call   0x31d9
    299d:	e8 f5 08 00 00       	call   0x3297
    29a2:	e8 d5 09 00 00       	call   0x337c
    29a7:	e8 76 09 00 00       	call   0x3322
    29ac:	e8 33 e1 ff ff       	call   0xae4
    29b1:	90                   	nop
    29b2:	c9                   	leave  
    29b3:	c3                   	ret    
    29b4:	55                   	push   ebp
    29b5:	89 e5                	mov    ebp,esp
    29b7:	83 ec 08             	sub    esp,0x8
    29ba:	83 ec 08             	sub    esp,0x8
    29bd:	6a 00                	push   0x0
    29bf:	68 80 00 00 00       	push   0x80
    29c4:	e8 5f d6 ff ff       	call   0x28
    29c9:	83 c4 10             	add    esp,0x10
    29cc:	90                   	nop
    29cd:	c9                   	leave  
    29ce:	c3                   	ret    
    29cf:	55                   	push   ebp
    29d0:	89 e5                	mov    ebp,esp
    29d2:	83 ec 04             	sub    esp,0x4
    29d5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    29d8:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
    29db:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
    29df:	83 f8 38             	cmp    eax,0x38
    29e2:	74 3a                	je     0x2a1e
    29e4:	83 f8 38             	cmp    eax,0x38
    29e7:	7f 3c                	jg     0x2a25
    29e9:	83 f8 36             	cmp    eax,0x36
    29ec:	74 29                	je     0x2a17
    29ee:	83 f8 36             	cmp    eax,0x36
    29f1:	7f 32                	jg     0x2a25
    29f3:	83 f8 2a             	cmp    eax,0x2a
    29f6:	74 1f                	je     0x2a17
    29f8:	83 f8 2a             	cmp    eax,0x2a
    29fb:	7f 28                	jg     0x2a25
    29fd:	83 f8 01             	cmp    eax,0x1
    2a00:	74 07                	je     0x2a09
    2a02:	83 f8 1d             	cmp    eax,0x1d
    2a05:	74 09                	je     0x2a10
    2a07:	eb 1c                	jmp    0x2a25
    2a09:	b8 00 00 00 00       	mov    eax,0x0
    2a0e:	eb 1a                	jmp    0x2a2a
    2a10:	b8 01 00 00 00       	mov    eax,0x1
    2a15:	eb 13                	jmp    0x2a2a
    2a17:	b8 02 00 00 00       	mov    eax,0x2
    2a1c:	eb 0c                	jmp    0x2a2a
    2a1e:	b8 03 00 00 00       	mov    eax,0x3
    2a23:	eb 05                	jmp    0x2a2a
    2a25:	b8 ff ff ff ff       	mov    eax,0xffffffff
    2a2a:	c9                   	leave  
    2a2b:	c3                   	ret    
    2a2c:	55                   	push   ebp
    2a2d:	89 e5                	mov    ebp,esp
    2a2f:	83 ec 04             	sub    esp,0x4
    2a32:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2a35:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
    2a38:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
    2a3c:	3d b8 00 00 00       	cmp    eax,0xb8
    2a41:	74 48                	je     0x2a8b
    2a43:	3d b8 00 00 00       	cmp    eax,0xb8
    2a48:	7f 48                	jg     0x2a92
    2a4a:	3d b6 00 00 00       	cmp    eax,0xb6
    2a4f:	74 33                	je     0x2a84
    2a51:	3d b6 00 00 00       	cmp    eax,0xb6
    2a56:	7f 3a                	jg     0x2a92
    2a58:	3d aa 00 00 00       	cmp    eax,0xaa
    2a5d:	74 25                	je     0x2a84
    2a5f:	3d aa 00 00 00       	cmp    eax,0xaa
    2a64:	7f 2c                	jg     0x2a92
    2a66:	3d 81 00 00 00       	cmp    eax,0x81
    2a6b:	74 09                	je     0x2a76
    2a6d:	3d 9d 00 00 00       	cmp    eax,0x9d
    2a72:	74 09                	je     0x2a7d
    2a74:	eb 1c                	jmp    0x2a92
    2a76:	b8 00 00 00 00       	mov    eax,0x0
    2a7b:	eb 1a                	jmp    0x2a97
    2a7d:	b8 01 00 00 00       	mov    eax,0x1
    2a82:	eb 13                	jmp    0x2a97
    2a84:	b8 02 00 00 00       	mov    eax,0x2
    2a89:	eb 0c                	jmp    0x2a97
    2a8b:	b8 03 00 00 00       	mov    eax,0x3
    2a90:	eb 05                	jmp    0x2a97
    2a92:	b8 ff ff ff ff       	mov    eax,0xffffffff
    2a97:	c9                   	leave  
    2a98:	c3                   	ret    
    2a99:	55                   	push   ebp
    2a9a:	89 e5                	mov    ebp,esp
    2a9c:	83 ec 18             	sub    esp,0x18
    2a9f:	e8 bc e2 ff ff       	call   0xd60
    2aa4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    2aa7:	83 ec 0c             	sub    esp,0xc
    2aaa:	6a 60                	push   0x60
    2aac:	e8 82 d5 ff ff       	call   0x33
    2ab1:	83 c4 10             	add    esp,0x10
    2ab4:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
    2ab7:	80 7d f3 e0          	cmp    BYTE PTR [ebp-0xd],0xe0
    2abb:	75 0c                	jne    0x2ac9
    2abd:	c6 05 8c 5e 03 00 01 	mov    BYTE PTR ds:0x35e8c,0x1
    2ac4:	e9 a6 00 00 00       	jmp    0x2b6f
    2ac9:	0f b6 05 8c 5e 03 00 	movzx  eax,BYTE PTR ds:0x35e8c
    2ad0:	0f b6 c0             	movzx  eax,al
    2ad3:	85 c0                	test   eax,eax
    2ad5:	74 08                	je     0x2adf
    2ad7:	83 f8 01             	cmp    eax,0x1
    2ada:	e9 89 00 00 00       	jmp    0x2b68
    2adf:	80 7d f3 53          	cmp    BYTE PTR [ebp-0xd],0x53
    2ae3:	77 5e                	ja     0x2b43
    2ae5:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    2ae9:	83 ec 0c             	sub    esp,0xc
    2aec:	50                   	push   eax
    2aed:	e8 dd fe ff ff       	call   0x29cf
    2af2:	83 c4 10             	add    esp,0x10
    2af5:	88 45 f1             	mov    BYTE PTR [ebp-0xf],al
    2af8:	80 7d f1 ff          	cmp    BYTE PTR [ebp-0xf],0xff
    2afc:	75 38                	jne    0x2b36
    2afe:	0f b6 05 8a 5e 03 00 	movzx  eax,BYTE PTR ds:0x35e8a
    2b05:	84 c0                	test   al,al
    2b07:	74 0d                	je     0x2b16
    2b09:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    2b0d:	0f b6 80 40 58 03 00 	movzx  eax,BYTE PTR [eax+0x35840]
    2b14:	eb 0b                	jmp    0x2b21
    2b16:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    2b1a:	0f b6 80 80 58 03 00 	movzx  eax,BYTE PTR [eax+0x35880]
    2b21:	88 45 f0             	mov    BYTE PTR [ebp-0x10],al
    2b24:	0f be 45 f0          	movsx  eax,BYTE PTR [ebp-0x10]
    2b28:	83 ec 0c             	sub    esp,0xc
    2b2b:	50                   	push   eax
    2b2c:	e8 99 e3 ff ff       	call   0xeca
    2b31:	83 c4 10             	add    esp,0x10
    2b34:	eb 31                	jmp    0x2b67
    2b36:	0f b6 45 f1          	movzx  eax,BYTE PTR [ebp-0xf]
    2b3a:	c6 80 88 5e 03 00 01 	mov    BYTE PTR [eax+0x35e88],0x1
    2b41:	eb 24                	jmp    0x2b67
    2b43:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    2b47:	83 ec 0c             	sub    esp,0xc
    2b4a:	50                   	push   eax
    2b4b:	e8 dc fe ff ff       	call   0x2a2c
    2b50:	83 c4 10             	add    esp,0x10
    2b53:	88 45 f2             	mov    BYTE PTR [ebp-0xe],al
    2b56:	80 7d f2 ff          	cmp    BYTE PTR [ebp-0xe],0xff
    2b5a:	74 0b                	je     0x2b67
    2b5c:	0f b6 45 f2          	movzx  eax,BYTE PTR [ebp-0xe]
    2b60:	c6 80 88 5e 03 00 00 	mov    BYTE PTR [eax+0x35e88],0x0
    2b67:	90                   	nop
    2b68:	c6 05 8c 5e 03 00 00 	mov    BYTE PTR ds:0x35e8c,0x0
    2b6f:	c9                   	leave  
    2b70:	c3                   	ret    
    2b71:	55                   	push   ebp
    2b72:	89 e5                	mov    ebp,esp
    2b74:	83 ec 08             	sub    esp,0x8
    2b77:	83 ec 0c             	sub    esp,0xc
    2b7a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    2b7d:	e8 05 00 00 00       	call   0x2b87
    2b82:	83 c4 10             	add    esp,0x10
    2b85:	c9                   	leave  
    2b86:	c3                   	ret    
    2b87:	55                   	push   ebp
    2b88:	89 e5                	mov    ebp,esp
    2b8a:	57                   	push   edi
    2b8b:	56                   	push   esi
    2b8c:	53                   	push   ebx
    2b8d:	83 ec 2c             	sub    esp,0x2c
    2b90:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
    2b97:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
    2b9e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
    2ba5:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
    2bac:	e9 e2 02 00 00       	jmp    0x2e93
    2bb1:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2bb4:	89 d0                	mov    eax,edx
    2bb6:	01 c0                	add    eax,eax
    2bb8:	01 d0                	add    eax,edx
    2bba:	c1 e0 03             	shl    eax,0x3
    2bbd:	89 c2                	mov    edx,eax
    2bbf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2bc2:	01 d0                	add    eax,edx
    2bc4:	8b 08                	mov    ecx,DWORD PTR [eax]
    2bc6:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2bc9:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2bcc:	89 d0                	mov    eax,edx
    2bce:	c1 e0 02             	shl    eax,0x2
    2bd1:	01 d0                	add    eax,edx
    2bd3:	c1 e0 03             	shl    eax,0x3
    2bd6:	05 a0 5e 03 00       	add    eax,0x35ea0
    2bdb:	89 08                	mov    DWORD PTR [eax],ecx
    2bdd:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2be0:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2be3:	89 d0                	mov    eax,edx
    2be5:	01 c0                	add    eax,eax
    2be7:	01 d0                	add    eax,edx
    2be9:	c1 e0 03             	shl    eax,0x3
    2bec:	89 c2                	mov    edx,eax
    2bee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2bf1:	01 d0                	add    eax,edx
    2bf3:	8b 08                	mov    ecx,DWORD PTR [eax]
    2bf5:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2bf8:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2bfb:	89 d0                	mov    eax,edx
    2bfd:	c1 e0 02             	shl    eax,0x2
    2c00:	01 d0                	add    eax,edx
    2c02:	c1 e0 03             	shl    eax,0x3
    2c05:	05 b0 5e 03 00       	add    eax,0x35eb0
    2c0a:	89 08                	mov    DWORD PTR [eax],ecx
    2c0c:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2c0f:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c12:	89 d0                	mov    eax,edx
    2c14:	01 c0                	add    eax,eax
    2c16:	01 d0                	add    eax,edx
    2c18:	c1 e0 03             	shl    eax,0x3
    2c1b:	89 c2                	mov    edx,eax
    2c1d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2c20:	01 d0                	add    eax,edx
    2c22:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
    2c25:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
    2c28:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c2b:	89 d0                	mov    eax,edx
    2c2d:	c1 e0 02             	shl    eax,0x2
    2c30:	01 d0                	add    eax,edx
    2c32:	c1 e0 03             	shl    eax,0x3
    2c35:	05 a8 5e 03 00       	add    eax,0x35ea8
    2c3a:	89 08                	mov    DWORD PTR [eax],ecx
    2c3c:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2c3f:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c42:	89 d0                	mov    eax,edx
    2c44:	01 c0                	add    eax,eax
    2c46:	01 d0                	add    eax,edx
    2c48:	c1 e0 03             	shl    eax,0x3
    2c4b:	89 c2                	mov    edx,eax
    2c4d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2c50:	01 d0                	add    eax,edx
    2c52:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2c55:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    2c58:	0f ac d0 0c          	shrd   eax,edx,0xc
    2c5c:	c1 ea 0c             	shr    edx,0xc
    2c5f:	89 c1                	mov    ecx,eax
    2c61:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c64:	89 d0                	mov    eax,edx
    2c66:	c1 e0 02             	shl    eax,0x2
    2c69:	01 d0                	add    eax,edx
    2c6b:	c1 e0 03             	shl    eax,0x3
    2c6e:	05 c4 5e 03 00       	add    eax,0x35ec4
    2c73:	89 08                	mov    DWORD PTR [eax],ecx
    2c75:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c78:	89 d0                	mov    eax,edx
    2c7a:	01 c0                	add    eax,eax
    2c7c:	01 d0                	add    eax,edx
    2c7e:	c1 e0 03             	shl    eax,0x3
    2c81:	89 c2                	mov    edx,eax
    2c83:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2c86:	01 d0                	add    eax,edx
    2c88:	8b 08                	mov    ecx,DWORD PTR [eax]
    2c8a:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2c8d:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2c90:	89 d0                	mov    eax,edx
    2c92:	01 c0                	add    eax,eax
    2c94:	01 d0                	add    eax,edx
    2c96:	c1 e0 03             	shl    eax,0x3
    2c99:	89 c2                	mov    edx,eax
    2c9b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2c9e:	01 d0                	add    eax,edx
    2ca0:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2ca3:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    2ca6:	01 c1                	add    ecx,eax
    2ca8:	11 d3                	adc    ebx,edx
    2caa:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2cad:	89 d0                	mov    eax,edx
    2caf:	c1 e0 02             	shl    eax,0x2
    2cb2:	01 d0                	add    eax,edx
    2cb4:	c1 e0 03             	shl    eax,0x3
    2cb7:	05 b8 5e 03 00       	add    eax,0x35eb8
    2cbc:	89 08                	mov    DWORD PTR [eax],ecx
    2cbe:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2cc1:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2cc4:	89 d0                	mov    eax,edx
    2cc6:	01 c0                	add    eax,eax
    2cc8:	01 d0                	add    eax,edx
    2cca:	c1 e0 03             	shl    eax,0x3
    2ccd:	89 c2                	mov    edx,eax
    2ccf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2cd2:	01 d0                	add    eax,edx
    2cd4:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
    2cd7:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2cda:	89 d0                	mov    eax,edx
    2cdc:	c1 e0 02             	shl    eax,0x2
    2cdf:	01 d0                	add    eax,edx
    2ce1:	c1 e0 03             	shl    eax,0x3
    2ce4:	05 c0 5e 03 00       	add    eax,0x35ec0
    2ce9:	89 08                	mov    DWORD PTR [eax],ecx
    2ceb:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2cee:	89 d0                	mov    eax,edx
    2cf0:	01 c0                	add    eax,eax
    2cf2:	01 d0                	add    eax,edx
    2cf4:	c1 e0 03             	shl    eax,0x3
    2cf7:	89 c2                	mov    edx,eax
    2cf9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2cfc:	01 d0                	add    eax,edx
    2cfe:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
    2d01:	83 f8 01             	cmp    eax,0x1
    2d04:	0f 85 85 01 00 00    	jne    0x2e8f
    2d0a:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2d0d:	89 d0                	mov    eax,edx
    2d0f:	01 c0                	add    eax,eax
    2d11:	01 d0                	add    eax,edx
    2d13:	c1 e0 03             	shl    eax,0x3
    2d16:	89 c2                	mov    edx,eax
    2d18:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d1b:	01 d0                	add    eax,edx
    2d1d:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    2d20:	8b 00                	mov    eax,DWORD PTR [eax]
    2d22:	89 c6                	mov    esi,eax
    2d24:	89 d7                	mov    edi,edx
    2d26:	89 f8                	mov    eax,edi
    2d28:	09 f0                	or     eax,esi
    2d2a:	85 c0                	test   eax,eax
    2d2c:	0f 84 5d 01 00 00    	je     0x2e8f
    2d32:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2d35:	89 d0                	mov    eax,edx
    2d37:	01 c0                	add    eax,eax
    2d39:	01 d0                	add    eax,edx
    2d3b:	c1 e0 03             	shl    eax,0x3
    2d3e:	89 c2                	mov    edx,eax
    2d40:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d43:	01 d0                	add    eax,edx
    2d45:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2d48:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    2d4b:	01 45 e0             	add    DWORD PTR [ebp-0x20],eax
    2d4e:	11 55 e4             	adc    DWORD PTR [ebp-0x1c],edx
    2d51:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2d54:	89 d0                	mov    eax,edx
    2d56:	01 c0                	add    eax,eax
    2d58:	01 d0                	add    eax,edx
    2d5a:	c1 e0 03             	shl    eax,0x3
    2d5d:	89 c2                	mov    edx,eax
    2d5f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d62:	01 d0                	add    eax,edx
    2d64:	8b 08                	mov    ecx,DWORD PTR [eax]
    2d66:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2d69:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2d6c:	89 d0                	mov    eax,edx
    2d6e:	c1 e0 02             	shl    eax,0x2
    2d71:	01 d0                	add    eax,edx
    2d73:	c1 e0 03             	shl    eax,0x3
    2d76:	05 c0 61 03 00       	add    eax,0x361c0
    2d7b:	89 08                	mov    DWORD PTR [eax],ecx
    2d7d:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2d80:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2d83:	89 d0                	mov    eax,edx
    2d85:	01 c0                	add    eax,eax
    2d87:	01 d0                	add    eax,edx
    2d89:	c1 e0 03             	shl    eax,0x3
    2d8c:	89 c2                	mov    edx,eax
    2d8e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2d91:	01 d0                	add    eax,edx
    2d93:	8b 08                	mov    ecx,DWORD PTR [eax]
    2d95:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2d98:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2d9b:	89 d0                	mov    eax,edx
    2d9d:	c1 e0 02             	shl    eax,0x2
    2da0:	01 d0                	add    eax,edx
    2da2:	c1 e0 03             	shl    eax,0x3
    2da5:	05 d0 61 03 00       	add    eax,0x361d0
    2daa:	89 08                	mov    DWORD PTR [eax],ecx
    2dac:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2daf:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2db2:	89 d0                	mov    eax,edx
    2db4:	01 c0                	add    eax,eax
    2db6:	01 d0                	add    eax,edx
    2db8:	c1 e0 03             	shl    eax,0x3
    2dbb:	89 c2                	mov    edx,eax
    2dbd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2dc0:	01 d0                	add    eax,edx
    2dc2:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
    2dc5:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
    2dc8:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2dcb:	89 d0                	mov    eax,edx
    2dcd:	c1 e0 02             	shl    eax,0x2
    2dd0:	01 d0                	add    eax,edx
    2dd2:	c1 e0 03             	shl    eax,0x3
    2dd5:	05 c8 61 03 00       	add    eax,0x361c8
    2dda:	89 08                	mov    DWORD PTR [eax],ecx
    2ddc:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2ddf:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2de2:	89 d0                	mov    eax,edx
    2de4:	01 c0                	add    eax,eax
    2de6:	01 d0                	add    eax,edx
    2de8:	c1 e0 03             	shl    eax,0x3
    2deb:	89 c2                	mov    edx,eax
    2ded:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2df0:	01 d0                	add    eax,edx
    2df2:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2df5:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    2df8:	0f ac d0 0c          	shrd   eax,edx,0xc
    2dfc:	c1 ea 0c             	shr    edx,0xc
    2dff:	89 c1                	mov    ecx,eax
    2e01:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2e04:	89 d0                	mov    eax,edx
    2e06:	c1 e0 02             	shl    eax,0x2
    2e09:	01 d0                	add    eax,edx
    2e0b:	c1 e0 03             	shl    eax,0x3
    2e0e:	05 e4 61 03 00       	add    eax,0x361e4
    2e13:	89 08                	mov    DWORD PTR [eax],ecx
    2e15:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2e18:	89 d0                	mov    eax,edx
    2e1a:	01 c0                	add    eax,eax
    2e1c:	01 d0                	add    eax,edx
    2e1e:	c1 e0 03             	shl    eax,0x3
    2e21:	89 c2                	mov    edx,eax
    2e23:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2e26:	01 d0                	add    eax,edx
    2e28:	8b 08                	mov    ecx,DWORD PTR [eax]
    2e2a:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2e2d:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2e30:	89 d0                	mov    eax,edx
    2e32:	01 c0                	add    eax,eax
    2e34:	01 d0                	add    eax,edx
    2e36:	c1 e0 03             	shl    eax,0x3
    2e39:	89 c2                	mov    edx,eax
    2e3b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2e3e:	01 d0                	add    eax,edx
    2e40:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    2e43:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
    2e46:	01 c1                	add    ecx,eax
    2e48:	11 d3                	adc    ebx,edx
    2e4a:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2e4d:	89 d0                	mov    eax,edx
    2e4f:	c1 e0 02             	shl    eax,0x2
    2e52:	01 d0                	add    eax,edx
    2e54:	c1 e0 03             	shl    eax,0x3
    2e57:	05 d8 61 03 00       	add    eax,0x361d8
    2e5c:	89 08                	mov    DWORD PTR [eax],ecx
    2e5e:	89 58 04             	mov    DWORD PTR [eax+0x4],ebx
    2e61:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
    2e64:	89 d0                	mov    eax,edx
    2e66:	01 c0                	add    eax,eax
    2e68:	01 d0                	add    eax,edx
    2e6a:	c1 e0 03             	shl    eax,0x3
    2e6d:	89 c2                	mov    edx,eax
    2e6f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    2e72:	01 d0                	add    eax,edx
    2e74:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
    2e77:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
    2e7a:	89 d0                	mov    eax,edx
    2e7c:	c1 e0 02             	shl    eax,0x2
    2e7f:	01 d0                	add    eax,edx
    2e81:	c1 e0 03             	shl    eax,0x3
    2e84:	05 e0 61 03 00       	add    eax,0x361e0
    2e89:	89 08                	mov    DWORD PTR [eax],ecx
    2e8b:	83 45 dc 01          	add    DWORD PTR [ebp-0x24],0x1
    2e8f:	83 45 d8 01          	add    DWORD PTR [ebp-0x28],0x1
    2e93:	83 7d d8 13          	cmp    DWORD PTR [ebp-0x28],0x13
    2e97:	0f 8e 14 fd ff ff    	jle    0x2bb1
    2e9d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    2ea0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    2ea3:	0f ac d0 0c          	shrd   eax,edx,0xc
    2ea7:	c1 ea 0c             	shr    edx,0xc
    2eaa:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
    2ead:	c7 45 d0 14 00 00 00 	mov    DWORD PTR [ebp-0x30],0x14
    2eb4:	e9 be 00 00 00       	jmp    0x2f77
    2eb9:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
    2ebc:	ba 01 00 00 00       	mov    edx,0x1
    2ec1:	89 c1                	mov    ecx,eax
    2ec3:	d3 e2                	shl    edx,cl
    2ec5:	89 d0                	mov    eax,edx
    2ec7:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
    2eca:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    2ecd:	3b 45 cc             	cmp    eax,DWORD PTR [ebp-0x34]
    2ed0:	0f 82 9d 00 00 00    	jb     0x2f73
    2ed6:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    2ed9:	2b 45 cc             	sub    eax,DWORD PTR [ebp-0x34]
    2edc:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
    2edf:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
    2ee2:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
    2ee5:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
    2ee8:	68 bc 52 03 00       	push   0x352bc
    2eed:	e8 43 e2 ff ff       	call   0x1135
    2ef2:	83 c4 10             	add    esp,0x10
    2ef5:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    2ef8:	89 d0                	mov    eax,edx
    2efa:	01 c0                	add    eax,eax
    2efc:	01 d0                	add    eax,edx
    2efe:	c1 e0 02             	shl    eax,0x2
    2f01:	05 e4 64 03 00       	add    eax,0x364e4
    2f06:	8b 00                	mov    eax,DWORD PTR [eax]
    2f08:	85 c0                	test   eax,eax
    2f0a:	75 3c                	jne    0x2f48
    2f0c:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    2f0f:	83 ec 0c             	sub    esp,0xc
    2f12:	50                   	push   eax
    2f13:	e8 01 01 00 00       	call   0x3019
    2f18:	83 c4 10             	add    esp,0x10
    2f1b:	89 c1                	mov    ecx,eax
    2f1d:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    2f20:	89 d0                	mov    eax,edx
    2f22:	01 c0                	add    eax,eax
    2f24:	01 d0                	add    eax,edx
    2f26:	c1 e0 02             	shl    eax,0x2
    2f29:	05 e4 64 03 00       	add    eax,0x364e4
    2f2e:	89 08                	mov    DWORD PTR [eax],ecx
    2f30:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    2f33:	89 d0                	mov    eax,edx
    2f35:	01 c0                	add    eax,eax
    2f37:	01 d0                	add    eax,edx
    2f39:	c1 e0 02             	shl    eax,0x2
    2f3c:	05 e8 64 03 00       	add    eax,0x364e8
    2f41:	66 c7 00 01 00       	mov    WORD PTR [eax],0x1
    2f46:	eb 2b                	jmp    0x2f73
    2f48:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    2f4b:	89 d0                	mov    eax,edx
    2f4d:	01 c0                	add    eax,eax
    2f4f:	01 d0                	add    eax,edx
    2f51:	c1 e0 02             	shl    eax,0x2
    2f54:	05 e8 64 03 00       	add    eax,0x364e8
    2f59:	0f b7 00             	movzx  eax,WORD PTR [eax]
    2f5c:	8d 48 01             	lea    ecx,[eax+0x1]
    2f5f:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
    2f62:	89 d0                	mov    eax,edx
    2f64:	01 c0                	add    eax,eax
    2f66:	01 d0                	add    eax,edx
    2f68:	c1 e0 02             	shl    eax,0x2
    2f6b:	05 e8 64 03 00       	add    eax,0x364e8
    2f70:	66 89 08             	mov    WORD PTR [eax],cx
    2f73:	83 6d d0 01          	sub    DWORD PTR [ebp-0x30],0x1
    2f77:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
    2f7b:	7e 0a                	jle    0x2f87
    2f7d:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
    2f81:	0f 89 32 ff ff ff    	jns    0x2eb9
    2f87:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    2f8a:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    2f8d:	8d 65 f4             	lea    esp,[ebp-0xc]
    2f90:	5b                   	pop    ebx
    2f91:	5e                   	pop    esi
    2f92:	5f                   	pop    edi
    2f93:	5d                   	pop    ebp
    2f94:	c3                   	ret    
    2f95:	55                   	push   ebp
    2f96:	89 e5                	mov    ebp,esp
    2f98:	57                   	push   edi
    2f99:	56                   	push   esi
    2f9a:	53                   	push   ebx
    2f9b:	83 ec 1c             	sub    esp,0x1c
    2f9e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    2fa1:	89 d0                	mov    eax,edx
    2fa3:	c1 e0 02             	shl    eax,0x2
    2fa6:	01 d0                	add    eax,edx
    2fa8:	c1 e0 03             	shl    eax,0x3
    2fab:	05 c8 61 03 00       	add    eax,0x361c8
    2fb0:	8b 30                	mov    esi,DWORD PTR [eax]
    2fb2:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
    2fb5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    2fb8:	89 d0                	mov    eax,edx
    2fba:	c1 e0 02             	shl    eax,0x2
    2fbd:	01 d0                	add    eax,edx
    2fbf:	c1 e0 03             	shl    eax,0x3
    2fc2:	05 e4 61 03 00       	add    eax,0x361e4
    2fc7:	8b 00                	mov    eax,DWORD PTR [eax]
    2fc9:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
    2fcc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    2fcf:	89 d0                	mov    eax,edx
    2fd1:	c1 e0 02             	shl    eax,0x2
    2fd4:	01 d0                	add    eax,edx
    2fd6:	c1 e0 03             	shl    eax,0x3
    2fd9:	05 d8 61 03 00       	add    eax,0x361d8
    2fde:	8b 08                	mov    ecx,DWORD PTR [eax]
    2fe0:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
    2fe3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    2fe6:	89 d0                	mov    eax,edx
    2fe8:	c1 e0 02             	shl    eax,0x2
    2feb:	01 d0                	add    eax,edx
    2fed:	c1 e0 03             	shl    eax,0x3
    2ff0:	05 d0 61 03 00       	add    eax,0x361d0
    2ff5:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    2ff8:	8b 00                	mov    eax,DWORD PTR [eax]
    2ffa:	57                   	push   edi
    2ffb:	56                   	push   esi
    2ffc:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    2fff:	53                   	push   ebx
    3000:	51                   	push   ecx
    3001:	52                   	push   edx
    3002:	50                   	push   eax
    3003:	68 f4 52 03 00       	push   0x352f4
    3008:	e8 28 e1 ff ff       	call   0x1135
    300d:	83 c4 20             	add    esp,0x20
    3010:	90                   	nop
    3011:	8d 65 f4             	lea    esp,[ebp-0xc]
    3014:	5b                   	pop    ebx
    3015:	5e                   	pop    esi
    3016:	5f                   	pop    edi
    3017:	5d                   	pop    ebp
    3018:	c3                   	ret    
    3019:	55                   	push   ebp
    301a:	89 e5                	mov    ebp,esp
    301c:	53                   	push   ebx
    301d:	83 ec 14             	sub    esp,0x14
    3020:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    3027:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
    302e:	e9 be 00 00 00       	jmp    0x30f1
    3033:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    3036:	89 d0                	mov    eax,edx
    3038:	c1 e0 02             	shl    eax,0x2
    303b:	01 d0                	add    eax,edx
    303d:	c1 e0 03             	shl    eax,0x3
    3040:	05 c8 61 03 00       	add    eax,0x361c8
    3045:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    3048:	8b 00                	mov    eax,DWORD PTR [eax]
    304a:	89 c1                	mov    ecx,eax
    304c:	89 d3                	mov    ebx,edx
    304e:	89 d8                	mov    eax,ebx
    3050:	09 c8                	or     eax,ecx
    3052:	85 c0                	test   eax,eax
    3054:	75 0a                	jne    0x3060
    3056:	b8 ff ff ff ff       	mov    eax,0xffffffff
    305b:	e9 9b 00 00 00       	jmp    0x30fb
    3060:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    3063:	89 d0                	mov    eax,edx
    3065:	c1 e0 02             	shl    eax,0x2
    3068:	01 d0                	add    eax,edx
    306a:	c1 e0 03             	shl    eax,0x3
    306d:	05 d0 61 03 00       	add    eax,0x361d0
    3072:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    3075:	8b 00                	mov    eax,DWORD PTR [eax]
    3077:	0f ac d0 0c          	shrd   eax,edx,0xc
    307b:	c1 ea 0c             	shr    edx,0xc
    307e:	89 c2                	mov    edx,eax
    3080:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3083:	29 c2                	sub    edx,eax
    3085:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
    3088:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    308b:	89 d0                	mov    eax,edx
    308d:	c1 e0 02             	shl    eax,0x2
    3090:	01 d0                	add    eax,edx
    3092:	c1 e0 03             	shl    eax,0x3
    3095:	05 d8 61 03 00       	add    eax,0x361d8
    309a:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    309d:	8b 00                	mov    eax,DWORD PTR [eax]
    309f:	0f ac d0 0c          	shrd   eax,edx,0xc
    30a3:	c1 ea 0c             	shr    edx,0xc
    30a6:	89 c2                	mov    edx,eax
    30a8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    30ab:	29 c2                	sub    edx,eax
    30ad:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
    30b0:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
    30b3:	89 d0                	mov    eax,edx
    30b5:	c1 e0 02             	shl    eax,0x2
    30b8:	01 d0                	add    eax,edx
    30ba:	c1 e0 03             	shl    eax,0x3
    30bd:	05 c8 61 03 00       	add    eax,0x361c8
    30c2:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    30c5:	8b 00                	mov    eax,DWORD PTR [eax]
    30c7:	0f ac d0 0c          	shrd   eax,edx,0xc
    30cb:	c1 ea 0c             	shr    edx,0xc
    30ce:	89 c2                	mov    edx,eax
    30d0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    30d3:	01 d0                	add    eax,edx
    30d5:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    30d8:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
    30db:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
    30de:	73 0d                	jae    0x30ed
    30e0:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
    30e3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    30e6:	01 d0                	add    eax,edx
    30e8:	c1 e0 0c             	shl    eax,0xc
    30eb:	eb 0e                	jmp    0x30fb
    30ed:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
    30f1:	83 7d f0 13          	cmp    DWORD PTR [ebp-0x10],0x13
    30f5:	0f 8e 38 ff ff ff    	jle    0x3033
    30fb:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    30fe:	c9                   	leave  
    30ff:	c3                   	ret    
    3100:	55                   	push   ebp
    3101:	89 e5                	mov    ebp,esp
    3103:	57                   	push   edi
    3104:	56                   	push   esi
    3105:	53                   	push   ebx
    3106:	83 ec 14             	sub    esp,0x14
    3109:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
    3110:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
    3117:	e9 ab 00 00 00       	jmp    0x31c7
    311c:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    311f:	89 d0                	mov    eax,edx
    3121:	c1 e0 02             	shl    eax,0x2
    3124:	01 d0                	add    eax,edx
    3126:	c1 e0 03             	shl    eax,0x3
    3129:	05 d0 61 03 00       	add    eax,0x361d0
    312e:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    3131:	8b 00                	mov    eax,DWORD PTR [eax]
    3133:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
    3136:	bb 00 00 00 00       	mov    ebx,0x0
    313b:	39 c1                	cmp    ecx,eax
    313d:	19 d3                	sbb    ebx,edx
    313f:	72 5a                	jb     0x319b
    3141:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
    3144:	bb 00 00 00 00       	mov    ebx,0x0
    3149:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    314c:	89 d0                	mov    eax,edx
    314e:	c1 e0 02             	shl    eax,0x2
    3151:	01 d0                	add    eax,edx
    3153:	c1 e0 03             	shl    eax,0x3
    3156:	05 d8 61 03 00       	add    eax,0x361d8
    315b:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    315e:	8b 00                	mov    eax,DWORD PTR [eax]
    3160:	39 c8                	cmp    eax,ecx
    3162:	89 d0                	mov    eax,edx
    3164:	19 d8                	sbb    eax,ebx
    3166:	72 33                	jb     0x319b
    3168:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
    316b:	bb 00 00 00 00       	mov    ebx,0x0
    3170:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    3173:	89 d0                	mov    eax,edx
    3175:	c1 e0 02             	shl    eax,0x2
    3178:	01 d0                	add    eax,edx
    317a:	c1 e0 03             	shl    eax,0x3
    317d:	05 d0 61 03 00       	add    eax,0x361d0
    3182:	8b 30                	mov    esi,DWORD PTR [eax]
    3184:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
    3187:	89 c8                	mov    eax,ecx
    3189:	89 da                	mov    edx,ebx
    318b:	29 f0                	sub    eax,esi
    318d:	19 fa                	sbb    edx,edi
    318f:	c1 e0 0c             	shl    eax,0xc
    3192:	89 c2                	mov    edx,eax
    3194:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    3197:	01 d0                	add    eax,edx
    3199:	eb 36                	jmp    0x31d1
    319b:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
    319e:	89 d0                	mov    eax,edx
    31a0:	c1 e0 02             	shl    eax,0x2
    31a3:	01 d0                	add    eax,edx
    31a5:	c1 e0 03             	shl    eax,0x3
    31a8:	05 c8 61 03 00       	add    eax,0x361c8
    31ad:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
    31b0:	8b 00                	mov    eax,DWORD PTR [eax]
    31b2:	0f ac d0 0c          	shrd   eax,edx,0xc
    31b6:	c1 ea 0c             	shr    edx,0xc
    31b9:	89 c2                	mov    edx,eax
    31bb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
    31be:	01 d0                	add    eax,edx
    31c0:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
    31c3:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
    31c7:	83 7d e8 13          	cmp    DWORD PTR [ebp-0x18],0x13
    31cb:	0f 8e 4b ff ff ff    	jle    0x311c
    31d1:	83 c4 14             	add    esp,0x14
    31d4:	5b                   	pop    ebx
    31d5:	5e                   	pop    esi
    31d6:	5f                   	pop    edi
    31d7:	5d                   	pop    ebp
    31d8:	c3                   	ret    
    31d9:	55                   	push   ebp
    31da:	89 e5                	mov    ebp,esp
    31dc:	83 ec 08             	sub    esp,0x8
    31df:	83 ec 04             	sub    esp,0x4
    31e2:	6a 10                	push   0x10
    31e4:	6a 08                	push   0x8
    31e6:	68 d4 58 03 00       	push   0x358d4
    31eb:	e8 50 ce ff ff       	call   0x40
    31f0:	83 c4 10             	add    esp,0x10
    31f3:	90                   	nop
    31f4:	c9                   	leave  
    31f5:	c3                   	ret    
    31f6:	55                   	push   ebp
    31f7:	89 e5                	mov    ebp,esp
    31f9:	83 ec 08             	sub    esp,0x8
    31fc:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
    31ff:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    3202:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
    3206:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
    3209:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    320c:	89 c2                	mov    edx,eax
    320e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3211:	66 89 14 c5 e0 65 03 	mov    WORD PTR [eax*8+0x365e0],dx
    3218:	00 
    3219:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    321c:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
    3220:	66 89 14 c5 e2 65 03 	mov    WORD PTR [eax*8+0x365e2],dx
    3227:	00 
    3228:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    322b:	c6 04 c5 e4 65 03 00 	mov    BYTE PTR [eax*8+0x365e4],0x0
    3232:	00 
    3233:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    3236:	0f b6 55 f8          	movzx  edx,BYTE PTR [ebp-0x8]
    323a:	88 14 c5 e5 65 03 00 	mov    BYTE PTR [eax*8+0x365e5],dl
    3241:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    3244:	c1 e8 10             	shr    eax,0x10
    3247:	89 c2                	mov    edx,eax
    3249:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    324c:	66 89 14 c5 e6 65 03 	mov    WORD PTR [eax*8+0x365e6],dx
    3253:	00 
    3254:	90                   	nop
    3255:	c9                   	leave  
    3256:	c3                   	ret    
    3257:	55                   	push   ebp
    3258:	89 e5                	mov    ebp,esp
    325a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    325d:	0f b6 04 c5 e5 65 03 	movzx  eax,BYTE PTR [eax*8+0x365e5]
    3264:	00 
    3265:	83 c8 80             	or     eax,0xffffff80
    3268:	89 c2                	mov    edx,eax
    326a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    326d:	88 14 c5 e5 65 03 00 	mov    BYTE PTR [eax*8+0x365e5],dl
    3274:	90                   	nop
    3275:	5d                   	pop    ebp
    3276:	c3                   	ret    
    3277:	55                   	push   ebp
    3278:	89 e5                	mov    ebp,esp
    327a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    327d:	0f b6 04 c5 e5 65 03 	movzx  eax,BYTE PTR [eax*8+0x365e5]
    3284:	00 
    3285:	83 e0 7f             	and    eax,0x7f
    3288:	89 c2                	mov    edx,eax
    328a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    328d:	88 14 c5 e5 65 03 00 	mov    BYTE PTR [eax*8+0x365e5],dl
    3294:	90                   	nop
    3295:	5d                   	pop    ebp
    3296:	c3                   	ret    
    3297:	55                   	push   ebp
    3298:	89 e5                	mov    ebp,esp
    329a:	83 ec 08             	sub    esp,0x8
    329d:	83 ec 0c             	sub    esp,0xc
    32a0:	68 dc 58 03 00       	push   0x358dc
    32a5:	e8 be cd ff ff       	call   0x68
    32aa:	83 c4 10             	add    esp,0x10
    32ad:	90                   	nop
    32ae:	c9                   	leave  
    32af:	c3                   	ret    
    32b0:	55                   	push   ebp
    32b1:	89 e5                	mov    ebp,esp
    32b3:	83 ec 18             	sub    esp,0x18
    32b6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    32b9:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    32bc:	83 e8 20             	sub    eax,0x20
    32bf:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
    32c2:	e8 3b 19 00 00       	call   0x4c02
    32c7:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
    32ca:	e8 db 18 00 00       	call   0x4baa
    32cf:	88 45 f2             	mov    BYTE PTR [ebp-0xe],al
    32d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    32d5:	8b 04 85 e0 6d 03 00 	mov    eax,DWORD PTR [eax*4+0x36de0]
    32dc:	85 c0                	test   eax,eax
    32de:	74 17                	je     0x32f7
    32e0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    32e3:	8b 04 85 e0 6d 03 00 	mov    eax,DWORD PTR [eax*4+0x36de0]
    32ea:	83 ec 0c             	sub    esp,0xc
    32ed:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    32f0:	ff d0                	call   eax
    32f2:	83 c4 10             	add    esp,0x10
    32f5:	eb 1a                	jmp    0x3311
    32f7:	0f b6 55 f2          	movzx  edx,BYTE PTR [ebp-0xe]
    32fb:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
    32ff:	52                   	push   edx
    3300:	50                   	push   eax
    3301:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    3304:	68 3c 53 03 00       	push   0x3533c
    3309:	e8 27 de ff ff       	call   0x1135
    330e:	83 c4 10             	add    esp,0x10
    3311:	83 ec 0c             	sub    esp,0xc
    3314:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    3317:	e8 7a 17 00 00       	call   0x4a96
    331c:	83 c4 10             	add    esp,0x10
    331f:	90                   	nop
    3320:	c9                   	leave  
    3321:	c3                   	ret    
    3322:	55                   	push   ebp
    3323:	89 e5                	mov    ebp,esp
    3325:	83 ec 18             	sub    esp,0x18
    3328:	83 ec 08             	sub    esp,0x8
    332b:	6a 28                	push   0x28
    332d:	6a 20                	push   0x20
    332f:	e8 70 16 00 00       	call   0x49a4
    3334:	83 c4 10             	add    esp,0x10
    3337:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    333e:	eb 1b                	jmp    0x335b
    3340:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
    3343:	83 c0 20             	add    eax,0x20
    3346:	83 ec 08             	sub    esp,0x8
    3349:	68 b0 32 03 00       	push   0x332b0
    334e:	50                   	push   eax
    334f:	e8 e5 14 00 00       	call   0x4839
    3354:	83 c4 10             	add    esp,0x10
    3357:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    335b:	83 7d f4 0f          	cmp    DWORD PTR [ebp-0xc],0xf
    335f:	7e df                	jle    0x3340
    3361:	e8 d6 cc ff ff       	call   0x3c
    3366:	90                   	nop
    3367:	c9                   	leave  
    3368:	c3                   	ret    
    3369:	55                   	push   ebp
    336a:	89 e5                	mov    ebp,esp
    336c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    336f:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    3372:	89 14 85 e0 6d 03 00 	mov    DWORD PTR [eax*4+0x36de0],edx
    3379:	90                   	nop
    337a:	5d                   	pop    ebp
    337b:	c3                   	ret    
    337c:	55                   	push   ebp
    337d:	89 e5                	mov    ebp,esp
    337f:	83 ec 18             	sub    esp,0x18
    3382:	6a 0e                	push   0xe
    3384:	6a 08                	push   0x8
    3386:	68 78 00 03 00       	push   0x30078
    338b:	6a 00                	push   0x0
    338d:	e8 64 fe ff ff       	call   0x31f6
    3392:	83 c4 10             	add    esp,0x10
    3395:	6a 0e                	push   0xe
    3397:	6a 08                	push   0x8
    3399:	68 81 00 03 00       	push   0x30081
    339e:	6a 01                	push   0x1
    33a0:	e8 51 fe ff ff       	call   0x31f6
    33a5:	83 c4 10             	add    esp,0x10
    33a8:	6a 0e                	push   0xe
    33aa:	6a 08                	push   0x8
    33ac:	68 8a 00 03 00       	push   0x3008a
    33b1:	6a 02                	push   0x2
    33b3:	e8 3e fe ff ff       	call   0x31f6
    33b8:	83 c4 10             	add    esp,0x10
    33bb:	6a 0e                	push   0xe
    33bd:	6a 08                	push   0x8
    33bf:	68 93 00 03 00       	push   0x30093
    33c4:	6a 03                	push   0x3
    33c6:	e8 2b fe ff ff       	call   0x31f6
    33cb:	83 c4 10             	add    esp,0x10
    33ce:	6a 0e                	push   0xe
    33d0:	6a 08                	push   0x8
    33d2:	68 9c 00 03 00       	push   0x3009c
    33d7:	6a 04                	push   0x4
    33d9:	e8 18 fe ff ff       	call   0x31f6
    33de:	83 c4 10             	add    esp,0x10
    33e1:	6a 0e                	push   0xe
    33e3:	6a 08                	push   0x8
    33e5:	68 a5 00 03 00       	push   0x300a5
    33ea:	6a 05                	push   0x5
    33ec:	e8 05 fe ff ff       	call   0x31f6
    33f1:	83 c4 10             	add    esp,0x10
    33f4:	6a 0e                	push   0xe
    33f6:	6a 08                	push   0x8
    33f8:	68 ae 00 03 00       	push   0x300ae
    33fd:	6a 06                	push   0x6
    33ff:	e8 f2 fd ff ff       	call   0x31f6
    3404:	83 c4 10             	add    esp,0x10
    3407:	6a 0e                	push   0xe
    3409:	6a 08                	push   0x8
    340b:	68 b7 00 03 00       	push   0x300b7
    3410:	6a 07                	push   0x7
    3412:	e8 df fd ff ff       	call   0x31f6
    3417:	83 c4 10             	add    esp,0x10
    341a:	6a 0e                	push   0xe
    341c:	6a 08                	push   0x8
    341e:	68 c0 00 03 00       	push   0x300c0
    3423:	6a 08                	push   0x8
    3425:	e8 cc fd ff ff       	call   0x31f6
    342a:	83 c4 10             	add    esp,0x10
    342d:	6a 0e                	push   0xe
    342f:	6a 08                	push   0x8
    3431:	68 c7 00 03 00       	push   0x300c7
    3436:	6a 09                	push   0x9
    3438:	e8 b9 fd ff ff       	call   0x31f6
    343d:	83 c4 10             	add    esp,0x10
    3440:	6a 0e                	push   0xe
    3442:	6a 08                	push   0x8
    3444:	68 d0 00 03 00       	push   0x300d0
    3449:	6a 0a                	push   0xa
    344b:	e8 a6 fd ff ff       	call   0x31f6
    3450:	83 c4 10             	add    esp,0x10
    3453:	6a 0e                	push   0xe
    3455:	6a 08                	push   0x8
    3457:	68 d7 00 03 00       	push   0x300d7
    345c:	6a 0b                	push   0xb
    345e:	e8 93 fd ff ff       	call   0x31f6
    3463:	83 c4 10             	add    esp,0x10
    3466:	6a 0e                	push   0xe
    3468:	6a 08                	push   0x8
    346a:	68 de 00 03 00       	push   0x300de
    346f:	6a 0c                	push   0xc
    3471:	e8 80 fd ff ff       	call   0x31f6
    3476:	83 c4 10             	add    esp,0x10
    3479:	6a 0e                	push   0xe
    347b:	6a 08                	push   0x8
    347d:	68 e5 00 03 00       	push   0x300e5
    3482:	6a 0d                	push   0xd
    3484:	e8 6d fd ff ff       	call   0x31f6
    3489:	83 c4 10             	add    esp,0x10
    348c:	6a 0e                	push   0xe
    348e:	6a 08                	push   0x8
    3490:	68 ec 00 03 00       	push   0x300ec
    3495:	6a 0e                	push   0xe
    3497:	e8 5a fd ff ff       	call   0x31f6
    349c:	83 c4 10             	add    esp,0x10
    349f:	6a 0e                	push   0xe
    34a1:	6a 08                	push   0x8
    34a3:	68 f3 00 03 00       	push   0x300f3
    34a8:	6a 0f                	push   0xf
    34aa:	e8 47 fd ff ff       	call   0x31f6
    34af:	83 c4 10             	add    esp,0x10
    34b2:	6a 0e                	push   0xe
    34b4:	6a 08                	push   0x8
    34b6:	68 fc 00 03 00       	push   0x300fc
    34bb:	6a 10                	push   0x10
    34bd:	e8 34 fd ff ff       	call   0x31f6
    34c2:	83 c4 10             	add    esp,0x10
    34c5:	6a 0e                	push   0xe
    34c7:	6a 08                	push   0x8
    34c9:	68 05 01 03 00       	push   0x30105
    34ce:	6a 11                	push   0x11
    34d0:	e8 21 fd ff ff       	call   0x31f6
    34d5:	83 c4 10             	add    esp,0x10
    34d8:	6a 0e                	push   0xe
    34da:	6a 08                	push   0x8
    34dc:	68 0c 01 03 00       	push   0x3010c
    34e1:	6a 12                	push   0x12
    34e3:	e8 0e fd ff ff       	call   0x31f6
    34e8:	83 c4 10             	add    esp,0x10
    34eb:	6a 0e                	push   0xe
    34ed:	6a 08                	push   0x8
    34ef:	68 15 01 03 00       	push   0x30115
    34f4:	6a 13                	push   0x13
    34f6:	e8 fb fc ff ff       	call   0x31f6
    34fb:	83 c4 10             	add    esp,0x10
    34fe:	6a 0e                	push   0xe
    3500:	6a 08                	push   0x8
    3502:	68 1e 01 03 00       	push   0x3011e
    3507:	6a 14                	push   0x14
    3509:	e8 e8 fc ff ff       	call   0x31f6
    350e:	83 c4 10             	add    esp,0x10
    3511:	6a 0e                	push   0xe
    3513:	6a 08                	push   0x8
    3515:	68 27 01 03 00       	push   0x30127
    351a:	6a 15                	push   0x15
    351c:	e8 d5 fc ff ff       	call   0x31f6
    3521:	83 c4 10             	add    esp,0x10
    3524:	6a 0e                	push   0xe
    3526:	6a 08                	push   0x8
    3528:	68 2e 01 03 00       	push   0x3012e
    352d:	6a 16                	push   0x16
    352f:	e8 c2 fc ff ff       	call   0x31f6
    3534:	83 c4 10             	add    esp,0x10
    3537:	6a 0e                	push   0xe
    3539:	6a 08                	push   0x8
    353b:	68 37 01 03 00       	push   0x30137
    3540:	6a 17                	push   0x17
    3542:	e8 af fc ff ff       	call   0x31f6
    3547:	83 c4 10             	add    esp,0x10
    354a:	6a 0e                	push   0xe
    354c:	6a 08                	push   0x8
    354e:	68 40 01 03 00       	push   0x30140
    3553:	6a 18                	push   0x18
    3555:	e8 9c fc ff ff       	call   0x31f6
    355a:	83 c4 10             	add    esp,0x10
    355d:	6a 0e                	push   0xe
    355f:	6a 08                	push   0x8
    3561:	68 49 01 03 00       	push   0x30149
    3566:	6a 19                	push   0x19
    3568:	e8 89 fc ff ff       	call   0x31f6
    356d:	83 c4 10             	add    esp,0x10
    3570:	6a 0e                	push   0xe
    3572:	6a 08                	push   0x8
    3574:	68 52 01 03 00       	push   0x30152
    3579:	6a 1a                	push   0x1a
    357b:	e8 76 fc ff ff       	call   0x31f6
    3580:	83 c4 10             	add    esp,0x10
    3583:	6a 0e                	push   0xe
    3585:	6a 08                	push   0x8
    3587:	68 5b 01 03 00       	push   0x3015b
    358c:	6a 1b                	push   0x1b
    358e:	e8 63 fc ff ff       	call   0x31f6
    3593:	83 c4 10             	add    esp,0x10
    3596:	6a 0e                	push   0xe
    3598:	6a 08                	push   0x8
    359a:	68 64 01 03 00       	push   0x30164
    359f:	6a 1c                	push   0x1c
    35a1:	e8 50 fc ff ff       	call   0x31f6
    35a6:	83 c4 10             	add    esp,0x10
    35a9:	6a 0e                	push   0xe
    35ab:	6a 08                	push   0x8
    35ad:	68 6d 01 03 00       	push   0x3016d
    35b2:	6a 1d                	push   0x1d
    35b4:	e8 3d fc ff ff       	call   0x31f6
    35b9:	83 c4 10             	add    esp,0x10
    35bc:	6a 0e                	push   0xe
    35be:	6a 08                	push   0x8
    35c0:	68 74 01 03 00       	push   0x30174
    35c5:	6a 1e                	push   0x1e
    35c7:	e8 2a fc ff ff       	call   0x31f6
    35cc:	83 c4 10             	add    esp,0x10
    35cf:	6a 0e                	push   0xe
    35d1:	6a 08                	push   0x8
    35d3:	68 7b 01 03 00       	push   0x3017b
    35d8:	6a 1f                	push   0x1f
    35da:	e8 17 fc ff ff       	call   0x31f6
    35df:	83 c4 10             	add    esp,0x10
    35e2:	6a 0e                	push   0xe
    35e4:	6a 08                	push   0x8
    35e6:	68 84 01 03 00       	push   0x30184
    35eb:	6a 20                	push   0x20
    35ed:	e8 04 fc ff ff       	call   0x31f6
    35f2:	83 c4 10             	add    esp,0x10
    35f5:	6a 0e                	push   0xe
    35f7:	6a 08                	push   0x8
    35f9:	68 8d 01 03 00       	push   0x3018d
    35fe:	6a 21                	push   0x21
    3600:	e8 f1 fb ff ff       	call   0x31f6
    3605:	83 c4 10             	add    esp,0x10
    3608:	6a 0e                	push   0xe
    360a:	6a 08                	push   0x8
    360c:	68 96 01 03 00       	push   0x30196
    3611:	6a 22                	push   0x22
    3613:	e8 de fb ff ff       	call   0x31f6
    3618:	83 c4 10             	add    esp,0x10
    361b:	6a 0e                	push   0xe
    361d:	6a 08                	push   0x8
    361f:	68 9f 01 03 00       	push   0x3019f
    3624:	6a 23                	push   0x23
    3626:	e8 cb fb ff ff       	call   0x31f6
    362b:	83 c4 10             	add    esp,0x10
    362e:	6a 0e                	push   0xe
    3630:	6a 08                	push   0x8
    3632:	68 a8 01 03 00       	push   0x301a8
    3637:	6a 24                	push   0x24
    3639:	e8 b8 fb ff ff       	call   0x31f6
    363e:	83 c4 10             	add    esp,0x10
    3641:	6a 0e                	push   0xe
    3643:	6a 08                	push   0x8
    3645:	68 b1 01 03 00       	push   0x301b1
    364a:	6a 25                	push   0x25
    364c:	e8 a5 fb ff ff       	call   0x31f6
    3651:	83 c4 10             	add    esp,0x10
    3654:	6a 0e                	push   0xe
    3656:	6a 08                	push   0x8
    3658:	68 ba 01 03 00       	push   0x301ba
    365d:	6a 26                	push   0x26
    365f:	e8 92 fb ff ff       	call   0x31f6
    3664:	83 c4 10             	add    esp,0x10
    3667:	6a 0e                	push   0xe
    3669:	6a 08                	push   0x8
    366b:	68 c3 01 03 00       	push   0x301c3
    3670:	6a 27                	push   0x27
    3672:	e8 7f fb ff ff       	call   0x31f6
    3677:	83 c4 10             	add    esp,0x10
    367a:	6a 0e                	push   0xe
    367c:	6a 08                	push   0x8
    367e:	68 cc 01 03 00       	push   0x301cc
    3683:	6a 28                	push   0x28
    3685:	e8 6c fb ff ff       	call   0x31f6
    368a:	83 c4 10             	add    esp,0x10
    368d:	6a 0e                	push   0xe
    368f:	6a 08                	push   0x8
    3691:	68 d5 01 03 00       	push   0x301d5
    3696:	6a 29                	push   0x29
    3698:	e8 59 fb ff ff       	call   0x31f6
    369d:	83 c4 10             	add    esp,0x10
    36a0:	6a 0e                	push   0xe
    36a2:	6a 08                	push   0x8
    36a4:	68 de 01 03 00       	push   0x301de
    36a9:	6a 2a                	push   0x2a
    36ab:	e8 46 fb ff ff       	call   0x31f6
    36b0:	83 c4 10             	add    esp,0x10
    36b3:	6a 0e                	push   0xe
    36b5:	6a 08                	push   0x8
    36b7:	68 e7 01 03 00       	push   0x301e7
    36bc:	6a 2b                	push   0x2b
    36be:	e8 33 fb ff ff       	call   0x31f6
    36c3:	83 c4 10             	add    esp,0x10
    36c6:	6a 0e                	push   0xe
    36c8:	6a 08                	push   0x8
    36ca:	68 f0 01 03 00       	push   0x301f0
    36cf:	6a 2c                	push   0x2c
    36d1:	e8 20 fb ff ff       	call   0x31f6
    36d6:	83 c4 10             	add    esp,0x10
    36d9:	6a 0e                	push   0xe
    36db:	6a 08                	push   0x8
    36dd:	68 f9 01 03 00       	push   0x301f9
    36e2:	6a 2d                	push   0x2d
    36e4:	e8 0d fb ff ff       	call   0x31f6
    36e9:	83 c4 10             	add    esp,0x10
    36ec:	6a 0e                	push   0xe
    36ee:	6a 08                	push   0x8
    36f0:	68 02 02 03 00       	push   0x30202
    36f5:	6a 2e                	push   0x2e
    36f7:	e8 fa fa ff ff       	call   0x31f6
    36fc:	83 c4 10             	add    esp,0x10
    36ff:	6a 0e                	push   0xe
    3701:	6a 08                	push   0x8
    3703:	68 0b 02 03 00       	push   0x3020b
    3708:	6a 2f                	push   0x2f
    370a:	e8 e7 fa ff ff       	call   0x31f6
    370f:	83 c4 10             	add    esp,0x10
    3712:	6a 0e                	push   0xe
    3714:	6a 08                	push   0x8
    3716:	68 14 02 03 00       	push   0x30214
    371b:	6a 30                	push   0x30
    371d:	e8 d4 fa ff ff       	call   0x31f6
    3722:	83 c4 10             	add    esp,0x10
    3725:	6a 0e                	push   0xe
    3727:	6a 08                	push   0x8
    3729:	68 1d 02 03 00       	push   0x3021d
    372e:	6a 31                	push   0x31
    3730:	e8 c1 fa ff ff       	call   0x31f6
    3735:	83 c4 10             	add    esp,0x10
    3738:	6a 0e                	push   0xe
    373a:	6a 08                	push   0x8
    373c:	68 26 02 03 00       	push   0x30226
    3741:	6a 32                	push   0x32
    3743:	e8 ae fa ff ff       	call   0x31f6
    3748:	83 c4 10             	add    esp,0x10
    374b:	6a 0e                	push   0xe
    374d:	6a 08                	push   0x8
    374f:	68 2f 02 03 00       	push   0x3022f
    3754:	6a 33                	push   0x33
    3756:	e8 9b fa ff ff       	call   0x31f6
    375b:	83 c4 10             	add    esp,0x10
    375e:	6a 0e                	push   0xe
    3760:	6a 08                	push   0x8
    3762:	68 38 02 03 00       	push   0x30238
    3767:	6a 34                	push   0x34
    3769:	e8 88 fa ff ff       	call   0x31f6
    376e:	83 c4 10             	add    esp,0x10
    3771:	6a 0e                	push   0xe
    3773:	6a 08                	push   0x8
    3775:	68 41 02 03 00       	push   0x30241
    377a:	6a 35                	push   0x35
    377c:	e8 75 fa ff ff       	call   0x31f6
    3781:	83 c4 10             	add    esp,0x10
    3784:	6a 0e                	push   0xe
    3786:	6a 08                	push   0x8
    3788:	68 4a 02 03 00       	push   0x3024a
    378d:	6a 36                	push   0x36
    378f:	e8 62 fa ff ff       	call   0x31f6
    3794:	83 c4 10             	add    esp,0x10
    3797:	6a 0e                	push   0xe
    3799:	6a 08                	push   0x8
    379b:	68 53 02 03 00       	push   0x30253
    37a0:	6a 37                	push   0x37
    37a2:	e8 4f fa ff ff       	call   0x31f6
    37a7:	83 c4 10             	add    esp,0x10
    37aa:	6a 0e                	push   0xe
    37ac:	6a 08                	push   0x8
    37ae:	68 5c 02 03 00       	push   0x3025c
    37b3:	6a 38                	push   0x38
    37b5:	e8 3c fa ff ff       	call   0x31f6
    37ba:	83 c4 10             	add    esp,0x10
    37bd:	6a 0e                	push   0xe
    37bf:	6a 08                	push   0x8
    37c1:	68 65 02 03 00       	push   0x30265
    37c6:	6a 39                	push   0x39
    37c8:	e8 29 fa ff ff       	call   0x31f6
    37cd:	83 c4 10             	add    esp,0x10
    37d0:	6a 0e                	push   0xe
    37d2:	6a 08                	push   0x8
    37d4:	68 6e 02 03 00       	push   0x3026e
    37d9:	6a 3a                	push   0x3a
    37db:	e8 16 fa ff ff       	call   0x31f6
    37e0:	83 c4 10             	add    esp,0x10
    37e3:	6a 0e                	push   0xe
    37e5:	6a 08                	push   0x8
    37e7:	68 77 02 03 00       	push   0x30277
    37ec:	6a 3b                	push   0x3b
    37ee:	e8 03 fa ff ff       	call   0x31f6
    37f3:	83 c4 10             	add    esp,0x10
    37f6:	6a 0e                	push   0xe
    37f8:	6a 08                	push   0x8
    37fa:	68 80 02 03 00       	push   0x30280
    37ff:	6a 3c                	push   0x3c
    3801:	e8 f0 f9 ff ff       	call   0x31f6
    3806:	83 c4 10             	add    esp,0x10
    3809:	6a 0e                	push   0xe
    380b:	6a 08                	push   0x8
    380d:	68 89 02 03 00       	push   0x30289
    3812:	6a 3d                	push   0x3d
    3814:	e8 dd f9 ff ff       	call   0x31f6
    3819:	83 c4 10             	add    esp,0x10
    381c:	6a 0e                	push   0xe
    381e:	6a 08                	push   0x8
    3820:	68 92 02 03 00       	push   0x30292
    3825:	6a 3e                	push   0x3e
    3827:	e8 ca f9 ff ff       	call   0x31f6
    382c:	83 c4 10             	add    esp,0x10
    382f:	6a 0e                	push   0xe
    3831:	6a 08                	push   0x8
    3833:	68 9b 02 03 00       	push   0x3029b
    3838:	6a 3f                	push   0x3f
    383a:	e8 b7 f9 ff ff       	call   0x31f6
    383f:	83 c4 10             	add    esp,0x10
    3842:	6a 0e                	push   0xe
    3844:	6a 08                	push   0x8
    3846:	68 a4 02 03 00       	push   0x302a4
    384b:	6a 40                	push   0x40
    384d:	e8 a4 f9 ff ff       	call   0x31f6
    3852:	83 c4 10             	add    esp,0x10
    3855:	6a 0e                	push   0xe
    3857:	6a 08                	push   0x8
    3859:	68 ad 02 03 00       	push   0x302ad
    385e:	6a 41                	push   0x41
    3860:	e8 91 f9 ff ff       	call   0x31f6
    3865:	83 c4 10             	add    esp,0x10
    3868:	6a 0e                	push   0xe
    386a:	6a 08                	push   0x8
    386c:	68 b6 02 03 00       	push   0x302b6
    3871:	6a 42                	push   0x42
    3873:	e8 7e f9 ff ff       	call   0x31f6
    3878:	83 c4 10             	add    esp,0x10
    387b:	6a 0e                	push   0xe
    387d:	6a 08                	push   0x8
    387f:	68 bf 02 03 00       	push   0x302bf
    3884:	6a 43                	push   0x43
    3886:	e8 6b f9 ff ff       	call   0x31f6
    388b:	83 c4 10             	add    esp,0x10
    388e:	6a 0e                	push   0xe
    3890:	6a 08                	push   0x8
    3892:	68 c8 02 03 00       	push   0x302c8
    3897:	6a 44                	push   0x44
    3899:	e8 58 f9 ff ff       	call   0x31f6
    389e:	83 c4 10             	add    esp,0x10
    38a1:	6a 0e                	push   0xe
    38a3:	6a 08                	push   0x8
    38a5:	68 d1 02 03 00       	push   0x302d1
    38aa:	6a 45                	push   0x45
    38ac:	e8 45 f9 ff ff       	call   0x31f6
    38b1:	83 c4 10             	add    esp,0x10
    38b4:	6a 0e                	push   0xe
    38b6:	6a 08                	push   0x8
    38b8:	68 da 02 03 00       	push   0x302da
    38bd:	6a 46                	push   0x46
    38bf:	e8 32 f9 ff ff       	call   0x31f6
    38c4:	83 c4 10             	add    esp,0x10
    38c7:	6a 0e                	push   0xe
    38c9:	6a 08                	push   0x8
    38cb:	68 e3 02 03 00       	push   0x302e3
    38d0:	6a 47                	push   0x47
    38d2:	e8 1f f9 ff ff       	call   0x31f6
    38d7:	83 c4 10             	add    esp,0x10
    38da:	6a 0e                	push   0xe
    38dc:	6a 08                	push   0x8
    38de:	68 ec 02 03 00       	push   0x302ec
    38e3:	6a 48                	push   0x48
    38e5:	e8 0c f9 ff ff       	call   0x31f6
    38ea:	83 c4 10             	add    esp,0x10
    38ed:	6a 0e                	push   0xe
    38ef:	6a 08                	push   0x8
    38f1:	68 f5 02 03 00       	push   0x302f5
    38f6:	6a 49                	push   0x49
    38f8:	e8 f9 f8 ff ff       	call   0x31f6
    38fd:	83 c4 10             	add    esp,0x10
    3900:	6a 0e                	push   0xe
    3902:	6a 08                	push   0x8
    3904:	68 fe 02 03 00       	push   0x302fe
    3909:	6a 4a                	push   0x4a
    390b:	e8 e6 f8 ff ff       	call   0x31f6
    3910:	83 c4 10             	add    esp,0x10
    3913:	6a 0e                	push   0xe
    3915:	6a 08                	push   0x8
    3917:	68 07 03 03 00       	push   0x30307
    391c:	6a 4b                	push   0x4b
    391e:	e8 d3 f8 ff ff       	call   0x31f6
    3923:	83 c4 10             	add    esp,0x10
    3926:	6a 0e                	push   0xe
    3928:	6a 08                	push   0x8
    392a:	68 10 03 03 00       	push   0x30310
    392f:	6a 4c                	push   0x4c
    3931:	e8 c0 f8 ff ff       	call   0x31f6
    3936:	83 c4 10             	add    esp,0x10
    3939:	6a 0e                	push   0xe
    393b:	6a 08                	push   0x8
    393d:	68 19 03 03 00       	push   0x30319
    3942:	6a 4d                	push   0x4d
    3944:	e8 ad f8 ff ff       	call   0x31f6
    3949:	83 c4 10             	add    esp,0x10
    394c:	6a 0e                	push   0xe
    394e:	6a 08                	push   0x8
    3950:	68 22 03 03 00       	push   0x30322
    3955:	6a 4e                	push   0x4e
    3957:	e8 9a f8 ff ff       	call   0x31f6
    395c:	83 c4 10             	add    esp,0x10
    395f:	6a 0e                	push   0xe
    3961:	6a 08                	push   0x8
    3963:	68 2b 03 03 00       	push   0x3032b
    3968:	6a 4f                	push   0x4f
    396a:	e8 87 f8 ff ff       	call   0x31f6
    396f:	83 c4 10             	add    esp,0x10
    3972:	6a 0e                	push   0xe
    3974:	6a 08                	push   0x8
    3976:	68 34 03 03 00       	push   0x30334
    397b:	6a 50                	push   0x50
    397d:	e8 74 f8 ff ff       	call   0x31f6
    3982:	83 c4 10             	add    esp,0x10
    3985:	6a 0e                	push   0xe
    3987:	6a 08                	push   0x8
    3989:	68 3d 03 03 00       	push   0x3033d
    398e:	6a 51                	push   0x51
    3990:	e8 61 f8 ff ff       	call   0x31f6
    3995:	83 c4 10             	add    esp,0x10
    3998:	6a 0e                	push   0xe
    399a:	6a 08                	push   0x8
    399c:	68 46 03 03 00       	push   0x30346
    39a1:	6a 52                	push   0x52
    39a3:	e8 4e f8 ff ff       	call   0x31f6
    39a8:	83 c4 10             	add    esp,0x10
    39ab:	6a 0e                	push   0xe
    39ad:	6a 08                	push   0x8
    39af:	68 4f 03 03 00       	push   0x3034f
    39b4:	6a 53                	push   0x53
    39b6:	e8 3b f8 ff ff       	call   0x31f6
    39bb:	83 c4 10             	add    esp,0x10
    39be:	6a 0e                	push   0xe
    39c0:	6a 08                	push   0x8
    39c2:	68 58 03 03 00       	push   0x30358
    39c7:	6a 54                	push   0x54
    39c9:	e8 28 f8 ff ff       	call   0x31f6
    39ce:	83 c4 10             	add    esp,0x10
    39d1:	6a 0e                	push   0xe
    39d3:	6a 08                	push   0x8
    39d5:	68 61 03 03 00       	push   0x30361
    39da:	6a 55                	push   0x55
    39dc:	e8 15 f8 ff ff       	call   0x31f6
    39e1:	83 c4 10             	add    esp,0x10
    39e4:	6a 0e                	push   0xe
    39e6:	6a 08                	push   0x8
    39e8:	68 6a 03 03 00       	push   0x3036a
    39ed:	6a 56                	push   0x56
    39ef:	e8 02 f8 ff ff       	call   0x31f6
    39f4:	83 c4 10             	add    esp,0x10
    39f7:	6a 0e                	push   0xe
    39f9:	6a 08                	push   0x8
    39fb:	68 73 03 03 00       	push   0x30373
    3a00:	6a 57                	push   0x57
    3a02:	e8 ef f7 ff ff       	call   0x31f6
    3a07:	83 c4 10             	add    esp,0x10
    3a0a:	6a 0e                	push   0xe
    3a0c:	6a 08                	push   0x8
    3a0e:	68 7c 03 03 00       	push   0x3037c
    3a13:	6a 58                	push   0x58
    3a15:	e8 dc f7 ff ff       	call   0x31f6
    3a1a:	83 c4 10             	add    esp,0x10
    3a1d:	6a 0e                	push   0xe
    3a1f:	6a 08                	push   0x8
    3a21:	68 85 03 03 00       	push   0x30385
    3a26:	6a 59                	push   0x59
    3a28:	e8 c9 f7 ff ff       	call   0x31f6
    3a2d:	83 c4 10             	add    esp,0x10
    3a30:	6a 0e                	push   0xe
    3a32:	6a 08                	push   0x8
    3a34:	68 8e 03 03 00       	push   0x3038e
    3a39:	6a 5a                	push   0x5a
    3a3b:	e8 b6 f7 ff ff       	call   0x31f6
    3a40:	83 c4 10             	add    esp,0x10
    3a43:	6a 0e                	push   0xe
    3a45:	6a 08                	push   0x8
    3a47:	68 97 03 03 00       	push   0x30397
    3a4c:	6a 5b                	push   0x5b
    3a4e:	e8 a3 f7 ff ff       	call   0x31f6
    3a53:	83 c4 10             	add    esp,0x10
    3a56:	6a 0e                	push   0xe
    3a58:	6a 08                	push   0x8
    3a5a:	68 a0 03 03 00       	push   0x303a0
    3a5f:	6a 5c                	push   0x5c
    3a61:	e8 90 f7 ff ff       	call   0x31f6
    3a66:	83 c4 10             	add    esp,0x10
    3a69:	6a 0e                	push   0xe
    3a6b:	6a 08                	push   0x8
    3a6d:	68 a9 03 03 00       	push   0x303a9
    3a72:	6a 5d                	push   0x5d
    3a74:	e8 7d f7 ff ff       	call   0x31f6
    3a79:	83 c4 10             	add    esp,0x10
    3a7c:	6a 0e                	push   0xe
    3a7e:	6a 08                	push   0x8
    3a80:	68 b2 03 03 00       	push   0x303b2
    3a85:	6a 5e                	push   0x5e
    3a87:	e8 6a f7 ff ff       	call   0x31f6
    3a8c:	83 c4 10             	add    esp,0x10
    3a8f:	6a 0e                	push   0xe
    3a91:	6a 08                	push   0x8
    3a93:	68 bb 03 03 00       	push   0x303bb
    3a98:	6a 5f                	push   0x5f
    3a9a:	e8 57 f7 ff ff       	call   0x31f6
    3a9f:	83 c4 10             	add    esp,0x10
    3aa2:	6a 0e                	push   0xe
    3aa4:	6a 08                	push   0x8
    3aa6:	68 c4 03 03 00       	push   0x303c4
    3aab:	6a 60                	push   0x60
    3aad:	e8 44 f7 ff ff       	call   0x31f6
    3ab2:	83 c4 10             	add    esp,0x10
    3ab5:	6a 0e                	push   0xe
    3ab7:	6a 08                	push   0x8
    3ab9:	68 cd 03 03 00       	push   0x303cd
    3abe:	6a 61                	push   0x61
    3ac0:	e8 31 f7 ff ff       	call   0x31f6
    3ac5:	83 c4 10             	add    esp,0x10
    3ac8:	6a 0e                	push   0xe
    3aca:	6a 08                	push   0x8
    3acc:	68 d6 03 03 00       	push   0x303d6
    3ad1:	6a 62                	push   0x62
    3ad3:	e8 1e f7 ff ff       	call   0x31f6
    3ad8:	83 c4 10             	add    esp,0x10
    3adb:	6a 0e                	push   0xe
    3add:	6a 08                	push   0x8
    3adf:	68 df 03 03 00       	push   0x303df
    3ae4:	6a 63                	push   0x63
    3ae6:	e8 0b f7 ff ff       	call   0x31f6
    3aeb:	83 c4 10             	add    esp,0x10
    3aee:	6a 0e                	push   0xe
    3af0:	6a 08                	push   0x8
    3af2:	68 e8 03 03 00       	push   0x303e8
    3af7:	6a 64                	push   0x64
    3af9:	e8 f8 f6 ff ff       	call   0x31f6
    3afe:	83 c4 10             	add    esp,0x10
    3b01:	6a 0e                	push   0xe
    3b03:	6a 08                	push   0x8
    3b05:	68 f1 03 03 00       	push   0x303f1
    3b0a:	6a 65                	push   0x65
    3b0c:	e8 e5 f6 ff ff       	call   0x31f6
    3b11:	83 c4 10             	add    esp,0x10
    3b14:	6a 0e                	push   0xe
    3b16:	6a 08                	push   0x8
    3b18:	68 fa 03 03 00       	push   0x303fa
    3b1d:	6a 66                	push   0x66
    3b1f:	e8 d2 f6 ff ff       	call   0x31f6
    3b24:	83 c4 10             	add    esp,0x10
    3b27:	6a 0e                	push   0xe
    3b29:	6a 08                	push   0x8
    3b2b:	68 03 04 03 00       	push   0x30403
    3b30:	6a 67                	push   0x67
    3b32:	e8 bf f6 ff ff       	call   0x31f6
    3b37:	83 c4 10             	add    esp,0x10
    3b3a:	6a 0e                	push   0xe
    3b3c:	6a 08                	push   0x8
    3b3e:	68 0c 04 03 00       	push   0x3040c
    3b43:	6a 68                	push   0x68
    3b45:	e8 ac f6 ff ff       	call   0x31f6
    3b4a:	83 c4 10             	add    esp,0x10
    3b4d:	6a 0e                	push   0xe
    3b4f:	6a 08                	push   0x8
    3b51:	68 15 04 03 00       	push   0x30415
    3b56:	6a 69                	push   0x69
    3b58:	e8 99 f6 ff ff       	call   0x31f6
    3b5d:	83 c4 10             	add    esp,0x10
    3b60:	6a 0e                	push   0xe
    3b62:	6a 08                	push   0x8
    3b64:	68 1e 04 03 00       	push   0x3041e
    3b69:	6a 6a                	push   0x6a
    3b6b:	e8 86 f6 ff ff       	call   0x31f6
    3b70:	83 c4 10             	add    esp,0x10
    3b73:	6a 0e                	push   0xe
    3b75:	6a 08                	push   0x8
    3b77:	68 27 04 03 00       	push   0x30427
    3b7c:	6a 6b                	push   0x6b
    3b7e:	e8 73 f6 ff ff       	call   0x31f6
    3b83:	83 c4 10             	add    esp,0x10
    3b86:	6a 0e                	push   0xe
    3b88:	6a 08                	push   0x8
    3b8a:	68 30 04 03 00       	push   0x30430
    3b8f:	6a 6c                	push   0x6c
    3b91:	e8 60 f6 ff ff       	call   0x31f6
    3b96:	83 c4 10             	add    esp,0x10
    3b99:	6a 0e                	push   0xe
    3b9b:	6a 08                	push   0x8
    3b9d:	68 39 04 03 00       	push   0x30439
    3ba2:	6a 6d                	push   0x6d
    3ba4:	e8 4d f6 ff ff       	call   0x31f6
    3ba9:	83 c4 10             	add    esp,0x10
    3bac:	6a 0e                	push   0xe
    3bae:	6a 08                	push   0x8
    3bb0:	68 42 04 03 00       	push   0x30442
    3bb5:	6a 6e                	push   0x6e
    3bb7:	e8 3a f6 ff ff       	call   0x31f6
    3bbc:	83 c4 10             	add    esp,0x10
    3bbf:	6a 0e                	push   0xe
    3bc1:	6a 08                	push   0x8
    3bc3:	68 4b 04 03 00       	push   0x3044b
    3bc8:	6a 6f                	push   0x6f
    3bca:	e8 27 f6 ff ff       	call   0x31f6
    3bcf:	83 c4 10             	add    esp,0x10
    3bd2:	6a 0e                	push   0xe
    3bd4:	6a 08                	push   0x8
    3bd6:	68 54 04 03 00       	push   0x30454
    3bdb:	6a 70                	push   0x70
    3bdd:	e8 14 f6 ff ff       	call   0x31f6
    3be2:	83 c4 10             	add    esp,0x10
    3be5:	6a 0e                	push   0xe
    3be7:	6a 08                	push   0x8
    3be9:	68 5d 04 03 00       	push   0x3045d
    3bee:	6a 71                	push   0x71
    3bf0:	e8 01 f6 ff ff       	call   0x31f6
    3bf5:	83 c4 10             	add    esp,0x10
    3bf8:	6a 0e                	push   0xe
    3bfa:	6a 08                	push   0x8
    3bfc:	68 66 04 03 00       	push   0x30466
    3c01:	6a 72                	push   0x72
    3c03:	e8 ee f5 ff ff       	call   0x31f6
    3c08:	83 c4 10             	add    esp,0x10
    3c0b:	6a 0e                	push   0xe
    3c0d:	6a 08                	push   0x8
    3c0f:	68 6f 04 03 00       	push   0x3046f
    3c14:	6a 73                	push   0x73
    3c16:	e8 db f5 ff ff       	call   0x31f6
    3c1b:	83 c4 10             	add    esp,0x10
    3c1e:	6a 0e                	push   0xe
    3c20:	6a 08                	push   0x8
    3c22:	68 78 04 03 00       	push   0x30478
    3c27:	6a 74                	push   0x74
    3c29:	e8 c8 f5 ff ff       	call   0x31f6
    3c2e:	83 c4 10             	add    esp,0x10
    3c31:	6a 0e                	push   0xe
    3c33:	6a 08                	push   0x8
    3c35:	68 81 04 03 00       	push   0x30481
    3c3a:	6a 75                	push   0x75
    3c3c:	e8 b5 f5 ff ff       	call   0x31f6
    3c41:	83 c4 10             	add    esp,0x10
    3c44:	6a 0e                	push   0xe
    3c46:	6a 08                	push   0x8
    3c48:	68 8a 04 03 00       	push   0x3048a
    3c4d:	6a 76                	push   0x76
    3c4f:	e8 a2 f5 ff ff       	call   0x31f6
    3c54:	83 c4 10             	add    esp,0x10
    3c57:	6a 0e                	push   0xe
    3c59:	6a 08                	push   0x8
    3c5b:	68 93 04 03 00       	push   0x30493
    3c60:	6a 77                	push   0x77
    3c62:	e8 8f f5 ff ff       	call   0x31f6
    3c67:	83 c4 10             	add    esp,0x10
    3c6a:	6a 0e                	push   0xe
    3c6c:	6a 08                	push   0x8
    3c6e:	68 9c 04 03 00       	push   0x3049c
    3c73:	6a 78                	push   0x78
    3c75:	e8 7c f5 ff ff       	call   0x31f6
    3c7a:	83 c4 10             	add    esp,0x10
    3c7d:	6a 0e                	push   0xe
    3c7f:	6a 08                	push   0x8
    3c81:	68 a5 04 03 00       	push   0x304a5
    3c86:	6a 79                	push   0x79
    3c88:	e8 69 f5 ff ff       	call   0x31f6
    3c8d:	83 c4 10             	add    esp,0x10
    3c90:	6a 0e                	push   0xe
    3c92:	6a 08                	push   0x8
    3c94:	68 ae 04 03 00       	push   0x304ae
    3c99:	6a 7a                	push   0x7a
    3c9b:	e8 56 f5 ff ff       	call   0x31f6
    3ca0:	83 c4 10             	add    esp,0x10
    3ca3:	6a 0e                	push   0xe
    3ca5:	6a 08                	push   0x8
    3ca7:	68 b7 04 03 00       	push   0x304b7
    3cac:	6a 7b                	push   0x7b
    3cae:	e8 43 f5 ff ff       	call   0x31f6
    3cb3:	83 c4 10             	add    esp,0x10
    3cb6:	6a 0e                	push   0xe
    3cb8:	6a 08                	push   0x8
    3cba:	68 c0 04 03 00       	push   0x304c0
    3cbf:	6a 7c                	push   0x7c
    3cc1:	e8 30 f5 ff ff       	call   0x31f6
    3cc6:	83 c4 10             	add    esp,0x10
    3cc9:	6a 0e                	push   0xe
    3ccb:	6a 08                	push   0x8
    3ccd:	68 c9 04 03 00       	push   0x304c9
    3cd2:	6a 7d                	push   0x7d
    3cd4:	e8 1d f5 ff ff       	call   0x31f6
    3cd9:	83 c4 10             	add    esp,0x10
    3cdc:	6a 0e                	push   0xe
    3cde:	6a 08                	push   0x8
    3ce0:	68 d2 04 03 00       	push   0x304d2
    3ce5:	6a 7e                	push   0x7e
    3ce7:	e8 0a f5 ff ff       	call   0x31f6
    3cec:	83 c4 10             	add    esp,0x10
    3cef:	6a 0e                	push   0xe
    3cf1:	6a 08                	push   0x8
    3cf3:	68 db 04 03 00       	push   0x304db
    3cf8:	6a 7f                	push   0x7f
    3cfa:	e8 f7 f4 ff ff       	call   0x31f6
    3cff:	83 c4 10             	add    esp,0x10
    3d02:	6a 0e                	push   0xe
    3d04:	6a 08                	push   0x8
    3d06:	68 e4 04 03 00       	push   0x304e4
    3d0b:	68 80 00 00 00       	push   0x80
    3d10:	e8 e1 f4 ff ff       	call   0x31f6
    3d15:	83 c4 10             	add    esp,0x10
    3d18:	6a 0e                	push   0xe
    3d1a:	6a 08                	push   0x8
    3d1c:	68 f0 04 03 00       	push   0x304f0
    3d21:	68 81 00 00 00       	push   0x81
    3d26:	e8 cb f4 ff ff       	call   0x31f6
    3d2b:	83 c4 10             	add    esp,0x10
    3d2e:	6a 0e                	push   0xe
    3d30:	6a 08                	push   0x8
    3d32:	68 fc 04 03 00       	push   0x304fc
    3d37:	68 82 00 00 00       	push   0x82
    3d3c:	e8 b5 f4 ff ff       	call   0x31f6
    3d41:	83 c4 10             	add    esp,0x10
    3d44:	6a 0e                	push   0xe
    3d46:	6a 08                	push   0x8
    3d48:	68 08 05 03 00       	push   0x30508
    3d4d:	68 83 00 00 00       	push   0x83
    3d52:	e8 9f f4 ff ff       	call   0x31f6
    3d57:	83 c4 10             	add    esp,0x10
    3d5a:	6a 0e                	push   0xe
    3d5c:	6a 08                	push   0x8
    3d5e:	68 14 05 03 00       	push   0x30514
    3d63:	68 84 00 00 00       	push   0x84
    3d68:	e8 89 f4 ff ff       	call   0x31f6
    3d6d:	83 c4 10             	add    esp,0x10
    3d70:	6a 0e                	push   0xe
    3d72:	6a 08                	push   0x8
    3d74:	68 20 05 03 00       	push   0x30520
    3d79:	68 85 00 00 00       	push   0x85
    3d7e:	e8 73 f4 ff ff       	call   0x31f6
    3d83:	83 c4 10             	add    esp,0x10
    3d86:	6a 0e                	push   0xe
    3d88:	6a 08                	push   0x8
    3d8a:	68 2c 05 03 00       	push   0x3052c
    3d8f:	68 86 00 00 00       	push   0x86
    3d94:	e8 5d f4 ff ff       	call   0x31f6
    3d99:	83 c4 10             	add    esp,0x10
    3d9c:	6a 0e                	push   0xe
    3d9e:	6a 08                	push   0x8
    3da0:	68 38 05 03 00       	push   0x30538
    3da5:	68 87 00 00 00       	push   0x87
    3daa:	e8 47 f4 ff ff       	call   0x31f6
    3daf:	83 c4 10             	add    esp,0x10
    3db2:	6a 0e                	push   0xe
    3db4:	6a 08                	push   0x8
    3db6:	68 44 05 03 00       	push   0x30544
    3dbb:	68 88 00 00 00       	push   0x88
    3dc0:	e8 31 f4 ff ff       	call   0x31f6
    3dc5:	83 c4 10             	add    esp,0x10
    3dc8:	6a 0e                	push   0xe
    3dca:	6a 08                	push   0x8
    3dcc:	68 50 05 03 00       	push   0x30550
    3dd1:	68 89 00 00 00       	push   0x89
    3dd6:	e8 1b f4 ff ff       	call   0x31f6
    3ddb:	83 c4 10             	add    esp,0x10
    3dde:	6a 0e                	push   0xe
    3de0:	6a 08                	push   0x8
    3de2:	68 5c 05 03 00       	push   0x3055c
    3de7:	68 8a 00 00 00       	push   0x8a
    3dec:	e8 05 f4 ff ff       	call   0x31f6
    3df1:	83 c4 10             	add    esp,0x10
    3df4:	6a 0e                	push   0xe
    3df6:	6a 08                	push   0x8
    3df8:	68 68 05 03 00       	push   0x30568
    3dfd:	68 8b 00 00 00       	push   0x8b
    3e02:	e8 ef f3 ff ff       	call   0x31f6
    3e07:	83 c4 10             	add    esp,0x10
    3e0a:	6a 0e                	push   0xe
    3e0c:	6a 08                	push   0x8
    3e0e:	68 74 05 03 00       	push   0x30574
    3e13:	68 8c 00 00 00       	push   0x8c
    3e18:	e8 d9 f3 ff ff       	call   0x31f6
    3e1d:	83 c4 10             	add    esp,0x10
    3e20:	6a 0e                	push   0xe
    3e22:	6a 08                	push   0x8
    3e24:	68 80 05 03 00       	push   0x30580
    3e29:	68 8d 00 00 00       	push   0x8d
    3e2e:	e8 c3 f3 ff ff       	call   0x31f6
    3e33:	83 c4 10             	add    esp,0x10
    3e36:	6a 0e                	push   0xe
    3e38:	6a 08                	push   0x8
    3e3a:	68 8c 05 03 00       	push   0x3058c
    3e3f:	68 8e 00 00 00       	push   0x8e
    3e44:	e8 ad f3 ff ff       	call   0x31f6
    3e49:	83 c4 10             	add    esp,0x10
    3e4c:	6a 0e                	push   0xe
    3e4e:	6a 08                	push   0x8
    3e50:	68 98 05 03 00       	push   0x30598
    3e55:	68 8f 00 00 00       	push   0x8f
    3e5a:	e8 97 f3 ff ff       	call   0x31f6
    3e5f:	83 c4 10             	add    esp,0x10
    3e62:	6a 0e                	push   0xe
    3e64:	6a 08                	push   0x8
    3e66:	68 a4 05 03 00       	push   0x305a4
    3e6b:	68 90 00 00 00       	push   0x90
    3e70:	e8 81 f3 ff ff       	call   0x31f6
    3e75:	83 c4 10             	add    esp,0x10
    3e78:	6a 0e                	push   0xe
    3e7a:	6a 08                	push   0x8
    3e7c:	68 b0 05 03 00       	push   0x305b0
    3e81:	68 91 00 00 00       	push   0x91
    3e86:	e8 6b f3 ff ff       	call   0x31f6
    3e8b:	83 c4 10             	add    esp,0x10
    3e8e:	6a 0e                	push   0xe
    3e90:	6a 08                	push   0x8
    3e92:	68 bc 05 03 00       	push   0x305bc
    3e97:	68 92 00 00 00       	push   0x92
    3e9c:	e8 55 f3 ff ff       	call   0x31f6
    3ea1:	83 c4 10             	add    esp,0x10
    3ea4:	6a 0e                	push   0xe
    3ea6:	6a 08                	push   0x8
    3ea8:	68 c8 05 03 00       	push   0x305c8
    3ead:	68 93 00 00 00       	push   0x93
    3eb2:	e8 3f f3 ff ff       	call   0x31f6
    3eb7:	83 c4 10             	add    esp,0x10
    3eba:	6a 0e                	push   0xe
    3ebc:	6a 08                	push   0x8
    3ebe:	68 d4 05 03 00       	push   0x305d4
    3ec3:	68 94 00 00 00       	push   0x94
    3ec8:	e8 29 f3 ff ff       	call   0x31f6
    3ecd:	83 c4 10             	add    esp,0x10
    3ed0:	6a 0e                	push   0xe
    3ed2:	6a 08                	push   0x8
    3ed4:	68 e0 05 03 00       	push   0x305e0
    3ed9:	68 95 00 00 00       	push   0x95
    3ede:	e8 13 f3 ff ff       	call   0x31f6
    3ee3:	83 c4 10             	add    esp,0x10
    3ee6:	6a 0e                	push   0xe
    3ee8:	6a 08                	push   0x8
    3eea:	68 ec 05 03 00       	push   0x305ec
    3eef:	68 96 00 00 00       	push   0x96
    3ef4:	e8 fd f2 ff ff       	call   0x31f6
    3ef9:	83 c4 10             	add    esp,0x10
    3efc:	6a 0e                	push   0xe
    3efe:	6a 08                	push   0x8
    3f00:	68 f8 05 03 00       	push   0x305f8
    3f05:	68 97 00 00 00       	push   0x97
    3f0a:	e8 e7 f2 ff ff       	call   0x31f6
    3f0f:	83 c4 10             	add    esp,0x10
    3f12:	6a 0e                	push   0xe
    3f14:	6a 08                	push   0x8
    3f16:	68 04 06 03 00       	push   0x30604
    3f1b:	68 98 00 00 00       	push   0x98
    3f20:	e8 d1 f2 ff ff       	call   0x31f6
    3f25:	83 c4 10             	add    esp,0x10
    3f28:	6a 0e                	push   0xe
    3f2a:	6a 08                	push   0x8
    3f2c:	68 10 06 03 00       	push   0x30610
    3f31:	68 99 00 00 00       	push   0x99
    3f36:	e8 bb f2 ff ff       	call   0x31f6
    3f3b:	83 c4 10             	add    esp,0x10
    3f3e:	6a 0e                	push   0xe
    3f40:	6a 08                	push   0x8
    3f42:	68 1c 06 03 00       	push   0x3061c
    3f47:	68 9a 00 00 00       	push   0x9a
    3f4c:	e8 a5 f2 ff ff       	call   0x31f6
    3f51:	83 c4 10             	add    esp,0x10
    3f54:	6a 0e                	push   0xe
    3f56:	6a 08                	push   0x8
    3f58:	68 28 06 03 00       	push   0x30628
    3f5d:	68 9b 00 00 00       	push   0x9b
    3f62:	e8 8f f2 ff ff       	call   0x31f6
    3f67:	83 c4 10             	add    esp,0x10
    3f6a:	6a 0e                	push   0xe
    3f6c:	6a 08                	push   0x8
    3f6e:	68 34 06 03 00       	push   0x30634
    3f73:	68 9c 00 00 00       	push   0x9c
    3f78:	e8 79 f2 ff ff       	call   0x31f6
    3f7d:	83 c4 10             	add    esp,0x10
    3f80:	6a 0e                	push   0xe
    3f82:	6a 08                	push   0x8
    3f84:	68 40 06 03 00       	push   0x30640
    3f89:	68 9d 00 00 00       	push   0x9d
    3f8e:	e8 63 f2 ff ff       	call   0x31f6
    3f93:	83 c4 10             	add    esp,0x10
    3f96:	6a 0e                	push   0xe
    3f98:	6a 08                	push   0x8
    3f9a:	68 4c 06 03 00       	push   0x3064c
    3f9f:	68 9e 00 00 00       	push   0x9e
    3fa4:	e8 4d f2 ff ff       	call   0x31f6
    3fa9:	83 c4 10             	add    esp,0x10
    3fac:	6a 0e                	push   0xe
    3fae:	6a 08                	push   0x8
    3fb0:	68 58 06 03 00       	push   0x30658
    3fb5:	68 9f 00 00 00       	push   0x9f
    3fba:	e8 37 f2 ff ff       	call   0x31f6
    3fbf:	83 c4 10             	add    esp,0x10
    3fc2:	6a 0e                	push   0xe
    3fc4:	6a 08                	push   0x8
    3fc6:	68 64 06 03 00       	push   0x30664
    3fcb:	68 a0 00 00 00       	push   0xa0
    3fd0:	e8 21 f2 ff ff       	call   0x31f6
    3fd5:	83 c4 10             	add    esp,0x10
    3fd8:	6a 0e                	push   0xe
    3fda:	6a 08                	push   0x8
    3fdc:	68 70 06 03 00       	push   0x30670
    3fe1:	68 a1 00 00 00       	push   0xa1
    3fe6:	e8 0b f2 ff ff       	call   0x31f6
    3feb:	83 c4 10             	add    esp,0x10
    3fee:	6a 0e                	push   0xe
    3ff0:	6a 08                	push   0x8
    3ff2:	68 7c 06 03 00       	push   0x3067c
    3ff7:	68 a2 00 00 00       	push   0xa2
    3ffc:	e8 f5 f1 ff ff       	call   0x31f6
    4001:	83 c4 10             	add    esp,0x10
    4004:	6a 0e                	push   0xe
    4006:	6a 08                	push   0x8
    4008:	68 88 06 03 00       	push   0x30688
    400d:	68 a3 00 00 00       	push   0xa3
    4012:	e8 df f1 ff ff       	call   0x31f6
    4017:	83 c4 10             	add    esp,0x10
    401a:	6a 0e                	push   0xe
    401c:	6a 08                	push   0x8
    401e:	68 94 06 03 00       	push   0x30694
    4023:	68 a4 00 00 00       	push   0xa4
    4028:	e8 c9 f1 ff ff       	call   0x31f6
    402d:	83 c4 10             	add    esp,0x10
    4030:	6a 0e                	push   0xe
    4032:	6a 08                	push   0x8
    4034:	68 a0 06 03 00       	push   0x306a0
    4039:	68 a5 00 00 00       	push   0xa5
    403e:	e8 b3 f1 ff ff       	call   0x31f6
    4043:	83 c4 10             	add    esp,0x10
    4046:	6a 0e                	push   0xe
    4048:	6a 08                	push   0x8
    404a:	68 ac 06 03 00       	push   0x306ac
    404f:	68 a6 00 00 00       	push   0xa6
    4054:	e8 9d f1 ff ff       	call   0x31f6
    4059:	83 c4 10             	add    esp,0x10
    405c:	6a 0e                	push   0xe
    405e:	6a 08                	push   0x8
    4060:	68 b8 06 03 00       	push   0x306b8
    4065:	68 a7 00 00 00       	push   0xa7
    406a:	e8 87 f1 ff ff       	call   0x31f6
    406f:	83 c4 10             	add    esp,0x10
    4072:	6a 0e                	push   0xe
    4074:	6a 08                	push   0x8
    4076:	68 c4 06 03 00       	push   0x306c4
    407b:	68 a8 00 00 00       	push   0xa8
    4080:	e8 71 f1 ff ff       	call   0x31f6
    4085:	83 c4 10             	add    esp,0x10
    4088:	6a 0e                	push   0xe
    408a:	6a 08                	push   0x8
    408c:	68 d0 06 03 00       	push   0x306d0
    4091:	68 a9 00 00 00       	push   0xa9
    4096:	e8 5b f1 ff ff       	call   0x31f6
    409b:	83 c4 10             	add    esp,0x10
    409e:	6a 0e                	push   0xe
    40a0:	6a 08                	push   0x8
    40a2:	68 dc 06 03 00       	push   0x306dc
    40a7:	68 aa 00 00 00       	push   0xaa
    40ac:	e8 45 f1 ff ff       	call   0x31f6
    40b1:	83 c4 10             	add    esp,0x10
    40b4:	6a 0e                	push   0xe
    40b6:	6a 08                	push   0x8
    40b8:	68 e8 06 03 00       	push   0x306e8
    40bd:	68 ab 00 00 00       	push   0xab
    40c2:	e8 2f f1 ff ff       	call   0x31f6
    40c7:	83 c4 10             	add    esp,0x10
    40ca:	6a 0e                	push   0xe
    40cc:	6a 08                	push   0x8
    40ce:	68 f4 06 03 00       	push   0x306f4
    40d3:	68 ac 00 00 00       	push   0xac
    40d8:	e8 19 f1 ff ff       	call   0x31f6
    40dd:	83 c4 10             	add    esp,0x10
    40e0:	6a 0e                	push   0xe
    40e2:	6a 08                	push   0x8
    40e4:	68 00 07 03 00       	push   0x30700
    40e9:	68 ad 00 00 00       	push   0xad
    40ee:	e8 03 f1 ff ff       	call   0x31f6
    40f3:	83 c4 10             	add    esp,0x10
    40f6:	6a 0e                	push   0xe
    40f8:	6a 08                	push   0x8
    40fa:	68 0c 07 03 00       	push   0x3070c
    40ff:	68 ae 00 00 00       	push   0xae
    4104:	e8 ed f0 ff ff       	call   0x31f6
    4109:	83 c4 10             	add    esp,0x10
    410c:	6a 0e                	push   0xe
    410e:	6a 08                	push   0x8
    4110:	68 18 07 03 00       	push   0x30718
    4115:	68 af 00 00 00       	push   0xaf
    411a:	e8 d7 f0 ff ff       	call   0x31f6
    411f:	83 c4 10             	add    esp,0x10
    4122:	6a 0e                	push   0xe
    4124:	6a 08                	push   0x8
    4126:	68 24 07 03 00       	push   0x30724
    412b:	68 b0 00 00 00       	push   0xb0
    4130:	e8 c1 f0 ff ff       	call   0x31f6
    4135:	83 c4 10             	add    esp,0x10
    4138:	6a 0e                	push   0xe
    413a:	6a 08                	push   0x8
    413c:	68 30 07 03 00       	push   0x30730
    4141:	68 b1 00 00 00       	push   0xb1
    4146:	e8 ab f0 ff ff       	call   0x31f6
    414b:	83 c4 10             	add    esp,0x10
    414e:	6a 0e                	push   0xe
    4150:	6a 08                	push   0x8
    4152:	68 3c 07 03 00       	push   0x3073c
    4157:	68 b2 00 00 00       	push   0xb2
    415c:	e8 95 f0 ff ff       	call   0x31f6
    4161:	83 c4 10             	add    esp,0x10
    4164:	6a 0e                	push   0xe
    4166:	6a 08                	push   0x8
    4168:	68 48 07 03 00       	push   0x30748
    416d:	68 b3 00 00 00       	push   0xb3
    4172:	e8 7f f0 ff ff       	call   0x31f6
    4177:	83 c4 10             	add    esp,0x10
    417a:	6a 0e                	push   0xe
    417c:	6a 08                	push   0x8
    417e:	68 54 07 03 00       	push   0x30754
    4183:	68 b4 00 00 00       	push   0xb4
    4188:	e8 69 f0 ff ff       	call   0x31f6
    418d:	83 c4 10             	add    esp,0x10
    4190:	6a 0e                	push   0xe
    4192:	6a 08                	push   0x8
    4194:	68 60 07 03 00       	push   0x30760
    4199:	68 b5 00 00 00       	push   0xb5
    419e:	e8 53 f0 ff ff       	call   0x31f6
    41a3:	83 c4 10             	add    esp,0x10
    41a6:	6a 0e                	push   0xe
    41a8:	6a 08                	push   0x8
    41aa:	68 6c 07 03 00       	push   0x3076c
    41af:	68 b6 00 00 00       	push   0xb6
    41b4:	e8 3d f0 ff ff       	call   0x31f6
    41b9:	83 c4 10             	add    esp,0x10
    41bc:	6a 0e                	push   0xe
    41be:	6a 08                	push   0x8
    41c0:	68 78 07 03 00       	push   0x30778
    41c5:	68 b7 00 00 00       	push   0xb7
    41ca:	e8 27 f0 ff ff       	call   0x31f6
    41cf:	83 c4 10             	add    esp,0x10
    41d2:	6a 0e                	push   0xe
    41d4:	6a 08                	push   0x8
    41d6:	68 84 07 03 00       	push   0x30784
    41db:	68 b8 00 00 00       	push   0xb8
    41e0:	e8 11 f0 ff ff       	call   0x31f6
    41e5:	83 c4 10             	add    esp,0x10
    41e8:	6a 0e                	push   0xe
    41ea:	6a 08                	push   0x8
    41ec:	68 90 07 03 00       	push   0x30790
    41f1:	68 b9 00 00 00       	push   0xb9
    41f6:	e8 fb ef ff ff       	call   0x31f6
    41fb:	83 c4 10             	add    esp,0x10
    41fe:	6a 0e                	push   0xe
    4200:	6a 08                	push   0x8
    4202:	68 9c 07 03 00       	push   0x3079c
    4207:	68 ba 00 00 00       	push   0xba
    420c:	e8 e5 ef ff ff       	call   0x31f6
    4211:	83 c4 10             	add    esp,0x10
    4214:	6a 0e                	push   0xe
    4216:	6a 08                	push   0x8
    4218:	68 a8 07 03 00       	push   0x307a8
    421d:	68 bb 00 00 00       	push   0xbb
    4222:	e8 cf ef ff ff       	call   0x31f6
    4227:	83 c4 10             	add    esp,0x10
    422a:	6a 0e                	push   0xe
    422c:	6a 08                	push   0x8
    422e:	68 b4 07 03 00       	push   0x307b4
    4233:	68 bc 00 00 00       	push   0xbc
    4238:	e8 b9 ef ff ff       	call   0x31f6
    423d:	83 c4 10             	add    esp,0x10
    4240:	6a 0e                	push   0xe
    4242:	6a 08                	push   0x8
    4244:	68 c0 07 03 00       	push   0x307c0
    4249:	68 bd 00 00 00       	push   0xbd
    424e:	e8 a3 ef ff ff       	call   0x31f6
    4253:	83 c4 10             	add    esp,0x10
    4256:	6a 0e                	push   0xe
    4258:	6a 08                	push   0x8
    425a:	68 cc 07 03 00       	push   0x307cc
    425f:	68 be 00 00 00       	push   0xbe
    4264:	e8 8d ef ff ff       	call   0x31f6
    4269:	83 c4 10             	add    esp,0x10
    426c:	6a 0e                	push   0xe
    426e:	6a 08                	push   0x8
    4270:	68 d8 07 03 00       	push   0x307d8
    4275:	68 bf 00 00 00       	push   0xbf
    427a:	e8 77 ef ff ff       	call   0x31f6
    427f:	83 c4 10             	add    esp,0x10
    4282:	6a 0e                	push   0xe
    4284:	6a 08                	push   0x8
    4286:	68 e4 07 03 00       	push   0x307e4
    428b:	68 c0 00 00 00       	push   0xc0
    4290:	e8 61 ef ff ff       	call   0x31f6
    4295:	83 c4 10             	add    esp,0x10
    4298:	6a 0e                	push   0xe
    429a:	6a 08                	push   0x8
    429c:	68 f0 07 03 00       	push   0x307f0
    42a1:	68 c1 00 00 00       	push   0xc1
    42a6:	e8 4b ef ff ff       	call   0x31f6
    42ab:	83 c4 10             	add    esp,0x10
    42ae:	6a 0e                	push   0xe
    42b0:	6a 08                	push   0x8
    42b2:	68 fc 07 03 00       	push   0x307fc
    42b7:	68 c2 00 00 00       	push   0xc2
    42bc:	e8 35 ef ff ff       	call   0x31f6
    42c1:	83 c4 10             	add    esp,0x10
    42c4:	6a 0e                	push   0xe
    42c6:	6a 08                	push   0x8
    42c8:	68 08 08 03 00       	push   0x30808
    42cd:	68 c3 00 00 00       	push   0xc3
    42d2:	e8 1f ef ff ff       	call   0x31f6
    42d7:	83 c4 10             	add    esp,0x10
    42da:	6a 0e                	push   0xe
    42dc:	6a 08                	push   0x8
    42de:	68 14 08 03 00       	push   0x30814
    42e3:	68 c4 00 00 00       	push   0xc4
    42e8:	e8 09 ef ff ff       	call   0x31f6
    42ed:	83 c4 10             	add    esp,0x10
    42f0:	6a 0e                	push   0xe
    42f2:	6a 08                	push   0x8
    42f4:	68 20 08 03 00       	push   0x30820
    42f9:	68 c5 00 00 00       	push   0xc5
    42fe:	e8 f3 ee ff ff       	call   0x31f6
    4303:	83 c4 10             	add    esp,0x10
    4306:	6a 0e                	push   0xe
    4308:	6a 08                	push   0x8
    430a:	68 2c 08 03 00       	push   0x3082c
    430f:	68 c6 00 00 00       	push   0xc6
    4314:	e8 dd ee ff ff       	call   0x31f6
    4319:	83 c4 10             	add    esp,0x10
    431c:	6a 0e                	push   0xe
    431e:	6a 08                	push   0x8
    4320:	68 38 08 03 00       	push   0x30838
    4325:	68 c7 00 00 00       	push   0xc7
    432a:	e8 c7 ee ff ff       	call   0x31f6
    432f:	83 c4 10             	add    esp,0x10
    4332:	6a 0e                	push   0xe
    4334:	6a 08                	push   0x8
    4336:	68 44 08 03 00       	push   0x30844
    433b:	68 c8 00 00 00       	push   0xc8
    4340:	e8 b1 ee ff ff       	call   0x31f6
    4345:	83 c4 10             	add    esp,0x10
    4348:	6a 0e                	push   0xe
    434a:	6a 08                	push   0x8
    434c:	68 50 08 03 00       	push   0x30850
    4351:	68 c9 00 00 00       	push   0xc9
    4356:	e8 9b ee ff ff       	call   0x31f6
    435b:	83 c4 10             	add    esp,0x10
    435e:	6a 0e                	push   0xe
    4360:	6a 08                	push   0x8
    4362:	68 5c 08 03 00       	push   0x3085c
    4367:	68 ca 00 00 00       	push   0xca
    436c:	e8 85 ee ff ff       	call   0x31f6
    4371:	83 c4 10             	add    esp,0x10
    4374:	6a 0e                	push   0xe
    4376:	6a 08                	push   0x8
    4378:	68 68 08 03 00       	push   0x30868
    437d:	68 cb 00 00 00       	push   0xcb
    4382:	e8 6f ee ff ff       	call   0x31f6
    4387:	83 c4 10             	add    esp,0x10
    438a:	6a 0e                	push   0xe
    438c:	6a 08                	push   0x8
    438e:	68 74 08 03 00       	push   0x30874
    4393:	68 cc 00 00 00       	push   0xcc
    4398:	e8 59 ee ff ff       	call   0x31f6
    439d:	83 c4 10             	add    esp,0x10
    43a0:	6a 0e                	push   0xe
    43a2:	6a 08                	push   0x8
    43a4:	68 80 08 03 00       	push   0x30880
    43a9:	68 cd 00 00 00       	push   0xcd
    43ae:	e8 43 ee ff ff       	call   0x31f6
    43b3:	83 c4 10             	add    esp,0x10
    43b6:	6a 0e                	push   0xe
    43b8:	6a 08                	push   0x8
    43ba:	68 8c 08 03 00       	push   0x3088c
    43bf:	68 ce 00 00 00       	push   0xce
    43c4:	e8 2d ee ff ff       	call   0x31f6
    43c9:	83 c4 10             	add    esp,0x10
    43cc:	6a 0e                	push   0xe
    43ce:	6a 08                	push   0x8
    43d0:	68 98 08 03 00       	push   0x30898
    43d5:	68 cf 00 00 00       	push   0xcf
    43da:	e8 17 ee ff ff       	call   0x31f6
    43df:	83 c4 10             	add    esp,0x10
    43e2:	6a 0e                	push   0xe
    43e4:	6a 08                	push   0x8
    43e6:	68 a4 08 03 00       	push   0x308a4
    43eb:	68 d0 00 00 00       	push   0xd0
    43f0:	e8 01 ee ff ff       	call   0x31f6
    43f5:	83 c4 10             	add    esp,0x10
    43f8:	6a 0e                	push   0xe
    43fa:	6a 08                	push   0x8
    43fc:	68 b0 08 03 00       	push   0x308b0
    4401:	68 d1 00 00 00       	push   0xd1
    4406:	e8 eb ed ff ff       	call   0x31f6
    440b:	83 c4 10             	add    esp,0x10
    440e:	6a 0e                	push   0xe
    4410:	6a 08                	push   0x8
    4412:	68 bc 08 03 00       	push   0x308bc
    4417:	68 d2 00 00 00       	push   0xd2
    441c:	e8 d5 ed ff ff       	call   0x31f6
    4421:	83 c4 10             	add    esp,0x10
    4424:	6a 0e                	push   0xe
    4426:	6a 08                	push   0x8
    4428:	68 c8 08 03 00       	push   0x308c8
    442d:	68 d3 00 00 00       	push   0xd3
    4432:	e8 bf ed ff ff       	call   0x31f6
    4437:	83 c4 10             	add    esp,0x10
    443a:	6a 0e                	push   0xe
    443c:	6a 08                	push   0x8
    443e:	68 d4 08 03 00       	push   0x308d4
    4443:	68 d4 00 00 00       	push   0xd4
    4448:	e8 a9 ed ff ff       	call   0x31f6
    444d:	83 c4 10             	add    esp,0x10
    4450:	6a 0e                	push   0xe
    4452:	6a 08                	push   0x8
    4454:	68 e0 08 03 00       	push   0x308e0
    4459:	68 d5 00 00 00       	push   0xd5
    445e:	e8 93 ed ff ff       	call   0x31f6
    4463:	83 c4 10             	add    esp,0x10
    4466:	6a 0e                	push   0xe
    4468:	6a 08                	push   0x8
    446a:	68 ec 08 03 00       	push   0x308ec
    446f:	68 d6 00 00 00       	push   0xd6
    4474:	e8 7d ed ff ff       	call   0x31f6
    4479:	83 c4 10             	add    esp,0x10
    447c:	6a 0e                	push   0xe
    447e:	6a 08                	push   0x8
    4480:	68 f8 08 03 00       	push   0x308f8
    4485:	68 d7 00 00 00       	push   0xd7
    448a:	e8 67 ed ff ff       	call   0x31f6
    448f:	83 c4 10             	add    esp,0x10
    4492:	6a 0e                	push   0xe
    4494:	6a 08                	push   0x8
    4496:	68 04 09 03 00       	push   0x30904
    449b:	68 d8 00 00 00       	push   0xd8
    44a0:	e8 51 ed ff ff       	call   0x31f6
    44a5:	83 c4 10             	add    esp,0x10
    44a8:	6a 0e                	push   0xe
    44aa:	6a 08                	push   0x8
    44ac:	68 10 09 03 00       	push   0x30910
    44b1:	68 d9 00 00 00       	push   0xd9
    44b6:	e8 3b ed ff ff       	call   0x31f6
    44bb:	83 c4 10             	add    esp,0x10
    44be:	6a 0e                	push   0xe
    44c0:	6a 08                	push   0x8
    44c2:	68 1c 09 03 00       	push   0x3091c
    44c7:	68 da 00 00 00       	push   0xda
    44cc:	e8 25 ed ff ff       	call   0x31f6
    44d1:	83 c4 10             	add    esp,0x10
    44d4:	6a 0e                	push   0xe
    44d6:	6a 08                	push   0x8
    44d8:	68 28 09 03 00       	push   0x30928
    44dd:	68 db 00 00 00       	push   0xdb
    44e2:	e8 0f ed ff ff       	call   0x31f6
    44e7:	83 c4 10             	add    esp,0x10
    44ea:	6a 0e                	push   0xe
    44ec:	6a 08                	push   0x8
    44ee:	68 34 09 03 00       	push   0x30934
    44f3:	68 dc 00 00 00       	push   0xdc
    44f8:	e8 f9 ec ff ff       	call   0x31f6
    44fd:	83 c4 10             	add    esp,0x10
    4500:	6a 0e                	push   0xe
    4502:	6a 08                	push   0x8
    4504:	68 40 09 03 00       	push   0x30940
    4509:	68 dd 00 00 00       	push   0xdd
    450e:	e8 e3 ec ff ff       	call   0x31f6
    4513:	83 c4 10             	add    esp,0x10
    4516:	6a 0e                	push   0xe
    4518:	6a 08                	push   0x8
    451a:	68 4c 09 03 00       	push   0x3094c
    451f:	68 de 00 00 00       	push   0xde
    4524:	e8 cd ec ff ff       	call   0x31f6
    4529:	83 c4 10             	add    esp,0x10
    452c:	6a 0e                	push   0xe
    452e:	6a 08                	push   0x8
    4530:	68 58 09 03 00       	push   0x30958
    4535:	68 df 00 00 00       	push   0xdf
    453a:	e8 b7 ec ff ff       	call   0x31f6
    453f:	83 c4 10             	add    esp,0x10
    4542:	6a 0e                	push   0xe
    4544:	6a 08                	push   0x8
    4546:	68 64 09 03 00       	push   0x30964
    454b:	68 e0 00 00 00       	push   0xe0
    4550:	e8 a1 ec ff ff       	call   0x31f6
    4555:	83 c4 10             	add    esp,0x10
    4558:	6a 0e                	push   0xe
    455a:	6a 08                	push   0x8
    455c:	68 70 09 03 00       	push   0x30970
    4561:	68 e1 00 00 00       	push   0xe1
    4566:	e8 8b ec ff ff       	call   0x31f6
    456b:	83 c4 10             	add    esp,0x10
    456e:	6a 0e                	push   0xe
    4570:	6a 08                	push   0x8
    4572:	68 7c 09 03 00       	push   0x3097c
    4577:	68 e2 00 00 00       	push   0xe2
    457c:	e8 75 ec ff ff       	call   0x31f6
    4581:	83 c4 10             	add    esp,0x10
    4584:	6a 0e                	push   0xe
    4586:	6a 08                	push   0x8
    4588:	68 88 09 03 00       	push   0x30988
    458d:	68 e3 00 00 00       	push   0xe3
    4592:	e8 5f ec ff ff       	call   0x31f6
    4597:	83 c4 10             	add    esp,0x10
    459a:	6a 0e                	push   0xe
    459c:	6a 08                	push   0x8
    459e:	68 94 09 03 00       	push   0x30994
    45a3:	68 e4 00 00 00       	push   0xe4
    45a8:	e8 49 ec ff ff       	call   0x31f6
    45ad:	83 c4 10             	add    esp,0x10
    45b0:	6a 0e                	push   0xe
    45b2:	6a 08                	push   0x8
    45b4:	68 a0 09 03 00       	push   0x309a0
    45b9:	68 e5 00 00 00       	push   0xe5
    45be:	e8 33 ec ff ff       	call   0x31f6
    45c3:	83 c4 10             	add    esp,0x10
    45c6:	6a 0e                	push   0xe
    45c8:	6a 08                	push   0x8
    45ca:	68 ac 09 03 00       	push   0x309ac
    45cf:	68 e6 00 00 00       	push   0xe6
    45d4:	e8 1d ec ff ff       	call   0x31f6
    45d9:	83 c4 10             	add    esp,0x10
    45dc:	6a 0e                	push   0xe
    45de:	6a 08                	push   0x8
    45e0:	68 b8 09 03 00       	push   0x309b8
    45e5:	68 e7 00 00 00       	push   0xe7
    45ea:	e8 07 ec ff ff       	call   0x31f6
    45ef:	83 c4 10             	add    esp,0x10
    45f2:	6a 0e                	push   0xe
    45f4:	6a 08                	push   0x8
    45f6:	68 c4 09 03 00       	push   0x309c4
    45fb:	68 e8 00 00 00       	push   0xe8
    4600:	e8 f1 eb ff ff       	call   0x31f6
    4605:	83 c4 10             	add    esp,0x10
    4608:	6a 0e                	push   0xe
    460a:	6a 08                	push   0x8
    460c:	68 d0 09 03 00       	push   0x309d0
    4611:	68 e9 00 00 00       	push   0xe9
    4616:	e8 db eb ff ff       	call   0x31f6
    461b:	83 c4 10             	add    esp,0x10
    461e:	6a 0e                	push   0xe
    4620:	6a 08                	push   0x8
    4622:	68 dc 09 03 00       	push   0x309dc
    4627:	68 ea 00 00 00       	push   0xea
    462c:	e8 c5 eb ff ff       	call   0x31f6
    4631:	83 c4 10             	add    esp,0x10
    4634:	6a 0e                	push   0xe
    4636:	6a 08                	push   0x8
    4638:	68 e8 09 03 00       	push   0x309e8
    463d:	68 eb 00 00 00       	push   0xeb
    4642:	e8 af eb ff ff       	call   0x31f6
    4647:	83 c4 10             	add    esp,0x10
    464a:	6a 0e                	push   0xe
    464c:	6a 08                	push   0x8
    464e:	68 f4 09 03 00       	push   0x309f4
    4653:	68 ec 00 00 00       	push   0xec
    4658:	e8 99 eb ff ff       	call   0x31f6
    465d:	83 c4 10             	add    esp,0x10
    4660:	6a 0e                	push   0xe
    4662:	6a 08                	push   0x8
    4664:	68 00 0a 03 00       	push   0x30a00
    4669:	68 ed 00 00 00       	push   0xed
    466e:	e8 83 eb ff ff       	call   0x31f6
    4673:	83 c4 10             	add    esp,0x10
    4676:	6a 0e                	push   0xe
    4678:	6a 08                	push   0x8
    467a:	68 0c 0a 03 00       	push   0x30a0c
    467f:	68 ee 00 00 00       	push   0xee
    4684:	e8 6d eb ff ff       	call   0x31f6
    4689:	83 c4 10             	add    esp,0x10
    468c:	6a 0e                	push   0xe
    468e:	6a 08                	push   0x8
    4690:	68 18 0a 03 00       	push   0x30a18
    4695:	68 ef 00 00 00       	push   0xef
    469a:	e8 57 eb ff ff       	call   0x31f6
    469f:	83 c4 10             	add    esp,0x10
    46a2:	6a 0e                	push   0xe
    46a4:	6a 08                	push   0x8
    46a6:	68 24 0a 03 00       	push   0x30a24
    46ab:	68 f0 00 00 00       	push   0xf0
    46b0:	e8 41 eb ff ff       	call   0x31f6
    46b5:	83 c4 10             	add    esp,0x10
    46b8:	6a 0e                	push   0xe
    46ba:	6a 08                	push   0x8
    46bc:	68 30 0a 03 00       	push   0x30a30
    46c1:	68 f1 00 00 00       	push   0xf1
    46c6:	e8 2b eb ff ff       	call   0x31f6
    46cb:	83 c4 10             	add    esp,0x10
    46ce:	6a 0e                	push   0xe
    46d0:	6a 08                	push   0x8
    46d2:	68 39 0a 03 00       	push   0x30a39
    46d7:	68 f2 00 00 00       	push   0xf2
    46dc:	e8 15 eb ff ff       	call   0x31f6
    46e1:	83 c4 10             	add    esp,0x10
    46e4:	6a 0e                	push   0xe
    46e6:	6a 08                	push   0x8
    46e8:	68 42 0a 03 00       	push   0x30a42
    46ed:	68 f3 00 00 00       	push   0xf3
    46f2:	e8 ff ea ff ff       	call   0x31f6
    46f7:	83 c4 10             	add    esp,0x10
    46fa:	6a 0e                	push   0xe
    46fc:	6a 08                	push   0x8
    46fe:	68 4b 0a 03 00       	push   0x30a4b
    4703:	68 f4 00 00 00       	push   0xf4
    4708:	e8 e9 ea ff ff       	call   0x31f6
    470d:	83 c4 10             	add    esp,0x10
    4710:	6a 0e                	push   0xe
    4712:	6a 08                	push   0x8
    4714:	68 54 0a 03 00       	push   0x30a54
    4719:	68 f5 00 00 00       	push   0xf5
    471e:	e8 d3 ea ff ff       	call   0x31f6
    4723:	83 c4 10             	add    esp,0x10
    4726:	6a 0e                	push   0xe
    4728:	6a 08                	push   0x8
    472a:	68 5d 0a 03 00       	push   0x30a5d
    472f:	68 f6 00 00 00       	push   0xf6
    4734:	e8 bd ea ff ff       	call   0x31f6
    4739:	83 c4 10             	add    esp,0x10
    473c:	6a 0e                	push   0xe
    473e:	6a 08                	push   0x8
    4740:	68 66 0a 03 00       	push   0x30a66
    4745:	68 f7 00 00 00       	push   0xf7
    474a:	e8 a7 ea ff ff       	call   0x31f6
    474f:	83 c4 10             	add    esp,0x10
    4752:	6a 0e                	push   0xe
    4754:	6a 08                	push   0x8
    4756:	68 6f 0a 03 00       	push   0x30a6f
    475b:	68 f8 00 00 00       	push   0xf8
    4760:	e8 91 ea ff ff       	call   0x31f6
    4765:	83 c4 10             	add    esp,0x10
    4768:	6a 0e                	push   0xe
    476a:	6a 08                	push   0x8
    476c:	68 78 0a 03 00       	push   0x30a78
    4771:	68 f9 00 00 00       	push   0xf9
    4776:	e8 7b ea ff ff       	call   0x31f6
    477b:	83 c4 10             	add    esp,0x10
    477e:	6a 0e                	push   0xe
    4780:	6a 08                	push   0x8
    4782:	68 81 0a 03 00       	push   0x30a81
    4787:	68 fa 00 00 00       	push   0xfa
    478c:	e8 65 ea ff ff       	call   0x31f6
    4791:	83 c4 10             	add    esp,0x10
    4794:	6a 0e                	push   0xe
    4796:	6a 08                	push   0x8
    4798:	68 8a 0a 03 00       	push   0x30a8a
    479d:	68 fb 00 00 00       	push   0xfb
    47a2:	e8 4f ea ff ff       	call   0x31f6
    47a7:	83 c4 10             	add    esp,0x10
    47aa:	6a 0e                	push   0xe
    47ac:	6a 08                	push   0x8
    47ae:	68 93 0a 03 00       	push   0x30a93
    47b3:	68 fc 00 00 00       	push   0xfc
    47b8:	e8 39 ea ff ff       	call   0x31f6
    47bd:	83 c4 10             	add    esp,0x10
    47c0:	6a 0e                	push   0xe
    47c2:	6a 08                	push   0x8
    47c4:	68 9c 0a 03 00       	push   0x30a9c
    47c9:	68 fd 00 00 00       	push   0xfd
    47ce:	e8 23 ea ff ff       	call   0x31f6
    47d3:	83 c4 10             	add    esp,0x10
    47d6:	6a 0e                	push   0xe
    47d8:	6a 08                	push   0x8
    47da:	68 a5 0a 03 00       	push   0x30aa5
    47df:	68 fe 00 00 00       	push   0xfe
    47e4:	e8 0d ea ff ff       	call   0x31f6
    47e9:	83 c4 10             	add    esp,0x10
    47ec:	6a 0e                	push   0xe
    47ee:	6a 08                	push   0x8
    47f0:	68 ae 0a 03 00       	push   0x30aae
    47f5:	68 ff 00 00 00       	push   0xff
    47fa:	e8 f7 e9 ff ff       	call   0x31f6
    47ff:	83 c4 10             	add    esp,0x10
    4802:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
    4809:	eb 12                	jmp    0x481d
    480b:	83 ec 0c             	sub    esp,0xc
    480e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
    4811:	e8 41 ea ff ff       	call   0x3257
    4816:	83 c4 10             	add    esp,0x10
    4819:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
    481d:	81 7d f4 ff 00 00 00 	cmp    DWORD PTR [ebp-0xc],0xff
    4824:	7e e5                	jle    0x480b
    4826:	83 ec 0c             	sub    esp,0xc
    4829:	68 80 00 00 00       	push   0x80
    482e:	e8 44 ea ff ff       	call   0x3277
    4833:	83 c4 10             	add    esp,0x10
    4836:	90                   	nop
    4837:	c9                   	leave  
    4838:	c3                   	ret    
    4839:	55                   	push   ebp
    483a:	89 e5                	mov    ebp,esp
    483c:	83 ec 08             	sub    esp,0x8
    483f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4842:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
    4845:	89 14 85 20 6e 03 00 	mov    DWORD PTR [eax*4+0x36e20],edx
    484c:	83 ec 0c             	sub    esp,0xc
    484f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    4852:	e8 00 ea ff ff       	call   0x3257
    4857:	83 c4 10             	add    esp,0x10
    485a:	90                   	nop
    485b:	c9                   	leave  
    485c:	c3                   	ret    
    485d:	55                   	push   ebp
    485e:	89 e5                	mov    ebp,esp
    4860:	57                   	push   edi
    4861:	56                   	push   esi
    4862:	53                   	push   ebx
    4863:	83 ec 1c             	sub    esp,0x1c
    4866:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4869:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    486c:	8b 04 85 20 6e 03 00 	mov    eax,DWORD PTR [eax*4+0x36e20]
    4873:	85 c0                	test   eax,eax
    4875:	74 1d                	je     0x4894
    4877:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    487a:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    487d:	8b 04 85 20 6e 03 00 	mov    eax,DWORD PTR [eax*4+0x36e20]
    4884:	83 ec 0c             	sub    esp,0xc
    4887:	ff 75 08             	push   DWORD PTR [ebp+0x8]
    488a:	ff d0                	call   eax
    488c:	83 c4 10             	add    esp,0x10
    488f:	e9 07 01 00 00       	jmp    0x499b
    4894:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4897:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    489a:	83 f8 1f             	cmp    eax,0x1f
    489d:	76 1c                	jbe    0x48bb
    489f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48a2:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    48a5:	83 ec 08             	sub    esp,0x8
    48a8:	50                   	push   eax
    48a9:	68 00 56 03 00       	push   0x35600
    48ae:	e8 82 c8 ff ff       	call   0x1135
    48b3:	83 c4 10             	add    esp,0x10
    48b6:	e9 e0 00 00 00       	jmp    0x499b
    48bb:	83 ec 0c             	sub    esp,0xc
    48be:	68 24 56 03 00       	push   0x35624
    48c3:	e8 6d c8 ff ff       	call   0x1135
    48c8:	83 c4 10             	add    esp,0x10
    48cb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48ce:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    48d1:	8b 14 85 80 55 03 00 	mov    edx,DWORD PTR [eax*4+0x35580]
    48d8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48db:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    48de:	83 ec 04             	sub    esp,0x4
    48e1:	52                   	push   edx
    48e2:	50                   	push   eax
    48e3:	68 43 56 03 00       	push   0x35643
    48e8:	e8 48 c8 ff ff       	call   0x1135
    48ed:	83 c4 10             	add    esp,0x10
    48f0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48f3:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
    48f6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    48f9:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
    48fc:	83 ec 04             	sub    esp,0x4
    48ff:	52                   	push   edx
    4900:	50                   	push   eax
    4901:	68 58 56 03 00       	push   0x35658
    4906:	e8 2a c8 ff ff       	call   0x1135
    490b:	83 c4 10             	add    esp,0x10
    490e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4911:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
    4914:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4917:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
    491a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    491d:	8b 58 18             	mov    ebx,DWORD PTR [eax+0x18]
    4920:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4923:	8b 48 1c             	mov    ecx,DWORD PTR [eax+0x1c]
    4926:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4929:	8b 50 14             	mov    edx,DWORD PTR [eax+0x14]
    492c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    492f:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
    4932:	83 ec 04             	sub    esp,0x4
    4935:	57                   	push   edi
    4936:	56                   	push   esi
    4937:	53                   	push   ebx
    4938:	51                   	push   ecx
    4939:	52                   	push   edx
    493a:	50                   	push   eax
    493b:	68 80 56 03 00       	push   0x35680
    4940:	e8 f0 c7 ff ff       	call   0x1135
    4945:	83 c4 20             	add    esp,0x20
    4948:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    494b:	8b 40 3c             	mov    eax,DWORD PTR [eax+0x3c]
    494e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
    4951:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4954:	8b 78 38             	mov    edi,DWORD PTR [eax+0x38]
    4957:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    495a:	8b 70 34             	mov    esi,DWORD PTR [eax+0x34]
    495d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4960:	8b 58 30             	mov    ebx,DWORD PTR [eax+0x30]
    4963:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4966:	8b 48 2c             	mov    ecx,DWORD PTR [eax+0x2c]
    4969:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    496c:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
    496f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4972:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
    4975:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
    4978:	57                   	push   edi
    4979:	56                   	push   esi
    497a:	53                   	push   ebx
    497b:	51                   	push   ecx
    497c:	52                   	push   edx
    497d:	50                   	push   eax
    497e:	68 b4 56 03 00       	push   0x356b4
    4983:	e8 ad c7 ff ff       	call   0x1135
    4988:	83 c4 20             	add    esp,0x20
    498b:	83 ec 0c             	sub    esp,0xc
    498e:	68 f8 56 03 00       	push   0x356f8
    4993:	e8 9d c7 ff ff       	call   0x1135
    4998:	83 c4 10             	add    esp,0x10
    499b:	90                   	nop
    499c:	8d 65 f4             	lea    esp,[ebp-0xc]
    499f:	5b                   	pop    ebx
    49a0:	5e                   	pop    esi
    49a1:	5f                   	pop    edi
    49a2:	5d                   	pop    ebp
    49a3:	c3                   	ret    
    49a4:	55                   	push   ebp
    49a5:	89 e5                	mov    ebp,esp
    49a7:	83 ec 18             	sub    esp,0x18
    49aa:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
    49ad:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
    49b0:	88 55 f4             	mov    BYTE PTR [ebp-0xc],dl
    49b3:	88 45 f0             	mov    BYTE PTR [ebp-0x10],al
    49b6:	83 ec 08             	sub    esp,0x8
    49b9:	6a 11                	push   0x11
    49bb:	6a 20                	push   0x20
    49bd:	e8 66 b6 ff ff       	call   0x28
    49c2:	83 c4 10             	add    esp,0x10
    49c5:	e8 ea df ff ff       	call   0x29b4
    49ca:	83 ec 08             	sub    esp,0x8
    49cd:	6a 11                	push   0x11
    49cf:	68 a0 00 00 00       	push   0xa0
    49d4:	e8 4f b6 ff ff       	call   0x28
    49d9:	83 c4 10             	add    esp,0x10
    49dc:	e8 d3 df ff ff       	call   0x29b4
    49e1:	0f b6 45 f4          	movzx  eax,BYTE PTR [ebp-0xc]
    49e5:	83 ec 08             	sub    esp,0x8
    49e8:	50                   	push   eax
    49e9:	6a 21                	push   0x21
    49eb:	e8 38 b6 ff ff       	call   0x28
    49f0:	83 c4 10             	add    esp,0x10
    49f3:	e8 bc df ff ff       	call   0x29b4
    49f8:	0f b6 45 f0          	movzx  eax,BYTE PTR [ebp-0x10]
    49fc:	83 ec 08             	sub    esp,0x8
    49ff:	50                   	push   eax
    4a00:	68 a1 00 00 00       	push   0xa1
    4a05:	e8 1e b6 ff ff       	call   0x28
    4a0a:	83 c4 10             	add    esp,0x10
    4a0d:	e8 a2 df ff ff       	call   0x29b4
    4a12:	83 ec 08             	sub    esp,0x8
    4a15:	6a 04                	push   0x4
    4a17:	6a 21                	push   0x21
    4a19:	e8 0a b6 ff ff       	call   0x28
    4a1e:	83 c4 10             	add    esp,0x10
    4a21:	e8 8e df ff ff       	call   0x29b4
    4a26:	83 ec 08             	sub    esp,0x8
    4a29:	6a 02                	push   0x2
    4a2b:	68 a1 00 00 00       	push   0xa1
    4a30:	e8 f3 b5 ff ff       	call   0x28
    4a35:	83 c4 10             	add    esp,0x10
    4a38:	e8 77 df ff ff       	call   0x29b4
    4a3d:	83 ec 08             	sub    esp,0x8
    4a40:	6a 01                	push   0x1
    4a42:	6a 21                	push   0x21
    4a44:	e8 df b5 ff ff       	call   0x28
    4a49:	83 c4 10             	add    esp,0x10
    4a4c:	e8 63 df ff ff       	call   0x29b4
    4a51:	83 ec 08             	sub    esp,0x8
    4a54:	6a 01                	push   0x1
    4a56:	68 a1 00 00 00       	push   0xa1
    4a5b:	e8 c8 b5 ff ff       	call   0x28
    4a60:	83 c4 10             	add    esp,0x10
    4a63:	e8 4c df ff ff       	call   0x29b4
    4a68:	83 ec 08             	sub    esp,0x8
    4a6b:	6a 00                	push   0x0
    4a6d:	6a 21                	push   0x21
    4a6f:	e8 b4 b5 ff ff       	call   0x28
    4a74:	83 c4 10             	add    esp,0x10
    4a77:	e8 38 df ff ff       	call   0x29b4
    4a7c:	83 ec 08             	sub    esp,0x8
    4a7f:	6a 00                	push   0x0
    4a81:	68 a1 00 00 00       	push   0xa1
    4a86:	e8 9d b5 ff ff       	call   0x28
    4a8b:	83 c4 10             	add    esp,0x10
    4a8e:	e8 21 df ff ff       	call   0x29b4
    4a93:	90                   	nop
    4a94:	c9                   	leave  
    4a95:	c3                   	ret    
    4a96:	55                   	push   ebp
    4a97:	89 e5                	mov    ebp,esp
    4a99:	83 ec 08             	sub    esp,0x8
    4a9c:	83 7d 08 07          	cmp    DWORD PTR [ebp+0x8],0x7
    4aa0:	7e 12                	jle    0x4ab4
    4aa2:	83 ec 08             	sub    esp,0x8
    4aa5:	6a 20                	push   0x20
    4aa7:	68 a0 00 00 00       	push   0xa0
    4aac:	e8 77 b5 ff ff       	call   0x28
    4ab1:	83 c4 10             	add    esp,0x10
    4ab4:	83 ec 08             	sub    esp,0x8
    4ab7:	6a 20                	push   0x20
    4ab9:	6a 20                	push   0x20
    4abb:	e8 68 b5 ff ff       	call   0x28
    4ac0:	83 c4 10             	add    esp,0x10
    4ac3:	90                   	nop
    4ac4:	c9                   	leave  
    4ac5:	c3                   	ret    
    4ac6:	55                   	push   ebp
    4ac7:	89 e5                	mov    ebp,esp
    4ac9:	83 ec 08             	sub    esp,0x8
    4acc:	83 ec 08             	sub    esp,0x8
    4acf:	68 ff 00 00 00       	push   0xff
    4ad4:	6a 21                	push   0x21
    4ad6:	e8 4d b5 ff ff       	call   0x28
    4adb:	83 c4 10             	add    esp,0x10
    4ade:	e8 d1 de ff ff       	call   0x29b4
    4ae3:	83 ec 08             	sub    esp,0x8
    4ae6:	68 ff 00 00 00       	push   0xff
    4aeb:	68 a1 00 00 00       	push   0xa1
    4af0:	e8 33 b5 ff ff       	call   0x28
    4af5:	83 c4 10             	add    esp,0x10
    4af8:	e8 b7 de ff ff       	call   0x29b4
    4afd:	90                   	nop
    4afe:	c9                   	leave  
    4aff:	c3                   	ret    
    4b00:	55                   	push   ebp
    4b01:	89 e5                	mov    ebp,esp
    4b03:	83 ec 18             	sub    esp,0x18
    4b06:	83 7d 08 07          	cmp    DWORD PTR [ebp+0x8],0x7
    4b0a:	7f 06                	jg     0x4b12
    4b0c:	c6 45 f7 21          	mov    BYTE PTR [ebp-0x9],0x21
    4b10:	eb 08                	jmp    0x4b1a
    4b12:	83 6d 08 08          	sub    DWORD PTR [ebp+0x8],0x8
    4b16:	c6 45 f7 a1          	mov    BYTE PTR [ebp-0x9],0xa1
    4b1a:	83 ec 0c             	sub    esp,0xc
    4b1d:	6a 21                	push   0x21
    4b1f:	e8 0f b5 ff ff       	call   0x33
    4b24:	83 c4 10             	add    esp,0x10
    4b27:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
    4b2a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4b2d:	ba 01 00 00 00       	mov    edx,0x1
    4b32:	89 c1                	mov    ecx,eax
    4b34:	d3 e2                	shl    edx,cl
    4b36:	89 d0                	mov    eax,edx
    4b38:	89 c2                	mov    edx,eax
    4b3a:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    4b3e:	09 d0                	or     eax,edx
    4b40:	0f b6 c0             	movzx  eax,al
    4b43:	83 ec 08             	sub    esp,0x8
    4b46:	50                   	push   eax
    4b47:	6a 21                	push   0x21
    4b49:	e8 da b4 ff ff       	call   0x28
    4b4e:	83 c4 10             	add    esp,0x10
    4b51:	90                   	nop
    4b52:	c9                   	leave  
    4b53:	c3                   	ret    
    4b54:	55                   	push   ebp
    4b55:	89 e5                	mov    ebp,esp
    4b57:	83 ec 18             	sub    esp,0x18
    4b5a:	83 7d 08 07          	cmp    DWORD PTR [ebp+0x8],0x7
    4b5e:	7f 06                	jg     0x4b66
    4b60:	c6 45 f7 21          	mov    BYTE PTR [ebp-0x9],0x21
    4b64:	eb 08                	jmp    0x4b6e
    4b66:	83 6d 08 08          	sub    DWORD PTR [ebp+0x8],0x8
    4b6a:	c6 45 f7 a1          	mov    BYTE PTR [ebp-0x9],0xa1
    4b6e:	83 ec 0c             	sub    esp,0xc
    4b71:	6a 21                	push   0x21
    4b73:	e8 bb b4 ff ff       	call   0x33
    4b78:	83 c4 10             	add    esp,0x10
    4b7b:	88 45 f6             	mov    BYTE PTR [ebp-0xa],al
    4b7e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
    4b81:	ba 01 00 00 00       	mov    edx,0x1
    4b86:	89 c1                	mov    ecx,eax
    4b88:	d3 e2                	shl    edx,cl
    4b8a:	89 d0                	mov    eax,edx
    4b8c:	f7 d0                	not    eax
    4b8e:	89 c2                	mov    edx,eax
    4b90:	0f b6 45 f6          	movzx  eax,BYTE PTR [ebp-0xa]
    4b94:	21 d0                	and    eax,edx
    4b96:	0f b6 c0             	movzx  eax,al
    4b99:	83 ec 08             	sub    esp,0x8
    4b9c:	50                   	push   eax
    4b9d:	6a 21                	push   0x21
    4b9f:	e8 84 b4 ff ff       	call   0x28
    4ba4:	83 c4 10             	add    esp,0x10
    4ba7:	90                   	nop
    4ba8:	c9                   	leave  
    4ba9:	c3                   	ret    
    4baa:	55                   	push   ebp
    4bab:	89 e5                	mov    ebp,esp
    4bad:	53                   	push   ebx
    4bae:	83 ec 04             	sub    esp,0x4
    4bb1:	83 ec 08             	sub    esp,0x8
    4bb4:	6a 0a                	push   0xa
    4bb6:	6a 20                	push   0x20
    4bb8:	e8 6b b4 ff ff       	call   0x28
    4bbd:	83 c4 10             	add    esp,0x10
    4bc0:	83 ec 08             	sub    esp,0x8
    4bc3:	6a 0a                	push   0xa
    4bc5:	68 a0 00 00 00       	push   0xa0
    4bca:	e8 59 b4 ff ff       	call   0x28
    4bcf:	83 c4 10             	add    esp,0x10
    4bd2:	83 ec 0c             	sub    esp,0xc
    4bd5:	68 a0 00 00 00       	push   0xa0
    4bda:	e8 54 b4 ff ff       	call   0x33
    4bdf:	83 c4 10             	add    esp,0x10
    4be2:	0f b6 d8             	movzx  ebx,al
    4be5:	83 ec 0c             	sub    esp,0xc
    4be8:	68 a0 00 00 00       	push   0xa0
    4bed:	e8 41 b4 ff ff       	call   0x33
    4bf2:	83 c4 10             	add    esp,0x10
    4bf5:	0f b6 c0             	movzx  eax,al
    4bf8:	c1 e0 08             	shl    eax,0x8
    4bfb:	09 d8                	or     eax,ebx
    4bfd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    4c00:	c9                   	leave  
    4c01:	c3                   	ret    
    4c02:	55                   	push   ebp
    4c03:	89 e5                	mov    ebp,esp
    4c05:	53                   	push   ebx
    4c06:	83 ec 04             	sub    esp,0x4
    4c09:	83 ec 08             	sub    esp,0x8
    4c0c:	6a 0b                	push   0xb
    4c0e:	6a 20                	push   0x20
    4c10:	e8 13 b4 ff ff       	call   0x28
    4c15:	83 c4 10             	add    esp,0x10
    4c18:	83 ec 08             	sub    esp,0x8
    4c1b:	6a 0b                	push   0xb
    4c1d:	68 a0 00 00 00       	push   0xa0
    4c22:	e8 01 b4 ff ff       	call   0x28
    4c27:	83 c4 10             	add    esp,0x10
    4c2a:	83 ec 0c             	sub    esp,0xc
    4c2d:	68 a0 00 00 00       	push   0xa0
    4c32:	e8 fc b3 ff ff       	call   0x33
    4c37:	83 c4 10             	add    esp,0x10
    4c3a:	0f b6 d8             	movzx  ebx,al
    4c3d:	83 ec 0c             	sub    esp,0xc
    4c40:	68 a0 00 00 00       	push   0xa0
    4c45:	e8 e9 b3 ff ff       	call   0x33
    4c4a:	83 c4 10             	add    esp,0x10
    4c4d:	0f b6 c0             	movzx  eax,al
    4c50:	c1 e0 08             	shl    eax,0x8
    4c53:	09 d8                	or     eax,ebx
    4c55:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
    4c58:	c9                   	leave  
    4c59:	c3                   	ret    
    4c5a:	66 90                	xchg   ax,ax
    4c5c:	66 90                	xchg   ax,ax
    4c5e:	66 90                	xchg   ax,ax
    4c60:	55                   	push   ebp
    4c61:	89 e5                	mov    ebp,esp
    4c63:	57                   	push   edi
    4c64:	56                   	push   esi
    4c65:	53                   	push   ebx
    4c66:	83 ec 1c             	sub    esp,0x1c
    4c69:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
    4c6c:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    4c6f:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
    4c72:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
    4c75:	89 7d e4             	mov    DWORD PTR [ebp-0x1c],edi
    4c78:	85 c0                	test   eax,eax
    4c7a:	75 1c                	jne    0x4c98
    4c7c:	39 de                	cmp    esi,ebx
    4c7e:	73 50                	jae    0x4cd0
    4c80:	89 f8                	mov    eax,edi
    4c82:	31 ff                	xor    edi,edi
    4c84:	89 f2                	mov    edx,esi
    4c86:	f7 f3                	div    ebx
    4c88:	89 fa                	mov    edx,edi
    4c8a:	83 c4 1c             	add    esp,0x1c
    4c8d:	5b                   	pop    ebx
    4c8e:	5e                   	pop    esi
    4c8f:	5f                   	pop    edi
    4c90:	5d                   	pop    ebp
    4c91:	c3                   	ret    
    4c92:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
    4c98:	39 c6                	cmp    esi,eax
    4c9a:	73 14                	jae    0x4cb0
    4c9c:	31 ff                	xor    edi,edi
    4c9e:	31 c0                	xor    eax,eax
    4ca0:	89 fa                	mov    edx,edi
    4ca2:	83 c4 1c             	add    esp,0x1c
    4ca5:	5b                   	pop    ebx
    4ca6:	5e                   	pop    esi
    4ca7:	5f                   	pop    edi
    4ca8:	5d                   	pop    ebp
    4ca9:	c3                   	ret    
    4caa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
    4cb0:	0f bd f8             	bsr    edi,eax
    4cb3:	83 f7 1f             	xor    edi,0x1f
    4cb6:	75 48                	jne    0x4d00
    4cb8:	39 f0                	cmp    eax,esi
    4cba:	72 07                	jb     0x4cc3
    4cbc:	31 c0                	xor    eax,eax
    4cbe:	39 5d e4             	cmp    DWORD PTR [ebp-0x1c],ebx
    4cc1:	72 dd                	jb     0x4ca0
    4cc3:	b8 01 00 00 00       	mov    eax,0x1
    4cc8:	eb d6                	jmp    0x4ca0
    4cca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
    4cd0:	89 d9                	mov    ecx,ebx
    4cd2:	85 db                	test   ebx,ebx
    4cd4:	75 0b                	jne    0x4ce1
    4cd6:	b8 01 00 00 00       	mov    eax,0x1
    4cdb:	31 d2                	xor    edx,edx
    4cdd:	f7 f3                	div    ebx
    4cdf:	89 c1                	mov    ecx,eax
    4ce1:	31 d2                	xor    edx,edx
    4ce3:	89 f0                	mov    eax,esi
    4ce5:	f7 f1                	div    ecx
    4ce7:	89 c6                	mov    esi,eax
    4ce9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
    4cec:	89 f7                	mov    edi,esi
    4cee:	f7 f1                	div    ecx
    4cf0:	89 fa                	mov    edx,edi
    4cf2:	83 c4 1c             	add    esp,0x1c
    4cf5:	5b                   	pop    ebx
    4cf6:	5e                   	pop    esi
    4cf7:	5f                   	pop    edi
    4cf8:	5d                   	pop    ebp
    4cf9:	c3                   	ret    
    4cfa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
    4d00:	89 f9                	mov    ecx,edi
    4d02:	ba 20 00 00 00       	mov    edx,0x20
    4d07:	29 fa                	sub    edx,edi
    4d09:	d3 e0                	shl    eax,cl
    4d0b:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
    4d0e:	89 d1                	mov    ecx,edx
    4d10:	89 d8                	mov    eax,ebx
    4d12:	d3 e8                	shr    eax,cl
    4d14:	89 c1                	mov    ecx,eax
    4d16:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    4d19:	09 c1                	or     ecx,eax
    4d1b:	89 f0                	mov    eax,esi
    4d1d:	89 4d e0             	mov    DWORD PTR [ebp-0x20],ecx
    4d20:	89 f9                	mov    ecx,edi
    4d22:	d3 e3                	shl    ebx,cl
    4d24:	89 d1                	mov    ecx,edx
    4d26:	d3 e8                	shr    eax,cl
    4d28:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
    4d2b:	89 f9                	mov    ecx,edi
    4d2d:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
    4d30:	d3 e6                	shl    esi,cl
    4d32:	89 d1                	mov    ecx,edx
    4d34:	d3 eb                	shr    ebx,cl
    4d36:	09 f3                	or     ebx,esi
    4d38:	89 c6                	mov    esi,eax
    4d3a:	89 f2                	mov    edx,esi
    4d3c:	89 d8                	mov    eax,ebx
    4d3e:	f7 75 e0             	div    DWORD PTR [ebp-0x20]
    4d41:	89 d6                	mov    esi,edx
    4d43:	89 c3                	mov    ebx,eax
    4d45:	f7 65 dc             	mul    DWORD PTR [ebp-0x24]
    4d48:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
    4d4b:	39 d6                	cmp    esi,edx
    4d4d:	72 21                	jb     0x4d70
    4d4f:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
    4d52:	89 f9                	mov    ecx,edi
    4d54:	d3 e2                	shl    edx,cl
    4d56:	39 c2                	cmp    edx,eax
    4d58:	73 07                	jae    0x4d61
    4d5a:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
    4d5d:	39 d6                	cmp    esi,edx
    4d5f:	74 0f                	je     0x4d70
    4d61:	89 d8                	mov    eax,ebx
    4d63:	31 ff                	xor    edi,edi
    4d65:	e9 36 ff ff ff       	jmp    0x4ca0
    4d6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
    4d70:	8d 43 ff             	lea    eax,[ebx-0x1]
    4d73:	31 ff                	xor    edi,edi
    4d75:	e9 26 ff ff ff       	jmp    0x4ca0
    4d7a:	66 90                	xchg   ax,ax
    4d7c:	66 90                	xchg   ax,ax
    4d7e:	66 90                	xchg   ax,ax
    4d80:	55                   	push   ebp
    4d81:	89 e5                	mov    ebp,esp
    4d83:	57                   	push   edi
    4d84:	56                   	push   esi
    4d85:	53                   	push   ebx
    4d86:	83 ec 2c             	sub    esp,0x2c
    4d89:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
    4d8c:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
    4d8f:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
    4d92:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
    4d95:	89 da                	mov    edx,ebx
    4d97:	85 c0                	test   eax,eax
    4d99:	75 15                	jne    0x4db0
    4d9b:	39 fb                	cmp    ebx,edi
    4d9d:	73 51                	jae    0x4df0
    4d9f:	89 f0                	mov    eax,esi
    4da1:	f7 f7                	div    edi
    4da3:	89 d0                	mov    eax,edx
    4da5:	31 d2                	xor    edx,edx
    4da7:	83 c4 2c             	add    esp,0x2c
    4daa:	5b                   	pop    ebx
    4dab:	5e                   	pop    esi
    4dac:	5f                   	pop    edi
    4dad:	5d                   	pop    ebp
    4dae:	c3                   	ret    
    4daf:	90                   	nop
    4db0:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
    4db3:	39 c3                	cmp    ebx,eax
    4db5:	73 11                	jae    0x4dc8
    4db7:	89 f0                	mov    eax,esi
    4db9:	83 c4 2c             	add    esp,0x2c
    4dbc:	5b                   	pop    ebx
    4dbd:	5e                   	pop    esi
    4dbe:	5f                   	pop    edi
    4dbf:	5d                   	pop    ebp
    4dc0:	c3                   	ret    
    4dc1:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
    4dc8:	0f bd c8             	bsr    ecx,eax
    4dcb:	83 f1 1f             	xor    ecx,0x1f
    4dce:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
    4dd1:	75 3d                	jne    0x4e10
    4dd3:	39 d8                	cmp    eax,ebx
    4dd5:	0f 82 cd 00 00 00    	jb     0x4ea8
    4ddb:	39 fe                	cmp    esi,edi
    4ddd:	0f 83 c5 00 00 00    	jae    0x4ea8
    4de3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    4de6:	83 c4 2c             	add    esp,0x2c
    4de9:	5b                   	pop    ebx
    4dea:	5e                   	pop    esi
    4deb:	5f                   	pop    edi
    4dec:	5d                   	pop    ebp
    4ded:	c3                   	ret    
    4dee:	66 90                	xchg   ax,ax
    4df0:	89 f9                	mov    ecx,edi
    4df2:	85 ff                	test   edi,edi
    4df4:	75 0b                	jne    0x4e01
    4df6:	b8 01 00 00 00       	mov    eax,0x1
    4dfb:	31 d2                	xor    edx,edx
    4dfd:	f7 f7                	div    edi
    4dff:	89 c1                	mov    ecx,eax
    4e01:	89 d8                	mov    eax,ebx
    4e03:	31 d2                	xor    edx,edx
    4e05:	f7 f1                	div    ecx
    4e07:	89 f0                	mov    eax,esi
    4e09:	f7 f1                	div    ecx
    4e0b:	eb 96                	jmp    0x4da3
    4e0d:	8d 76 00             	lea    esi,[esi+0x0]
    4e10:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
    4e13:	ba 20 00 00 00       	mov    edx,0x20
    4e18:	29 ca                	sub    edx,ecx
    4e1a:	d3 e0                	shl    eax,cl
    4e1c:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
    4e1f:	89 d1                	mov    ecx,edx
    4e21:	89 f8                	mov    eax,edi
    4e23:	d3 e8                	shr    eax,cl
    4e25:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
    4e28:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
    4e2c:	89 c2                	mov    edx,eax
    4e2e:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
    4e31:	d3 e7                	shl    edi,cl
    4e33:	09 c2                	or     edx,eax
    4e35:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
    4e38:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
    4e3b:	89 f7                	mov    edi,esi
    4e3d:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
    4e40:	89 da                	mov    edx,ebx
    4e42:	89 c1                	mov    ecx,eax
    4e44:	d3 ea                	shr    edx,cl
    4e46:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
    4e4a:	d3 e3                	shl    ebx,cl
    4e4c:	89 c1                	mov    ecx,eax
    4e4e:	d3 ef                	shr    edi,cl
    4e50:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
    4e54:	89 f8                	mov    eax,edi
    4e56:	d3 e6                	shl    esi,cl
    4e58:	09 d8                	or     eax,ebx
    4e5a:	f7 75 dc             	div    DWORD PTR [ebp-0x24]
    4e5d:	89 d3                	mov    ebx,edx
    4e5f:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
    4e62:	89 f7                	mov    edi,esi
    4e64:	f7 65 d8             	mul    DWORD PTR [ebp-0x28]
    4e67:	89 c6                	mov    esi,eax
    4e69:	89 d1                	mov    ecx,edx
    4e6b:	39 d3                	cmp    ebx,edx
    4e6d:	72 06                	jb     0x4e75
    4e6f:	75 0e                	jne    0x4e7f
    4e71:	39 c7                	cmp    edi,eax
    4e73:	73 0a                	jae    0x4e7f
    4e75:	2b 45 d8             	sub    eax,DWORD PTR [ebp-0x28]
    4e78:	1b 55 dc             	sbb    edx,DWORD PTR [ebp-0x24]
    4e7b:	89 d1                	mov    ecx,edx
    4e7d:	89 c6                	mov    esi,eax
    4e7f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
    4e82:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
    4e85:	29 f0                	sub    eax,esi
    4e87:	19 cb                	sbb    ebx,ecx
    4e89:	0f b6 4d e0          	movzx  ecx,BYTE PTR [ebp-0x20]
    4e8d:	89 da                	mov    edx,ebx
    4e8f:	d3 e2                	shl    edx,cl
    4e91:	89 f9                	mov    ecx,edi
    4e93:	d3 e8                	shr    eax,cl
    4e95:	d3 eb                	shr    ebx,cl
    4e97:	09 d0                	or     eax,edx
    4e99:	89 da                	mov    edx,ebx
    4e9b:	83 c4 2c             	add    esp,0x2c
    4e9e:	5b                   	pop    ebx
    4e9f:	5e                   	pop    esi
    4ea0:	5f                   	pop    edi
    4ea1:	5d                   	pop    ebp
    4ea2:	c3                   	ret    
    4ea3:	2e 8d 74 26 00       	lea    esi,cs:[esi+eiz*1+0x0]
    4ea8:	89 da                	mov    edx,ebx
    4eaa:	29 fe                	sub    esi,edi
    4eac:	19 c2                	sbb    edx,eax
    4eae:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
    4eb1:	e9 2d ff ff ff       	jmp    0x4de3
	...
    4ebe:	00 00                	add    BYTE PTR [eax],al
    4ec0:	4b                   	dec    ebx
    4ec1:	65 72 6e             	gs jb  0x4f32
    4ec4:	65 6c                	gs ins BYTE PTR es:[edi],dx
    4ec6:	20 49 2f             	and    BYTE PTR [ecx+0x2f],cl
    4ec9:	4f                   	dec    edi
    4eca:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
    4ecd:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x617a696c
    4ed4:	61 
    4ed5:	74 69                	je     0x4f40
    4ed7:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4ed8:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4ed9:	20 43 6f             	and    BYTE PTR [ebx+0x6f],al
    4edc:	6d                   	ins    DWORD PTR es:[edi],dx
    4edd:	70 6c                	jo     0x4f4b
    4edf:	65 74 65             	gs je  0x4f47
    4ee2:	21 0a                	and    DWORD PTR [edx],ecx
    4ee4:	42                   	inc    edx
    4ee5:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4ee6:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4ee7:	74 65                	je     0x4f4e
    4ee9:	64 20 66 72          	and    BYTE PTR fs:[esi+0x72],ah
    4eed:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4eee:	6d                   	ins    DWORD PTR es:[edi],dx
    4eef:	20 64 72 69          	and    BYTE PTR [edx+esi*2+0x69],ah
    4ef3:	76 65                	jbe    0x4f5a
    4ef5:	3a 20                	cmp    ah,BYTE PTR [eax]
    4ef7:	25 6c 75 0a 00       	and    eax,0xa756c
    4efc:	49                   	dec    ecx
    4efd:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4efe:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x697a696c
    4f05:	69 
    4f06:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f07:	67 20 48 41          	and    BYTE PTR [bx+si+0x41],cl
    4f0b:	4c                   	dec    esp
    4f0c:	2e 2e 2e 20 00       	cs cs and BYTE PTR cs:[eax],al
    4f11:	00 00                	add    BYTE PTR [eax],al
    4f13:	00 44 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],al
    4f17:	65 21 0a             	and    DWORD PTR gs:[edx],ecx
    4f1a:	49                   	dec    ecx
    4f1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f1c:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x697a696c
    4f23:	69 
    4f24:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f25:	67 20 4d 65          	and    BYTE PTR [di+0x65],cl
    4f29:	6d                   	ins    DWORD PTR es:[edi],dx
    4f2a:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4f2b:	72 79                	jb     0x4fa6
    4f2d:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
    4f30:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f31:	61                   	popa   
    4f32:	67 65 72 2e          	addr16 gs jb 0x4f64
    4f36:	2e 2e 0a 00          	cs or  al,BYTE PTR cs:[eax]
    4f3a:	00 00                	add    BYTE PTR [eax],al
    4f3c:	44                   	inc    esp
    4f3d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4f3e:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f3f:	65 21 0a             	and    DWORD PTR gs:[edx],ecx
    4f42:	55                   	push   ebp
    4f43:	73 61                	jae    0x4fa6
    4f45:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
    4f49:	52                   	push   edx
    4f4a:	61                   	popa   
    4f4b:	6d                   	ins    DWORD PTR es:[edi],dx
    4f4c:	3a 20                	cmp    ah,BYTE PTR [eax]
    4f4e:	25 6c 6c 75 20       	and    eax,0x20756c6c
    4f53:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
    4f57:	6b 73 2c 20          	imul   esi,DWORD PTR [ebx+0x2c],0x20
    4f5b:	25 6c 6c 75 20       	and    eax,0x20756c6c
    4f60:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
    4f63:	65 73 0a             	gs jae 0x4f70
    4f66:	53                   	push   ebx
    4f67:	79 73                	jns    0x4fdc
    4f69:	74 65                	je     0x4fd0
    4f6b:	6d                   	ins    DWORD PTR es:[edi],dx
    4f6c:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
    4f6f:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x617a696c
    4f76:	61 
    4f77:	74 69                	je     0x4fe2
    4f79:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4f7a:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f7b:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
    4f7e:	6d                   	ins    DWORD PTR es:[edi],dx
    4f7f:	70 6c                	jo     0x4fed
    4f81:	65 74 65             	gs je  0x4fe9
    4f84:	21 0a                	and    DWORD PTR [edx],ecx
    4f86:	00 75 73             	add    BYTE PTR [ebp+0x73],dh
    4f89:	65 72 40             	gs jb  0x4fcc
    4f8c:	6d                   	ins    DWORD PTR es:[edi],dx
    4f8d:	61                   	popa   
    4f8e:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
    4f91:	6e                   	outs   dx,BYTE PTR ds:[esi]
    4f92:	65 3a 2f             	cmp    ch,BYTE PTR gs:[edi]
    4f95:	24 20                	and    al,0x20
    4f97:	00 25 64 00 00 52    	add    BYTE PTR ds:0x52000064,ah
    4f9d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4f9e:	6f                   	outs   dx,DWORD PTR ds:[esi]
    4f9f:	74 20                	je     0x4fc1
    4fa1:	54                   	push   esp
    4fa2:	65 72 6d             	gs jb  0x5012
    4fa5:	69 6e 61 6c 00 00 00 	imul   ebp,DWORD PTR [esi+0x61],0x6c
    4fac:	30 31                	xor    BYTE PTR [ecx],dh
    4fae:	32 33                	xor    dh,BYTE PTR [ebx]
    4fb0:	34 35                	xor    al,0x35
    4fb2:	36 37                	ss aaa 
    4fb4:	38 39                	cmp    BYTE PTR [ecx],bh
    4fb6:	61                   	popa   
    4fb7:	62 63 64             	bound  esp,QWORD PTR [ebx+0x64]
    4fba:	65 66 00 00          	data16 add BYTE PTR gs:[eax],al
    4fbe:	00 00                	add    BYTE PTR [eax],al
    4fc0:	7c 11                	jl     0x4fd3
    4fc2:	03 00                	add    eax,DWORD PTR [eax]
    4fc4:	ab                   	stos   DWORD PTR es:[edi],eax
    4fc5:	11 03                	adc    DWORD PTR [ebx],eax
    4fc7:	00 e4                	add    ah,ah
    4fc9:	11 03                	adc    DWORD PTR [ebx],eax
    4fcb:	00 01                	add    BYTE PTR [ecx],al
    4fcd:	12 03                	adc    al,BYTE PTR [ebx]
    4fcf:	00 22                	add    BYTE PTR [edx],ah
    4fd1:	12 03                	adc    al,BYTE PTR [ebx]
    4fd3:	00 bd 12 03 00 df    	add    BYTE PTR [ebp-0x20fffcee],bh
    4fd9:	12 03                	adc    al,BYTE PTR [ebx]
    4fdb:	00 df                	add    bh,bl
    4fdd:	12 03                	adc    al,BYTE PTR [ebx]
    4fdf:	00 df                	add    bh,bl
    4fe1:	12 03                	adc    al,BYTE PTR [ebx]
    4fe3:	00 df                	add    bh,bl
    4fe5:	12 03                	adc    al,BYTE PTR [ebx]
    4fe7:	00 df                	add    bh,bl
    4fe9:	12 03                	adc    al,BYTE PTR [ebx]
    4feb:	00 df                	add    bh,bl
    4fed:	12 03                	adc    al,BYTE PTR [ebx]
    4fef:	00 df                	add    bh,bl
    4ff1:	12 03                	adc    al,BYTE PTR [ebx]
    4ff3:	00 df                	add    bh,bl
    4ff5:	12 03                	adc    al,BYTE PTR [ebx]
    4ff7:	00 df                	add    bh,bl
    4ff9:	12 03                	adc    al,BYTE PTR [ebx]
    4ffb:	00 df                	add    bh,bl
    4ffd:	12 03                	adc    al,BYTE PTR [ebx]
    4fff:	00 60 12             	add    BYTE PTR [eax+0x12],ah
    5002:	03 00                	add    eax,DWORD PTR [eax]
    5004:	9b                   	fwait
    5005:	12 03                	adc    al,BYTE PTR [ebx]
    5007:	00 df                	add    bh,bl
    5009:	12 03                	adc    al,BYTE PTR [ebx]
    500b:	00 df                	add    bh,bl
    500d:	12 03                	adc    al,BYTE PTR [ebx]
    500f:	00 df                	add    bh,bl
    5011:	12 03                	adc    al,BYTE PTR [ebx]
    5013:	00 df                	add    bh,bl
    5015:	12 03                	adc    al,BYTE PTR [ebx]
    5017:	00 9b 12 03 00 df    	add    BYTE PTR [ebx-0x20fffcee],bl
    501d:	12 03                	adc    al,BYTE PTR [ebx]
    501f:	00 df                	add    bh,bl
    5021:	12 03                	adc    al,BYTE PTR [ebx]
    5023:	00 df                	add    bh,bl
    5025:	12 03                	adc    al,BYTE PTR [ebx]
    5027:	00 df                	add    bh,bl
    5029:	12 03                	adc    al,BYTE PTR [ebx]
    502b:	00 df                	add    bh,bl
    502d:	12 03                	adc    al,BYTE PTR [ebx]
    502f:	00 ce                	add    dh,cl
    5031:	12 03                	adc    al,BYTE PTR [ebx]
    5033:	00 bd 12 03 00 df    	add    BYTE PTR [ebp-0x20fffcee],bh
    5039:	12 03                	adc    al,BYTE PTR [ebx]
    503b:	00 df                	add    bh,bl
    503d:	12 03                	adc    al,BYTE PTR [ebx]
    503f:	00 79 12             	add    BYTE PTR [ecx+0x12],bh
    5042:	03 00                	add    eax,DWORD PTR [eax]
    5044:	df 12                	fist   WORD PTR [edx]
    5046:	03 00                	add    eax,DWORD PTR [eax]
    5048:	ac                   	lods   al,BYTE PTR ds:[esi]
    5049:	12 03                	adc    al,BYTE PTR [ebx]
    504b:	00 df                	add    bh,bl
    504d:	12 03                	adc    al,BYTE PTR [ebx]
    504f:	00 df                	add    bh,bl
    5051:	12 03                	adc    al,BYTE PTR [ebx]
    5053:	00 bd 12 03 00 63    	add    BYTE PTR [ebp+0x63000312],bh
    5059:	14 03                	adc    al,0x3
    505b:	00 6a 14             	add    BYTE PTR [edx+0x14],ch
    505e:	03 00                	add    eax,DWORD PTR [eax]
    5060:	71 14                	jno    0x5076
    5062:	03 00                	add    eax,DWORD PTR [eax]
    5064:	78 14                	js     0x507a
    5066:	03 00                	add    eax,DWORD PTR [eax]
    5068:	7f 14                	jg     0x507e
    506a:	03 00                	add    eax,DWORD PTR [eax]
    506c:	86 14 03             	xchg   BYTE PTR [ebx+eax*1],dl
    506f:	00 8d 14 03 00 94    	add    BYTE PTR [ebp-0x6bfffcec],cl
    5075:	14 03                	adc    al,0x3
    5077:	00 9b 14 03 00 a2    	add    BYTE PTR [ebx-0x5dfffcec],bl
    507d:	14 03                	adc    al,0x3
    507f:	00 d3                	add    bl,dl
    5081:	14 03                	adc    al,0x3
    5083:	00 d3                	add    bl,dl
    5085:	14 03                	adc    al,0x3
    5087:	00 d3                	add    bl,dl
    5089:	14 03                	adc    al,0x3
    508b:	00 d3                	add    bl,dl
    508d:	14 03                	adc    al,0x3
    508f:	00 d3                	add    bl,dl
    5091:	14 03                	adc    al,0x3
    5093:	00 d3                	add    bl,dl
    5095:	14 03                	adc    al,0x3
    5097:	00 d3                	add    bl,dl
    5099:	14 03                	adc    al,0x3
    509b:	00 a9 14 03 00 b0    	add    BYTE PTR [ecx-0x4ffffcec],ch
    50a1:	14 03                	adc    al,0x3
    50a3:	00 b7 14 03 00 be    	add    BYTE PTR [edi-0x41fffcec],dh
    50a9:	14 03                	adc    al,0x3
    50ab:	00 c5                	add    ch,al
    50ad:	14 03                	adc    al,0x3
    50af:	00 cc                	add    ah,cl
    50b1:	14 03                	adc    al,0x3
    50b3:	00 d3                	add    bl,dl
    50b5:	14 03                	adc    al,0x3
    50b7:	00 d3                	add    bl,dl
    50b9:	14 03                	adc    al,0x3
    50bb:	00 d3                	add    bl,dl
    50bd:	14 03                	adc    al,0x3
    50bf:	00 d3                	add    bl,dl
    50c1:	14 03                	adc    al,0x3
    50c3:	00 d3                	add    bl,dl
    50c5:	14 03                	adc    al,0x3
    50c7:	00 d3                	add    bl,dl
    50c9:	14 03                	adc    al,0x3
    50cb:	00 d3                	add    bl,dl
    50cd:	14 03                	adc    al,0x3
    50cf:	00 d3                	add    bl,dl
    50d1:	14 03                	adc    al,0x3
    50d3:	00 d3                	add    bl,dl
    50d5:	14 03                	adc    al,0x3
    50d7:	00 d3                	add    bl,dl
    50d9:	14 03                	adc    al,0x3
    50db:	00 d3                	add    bl,dl
    50dd:	14 03                	adc    al,0x3
    50df:	00 d3                	add    bl,dl
    50e1:	14 03                	adc    al,0x3
    50e3:	00 d3                	add    bl,dl
    50e5:	14 03                	adc    al,0x3
    50e7:	00 d3                	add    bl,dl
    50e9:	14 03                	adc    al,0x3
    50eb:	00 d3                	add    bl,dl
    50ed:	14 03                	adc    al,0x3
    50ef:	00 d3                	add    bl,dl
    50f1:	14 03                	adc    al,0x3
    50f3:	00 d3                	add    bl,dl
    50f5:	14 03                	adc    al,0x3
    50f7:	00 d3                	add    bl,dl
    50f9:	14 03                	adc    al,0x3
    50fb:	00 d3                	add    bl,dl
    50fd:	14 03                	adc    al,0x3
    50ff:	00 d3                	add    bl,dl
    5101:	14 03                	adc    al,0x3
    5103:	00 d3                	add    bl,dl
    5105:	14 03                	adc    al,0x3
    5107:	00 d3                	add    bl,dl
    5109:	14 03                	adc    al,0x3
    510b:	00 d3                	add    bl,dl
    510d:	14 03                	adc    al,0x3
    510f:	00 d3                	add    bl,dl
    5111:	14 03                	adc    al,0x3
    5113:	00 d3                	add    bl,dl
    5115:	14 03                	adc    al,0x3
    5117:	00 d3                	add    bl,dl
    5119:	14 03                	adc    al,0x3
    511b:	00 a9 14 03 00 b0    	add    BYTE PTR [ecx-0x4ffffcec],ch
    5121:	14 03                	adc    al,0x3
    5123:	00 b7 14 03 00 be    	add    BYTE PTR [edi-0x41fffcec],dh
    5129:	14 03                	adc    al,0x3
    512b:	00 c5                	add    ch,al
    512d:	14 03                	adc    al,0x3
    512f:	00 cc                	add    ah,cl
    5131:	14 03                	adc    al,0x3
    5133:	00 5c 1a 03          	add    BYTE PTR [edx+ebx*1+0x3],bl
    5137:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    513d:	1a 03                	sbb    al,BYTE PTR [ebx]
    513f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5145:	1a 03                	sbb    al,BYTE PTR [ebx]
    5147:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    514d:	1a 03                	sbb    al,BYTE PTR [ebx]
    514f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5155:	1a 03                	sbb    al,BYTE PTR [ebx]
    5157:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    515d:	1a 03                	sbb    al,BYTE PTR [ebx]
    515f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5165:	1a 03                	sbb    al,BYTE PTR [ebx]
    5167:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    516d:	1a 03                	sbb    al,BYTE PTR [ebx]
    516f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5175:	1a 03                	sbb    al,BYTE PTR [ebx]
    5177:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    517d:	1a 03                	sbb    al,BYTE PTR [ebx]
    517f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5185:	1a 03                	sbb    al,BYTE PTR [ebx]
    5187:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    518d:	1a 03                	sbb    al,BYTE PTR [ebx]
    518f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5195:	1a 03                	sbb    al,BYTE PTR [ebx]
    5197:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    519d:	1a 03                	sbb    al,BYTE PTR [ebx]
    519f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51a5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51a7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51ad:	1a 03                	sbb    al,BYTE PTR [ebx]
    51af:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51b5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51b7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51bd:	1a 03                	sbb    al,BYTE PTR [ebx]
    51bf:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51c5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51c7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51cd:	1a 03                	sbb    al,BYTE PTR [ebx]
    51cf:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51d5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51d7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51dd:	1a 03                	sbb    al,BYTE PTR [ebx]
    51df:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51e5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51e7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51ed:	1a 03                	sbb    al,BYTE PTR [ebx]
    51ef:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51f5:	1a 03                	sbb    al,BYTE PTR [ebx]
    51f7:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    51fd:	1a 03                	sbb    al,BYTE PTR [ebx]
    51ff:	00 a9 18 03 00 aa    	add    BYTE PTR [ecx-0x55fffce8],ch
    5205:	1a 03                	sbb    al,BYTE PTR [ebx]
    5207:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    520d:	1a 03                	sbb    al,BYTE PTR [ebx]
    520f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5215:	1a 03                	sbb    al,BYTE PTR [ebx]
    5217:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    521d:	1a 03                	sbb    al,BYTE PTR [ebx]
    521f:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    5225:	1a 03                	sbb    al,BYTE PTR [ebx]
    5227:	00 aa 1a 03 00 ea    	add    BYTE PTR [edx-0x15fffce6],ch
    522d:	19 03                	sbb    DWORD PTR [ebx],eax
    522f:	00 01                	add    BYTE PTR [ecx],al
    5231:	16                   	push   ss
    5232:	03 00                	add    eax,DWORD PTR [eax]
    5234:	aa                   	stos   BYTE PTR es:[edi],al
    5235:	1a 03                	sbb    al,BYTE PTR [ebx]
    5237:	00 aa 1a 03 00 aa    	add    BYTE PTR [edx-0x55fffce6],ch
    523d:	1a 03                	sbb    al,BYTE PTR [ebx]
    523f:	00 f2                	add    dl,dh
    5241:	15 03 00 01 16       	adc    eax,0x16010003
    5246:	03 00                	add    eax,DWORD PTR [eax]
    5248:	aa                   	stos   BYTE PTR es:[edi],al
    5249:	1a 03                	sbb    al,BYTE PTR [ebx]
    524b:	00 aa 1a 03 00 e3    	add    BYTE PTR [edx-0x1cfffce6],ch
    5251:	15 03 00 aa 1a       	adc    eax,0x1aaa0003
    5256:	03 00                	add    eax,DWORD PTR [eax]
    5258:	aa                   	stos   BYTE PTR es:[edi],al
    5259:	1a 03                	sbb    al,BYTE PTR [ebx]
    525b:	00 de                	add    dh,bl
    525d:	19 03                	sbb    DWORD PTR [ebx],eax
    525f:	00 a9 18 03 00 aa    	add    BYTE PTR [ecx-0x55fffce8],ch
    5265:	1a 03                	sbb    al,BYTE PTR [ebx]
    5267:	00 aa 1a 03 00 0e    	add    BYTE PTR [edx+0xe00031a],ch
    526d:	1a 03                	sbb    al,BYTE PTR [ebx]
    526f:	00 aa 1a 03 00 67    	add    BYTE PTR [edx+0x6700031a],ch
    5275:	17                   	pop    ss
    5276:	03 00                	add    eax,DWORD PTR [eax]
    5278:	aa                   	stos   BYTE PTR es:[edi],al
    5279:	1a 03                	sbb    al,BYTE PTR [ebx]
    527b:	00 aa 1a 03 00 a9    	add    BYTE PTR [edx-0x56fffce6],ch
    5281:	18 03                	sbb    BYTE PTR [ebx],al
    5283:	00 45 72             	add    BYTE PTR [ebp+0x72],al
    5286:	72 6f                	jb     0x52f7
    5288:	72 3a                	jb     0x52c4
    528a:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
    528d:	76 61                	jbe    0x52f0
    528f:	6c                   	ins    BYTE PTR es:[edi],dx
    5290:	69 64 20 64 69 6d 65 	imul   esp,DWORD PTR [eax+eiz*1+0x64],0x6e656d69
    5297:	6e 
    5298:	73 69                	jae    0x5303
    529a:	6f                   	outs   dx,DWORD PTR ds:[esi]
    529b:	6e                   	outs   dx,BYTE PTR ds:[esi]
    529c:	73 20                	jae    0x52be
    529e:	66 6f                	outs   dx,WORD PTR ds:[esi]
    52a0:	72 20                	jb     0x52c2
    52a2:	74 65                	je     0x5309
    52a4:	72 6d                	jb     0x5313
    52a6:	69 6e 61 6c 20 69 6e 	imul   ebp,DWORD PTR [esi+0x61],0x6e69206c
    52ad:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [ecx+ebp*2+0x61],0x617a696c
    52b4:	61 
    52b5:	74 69                	je     0x5320
    52b7:	6f                   	outs   dx,DWORD PTR ds:[esi]
    52b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
    52b9:	21 00                	and    DWORD PTR [eax],eax
    52bb:	00 46 6f             	add    BYTE PTR [esi+0x6f],al
    52be:	75 6e                	jne    0x532e
    52c0:	64 20 62 6c          	and    BYTE PTR fs:[edx+0x6c],ah
    52c4:	6f                   	outs   dx,DWORD PTR ds:[esi]
    52c5:	63 6b 20             	arpl   WORD PTR [ebx+0x20],bp
    52c8:	6f                   	outs   dx,DWORD PTR ds:[esi]
    52c9:	66 20 73 69          	data16 and BYTE PTR [ebx+0x69],dh
    52cd:	7a 65                	jp     0x5334
    52cf:	20 25 6c 64 2c 20    	and    BYTE PTR ds:0x202c646c,ah
    52d5:	32 5e 25             	xor    bl,BYTE PTR [esi+0x25]
    52d8:	64 3b 20             	cmp    esp,DWORD PTR fs:[eax]
    52db:	72 65                	jb     0x5342
    52dd:	6d                   	ins    DWORD PTR es:[edi],dx
    52de:	61                   	popa   
    52df:	69 6e 69 6e 67 20 62 	imul   ebp,DWORD PTR [esi+0x69],0x6220676e
    52e6:	6c                   	ins    BYTE PTR es:[edi],dx
    52e7:	6f                   	outs   dx,DWORD PTR ds:[esi]
    52e8:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
    52eb:	3a 20                	cmp    ah,BYTE PTR [eax]
    52ed:	25 64 0a 00 00       	and    eax,0xa64
    52f2:	00 00                	add    BYTE PTR [eax],al
    52f4:	53                   	push   ebx
    52f5:	74 61                	je     0x5358
    52f7:	72 74                	jb     0x536d
    52f9:	20 41 64             	and    BYTE PTR [ecx+0x64],al
    52fc:	64 72 65             	fs jb  0x5364
    52ff:	73 73                	jae    0x5374
    5301:	3a 20                	cmp    ah,BYTE PTR [eax]
    5303:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
    5306:	6c                   	ins    BYTE PTR es:[edi],dx
    5307:	6c                   	ins    BYTE PTR es:[edi],dx
    5308:	78 0a                	js     0x5314
    530a:	45                   	inc    ebp
    530b:	6e                   	outs   dx,BYTE PTR ds:[esi]
    530c:	64 20 41 64          	and    BYTE PTR fs:[ecx+0x64],al
    5310:	64 72 65             	fs jb  0x5378
    5313:	73 73                	jae    0x5388
    5315:	3a 20                	cmp    ah,BYTE PTR [eax]
    5317:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
    531a:	6c                   	ins    BYTE PTR es:[edi],dx
    531b:	6c                   	ins    BYTE PTR es:[edi],dx
    531c:	78 0a                	js     0x5328
    531e:	53                   	push   ebx
    531f:	69 7a 65 3a 20 25 6c 	imul   edi,DWORD PTR [edx+0x65],0x6c25203a
    5326:	75 20                	jne    0x5348
    5328:	62 6c 6f 63          	bound  ebp,QWORD PTR [edi+ebp*2+0x63]
    532c:	6b 73 2c 20          	imul   esi,DWORD PTR [ebx+0x2c],0x20
    5330:	25 6c 6c 75 20       	and    eax,0x20756c6c
    5335:	62 79 74             	bound  edi,QWORD PTR [ecx+0x74]
    5338:	65 73 0a             	gs jae 0x5345
    533b:	00 55 6e             	add    BYTE PTR [ebp+0x6e],dl
    533e:	68 61 6e 64 6c       	push   0x6c646e61
    5343:	65 64 20 49 52       	gs and BYTE PTR fs:[ecx+0x52],cl
    5348:	51                   	push   ecx
    5349:	20 25 64 20 20 49    	and    BYTE PTR ds:0x49202064,ah
    534f:	53                   	push   ebx
    5350:	52                   	push   edx
    5351:	3d 25 78 20 20       	cmp    eax,0x20207825
    5356:	49                   	dec    ecx
    5357:	52                   	push   edx
    5358:	52                   	push   edx
    5359:	3d 25 78 2e 2e       	cmp    eax,0x2e2e7825
    535e:	2e 0a 00             	or     al,BYTE PTR cs:[eax]
	...
    537d:	00 00                	add    BYTE PTR [eax],al
    537f:	00 44 69 76          	add    BYTE PTR [ecx+ebp*2+0x76],al
    5383:	69 64 65 20 62 79 20 	imul   esp,DWORD PTR [ebp+eiz*2+0x20],0x7a207962
    538a:	7a 
    538b:	65 72 6f             	gs jb  0x53fd
    538e:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
    5391:	72 6f                	jb     0x5402
    5393:	72 00                	jb     0x5395
    5395:	44                   	inc    esp
    5396:	65 62 75 67          	bound  esi,QWORD PTR gs:[ebp+0x67]
    539a:	00 4e 6f             	add    BYTE PTR [esi+0x6f],cl
    539d:	6e                   	outs   dx,BYTE PTR ds:[esi]
    539e:	2d 6d 61 73 6b       	sub    eax,0x6b73616d
    53a3:	61                   	popa   
    53a4:	62 6c 65 20          	bound  ebp,QWORD PTR [ebp+eiz*2+0x20]
    53a8:	49                   	dec    ecx
    53a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
    53aa:	74 65                	je     0x5411
    53ac:	72 72                	jb     0x5420
    53ae:	75 70                	jne    0x5420
    53b0:	74 00                	je     0x53b2
    53b2:	42                   	inc    edx
    53b3:	72 65                	jb     0x541a
    53b5:	61                   	popa   
    53b6:	6b 70 6f 69          	imul   esi,DWORD PTR [eax+0x6f],0x69
    53ba:	6e                   	outs   dx,BYTE PTR ds:[esi]
    53bb:	74 00                	je     0x53bd
    53bd:	4f                   	dec    edi
    53be:	76 65                	jbe    0x5425
    53c0:	72 66                	jb     0x5428
    53c2:	6c                   	ins    BYTE PTR es:[edi],dx
    53c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
    53c4:	77 00                	ja     0x53c6
    53c6:	42                   	inc    edx
    53c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
    53c8:	75 6e                	jne    0x5438
    53ca:	64 20 52 61          	and    BYTE PTR fs:[edx+0x61],dl
    53ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
    53cf:	67 65 20 45 78       	and    BYTE PTR gs:[di+0x78],al
    53d4:	63 65 65             	arpl   WORD PTR [ebp+0x65],sp
    53d7:	64 65 64 00 49 6e    	fs gs add BYTE PTR fs:[ecx+0x6e],cl
    53dd:	76 61                	jbe    0x5440
    53df:	6c                   	ins    BYTE PTR es:[edi],dx
    53e0:	69 64 20 4f 70 63 6f 	imul   esp,DWORD PTR [eax+eiz*1+0x4f],0x646f6370
    53e7:	64 
    53e8:	65 00 44 65 76       	add    BYTE PTR gs:[ebp+eiz*2+0x76],al
    53ed:	69 63 65 20 4e 6f 74 	imul   esp,DWORD PTR [ebx+0x65],0x746f4e20
    53f4:	20 41 76             	and    BYTE PTR [ecx+0x76],al
    53f7:	61                   	popa   
    53f8:	69 6c 61 62 6c 65 00 	imul   ebp,DWORD PTR [ecx+eiz*2+0x62],0x4400656c
    53ff:	44 
    5400:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5401:	75 62                	jne    0x5465
    5403:	6c                   	ins    BYTE PTR es:[edi],dx
    5404:	65 20 46 61          	and    BYTE PTR gs:[esi+0x61],al
    5408:	75 6c                	jne    0x5476
    540a:	74 00                	je     0x540c
    540c:	43                   	inc    ebx
    540d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    540e:	70 72                	jo     0x5482
    5410:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5411:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
    5414:	73 6f                	jae    0x5485
    5416:	72 20                	jb     0x5438
    5418:	53                   	push   ebx
    5419:	65 67 6d             	gs ins DWORD PTR es:[di],dx
    541c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    541e:	74 20                	je     0x5440
    5420:	4f                   	dec    edi
    5421:	76 65                	jbe    0x5488
    5423:	72 72                	jb     0x5497
    5425:	75 6e                	jne    0x5495
    5427:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
    542a:	76 61                	jbe    0x548d
    542c:	6c                   	ins    BYTE PTR es:[edi],dx
    542d:	69 64 20 54 53 53 00 	imul   esp,DWORD PTR [eax+eiz*1+0x54],0x53005353
    5434:	53 
    5435:	65 67 6d             	gs ins DWORD PTR es:[di],dx
    5438:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    543a:	74 20                	je     0x545c
    543c:	4e                   	dec    esi
    543d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    543e:	74 20                	je     0x5460
    5440:	50                   	push   eax
    5441:	72 65                	jb     0x54a8
    5443:	73 65                	jae    0x54aa
    5445:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5446:	74 00                	je     0x5448
    5448:	53                   	push   ebx
    5449:	74 61                	je     0x54ac
    544b:	63 6b 2d             	arpl   WORD PTR [ebx+0x2d],bp
    544e:	53                   	push   ebx
    544f:	65 67 6d             	gs ins DWORD PTR es:[di],dx
    5452:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    5454:	74 20                	je     0x5476
    5456:	46                   	inc    esi
    5457:	61                   	popa   
    5458:	75 6c                	jne    0x54c6
    545a:	74 00                	je     0x545c
    545c:	47                   	inc    edi
    545d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    545f:	65 72 61             	gs jb  0x54c3
    5462:	6c                   	ins    BYTE PTR es:[edi],dx
    5463:	20 50 72             	and    BYTE PTR [eax+0x72],dl
    5466:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5467:	74 65                	je     0x54ce
    5469:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
    546d:	6e                   	outs   dx,BYTE PTR ds:[esi]
    546e:	20 46 61             	and    BYTE PTR [esi+0x61],al
    5471:	75 6c                	jne    0x54df
    5473:	74 00                	je     0x5475
    5475:	50                   	push   eax
    5476:	61                   	popa   
    5477:	67 65 20 46 61       	and    BYTE PTR gs:[bp+0x61],al
    547c:	75 6c                	jne    0x54ea
    547e:	74 00                	je     0x5480
    5480:	00 78 38             	add    BYTE PTR [eax+0x38],bh
    5483:	37                   	aaa    
    5484:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
    5487:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5488:	61                   	popa   
    5489:	74 69                	je     0x54f4
    548b:	6e                   	outs   dx,BYTE PTR ds:[esi]
    548c:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
    5492:	74 20                	je     0x54b4
    5494:	45                   	inc    ebp
    5495:	78 63                	js     0x54fa
    5497:	65 70 74             	gs jo  0x550e
    549a:	69 6f 6e 00 41 6c 69 	imul   ebp,DWORD PTR [edi+0x6e],0x696c4100
    54a1:	67 6e                	outs   dx,BYTE PTR ds:[si]
    54a3:	6d                   	ins    DWORD PTR es:[edi],dx
    54a4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
    54a6:	74 20                	je     0x54c8
    54a8:	43                   	inc    ebx
    54a9:	68 65 63 6b 00       	push   0x6b6365
    54ae:	4d                   	dec    ebp
    54af:	61                   	popa   
    54b0:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
    54b3:	6e                   	outs   dx,BYTE PTR ds:[esi]
    54b4:	65 20 43 68          	and    BYTE PTR gs:[ebx+0x68],al
    54b8:	65 63 6b 00          	arpl   WORD PTR gs:[ebx+0x0],bp
    54bc:	53                   	push   ebx
    54bd:	49                   	dec    ecx
    54be:	4d                   	dec    ebp
    54bf:	44                   	inc    esp
    54c0:	20 46 6c             	and    BYTE PTR [esi+0x6c],al
    54c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
    54c4:	61                   	popa   
    54c5:	74 69                	je     0x5530
    54c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
    54c8:	67 2d 50 6f 69 6e    	addr16 sub eax,0x6e696f50
    54ce:	74 20                	je     0x54f0
    54d0:	45                   	inc    ebp
    54d1:	78 63                	js     0x5536
    54d3:	65 70 74             	gs jo  0x554a
    54d6:	69 6f 6e 00 56 69 72 	imul   ebp,DWORD PTR [edi+0x6e],0x72695600
    54dd:	74 75                	je     0x5554
    54df:	61                   	popa   
    54e0:	6c                   	ins    BYTE PTR es:[edi],dx
    54e1:	69 7a 61 74 69 6f 6e 	imul   edi,DWORD PTR [edx+0x61],0x6e6f6974
    54e8:	20 45 78             	and    BYTE PTR [ebp+0x78],al
    54eb:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
    54ee:	74 69                	je     0x5559
    54f0:	6f                   	outs   dx,DWORD PTR ds:[esi]
    54f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
    54f2:	00 43 6f             	add    BYTE PTR [ebx+0x6f],al
    54f5:	6e                   	outs   dx,BYTE PTR ds:[esi]
    54f6:	74 72                	je     0x556a
    54f8:	6f                   	outs   dx,DWORD PTR ds:[esi]
    54f9:	6c                   	ins    BYTE PTR es:[edi],dx
    54fa:	20 50 72             	and    BYTE PTR [eax+0x72],dl
    54fd:	6f                   	outs   dx,DWORD PTR ds:[esi]
    54fe:	74 65                	je     0x5565
    5500:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
    5504:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5505:	20 45 78             	and    BYTE PTR [ebp+0x78],al
    5508:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
    550b:	74 69                	je     0x5576
    550d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    550e:	6e                   	outs   dx,BYTE PTR ds:[esi]
    550f:	20 00                	and    BYTE PTR [eax],al
    5511:	00 00                	add    BYTE PTR [eax],al
    5513:	00 48 79             	add    BYTE PTR [eax+0x79],cl
    5516:	70 65                	jo     0x557d
    5518:	72 76                	jb     0x5590
    551a:	69 73 6f 72 20 49 6e 	imul   esi,DWORD PTR [ebx+0x6f],0x6e492072
    5521:	6a 65                	push   0x65
    5523:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
    5527:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5528:	20 45 78             	and    BYTE PTR [ebp+0x78],al
    552b:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
    552e:	74 69                	je     0x5599
    5530:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5531:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5532:	00 56 4d             	add    BYTE PTR [esi+0x4d],dl
    5535:	4d                   	dec    ebp
    5536:	20 43 6f             	and    BYTE PTR [ebx+0x6f],al
    5539:	6d                   	ins    DWORD PTR es:[edi],dx
    553a:	6d                   	ins    DWORD PTR es:[edi],dx
    553b:	75 6e                	jne    0x55ab
    553d:	69 63 61 74 69 6f 6e 	imul   esp,DWORD PTR [ebx+0x61],0x6e6f6974
    5544:	20 45 78             	and    BYTE PTR [ebp+0x78],al
    5547:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
    554a:	74 69                	je     0x55b5
    554c:	6f                   	outs   dx,DWORD PTR ds:[esi]
    554d:	6e                   	outs   dx,BYTE PTR ds:[esi]
    554e:	00 53 65             	add    BYTE PTR [ebx+0x65],dl
    5551:	63 75 72             	arpl   WORD PTR [ebp+0x72],si
    5554:	69 74 79 20 45 78 63 	imul   esi,DWORD PTR [ecx+edi*2+0x20],0x65637845
    555b:	65 
    555c:	70 74                	jo     0x55d2
    555e:	69 6f 6e 00 00 00 00 	imul   ebp,DWORD PTR [edi+0x6e],0x0
	...
    557d:	00 00                	add    BYTE PTR [eax],al
    557f:	00 80 53 03 00 95    	add    BYTE PTR [eax-0x6afffcad],al
    5585:	53                   	push   ebx
    5586:	03 00                	add    eax,DWORD PTR [eax]
    5588:	9b                   	fwait
    5589:	53                   	push   ebx
    558a:	03 00                	add    eax,DWORD PTR [eax]
    558c:	b2 53                	mov    dl,0x53
    558e:	03 00                	add    eax,DWORD PTR [eax]
    5590:	bd 53 03 00 c6       	mov    ebp,0xc6000353
    5595:	53                   	push   ebx
    5596:	03 00                	add    eax,DWORD PTR [eax]
    5598:	db 53 03             	fist   DWORD PTR [ebx+0x3]
    559b:	00 ea                	add    dl,ch
    559d:	53                   	push   ebx
    559e:	03 00                	add    eax,DWORD PTR [eax]
    55a0:	ff 53 03             	call   DWORD PTR [ebx+0x3]
    55a3:	00 0c 54             	add    BYTE PTR [esp+edx*2],cl
    55a6:	03 00                	add    eax,DWORD PTR [eax]
    55a8:	28 54 03 00          	sub    BYTE PTR [ebx+eax*1+0x0],dl
    55ac:	34 54                	xor    al,0x54
    55ae:	03 00                	add    eax,DWORD PTR [eax]
    55b0:	48                   	dec    eax
    55b1:	54                   	push   esp
    55b2:	03 00                	add    eax,DWORD PTR [eax]
    55b4:	5c                   	pop    esp
    55b5:	54                   	push   esp
    55b6:	03 00                	add    eax,DWORD PTR [eax]
    55b8:	75 54                	jne    0x560e
    55ba:	03 00                	add    eax,DWORD PTR [eax]
    55bc:	80 54 03 00 81       	adc    BYTE PTR [ebx+eax*1+0x0],0x81
    55c1:	54                   	push   esp
    55c2:	03 00                	add    eax,DWORD PTR [eax]
    55c4:	9e                   	sahf   
    55c5:	54                   	push   esp
    55c6:	03 00                	add    eax,DWORD PTR [eax]
    55c8:	ae                   	scas   al,BYTE PTR es:[edi]
    55c9:	54                   	push   esp
    55ca:	03 00                	add    eax,DWORD PTR [eax]
    55cc:	bc 54 03 00 da       	mov    esp,0xda000354
    55d1:	54                   	push   esp
    55d2:	03 00                	add    eax,DWORD PTR [eax]
    55d4:	f3 54                	repz push esp
    55d6:	03 00                	add    eax,DWORD PTR [eax]
    55d8:	80 54 03 00 80       	adc    BYTE PTR [ebx+eax*1+0x0],0x80
    55dd:	54                   	push   esp
    55de:	03 00                	add    eax,DWORD PTR [eax]
    55e0:	80 54 03 00 80       	adc    BYTE PTR [ebx+eax*1+0x0],0x80
    55e5:	54                   	push   esp
    55e6:	03 00                	add    eax,DWORD PTR [eax]
    55e8:	80 54 03 00 80       	adc    BYTE PTR [ebx+eax*1+0x0],0x80
    55ed:	54                   	push   esp
    55ee:	03 00                	add    eax,DWORD PTR [eax]
    55f0:	14 55                	adc    al,0x55
    55f2:	03 00                	add    eax,DWORD PTR [eax]
    55f4:	33 55 03             	xor    edx,DWORD PTR [ebp+0x3]
    55f7:	00 4f 55             	add    BYTE PTR [edi+0x55],cl
    55fa:	03 00                	add    eax,DWORD PTR [eax]
    55fc:	80 54 03 00 55       	adc    BYTE PTR [ebx+eax*1+0x0],0x55
    5601:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5602:	68 61 6e 64 6c       	push   0x6c646e61
    5607:	65 64 20 69 6e       	gs and BYTE PTR fs:[ecx+0x6e],ch
    560c:	74 65                	je     0x5673
    560e:	72 72                	jb     0x5682
    5610:	75 70                	jne    0x5682
    5612:	74 20                	je     0x5634
    5614:	72 65                	jb     0x567b
    5616:	63 65 69             	arpl   WORD PTR [ebp+0x69],sp
    5619:	76 65                	jbe    0x5680
    561b:	64 3a 20             	cmp    ah,BYTE PTR fs:[eax]
    561e:	25 64 21 0a 00       	and    eax,0xa2164
    5623:	00 55 6e             	add    BYTE PTR [ebp+0x6e],dl
    5626:	68 61 6e 64 6c       	push   0x6c646e61
    562b:	65 64 20 65 78       	gs and BYTE PTR fs:[ebp+0x78],ah
    5630:	63 65 70             	arpl   WORD PTR [ebp+0x70],sp
    5633:	74 69                	je     0x569e
    5635:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5636:	6e                   	outs   dx,BYTE PTR ds:[esi]
    5637:	20 72 65             	and    BYTE PTR [edx+0x65],dh
    563a:	63 65 69             	arpl   WORD PTR [ebp+0x69],sp
    563d:	76 65                	jbe    0x56a4
    563f:	64 21 0a             	and    DWORD PTR fs:[edx],ecx
    5642:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
    5645:	74 65                	je     0x56ac
    5647:	72 72                	jb     0x56bb
    5649:	75 70                	jne    0x56bb
    564b:	74 20                	je     0x566d
    564d:	30 78 25             	xor    BYTE PTR [eax+0x25],bh
    5650:	78 3a                	js     0x568c
    5652:	20 25 73 0a 00 00    	and    BYTE PTR ds:0xa73,ah
    5658:	20 20                	and    BYTE PTR [eax],ah
    565a:	69 6e 74 65 72 72 75 	imul   ebp,DWORD PTR [esi+0x74],0x75727265
    5661:	70 74                	jo     0x56d7
    5663:	3d 30 78 25 78       	cmp    eax,0x78257830
    5668:	20 20                	and    BYTE PTR [eax],ah
    566a:	65 72 72             	gs jb  0x56df
    566d:	6f                   	outs   dx,DWORD PTR ds:[esi]
    566e:	72 5f                	jb     0x56cf
    5670:	63 6f 64             	arpl   WORD PTR [edi+0x64],bp
    5673:	65 3d 30 78 25 78    	gs cmp eax,0x78257830
    5679:	20 20                	and    BYTE PTR [eax],ah
    567b:	0a 00                	or     al,BYTE PTR [eax]
    567d:	00 00                	add    BYTE PTR [eax],al
    567f:	00 20                	add    BYTE PTR [eax],ah
    5681:	20 65 61             	and    BYTE PTR [ebp+0x61],ah
    5684:	78 3d                	js     0x56c3
    5686:	25 64 20 20 65       	and    eax,0x65202064
    568b:	62 78 3d             	bound  edi,QWORD PTR [eax+0x3d]
    568e:	25 64 20 20 65       	and    eax,0x65202064
    5693:	63 78 3d             	arpl   WORD PTR [eax+0x3d],di
    5696:	25 64 20 20 65       	and    eax,0x65202064
    569b:	64 78 3d             	fs js  0x56db
    569e:	25 64 20 20 65       	and    eax,0x65202064
    56a3:	73 69                	jae    0x570e
    56a5:	3d 25 64 20 20       	cmp    eax,0x20206425
    56aa:	65 64 69 3d 25 64 0a 	gs imul edi,DWORD PTR fs:0xa6425,0x20200000
    56b1:	00 00 00 20 20 
    56b6:	6b 65 72 6e          	imul   esp,DWORD PTR [ebp+0x72],0x6e
    56ba:	65 6c                	gs ins BYTE PTR es:[edi],dx
    56bc:	5f                   	pop    edi
    56bd:	65 73 70             	gs jae 0x5730
    56c0:	3d 25 64 20 20       	cmp    eax,0x20206425
    56c5:	65 62 70 3d          	bound  esi,QWORD PTR gs:[eax+0x3d]
    56c9:	25 64 20 20 65       	and    eax,0x65202064
    56ce:	69 70 3d 25 64 20 20 	imul   esi,DWORD PTR [eax+0x3d],0x20206425
    56d5:	63 73 3d             	arpl   WORD PTR [ebx+0x3d],si
    56d8:	25 64 0a 20 20       	and    eax,0x20200a64
    56dd:	65 66 6c             	gs data16 ins BYTE PTR es:[edi],dx
    56e0:	61                   	popa   
    56e1:	67 73 3d             	addr16 jae 0x5721
    56e4:	25 64 20 20 65       	and    eax,0x65202064
    56e9:	73 70                	jae    0x575b
    56eb:	3d 25 64 20 20       	cmp    eax,0x20206425
    56f0:	73 73                	jae    0x5765
    56f2:	3d 25 64 20 20       	cmp    eax,0x20206425
    56f7:	00 0a                	add    BYTE PTR [edx],cl
    56f9:	4b                   	dec    ebx
    56fa:	45                   	inc    ebp
    56fb:	52                   	push   edx
    56fc:	4e                   	dec    esi
    56fd:	45                   	inc    ebp
    56fe:	4c                   	dec    esp
    56ff:	20 50 41             	and    BYTE PTR [eax+0x41],dl
    5702:	4e                   	dec    esi
    5703:	49                   	dec    ecx
    5704:	43                   	inc    ebx
    5705:	21 0a                	and    DWORD PTR [edx],ecx
    5707:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
    570a:	00 00                	add    BYTE PTR [eax],al
    570c:	00 00                	add    BYTE PTR [eax],al
    570e:	00 00                	add    BYTE PTR [eax],al
    5710:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
    5713:	00 01                	add    BYTE PTR [ecx],al
    5715:	7c 08                	jl     0x571f
    5717:	01 1b                	add    DWORD PTR [ebx],ebx
    5719:	0c 04                	or     al,0x4
    571b:	04 88                	add    al,0x88
    571d:	01 00                	add    DWORD PTR [eax],eax
    571f:	00 48 00             	add    BYTE PTR [eax+0x0],cl
    5722:	00 00                	add    BYTE PTR [eax],al
    5724:	1c 00                	sbb    al,0x0
    5726:	00 00                	add    BYTE PTR [eax],al
    5728:	38 f5                	cmp    ch,dh
    572a:	ff                   	(bad)  
    572b:	ff 1a                	call   FWORD PTR [edx]
    572d:	01 00                	add    DWORD PTR [eax],eax
    572f:	00 00                	add    BYTE PTR [eax],al
    5731:	41                   	inc    ecx
    5732:	0e                   	push   cs
    5733:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
    5739:	46                   	inc    esi
    573a:	87 03                	xchg   DWORD PTR [ebx],eax
    573c:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
    573f:	05 65 0a c3 41       	add    eax,0x41c30a65
    5744:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    5748:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    574b:	04 47                	add    al,0x47
    574d:	0b 4e 0a             	or     ecx,DWORD PTR [esi+0xa]
    5750:	c3                   	ret    
    5751:	41                   	inc    ecx
    5752:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    5756:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    5759:	04 47                	add    al,0x47
    575b:	0b 02                	or     eax,DWORD PTR [edx]
    575d:	46                   	inc    esi
    575e:	0a c3                	or     al,bl
    5760:	41                   	inc    ecx
    5761:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    5765:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    5768:	04 47                	add    al,0x47
    576a:	0b 00                	or     eax,DWORD PTR [eax]
    576c:	14 00                	adc    al,0x0
    576e:	00 00                	add    BYTE PTR [eax],al
    5770:	00 00                	add    BYTE PTR [eax],al
    5772:	00 00                	add    BYTE PTR [eax],al
    5774:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
    5777:	00 01                	add    BYTE PTR [ecx],al
    5779:	7c 08                	jl     0x5783
    577b:	01 1b                	add    DWORD PTR [ebx],ebx
    577d:	0c 04                	or     al,0x4
    577f:	04 88                	add    al,0x88
    5781:	01 00                	add    DWORD PTR [eax],eax
    5783:	00 58 00             	add    BYTE PTR [eax+0x0],bl
    5786:	00 00                	add    BYTE PTR [eax],al
    5788:	1c 00                	sbb    al,0x0
    578a:	00 00                	add    BYTE PTR [eax],al
    578c:	f4                   	hlt    
    578d:	f5                   	cmc    
    578e:	ff                   	(bad)  
    578f:	ff 36                	push   DWORD PTR [esi]
    5791:	01 00                	add    DWORD PTR [eax],eax
    5793:	00 00                	add    BYTE PTR [eax],al
    5795:	41                   	inc    ecx
    5796:	0e                   	push   cs
    5797:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
    579d:	46                   	inc    esi
    579e:	87 03                	xchg   DWORD PTR [ebx],eax
    57a0:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
    57a3:	05 62 0a c3 41       	add    eax,0x41c30a62
    57a8:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    57ac:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    57af:	04 42                	add    al,0x42
    57b1:	0b 4d 0a             	or     ecx,DWORD PTR [ebp+0xa]
    57b4:	c3                   	ret    
    57b5:	41                   	inc    ecx
    57b6:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    57ba:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    57bd:	04 48                	add    al,0x48
    57bf:	0b 62 0a             	or     esp,DWORD PTR [edx+0xa]
    57c2:	c3                   	ret    
    57c3:	41                   	inc    ecx
    57c4:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    57c8:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    57cb:	04 43                	add    al,0x43
    57cd:	0b 02                	or     eax,DWORD PTR [edx]
    57cf:	af                   	scas   eax,DWORD PTR es:[edi]
    57d0:	0a c3                	or     al,bl
    57d2:	41                   	inc    ecx
    57d3:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
    57d7:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
    57da:	04 46                	add    al,0x46
    57dc:	0b 00                	or     eax,DWORD PTR [eax]
    57de:	00 00                	add    BYTE PTR [eax],al
    57e0:	48                   	dec    eax
    57e1:	65 6c                	gs ins BYTE PTR es:[edi],dx
    57e3:	6c                   	ins    BYTE PTR es:[edi],dx
    57e4:	6f                   	outs   dx,DWORD PTR ds:[esi]
    57e5:	20 57 6f             	and    BYTE PTR [edi+0x6f],dl
    57e8:	72 6c                	jb     0x5856
    57ea:	64 21 20             	and    DWORD PTR fs:[eax],esp
    57ed:	54                   	push   esp
    57ee:	68 69 73 20 69       	push   0x69207369
    57f3:	73 20                	jae    0x5815
    57f5:	66 6f                	outs   dx,WORD PTR ds:[esi]
    57f7:	72 20                	jb     0x5819
    57f9:	44                   	inc    esp
    57fa:	45                   	inc    ebp
    57fb:	42                   	inc    edx
    57fc:	55                   	push   ebp
    57fd:	47                   	inc    edi
    57fe:	20 70 75             	and    BYTE PTR [eax+0x75],dh
    5801:	72 70                	jb     0x5873
    5803:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5804:	73 65                	jae    0x586b
    5806:	73 20                	jae    0x5828
    5808:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5809:	6e                   	outs   dx,BYTE PTR ds:[esi]
    580a:	6c                   	ins    BYTE PTR es:[edi],dx
    580b:	79 2c                	jns    0x5839
    580d:	20 61 6e             	and    BYTE PTR [ecx+0x6e],ah
    5810:	64 20 73 68          	and    BYTE PTR fs:[ebx+0x68],dh
    5814:	6f                   	outs   dx,DWORD PTR ds:[esi]
    5815:	75 6c                	jne    0x5883
    5817:	64 20 4e 45          	and    BYTE PTR fs:[esi+0x45],cl
    581b:	56                   	push   esi
    581c:	45                   	inc    ebp
    581d:	52                   	push   edx
    581e:	20 62 65             	and    BYTE PTR [edx+0x65],ah
    5821:	20 76 69             	and    BYTE PTR [esi+0x69],dh
    5824:	73 69                	jae    0x588f
    5826:	62 6c 65 21          	bound  ebp,QWORD PTR [ebp+eiz*2+0x21]
	...
    5842:	21 40 23             	and    DWORD PTR [eax+0x23],eax
    5845:	24 25                	and    al,0x25
    5847:	5e                   	pop    esi
    5848:	26 2a 28             	sub    ch,BYTE PTR es:[eax]
    584b:	29 5f 2b             	sub    DWORD PTR [edi+0x2b],ebx
    584e:	08 09                	or     BYTE PTR [ecx],cl
    5850:	51                   	push   ecx
    5851:	57                   	push   edi
    5852:	45                   	inc    ebp
    5853:	52                   	push   edx
    5854:	54                   	push   esp
    5855:	59                   	pop    ecx
    5856:	55                   	push   ebp
    5857:	49                   	dec    ecx
    5858:	4f                   	dec    edi
    5859:	50                   	push   eax
    585a:	7b 7d                	jnp    0x58d9
    585c:	0a 00                	or     al,BYTE PTR [eax]
    585e:	41                   	inc    ecx
    585f:	53                   	push   ebx
    5860:	44                   	inc    esp
    5861:	46                   	inc    esi
    5862:	47                   	inc    edi
    5863:	48                   	dec    eax
    5864:	4a                   	dec    edx
    5865:	4b                   	dec    ebx
    5866:	4c                   	dec    esp
    5867:	3a 22                	cmp    ah,BYTE PTR [edx]
    5869:	7e 00                	jle    0x586b
    586b:	7c 5a                	jl     0x58c7
    586d:	58                   	pop    eax
    586e:	43                   	inc    ebx
    586f:	56                   	push   esi
    5870:	42                   	inc    edx
    5871:	4e                   	dec    esi
    5872:	4d                   	dec    ebp
    5873:	3c 3e                	cmp    al,0x3e
    5875:	3f                   	aas    
    5876:	00 00                	add    BYTE PTR [eax],al
    5878:	00 20                	add    BYTE PTR [eax],ah
	...
    5882:	31 32                	xor    DWORD PTR [edx],esi
    5884:	33 34 35 36 37 38 39 	xor    esi,DWORD PTR [esi*1+0x39383736]
    588b:	30 2d 3d 08 09 71    	xor    BYTE PTR ds:0x7109083d,ch
    5891:	77 65                	ja     0x58f8
    5893:	72 74                	jb     0x5909
    5895:	79 75                	jns    0x590c
    5897:	69 6f 70 5b 5d 0a 00 	imul   ebp,DWORD PTR [edi+0x70],0xa5d5b
    589e:	61                   	popa   
    589f:	73 64                	jae    0x5905
    58a1:	66 67 68 6a 6b       	addr16 pushw 0x6b6a
    58a6:	6c                   	ins    BYTE PTR es:[edi],dx
    58a7:	3b 27                	cmp    esp,DWORD PTR [edi]
    58a9:	60                   	pusha  
    58aa:	00 5c 7a 78          	add    BYTE PTR [edx+edi*2+0x78],bl
    58ae:	63 76 62             	arpl   WORD PTR [esi+0x62],si
    58b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
    58b2:	6d                   	ins    DWORD PTR es:[edi],dx
    58b3:	2c 2e                	sub    al,0x2e
    58b5:	2f                   	das    
    58b6:	00 00                	add    BYTE PTR [eax],al
    58b8:	00 20                	add    BYTE PTR [eax],ah
	...
    58c2:	00 00                	add    BYTE PTR [eax],al
    58c4:	ff                   	(bad)  
    58c5:	ff 00                	inc    DWORD PTR [eax]
    58c7:	00 00                	add    BYTE PTR [eax],al
    58c9:	9a cf 00 ff ff 00 00 	call   0x0:0xffff00cf
    58d0:	00 92 cf 00 17 00    	add    BYTE PTR [edx+0x1700cf],dl
    58d6:	bc 58 03 00 00       	mov    esp,0x358
    58db:	00 ff                	add    bh,bh
    58dd:	07                   	pop    es
    58de:	e0 65                	loopne 0x5945
    58e0:	03 00                	add    eax,DWORD PTR [eax]

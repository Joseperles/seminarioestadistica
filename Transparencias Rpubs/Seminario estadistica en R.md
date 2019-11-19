

Statistical  Econometric using R
========================================================
author: Jose F. Perles Ribes
date: july 2015
width: 1500
height: 900

What is R?
========================================================


- R is a language and environment for statistical computing and graphics.
- Developed by John Chambers and colleagues. R can be considered as a different implementation of S
- R provides a wide variety of statistical (linear and nonlinear modelling, classical statistical tests, time-series analysis, classification, clustering, .) and graphical techniques, and is highly extensible. 
- R is free


R in Statistics Econometrics Applications
========================================================


- There are many R packages done by contributors
- An IDE like R-Studio is highly reccommended
- R provides a high quality graphical capabilities through packages as ggplot or lattice that outperforms commercial econometric software.

R in this course
========================================================


- Load data and packages
- Exploratory statistics and graphs
- NHST.
- Correlation and Regression



Loading data
========================================================


```r
Datos <- read.csv("~/GitHub/seminarioestadistica/Datos.csv")
#Exploring file
class(Datos)
```

```
[1] "data.frame"
```

```r
dim(Datos)
```

```
[1] 151  73
```

Variables
========================================================


```r
str(Datos)
```

```
'data.frame':	151 obs. of  73 variables:
 $ Codine         : int  3014 3031 3047 3063 3065 3082 3121 3011 3018 3050 ...
 $ Lirmun         : Factor w/ 114 levels "03014 Alicante/Alacant",..: 1 3 4 114 6 114 10 114 2 5 ...
 $ Pob            : int  319380 67492 25190 40601 215137 28242 25494 16843 21154 23640 ...
 $ Sup            : num  201.3 38.5 23.5 66.2 326.1 ...
 $ Dens           : num  1587 1753 1071 613 660 ...
 $ Extran         : int  35588 17115 14765 11217 18666 14465 4700 8571 6541 4058 ...
 $ Porext         : num  0.1114 0.2536 0.5861 0.2763 0.0868 ...
 $ Mayor65        : int  50042 9847 6728 6184 27441 5795 3865 3199 3434 3410 ...
 $ Pormayor65     : num  0.157 0.146 0.267 0.152 0.128 ...
 $ CMerCA         : num  0.0922 0.0922 0.0922 0.0922 0.0922 ...
 $ Nivec03        : int  5 6 6 5 4 6 5 6 7 6 ...
 $ Nivec04        : int  4 5 5 5 4 5 5 5 6 5 ...
 $ Parreg         : num  4.2 3.3 2 3.4 7.7 1.6 3.6 2.2 2.3 3 ...
 $ Cmer05         : int  695 168 57 101 457 72 59 43 58 54 ...
 $ Cmer03         : int  697 167 54 98 455 74 52 40 55 51 ...
 $ Telfij         : int  119058 34756 12589 24026 60826 17177 13541 10134 12931 13630 ...
 $ Vmot           : int  189820 44217 14094 28048 131553 19922 12748 12078 16259 13951 ...
 $ Ofban          : int  281 69 20 34 145 28 23 21 23 20 ...
 $ Acind          : int  3344 1014 609 1335 4146 951 389 427 716 334 ...
 $ Acomay         : int  1469 125 59 116 1491 84 68 54 88 55 ...
 $ Acomin         : int  6565 2529 626 1220 4116 747 715 423 835 454 ...
 $ Scomin         : int  774228 170181 78441 172726 518667 87287 61874 69132 84968 44600 ...
 $ Ccom           : int  6 2 1 0 2 0 1 0 0 0 ...
 $ Sccom          : int  168172 47737 8000 0 52394 0 7500 0 0 0 ...
 $ Acresbar       : int  2479 1351 384 510 1322 403 277 250 295 261 ...
 $ Iindus         : int  553 58 26 63 506 40 19 16 30 15 ...
 $ Icomer         : int  907 164 41 85 647 52 42 35 52 29 ...
 $ Iresbar        : int  1012 373 69 125 593 85 69 48 58 60 ...
 $ Itur           : int  693 2882 104 181 145 74 50 129 79 32 ...
 $ Iae            : int  994 183 38 91 460 59 33 30 46 26 ...
 $ paseos         : int  4 3 5 1 0 3 4 0 1 2 ...
 $ cnautic        : int  0 1 1 2 0 0 0 0 1 2 ...
 $ bazul05        : int  3 3 3 4 3 3 3 1 1 2 ...
 $ nviviend       : int  153377 51427 18155 34055 90314 19801 33381 10160 12173 18883 ...
 $ porvpal        : num  67.9 41.3 42 36.3 71.1 37.1 22.1 46.2 48.2 38.3 ...
 $ porvisec       : num  17.9 32.2 55.8 52.9 15.6 53.6 53.3 21.6 17.2 52.4 ...
 $ porvivac       : num  13.3 15.5 2 10.3 12.6 6.9 24.4 26.3 31.9 4.1 ...
 $ porhvivprop    : num  84.5 73 76.7 83 89.3 79.3 85.2 78 79.7 86.6 ...
 $ porhvivalq     : num  11.5 21.1 18.3 12.3 6.4 15.3 8.4 16.6 14.3 8 ...
 $ porhvivotreg   : num  4 6 5.1 4.7 4.3 5.5 6.3 5.3 6 5.3 ...
 $ porhHdispsegviv: num  5.1 2.2 4.4 7.8 7.6 9.9 3.9 1.7 4.8 4.5 ...
 $ Poranalf       : num  11.3 12.7 6.1 9.3 19 6.6 18.6 4.9 11.1 14.6 ...
 $ Porestprim     : num  21 23.7 19.5 22.1 25.8 18.8 23.7 19.9 20.8 16.8 ...
 $ Porestsec      : num  52.1 55.7 66.9 56.3 47.6 62.6 48.9 62.4 55.1 53.1 ...
 $ Porestuniv     : num  15.8 8 7.4 12.4 7.6 12 8.7 12.8 13 15.3 ...
 $ Nhot05         : int  33 128 8 15 8 9 4 7 6 5 ...
 $ nhcatsup       : int  7 25 2 5 1 3 0 2 2 1 ...
 $ porhcatsup     : num  21.2 19.5 25 33.3 12.5 ...
 $ Ing01          : num  99646608 34612000 12701471 17116301 57125000 ...
 $ Ing02          : num  17195546 1300000 3768477 3800000 12050000 ...
 $ Ing03          : num  29653584 35160666 9546191 13708369 26752008 ...
 $ Ing04          : num  47757557 14279682 4846872 7916271 37485952 ...
 $ Ing05          : num  4599157 1851699 1003590 583230 741000 ...
 $ Ing06          : num  17850000 0 1186071 2966055 1823333 ...
 $ Ing07          : num  24282542 991500 0 1391472 4520198 ...
 $ Ing08          : num  750000 219000 0 0 300000 ...
 $ Ing09          : num  17022336 10460459 0 4590089 18881343 ...
 $ IngTot         : num  2.59e+08 9.89e+07 3.31e+07 5.21e+07 1.60e+08 ...
 $ Gas01          : num  72598170 29452609 12955492 15538963 50100704 ...
 $ Gas02          : num  73361066 32264806 10893200 16441951 44279100 ...
 $ Gas03          : num  4286847 2850000 902227 770081 3650768 ...
 $ Gas04          : num  29707201 8832187 1462779 2818714 15129087 ...
 $ Gas06          : num  50431762 20356404 3792365 13536191 26590215 ...
 $ Gas07          : num  9099949 0 172459 126251 747616 ...
 $ Gas08          : num  2250000 219000 18031 95016 300000 ...
 $ Gas09          : num  17022336 4900000 186433 2744620 18881343 ...
 $ TotGas         : num  2.59e+08 9.89e+07 3.04e+07 5.21e+07 1.60e+08 ...
 $ LIngporhab     : num  6.7 7.29 7.18 7.16 6.61 ...
 $ LGasporhab     : num  6.7 7.29 7.1 7.16 6.61 ...
 $ Portasas       : num  11.5 35.6 28.9 26.3 16.8 ...
 $ Porinver       : num  19.5 20.6 12.5 26 16.7 ...
 $ RivCom         : num  48.6 26.7 40.2 33.3 52.3 ...
 $ RivRes         : num  128.8 50 65.6 79.6 162.7 ...
```

Exploring data
========================================================


```r
head(Datos)
```

```
  Codine                 Lirmun    Pob    Sup    Dens Extran     Porext
1   3014 03014 Alicante/Alacant 319380 201.27 1586.82  35588 0.11142839
2   3031         03031 Benidorm  67492  38.51 1752.58  17115 0.25358561
3   3047       03047 Calpe/Calp  25190  23.51 1071.46  14765 0.58614530
4   3063                unknown  40601  66.19  613.40  11217 0.27627398
5   3065        03065 Elche/Elx 215137 326.07  659.79  18666 0.08676332
6   3082                unknown  28242  68.59  411.75  14465 0.51218044
  Mayor65 Pormayor65     CMerCA Nivec03 Nivec04 Parreg Cmer05 Cmer03
1   50042  0.1566848 0.09222964       5       4    4.2    695    697
2    9847  0.1458988 0.09222964       6       5    3.3    168    167
3    6728  0.2670901 0.09222964       6       5    2.0     57     54
4    6184  0.1523115 0.09222964       5       5    3.4    101     98
5   27441  0.1275513 0.09222964       4       4    7.7    457    455
6    5795  0.2051909 0.09222964       6       5    1.6     72     74
  Telfij   Vmot Ofban Acind Acomay Acomin Scomin Ccom  Sccom Acresbar
1 119058 189820   281  3344   1469   6565 774228    6 168172     2479
2  34756  44217    69  1014    125   2529 170181    2  47737     1351
3  12589  14094    20   609     59    626  78441    1   8000      384
4  24026  28048    34  1335    116   1220 172726    0      0      510
5  60826 131553   145  4146   1491   4116 518667    2  52394     1322
6  17177  19922    28   951     84    747  87287    0      0      403
  Iindus Icomer Iresbar Itur Iae paseos cnautic bazul05 nviviend porvpal
1    553    907    1012  693 994      4       0       3   153377    67.9
2     58    164     373 2882 183      3       1       3    51427    41.3
3     26     41      69  104  38      5       1       3    18155    42.0
4     63     85     125  181  91      1       2       4    34055    36.3
5    506    647     593  145 460      0       0       3    90314    71.1
6     40     52      85   74  59      3       0       3    19801    37.1
  porvisec porvivac porhvivprop porhvivalq porhvivotreg porhHdispsegviv
1     17.9     13.3        84.5       11.5          4.0             5.1
2     32.2     15.5        73.0       21.1          6.0             2.2
3     55.8      2.0        76.7       18.3          5.1             4.4
4     52.9     10.3        83.0       12.3          4.7             7.8
5     15.6     12.6        89.3        6.4          4.3             7.6
6     53.6      6.9        79.3       15.3          5.5             9.9
  Poranalf Porestprim Porestsec Porestuniv Nhot05 nhcatsup porhcatsup
1     11.3       21.0      52.1       15.8     33        7   21.21212
2     12.7       23.7      55.7        8.0    128       25   19.53125
3      6.1       19.5      66.9        7.4      8        2   25.00000
4      9.3       22.1      56.3       12.4     15        5   33.33333
5     19.0       25.8      47.6        7.6      8        1   12.50000
6      6.6       18.8      62.6       12.0      9        3   33.33333
     Ing01    Ing02    Ing03    Ing04     Ing05    Ing06      Ing07  Ing08
1 99646608 17195546 29653584 47757557 4599157.5 17850000 24282542.1 750000
2 34612000  1300000 35160666 14279682 1851699.1        0   991500.0 219000
3 12701471  3768477  9546191  4846872 1003589.7  1186071        0.0      0
4 17116301  3800000 13708369  7916271  583230.4  2966055  1391471.5      0
5 57125000 12050000 26752008 37485952  741000.0  1823333  4520197.8 300000
6 12309000  1400000  5880293  5100000  541255.4        0   220202.4      0
     Ing09    IngTot    Gas01    Gas02     Gas03    Gas04    Gas06
1 17022336 258757331 72598170 73361066 4286847.0 29707201 50431762
2 10460459  98875006 29452609 32264806 2850000.0  8832187 20356404
3        0  33052672 12955492 10893200  902226.9  1462779  3792365
4  4590089  52071786 15538963 16441951  770081.0  2818714 13536191
5 18881343 159678834 50100704 44279100 3650768.4 15129087 26590215
6  7969574  33420324 11515991 10467848  355325.8  1285932  8197615
      Gas07   Gas08      Gas09    TotGas LIngporhab LGasporhab Portasas
1 9099949.2 2250000 17022336.0 258757331   6.697264   6.697264 11.46000
2       0.0  219000  4900000.0  98875006   7.289603   7.289603 35.56072
3  172458.7   18031   186433.1  30382985   7.179411   7.095191 28.88175
4  126250.7   95016  2744620.0  52071786   7.156586   7.156586 26.32591
5  747616.1  300000 18881343.0 159678834   6.609645   6.609645 16.75363
6  197613.0       0  1400000.0  33420324   7.076109   7.076109 17.59496
  Porinver   RivCom    RivRes
1 19.48998 48.64890 128.83421
2 20.58802 26.68723  49.95707
3 12.48187 40.23962  65.59896
4 25.99525 33.27951  79.60980
5 16.65231 52.26846 162.73601
6 24.52883 37.80723  70.07940
```

Basic Plot
========================================================


```r
hist(Datos$Pob)
```

![plot of chunk unnamed-chunk-4](Seminario estadistica en R-figure/unnamed-chunk-4-1.png) 


Basic Plot more details
========================================================


```r
hist(Datos$Pob, breaks=50, main="Population histogram", xlab="Population", ylab="frequencies")
```

![plot of chunk unnamed-chunk-5](Seminario estadistica en R-figure/unnamed-chunk-5-1.png) 

Basic Plot more details
========================================================



```r
par(mfrow=c(1,3))
hist(Datos$Sup)
hist(Datos$Acomin)
hist(Datos$Acomin, breaks=50)
```

![plot of chunk unnamed-chunk-6](Seminario estadistica en R-figure/unnamed-chunk-6-1.png) 


Basic Plot more details (without code)
========================================================


![plot of chunk unnamed-chunk-7](Seminario estadistica en R-figure/unnamed-chunk-7-1.png) 

Basic Box Plot
========================================================



```r
par(mfrow=c(1,3))
boxplot(Datos$Pob)
boxplot(Datos$Sup)
boxplot(Datos$Acomin)
```

![plot of chunk unnamed-chunk-8](Seminario estadistica en R-figure/unnamed-chunk-8-1.png) 

Create new variable
========================================================



```r
par(mfrow=c(1,1))
hist(Datos$porvpal)
```

![plot of chunk unnamed-chunk-9](Seminario estadistica en R-figure/unnamed-chunk-9-1.png) 

Create new variable
========================================================


```r
Datos$residential[Datos$porvpal<50]<- "residential"
Datos$residential[Datos$porvpal>=50]<- "holiday"
head(Datos$residential)
```

```
[1] "holiday"     "residential" "residential" "residential" "holiday"    
[6] "residential"
```

```r
Datos$IDC<-(Datos$Acomin / Datos$Pob)*1000
head(Datos$IDC)
```

```
[1] 20.55545 37.47111 24.85113 30.04852 19.13199 26.44997
```

Basic boxplot by group
========================================================



```r
par(mfrow=c(1,2))
boxplot(Datos$Pob~Datos$residential, data=Datos)
boxplot(Datos$IDC~Datos$residential, data=Datos)
```

![plot of chunk unnamed-chunk-11](Seminario estadistica en R-figure/unnamed-chunk-11-1.png) 

Split data
========================================================


```r
residential<-subset(Datos, Datos$residential=="residential")
holiday<-subset(Datos, Datos$residential=="holiday")
```

Histrogram by group
========================================================



```r
par(mfrow=c(2,2))
hist(residential$IDC)
hist(holiday$IDC)
plot(density(residential$IDC), main="Residential")
plot(density(holiday$IDC), main="Holiday")
```

![plot of chunk unnamed-chunk-13](Seminario estadistica en R-figure/unnamed-chunk-13-1.png) 


Better graphs using ggplot2
========================================================



```r
library(ggplot2)
ggplot(data=Datos)+geom_histogram(aes(x=IDC))
```

![plot of chunk unnamed-chunk-14](Seminario estadistica en R-figure/unnamed-chunk-14-1.png) 

Better graphs using ggplot2
========================================================



```r
ggplot(data=Datos, aes(x=IDC))+geom_histogram()+facet_wrap(~residential)
```

![plot of chunk unnamed-chunk-15](Seminario estadistica en R-figure/unnamed-chunk-15-1.png) 

Better graphs using ggplot2
========================================================



```r
ggplot(data=Datos, aes(y=IDC, x=residential))+geom_violin()
```

![plot of chunk unnamed-chunk-16](Seminario estadistica en R-figure/unnamed-chunk-16-1.png) 


Descriptive statistics via psych package
========================================================


```r
library(psych)
describe(Datos)
```

```
                vars   n        mean           sd      median     trimmed
Codine             1 151    19907.17     15346.06    12028.00    18845.17
Lirmun*            2 151         NaN           NA          NA         NaN
Pob                3 151    60612.96    158066.92    22709.00    29435.89
Sup                4 151       93.23       100.75       59.65       73.73
Dens               5 151     1017.31      1868.84      426.15      625.19
Extran             6 151     8323.06     20207.92     3332.00     4790.32
Porext             7 151        0.18         0.12        0.15        0.16
Mayor65            8 151     9115.54     30106.42     3067.00     3827.58
Pormayor65         9 151        0.14         0.04        0.14        0.14
CMerCA            10 151        0.16         0.06        0.17        0.16
Nivec03           11 151        6.15         1.93        6.00        6.13
Nivec04           12 151        5.93         2.11        5.00        5.88
Parreg            13 151        3.74         1.96        3.30        3.47
Cmer05            14 151      139.53       367.75       53.00       68.80
Cmer03            15 151      138.46       377.86       51.00       66.15
Telfij            16 151    27191.82     85431.09    10239.00    13104.75
Vmot              17 151    37200.10     91657.25    14230.00    18502.22
Ofban             18 151       56.26       185.58       19.00       24.04
Acind             19 151      899.16      2225.02      427.00      512.84
Acomay            20 151      288.91      1019.15       80.00      103.06
Acomin            21 151     1436.46      3657.39      588.00      770.49
Scomin            22 151   161254.30    440492.76    57024.00    78288.59
Ccom              23 151        0.84         1.99        0.00        0.38
Sccom             24 151    17477.68     49362.34        0.00     5266.36
Acresbar          25 151      515.32      1114.90      241.00      315.49
Iindus            26 151      101.81       279.45       25.00       42.17
Icomer            27 151      170.60       572.06       41.00       62.69
Iresbar           28 151      172.26       520.49       55.00       76.22
Itur              29 151      357.93       731.69       99.00      176.43
Iae               30 151      151.26       493.83       39.00       61.56
paseos            31 151        2.27         2.40        2.00        1.86
cnautic           32 151        0.88         1.42        0.00        0.57
bazul05           33 151        1.93         1.51        2.00        1.77
nviviend          34 151    30985.35     72527.65    14317.00    17510.55
porvpal           35 151       50.81        17.36       50.40       50.93
porvisec          36 151       32.65        20.02       29.20       31.23
porvivac          37 151       13.53         9.49       11.60       12.35
porhvivprop       38 151       78.83         8.05       79.70       79.46
porhvivalq        39 151       13.96         6.76       13.00       13.41
porhvivotreg      40 151        7.22         3.84        6.00        6.63
porhHdispsegviv   41 151        4.29         4.45        2.70        3.36
Poranalf          42 151       15.13         5.84       14.30       14.83
Porestprim        43 151       23.79         4.42       23.80       23.78
Porestsec         44 151       50.77         6.27       50.70       50.62
Porestuniv        45 151       10.32         4.19        9.30        9.85
Nhot05            46 151       17.96        41.38        8.00       10.39
nhcatsup          47 151        4.21         9.26        1.00        2.18
porhcatsup        48 151       23.48        26.64       16.67       19.12
Ing01             49 151 20008204.06  56858967.41  7658070.00 10466787.09
Ing02             50 151  3392723.36   6718012.81  1381000.00  2011541.35
Ing03             51 151 10717835.86  21242806.80  5425000.00  7081905.30
Ing04             52 151 16981905.47  68783955.17  4468250.01  6162374.64
Ing05             53 151  1504282.70   4595712.14   356000.00   606418.19
Ing06             54 151  3825905.84   9131284.59   461003.00  1722676.87
Ing07             55 151  2245964.36   3558953.59   904498.66  1479866.80
Ing08             56 151    77602.71    260212.16     1536.28    26940.80
Ing09             57 151  4008244.50  10114614.73  1200000.00  2053965.41
IngTot            58 151 62762668.87 167519907.37 25580145.03 34851204.06
Gas01             59 151 16707724.78  32649091.59  7768928.24 10272543.61
Gas02             60 151 17052626.31  35398588.84  6876951.80 10104338.70
Gas03             61 151  1513113.58   5808786.02   385349.00   583682.10
Gas04             62 151  9118550.79  47785972.47  1439031.00  2527401.87
Gas06             63 151 12528572.76  29127454.25  5618893.53  7719036.24
Gas07             64 151  2017394.04  10574955.54   126250.70   411478.50
Gas08             65 151   140637.35    472097.36     6500.00    39364.39
Gas09             66 151  3305250.99  13480841.94   950000.00  1354785.10
TotGas            67 151 62383870.60 167524277.61 25238138.00 34446520.68
LIngporhab        68 151        7.05         0.68        7.06        7.06
LGasporhab        69 151        7.04         0.68        7.04        7.05
Portasas          70 151       21.21         9.34       19.97       20.31
Porinver          71 151       23.39        13.75       22.09       22.45
RivCom            72 151       40.58        11.04       39.77       40.15
RivRes            73 151      103.02        43.57       99.86       99.51
residential*      74 151         NaN           NA          NA         NaN
IDC               75 151       26.64         7.93       25.15       25.73
                        mad       min          max        range  skew
Codine             13187.73   3011.00 4.625000e+04 4.323900e+04  0.51
Lirmun*                  NA       Inf         -Inf         -Inf    NA
Pob                19399.82   1910.00 1.593075e+06 1.591165e+06  7.05
Sup                   60.64      2.85 5.997700e+02 5.969200e+02  2.30
Dens                 471.10     18.18 1.622111e+04 1.620293e+04  5.02
Extran              3356.61      4.00 2.199410e+05 2.199370e+05  8.06
Porext                 0.12      0.00 6.000000e-01 6.000000e-01  1.12
Mayor65             2591.58    351.00 3.292220e+05 3.288710e+05  8.59
Pormayor65             0.03      0.04 2.700000e-01 2.200000e-01  0.30
CMerCA                 0.12      0.01 2.500000e-01 2.400000e-01 -0.07
Nivec03                1.48      2.00 1.000000e+01 8.000000e+00  0.14
Nivec04                2.97      2.00 1.000000e+01 8.000000e+00  0.19
Parreg                 1.33      1.00 1.250000e+01 1.150000e+01  1.47
Cmer05                44.48      5.00 3.813000e+03 3.808000e+03  7.45
Cmer03                43.00      5.00 3.942000e+03 3.937000e+03  7.58
Telfij              8404.86    614.00 9.727620e+05 9.721480e+05  9.27
Vmot               12434.57   1115.00 8.939360e+05 8.928210e+05  6.60
Ofban                 14.83      1.00 2.039000e+03 2.038000e+03  8.69
Acind                317.28     31.00 2.442600e+04 2.439500e+04  8.34
Acomay                72.65      3.00 1.122200e+04 1.121900e+04  8.62
Acomin               489.26     42.00 3.901000e+04 3.896800e+04  7.84
Scomin             50986.61   2566.00 4.623902e+06 4.621336e+06  7.68
Ccom                   0.00      0.00 1.600000e+01 1.600000e+01  4.42
Sccom                  0.00      0.00 3.614770e+05 3.614770e+05  4.45
Acresbar             200.15     20.00 1.177200e+04 1.175200e+04  7.47
Iindus                25.20      2.00 2.956000e+03 2.954000e+03  7.49
Icomer                38.55      2.00 6.113000e+03 6.111000e+03  8.10
Iresbar               50.41      3.00 5.481000e+03 5.478000e+03  7.87
Itur                 118.61      0.00 5.616000e+03 5.616000e+03  3.98
Iae                   35.58      2.00 5.421000e+03 5.419000e+03  8.54
paseos                 1.48      0.00 1.400000e+01 1.400000e+01  1.81
cnautic                0.00      0.00 8.000000e+00 8.000000e+00  2.42
bazul05                1.48      0.00 8.000000e+00 8.000000e+00  1.30
nviviend           12149.91   1194.00 7.513980e+05 7.502040e+05  7.42
porvpal               20.61     17.70 8.220000e+01 6.450000e+01  0.00
porvisec              21.79      0.00 7.900000e+01 7.900000e+01  0.50
porvivac               7.12      0.20 6.070000e+01 6.050000e+01  1.83
porhvivprop            6.38     33.40 9.240000e+01 5.900000e+01 -1.52
porhvivalq             6.23      2.10 3.340000e+01 3.130000e+01  0.78
porhvivotreg           2.22      3.00 3.380000e+01 3.080000e+01  2.98
porhHdispsegviv        2.37      0.10 2.310000e+01 2.300000e+01  2.26
Poranalf               5.63      4.10 3.140000e+01 2.730000e+01  0.54
Porestprim             5.04     13.00 3.460000e+01 2.160000e+01  0.03
Porestsec              5.49     34.20 6.690000e+01 3.270000e+01  0.13
Porestuniv             3.41      3.70 2.460000e+01 2.090000e+01  1.13
Nhot05                 8.90      0.00 4.350000e+02 4.350000e+02  7.37
nhcatsup               1.48      0.00 8.500000e+01 8.500000e+01  5.43
porhcatsup            24.71      0.00 1.000000e+02 1.000000e+02  1.18
Ing01            7294088.07  88564.00 6.249580e+08 6.248694e+08  8.55
Ing02            1344718.20      0.00 6.325410e+07 6.325410e+07  5.78
Ing03            5066634.41  49451.41 2.314848e+08 2.314353e+08  7.77
Ing04            3983924.13  27182.10 7.874416e+08 7.874144e+08  9.63
Ing05             462270.23    420.00 3.984550e+07 3.984508e+07  6.64
Ing06             683483.05      0.00 8.175717e+07 8.175717e+07  5.23
Ing07            1177923.71      0.00 2.428254e+07 2.428254e+07  3.35
Ing08               2277.69      0.00 2.762513e+06 2.762513e+06  7.85
Ing09            1779120.00      0.00 1.000000e+08 1.000000e+08  6.72
IngTot          22001579.10 185986.59 1.867339e+09 1.867153e+09  8.70
Gas01            6253500.41  72852.50 2.908080e+08 2.907351e+08  5.68
Gas02            5857422.62  36317.67 3.460820e+08 3.460457e+08  6.37
Gas03             448151.43   1689.96 6.262018e+07 6.261849e+07  8.67
Gas04            1524273.22  51664.18 5.660757e+08 5.660241e+08 10.62
Gas06            5789342.92      0.00 3.257992e+08 3.257992e+08  8.51
Gas07             187179.29      0.00 1.146665e+08 1.146665e+08  9.10
Gas08               9636.90      0.00 3.720000e+06 3.720000e+06  5.55
Gas09            1115284.89      0.00 1.582876e+08 1.582876e+08 10.25
TotGas          20812943.40 185986.59 1.867339e+09 1.867153e+09  8.71
LIngporhab             0.40      0.40 8.740000e+00 8.340000e+00 -5.83
LGasporhab             0.39      0.40 8.740000e+00 8.340000e+00 -5.86
Portasas               9.10      4.80 6.378000e+01 5.897000e+01  1.15
Porinver              12.86      0.00 6.648000e+01 6.648000e+01  0.69
RivCom                10.73     18.66 7.297000e+01 5.431000e+01  0.47
RivRes                44.60     35.84 2.681900e+02 2.323500e+02  0.82
residential*             NA       Inf         -Inf         -Inf    NA
IDC                    6.81     13.70 5.359000e+01 3.988000e+01  1.15
                kurtosis          se
Codine             -1.35     1248.84
Lirmun*               NA          NA
Pob                59.56    12863.30
Sup                 6.65        8.20
Dens               32.26      152.08
Extran             78.10     1644.50
Porext              1.14        0.01
Mayor65            83.97     2450.03
Pormayor65          0.51        0.00
CMerCA             -0.60        0.01
Nivec03            -0.59        0.16
Nivec04            -0.92        0.17
Parreg              2.57        0.16
Cmer05             66.11       29.93
Cmer03             68.08       30.75
Telfij             97.12     6952.28
Vmot               52.47     7458.96
Ofban              85.62       15.10
Acind              81.38      181.07
Acomay             85.92       82.94
Acomin             73.07      297.63
Scomin             69.86    35846.79
Ccom               24.70        0.16
Sccom              22.29     4017.05
Acresbar           68.06       90.73
Iindus             70.02       22.74
Icomer             76.47       46.55
Iresbar            72.13       42.36
Itur               19.78       59.54
Iae                84.48       40.19
paseos              4.17        0.20
cnautic             7.00        0.12
bazul05             2.42        0.12
nviviend           65.37     5902.22
porvpal            -1.04        1.41
porvisec           -0.72        1.63
porvivac            5.19        0.77
porhvivprop         5.72        0.65
porhvivalq          0.47        0.55
porhvivotreg       14.92        0.31
porhHdispsegviv     5.41        0.36
Poranalf            0.17        0.48
Porestprim         -0.55        0.36
Porestsec           0.14        0.51
Porestuniv          1.39        0.34
Nhot05             67.00        3.37
nhcatsup           38.81        0.75
porhcatsup          0.66        2.17
Ing01              83.99  4627117.15
Ing02              42.68   546704.13
Ing03              75.10  1728715.10
Ing04             102.17  5597558.89
Ing05              48.28   373993.75
Ing06              35.91   743093.40
Ing07              13.88   289623.54
Ing08              73.85    21175.77
Ing09              55.25   823115.67
IngTot             87.49 13632576.72
Gas01              38.48  2656945.39
Gas02              50.53  2880696.31
Gas03              82.74   472712.30
Gas04             119.51  3888767.29
Gas06              86.23  2370358.61
Gas07              88.23   860577.68
Gas08              32.89    38418.74
Gas09             113.19  1097055.36
TotGas             87.56 13632932.37
LIngporhab         56.89        0.06
LGasporhab         57.17        0.06
Portasas            2.46        0.76
Porinver            0.29        1.12
RivCom              0.22        0.90
RivRes              0.82        3.55
residential*          NA          NA
IDC                 1.51        0.65
```


Descriptive statistics via psych package
========================================================


```r
library(psych)
describe(Datos$IDC)
```

```
  vars   n  mean   sd median trimmed  mad  min   max range skew kurtosis
1    1 151 26.64 7.93  25.15   25.73 6.81 13.7 53.59 39.88 1.15     1.51
    se
1 0.65
```


Descriptive statistics via psych package
========================================================


```r
library(psych)
describeBy(x=Datos$IDC, group=Datos$residential)
```

```
group: holiday
  vars  n mean   sd median trimmed  mad   min   max range skew kurtosis
1    1 78 24.4 6.56     23   23.72 5.56 14.02 50.94 36.92 1.37     2.79
    se
1 0.74
-------------------------------------------------------- 
group: residential
  vars  n  mean  sd median trimmed  mad  min   max range skew kurtosis
1    1 73 29.02 8.6  27.68   28.22 7.63 13.7 53.59 39.88 0.87     0.67
    se
1 1.01
```


Descriptive statistics via psych package
========================================================


```r
library(psych)
describeBy(x=Datos$IDC, group=Datos$residential)
```

```
group: holiday
  vars  n mean   sd median trimmed  mad   min   max range skew kurtosis
1    1 78 24.4 6.56     23   23.72 5.56 14.02 50.94 36.92 1.37     2.79
    se
1 0.74
-------------------------------------------------------- 
group: residential
  vars  n  mean  sd median trimmed  mad  min   max range skew kurtosis
1    1 73 29.02 8.6  27.68   28.22 7.63 13.7 53.59 39.88 0.87     0.67
    se
1 1.01
```


Descriptive statistics via plyr package
========================================================


```r
library(plyr)
aggregate(IDC~residential, Datos, FUN=function(x) c(mean=mean(x), var=var(x)))
```

```
  residential IDC.mean  IDC.var
1     holiday 24.40012 43.00547
2 residential 29.02408 73.93730
```

Descriptive statistics via plyr package
========================================================


```r
aggregate(IDC~residential+Nivec04, Datos, FUN=function(x) c(mean=mean(x), var=var(x)))
```

```
   residential Nivec04   IDC.mean    IDC.var
1      holiday       2  21.054022   7.762192
2      holiday       3  21.754943   6.760955
3  residential       3  25.471311   9.535749
4      holiday       4  21.222866  15.590894
5  residential       4  26.057297  37.355424
6      holiday       5  27.076984 109.046835
7  residential       5  27.882529  58.274150
8      holiday       6  24.417870  25.745638
9  residential       6  34.986717 137.307065
10     holiday       7  25.567272  15.413855
11 residential       7  28.428596  81.646580
12     holiday       8  25.985812  68.008928
13 residential       8  24.889164  42.571494
14     holiday       9  29.709179  13.568347
15 residential       9  29.922450  51.163214
16 residential      10  36.738423  84.409081
```


NHST one sample two sided
========================================================


```r
t.test(Datos$IDC, alternative="two.sided", mu=20)
```

```

	One Sample t-test

data:  Datos$IDC
t = 10.278, df = 150, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 20
95 percent confidence interval:
 25.35985 27.91123
sample estimates:
mean of x 
 26.63554 
```


NHST one sample one sided
========================================================


```r
t.test(Datos$IDC, alternative="greater", mu=27)
```

```

	One Sample t-test

data:  Datos$IDC
t = -0.56451, df = 150, p-value = 0.7134
alternative hypothesis: true mean is greater than 27
95 percent confidence interval:
 25.56699      Inf
sample estimates:
mean of x 
 26.63554 
```

NHST two sample (check for normality)
========================================================


```r
#two sample t.test residential versus holiday
aggregate(IDC~residential, Datos, FUN=function(x) c(mean=mean(x), var=var(x))) #evaluate variance
```

```
  residential IDC.mean  IDC.var
1     holiday 24.40012 43.00547
2 residential 29.02408 73.93730
```

```r
shapiro.test(Datos$IDC) #evaluate normality
```

```

	Shapiro-Wilk normality test

data:  Datos$IDC
W = 0.92146, p-value = 2.444e-07
```

NHST two sample 
========================================================


```r
shapiro.test(Datos$IDC[Datos$residential=="residential"]) 
```

```

	Shapiro-Wilk normality test

data:  Datos$IDC[Datos$residential == "residential"]
W = 0.94545, p-value = 0.003316
```

NHST two sample 
========================================================


```r
shapiro.test(Datos$IDC[Datos$residential=="holiday"])
```

```

	Shapiro-Wilk normality test

data:  Datos$IDC[Datos$residential == "holiday"]
W = 0.90473, p-value = 2.42e-05
```

NHST two sample (testing equality variance)
========================================================


```r
ansari.test(IDC~residential, Datos)
```

```

	Ansari-Bradley test

data:  IDC by residential
AB = 3038, p-value = 0.6856
alternative hypothesis: true ratio of scales is not equal to 1
```

NHST two sample t.test
========================================================


```r
t.test(IDC~residential, data=Datos, var.equal=TRUE)
```

```

	Two Sample t-test

data:  IDC by residential
t = -3.7299, df = 149, p-value = 0.0002717
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -7.073612 -2.174298
sample estimates:
    mean in group holiday mean in group residential 
                 24.40012                  29.02408 
```


Plotting the confidence interval
========================================================


```r
IDCsummary<-ddply(Datos, "residential", summarize,
                  IDC.mean=mean(IDC), IDC.sd=sd(IDC),
                  Lower=IDC.mean-2*IDC.sd/sqrt(NROW(Datos)),
                  Upper=IDC.mean+2*IDC.sd/sqrt(NROW(Datos)))

IDCsummary
```

```
  residential IDC.mean   IDC.sd    Lower    Upper
1     holiday 24.40012 6.557855 23.33278 25.46746
2 residential 29.02408 8.598680 27.62457 30.42358
```

Plotting the confidence interval
========================================================


```r
ggplot(IDCsummary, aes(x=IDC.mean, y=residential))+geom_point()+geom_errorbarh(aes(xmin=Lower, xmax=Upper), height=.2)
```

![plot of chunk unnamed-chunk-31](Seminario estadistica en R-figure/unnamed-chunk-31-1.png) 


ANOVA
========================================================


```r
par(mfrow=c(1,1))
boxplot(Datos$IDC~Datos$Nivec04)
```

![plot of chunk unnamed-chunk-32](Seminario estadistica en R-figure/unnamed-chunk-32-1.png) 


ANOVA
========================================================


```r
Datos$Nivec04<-as.factor(as.character(Datos$Nivec04))
ggplot(Datos, aes(y=IDC, x=Nivec04))+geom_boxplot()
```

![plot of chunk unnamed-chunk-33](Seminario estadistica en R-figure/unnamed-chunk-33-1.png) 


ANOVA
========================================================


```r
IDCanova<-aov(IDC~Nivec04 -1, Datos)  #without intercept
summary(IDCanova)
```

```
           Df Sum Sq Mean Sq F value Pr(>F)    
Nivec04     9 108981   12109   226.6 <2e-16 ***
Residuals 142   7588      53                   
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


ANOVA
========================================================


```r
IDCanova.intercept<-aov(IDC~Nivec04, Datos)
summary(IDCanova.intercept)
```

```
             Df Sum Sq Mean Sq F value   Pr(>F)    
Nivec04       8   1854  231.69   4.336 0.000106 ***
Residuals   142   7588   53.43                     
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


Linear regression
========================================================


```r
ggplot(Datos, aes(x=Pob, y=Acomin))+geom_point()+geom_smooth(method="lm")+labs(x="Population", y="Retail")
```

![plot of chunk unnamed-chunk-36](Seminario estadistica en R-figure/unnamed-chunk-36-1.png) 


Linear regression
========================================================


```r
ggplot(Datos, aes(x=Pob, y=IDC))+geom_point()+geom_smooth(method="lm")+labs(x="Population", y="Retail Density")
```

![plot of chunk unnamed-chunk-37](Seminario estadistica en R-figure/unnamed-chunk-37-1.png) 


Variable transformation logs
========================================================


```r
Datos$LIDC<-log(Datos$IDC)
Datos$LPob<-log(Datos$Pob)
```



Linear regression 
========================================================


```r
ggplot(Datos, aes(x=LPob, y=LIDC))+geom_point()+geom_smooth(method="lm")+labs(x="Population", y="Log Retail Density")
```

![plot of chunk unnamed-chunk-39](Seminario estadistica en R-figure/unnamed-chunk-39-1.png) 


Linear regression colour by group
========================================================


```r
ggplot(Datos, aes(x=LPob, y=LIDC, color=residential)) + geom_point(shape=1)
```

![plot of chunk unnamed-chunk-40](Seminario estadistica en R-figure/unnamed-chunk-40-1.png) 

Linear regression colour by group
========================================================


```r
ggplot(Datos, aes(x=LPob, y=LIDC, color=residential)) +
  geom_point(shape=1) +
  scale_colour_hue(l=50) + # Use a slightly darker palette than normal
  geom_smooth(method=lm,   # Add linear regression lines
              se=FALSE)    # Don't add shaded confidence region
```

![plot of chunk unnamed-chunk-41](Seminario estadistica en R-figure/unnamed-chunk-41-1.png) 


Linear regression shape by group
========================================================


```r
# Set shape by cond
ggplot(Datos, aes(x=LPob, y=LIDC, shape=residential)) + geom_point()
```

![plot of chunk unnamed-chunk-42](Seminario estadistica en R-figure/unnamed-chunk-42-1.png) 

Linear regression shape by group
========================================================


```r
# Same, but with different shapes
ggplot(Datos, aes(x=LPob, y=LIDC, shape=residential)) + geom_point() +
  scale_shape_manual(values=c(1,2))  # Use a hollow circle and triangle
```

![plot of chunk unnamed-chunk-43](Seminario estadistica en R-figure/unnamed-chunk-43-1.png) 


========================================================


```r
LIDClm<-lm(LIDC~LPob, data=Datos)
summary(LIDClm)
```

```

Call:
lm(formula = LIDC ~ LPob, data = Datos)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.70146 -0.17949 -0.01157  0.16516  0.71952 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.71051    0.19012   19.52   <2e-16 ***
LPob        -0.04640    0.01871   -2.48   0.0142 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.275 on 149 degrees of freedom
Multiple R-squared:  0.03965,	Adjusted R-squared:  0.03321 
F-statistic: 6.152 on 1 and 149 DF,  p-value: 0.01424
```



========================================================


```r
Extended.LIDClm<-lm(LIDC~LPob+residential+Nivec04+Sup, data=Datos)
summary(Extended.LIDClm)
```

```

Call:
lm(formula = LIDC ~ LPob + residential + Nivec04 + Sup, data = Datos)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.64054 -0.14662 -0.01058  0.13705  0.66740 

Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
(Intercept)             3.6960776  0.2293673  16.114  < 2e-16 ***
LPob                   -0.0253811  0.0207678  -1.222 0.223723    
residentialresidential  0.0991253  0.0494274   2.005 0.046854 *  
Nivec042               -0.4618480  0.1494365  -3.091 0.002414 ** 
Nivec043               -0.3846032  0.1170605  -3.286 0.001289 ** 
Nivec044               -0.4168761  0.1055891  -3.948 0.000125 ***
Nivec045               -0.2546717  0.0975965  -2.609 0.010062 *  
Nivec046               -0.1853834  0.1103051  -1.681 0.095078 .  
Nivec047               -0.2614519  0.1083184  -2.414 0.017092 *  
Nivec048               -0.3258328  0.1015869  -3.207 0.001662 ** 
Nivec049               -0.1063319  0.1275099  -0.834 0.405762    
Sup                     0.0003903  0.0002423   1.611 0.109531    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.2542 on 139 degrees of freedom
Multiple R-squared:  0.2348,	Adjusted R-squared:  0.1742 
F-statistic: 3.877 on 11 and 139 DF,  p-value: 6.801e-05
```


========================================================


```r
library(coefplot)
coefplot(LIDClm)
```

![plot of chunk unnamed-chunk-46](Seminario estadistica en R-figure/unnamed-chunk-46-1.png) 



========================================================


```r
coefplot(Extended.LIDClm)
```

![plot of chunk unnamed-chunk-47](Seminario estadistica en R-figure/unnamed-chunk-47-1.png) 


AIC and BIC
========================================================


```r
AIC(LIDClm, Extended.LIDClm)
```

```
                df      AIC
LIDClm           3 42.62436
Extended.LIDClm 13 28.33112
```

```r
BIC(LIDClm, Extended.LIDClm)
```

```
                df      BIC
LIDClm           3 51.67620
Extended.LIDClm 13 67.55576
```

Cross validation
========================================================


```r
LIDCglm<-glm(LIDC~LPob, data=Datos, family=gaussian(link="identity"))
summary(LIDCglm)
```

```

Call:
glm(formula = LIDC ~ LPob, family = gaussian(link = "identity"), 
    data = Datos)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-0.70146  -0.17949  -0.01157   0.16516   0.71952  

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  3.71051    0.19012   19.52   <2e-16 ***
LPob        -0.04640    0.01871   -2.48   0.0142 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for gaussian family taken to be 0.07562275)

    Null deviance: 11.733  on 150  degrees of freedom
Residual deviance: 11.268  on 149  degrees of freedom
AIC: 42.624

Number of Fisher Scoring iterations: 2
```

Cross validation
========================================================


```r
Extended.LIDCglm<-glm(LIDC~LPob+residential+Nivec04+Sup, data=Datos, family=gaussian(link="identity"))
summary(Extended.LIDCglm)
```

```

Call:
glm(formula = LIDC ~ LPob + residential + Nivec04 + Sup, family = gaussian(link = "identity"), 
    data = Datos)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-0.64054  -0.14662  -0.01058   0.13705   0.66740  

Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
(Intercept)             3.6960776  0.2293673  16.114  < 2e-16 ***
LPob                   -0.0253811  0.0207678  -1.222 0.223723    
residentialresidential  0.0991253  0.0494274   2.005 0.046854 *  
Nivec042               -0.4618480  0.1494365  -3.091 0.002414 ** 
Nivec043               -0.3846032  0.1170605  -3.286 0.001289 ** 
Nivec044               -0.4168761  0.1055891  -3.948 0.000125 ***
Nivec045               -0.2546717  0.0975965  -2.609 0.010062 *  
Nivec046               -0.1853834  0.1103051  -1.681 0.095078 .  
Nivec047               -0.2614519  0.1083184  -2.414 0.017092 *  
Nivec048               -0.3258328  0.1015869  -3.207 0.001662 ** 
Nivec049               -0.1063319  0.1275099  -0.834 0.405762    
Sup                     0.0003903  0.0002423   1.611 0.109531    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for gaussian family taken to be 0.06459403)

    Null deviance: 11.7330  on 150  degrees of freedom
Residual deviance:  8.9786  on 139  degrees of freedom
AIC: 28.331

Number of Fisher Scoring iterations: 2
```


Cross validation
========================================================


```r
library(boot)
LIDCglmCV<-cv.glm(Datos,LIDCglm,K=5)
Extended.LIDCglmCV<-cv.glm(Datos,Extended.LIDCglm,K=5)
cvResults<-as.data.frame(rbind(LIDCglmCV$delta,Extended.LIDCglmCV$delta))
names(cvResults)<-c("Error", "Adjusted.Error")
cvResults
```

```
       Error Adjusted.Error
1 0.07592054     0.07577809
2 0.07473778     0.07298967
```


Robust standard errors via sandwich
========================================================


```r
#Robust standard error via sandwich.
library(car)
library(lmtest)
library(sandwich)
library(boot)
robust.Extended.LIDClm<-lm(LIDC~LPob+residential+Nivec04+Sup, data=Datos)
sandwich(robust.Extended.LIDClm)
```

```
                         (Intercept)          LPob residentialresidential
(Intercept)             3.668383e-02 -2.840308e-03          -4.024054e-03
LPob                   -2.840308e-03  2.911421e-04           1.367441e-04
residentialresidential -4.024054e-03  1.367441e-04           2.509896e-03
Nivec042               -9.445170e-03  1.599870e-04           2.163310e-03
Nivec043               -5.856032e-03 -1.542595e-04           1.498393e-03
Nivec044               -7.313052e-03  4.906396e-05           1.306844e-03
Nivec045               -4.091601e-03 -2.388116e-04           3.809992e-04
Nivec046               -7.843903e-03 -3.254510e-05           2.066342e-03
Nivec047               -5.865263e-03 -1.823327e-04           1.609492e-03
Nivec048               -8.037019e-03  1.203934e-04           1.153798e-03
Nivec049               -6.584481e-03 -1.505470e-04           1.894528e-03
Sup                     6.289426e-06 -1.427989e-06           3.528822e-06
                            Nivec042      Nivec043      Nivec044
(Intercept)            -9.445170e-03 -5.856032e-03 -7.313052e-03
LPob                    1.599870e-04 -1.542595e-04  4.906396e-05
residentialresidential  2.163310e-03  1.498393e-03  1.306844e-03
Nivec042                9.959971e-03  7.375137e-03  7.543405e-03
Nivec043                7.375137e-03  8.271851e-03  7.082032e-03
Nivec044                7.543405e-03  7.082032e-03  9.275897e-03
Nivec045                6.062942e-03  6.209453e-03  6.059339e-03
Nivec046                7.559955e-03  7.162700e-03  6.792346e-03
Nivec047                7.364603e-03  7.196154e-03  6.978353e-03
Nivec048                7.160972e-03  6.747373e-03  6.860447e-03
Nivec049                7.360938e-03  7.117511e-03  6.685681e-03
Sup                    -1.534020e-06  5.990884e-08 -4.978951e-06
                            Nivec045      Nivec046      Nivec047
(Intercept)            -4.091601e-03 -7.843903e-03 -5.865263e-03
LPob                   -2.388116e-04 -3.254510e-05 -1.823327e-04
residentialresidential  3.809992e-04  2.066342e-03  1.609492e-03
Nivec042                6.062942e-03  7.559955e-03  7.364603e-03
Nivec043                6.209453e-03  7.162700e-03  7.196154e-03
Nivec044                6.059339e-03  6.792346e-03  6.978353e-03
Nivec045                7.887055e-03  6.353822e-03  6.354182e-03
Nivec046                6.353822e-03  1.335166e-02  7.132377e-03
Nivec047                6.354182e-03  7.132377e-03  1.023756e-02
Nivec048                6.043451e-03  6.801479e-03  6.735193e-03
Nivec049                6.397625e-03  7.437930e-03  7.212897e-03
Sup                     2.719123e-06  4.235036e-06  2.063964e-06
                            Nivec048      Nivec049           Sup
(Intercept)            -8.037019e-03 -6.584481e-03  6.289426e-06
LPob                    1.203934e-04 -1.505470e-04 -1.427989e-06
residentialresidential  1.153798e-03  1.894528e-03  3.528822e-06
Nivec042                7.160972e-03  7.360938e-03 -1.534020e-06
Nivec043                6.747373e-03  7.117511e-03  5.990884e-08
Nivec044                6.860447e-03  6.685681e-03 -4.978951e-06
Nivec045                6.043451e-03  6.397625e-03  2.719123e-06
Nivec046                6.801479e-03  7.437930e-03  4.235036e-06
Nivec047                6.735193e-03  7.212897e-03  2.063964e-06
Nivec048                1.002602e-02  6.648824e-03 -2.182667e-06
Nivec049                6.648824e-03  1.062687e-02  5.005624e-06
Sup                    -2.182667e-06  5.005624e-06  6.589660e-08
```

```r
coeftest(robust.Extended.LIDClm, vcov=vcovHC(robust.Extended.LIDClm,type="HC1"))
```

```

t test of coefficients:

                          Estimate  Std. Error t value  Pr(>|t|)    
(Intercept)             3.69607765  0.19962659 18.5150 < 2.2e-16 ***
LPob                   -0.02538110  0.01778417 -1.4272  0.155772    
residentialresidential  0.09912528  0.05221664  1.8983  0.059723 .  
Nivec042               -0.46184797  0.10401839 -4.4401 1.819e-05 ***
Nivec043               -0.38460324  0.09479434 -4.0572 8.243e-05 ***
Nivec044               -0.41687613  0.10038274 -4.1529 5.701e-05 ***
Nivec045               -0.25467173  0.09256323 -2.7513  0.006727 ** 
Nivec046               -0.18538337  0.12043389 -1.5393  0.126005    
Nivec047               -0.26145192  0.10545796 -2.4792  0.014363 *  
Nivec048               -0.32583278  0.10436270 -3.1221  0.002185 ** 
Nivec049               -0.10633194  0.10744439 -0.9896  0.324067    
Sup                     0.00039028  0.00026755  1.4587  0.146904    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


Robust standard errors 
========================================================


```r
coeftest(robust.Extended.LIDClm, vcov=vcovHC(robust.Extended.LIDClm,type="HC1"))
```

```

t test of coefficients:

                          Estimate  Std. Error t value  Pr(>|t|)    
(Intercept)             3.69607765  0.19962659 18.5150 < 2.2e-16 ***
LPob                   -0.02538110  0.01778417 -1.4272  0.155772    
residentialresidential  0.09912528  0.05221664  1.8983  0.059723 .  
Nivec042               -0.46184797  0.10401839 -4.4401 1.819e-05 ***
Nivec043               -0.38460324  0.09479434 -4.0572 8.243e-05 ***
Nivec044               -0.41687613  0.10038274 -4.1529 5.701e-05 ***
Nivec045               -0.25467173  0.09256323 -2.7513  0.006727 ** 
Nivec046               -0.18538337  0.12043389 -1.5393  0.126005    
Nivec047               -0.26145192  0.10545796 -2.4792  0.014363 *  
Nivec048               -0.32583278  0.10436270 -3.1221  0.002185 ** 
Nivec049               -0.10633194  0.10744439 -0.9896  0.324067    
Sup                     0.00039028  0.00026755  1.4587  0.146904    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


Robust standard errors via bootstrap
========================================================


```r
set.seed(123)
boot.Extended.LIDClm<-Boot(Extended.LIDClm,f=coef,labels=names(coef(Extended.LIDClm)), R=999, method=c("case"))
summary(boot.Extended.LIDClm)
```

```
                         R    original    bootBias     bootSE     bootMed
(Intercept)            990  3.69607765 -1.1230e-03 0.20412097  3.70154086
LPob                   990 -0.02538110 -1.1069e-04 0.01822131 -0.02606065
residentialresidential 990  0.09912528  1.6909e-03 0.05269851  0.10027951
Nivec042               990 -0.46184797 -1.6481e-03 0.11028803 -0.46426047
Nivec043               990 -0.38460324 -2.1611e-05 0.09924164 -0.38203302
Nivec044               990 -0.41687613  4.1598e-04 0.10244038 -0.41492741
Nivec045               990 -0.25467173 -4.5605e-04 0.09865871 -0.25290391
Nivec046               990 -0.18538337 -3.4130e-03 0.11927626 -0.18666472
Nivec047               990 -0.26145192  8.2131e-04 0.11096709 -0.25842181
Nivec048               990 -0.32583278  2.2105e-03 0.10454471 -0.32402996
Nivec049               990 -0.10633194  2.6504e-04 0.11017708 -0.10301458
Sup                    990  0.00039028  2.5032e-05 0.00027798  0.00041034
```

Robust standard errors via bootstrap
========================================================


```r
boot.ci(boot.out=boot.Extended.LIDClm, type="bca", index=2) 
```

```
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 990 bootstrap replicates

CALL : 
boot.ci(boot.out = boot.Extended.LIDClm, type = "bca", index = 2)

Intervals : 
Level       BCa          
95%   (-0.0597,  0.0129 )  
Calculations and Intervals on Original Scale
```



Robust standard errors via bootstrap
========================================================


```r
boot.ci(boot.out=boot.Extended.LIDClm, type="bca", index=3) 
```

```
BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 990 bootstrap replicates

CALL : 
boot.ci(boot.out = boot.Extended.LIDClm, type = "bca", index = 3)

Intervals : 
Level       BCa          
95%   ( 0.0012,  0.2006 )  
Calculations and Intervals on Original Scale
```



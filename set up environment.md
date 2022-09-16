# Run Assembly Code(8086) with MASM(on windows)
1. Download DOSBox from the Internet
2. Create a folder which contains two subfolders. One will be your working directory and another for other necessary files. I'll name them "asm" and "masm" here.
3. Download 8086.rar, unzip it and drag all files into the masm file.

The file structure should be something similar to this:
"""
OS(C:)
│  
|
└── 8086
    |
    |
    └───masm
    |    | .exe's from 8086.rar      
    |
    |
    └───asm 

```






> Add the code below at the very bottom of DOSBox 0.7xx Options.bat. It should be somewhere like this **C:\Program Files (x86)\DOSBox-0.74-3\DOSBox 0.74-3 Options.bat**.
> It will add path and open your working directory for you whenever you open DOSBox (otherwise the operations you implement in DOSBOx are mostly not permanent).

`
mount c c:\8086
path=%path%;\masm
c:
cd asm
`

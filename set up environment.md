# Run Assembly Code(8086) with MASM(on windows)
## Setting Up
1. Download DOSBox from the Internet
2. Create a folder which contains two subfolders. One will be your working directory and another for other necessary files. I'll name them "asm" and "masm".
3. Download 8086.rar, unzip it and drag all files into the masm folder.

The file structure should be something similar to this:  
```
OS(C:)
│  
|
└── 8086
    |
    |
    └───masm
    |    | .exe's from 8086.rar      
    |
    └───asm 
         | hello.asm
         | project-files.asm
```


> Add the code below at the very bottom of **DOSBox 0.7xx Options.bat** .  
> The file should be somewhere like this:   **C:\Program Files (x86)\DOSBox-0.74-3\DOSBox 0.74-3 Options.bat**  
> It will add masm folder to path and open your working directory whenever you open DOSBox (otherwise you'll have to mount the program everytime starting DOSBox).

`
mount c c:\8086
path=%path%;\masm
c:
cd asm
`
## Hello World Progra

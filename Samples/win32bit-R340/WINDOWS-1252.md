# Test File for Encoding on Win7
Arnold Cross  
`r Sys.Date()`  



OS: Windows 7 (build 7601) SP 1  32-bit

R version 3.4.0 (2017-04-21)

Encoding Setting:  WINDOWS-1252

## Introduction

### Purpose

This is a test file for generating md and html files as described in the associated report, _knitr Encoding in RStudio on Win7_.  The files generated from this test file are renamed and saved in the <Samples> folder.

## Demonstration

The text that I use for this demonstration is shown here with a graphic, so you can see what it is supposed to look like.

![](img/RusText.png)

That text is contained in a file, <input.txt>.


```r
russianText <- readLines("input.txt")
cat( Encoding(russianText) )
```

```
## unknown
```

R considers the encoding of the file to be unknown, but I can confirm with the following code chunk that it is UTF-8.

### Starting Bytes


```r
cat( charToRaw(substr( russianText, 1, 6 )) )
```

```
## d0 9a d0 be d0 b3
```

Those bytes are the UTF-8 encodings of U+041A, U+043E, and U+0433, which correspond to the first three letters in my Russian text.  I will refer to them as the "STARTING BYTES".  They are always d0 9a d0 be d0 b3 regardless of the ENCODING SETTING.

### Pasted Text

The text is pasted here for rendering:

> ÃÅ¡ÃÂ¾ÃÂ³ÃÂ¾ Ãâ€™Ã‘â€¹ Ã‘â€¦ÃÂ¾Ã‘â€šÃÂ¸Ã‘â€šÃÂµ ÃÂ²ÃÂ¸ÃÂ´ÃÂµÃ‘â€šÃ‘Å’ ÃÂ² ÃÂºÃÂ°Ã‘â€¡ÃÂµÃ‘ÂÃ‘â€šÃÂ²ÃÂµ VIP-ÃÂ¿ÃÂµÃ‘â‚¬Ã‘ÂÃÂ¾ÃÂ½Ã‘â€¹ ÃÂ½ÃÂ° Ã‘â€žÃÂ¾Ã‘â‚¬Ã‘Æ’ÃÂ¼ÃÂµ?

I will refer to that as the "PASTED TEXT", because I pasted it into this Rmd file.  You might not see Russian text above depending on the ENCODING SETTING under which this file was knitted and which output file (md or html) you are viewing.  If you are viewing the source Rmd file in RStudio, then what you see depends on the ENCODING SETTING at the time that you opened the file.

When the [Knit] button is clicked in RStudio to knit this Rmd file, an md file and an html file are produced.  The report discusses how the PASTED TEXT appears in those files as well as how it appears in RStudio.

### Knitted Text

The following code chunk renders the same text from the execution environment.


```r
cat(russianText)
```

```
## ÃÂšÃÂ¾ÃÂ³ÃÂ¾ ÃÂ’Ã‘Â‹ Ã‘Â…ÃÂ¾Ã‘Â‚ÃÂ¸Ã‘Â‚ÃÂµ ÃÂ²ÃÂ¸ÃÂ´ÃÂµÃ‘Â‚Ã‘ÂŒ ÃÂ² ÃÂºÃÂ°Ã‘Â‡ÃÂµÃ‘ÂÃ‘Â‚ÃÂ²ÃÂµ VIP-ÃÂ¿ÃÂµÃ‘Â€Ã‘ÂÃÂ¾ÃÂ½Ã‘Â‹ ÃÂ½ÃÂ° Ã‘Â„ÃÂ¾Ã‘Â€Ã‘ÂƒÃÂ¼ÃÂµ?
```

I refer to that as the "KNITTED TEXT", because it is generated when this file is knitted.  The report discusses how the KNITTED TEXT appears in the md and html files.

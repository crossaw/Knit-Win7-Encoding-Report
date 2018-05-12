---
title: "Test File for Encoding on Win7"
author: "Arnold Cross"
date: "2018-05-11"
output: 
  html_document: 
    keep_md: yes
---



OS: Windows 7 x64 (build 7601) SP 1

R version 3.4.4 (2018-03-15)

Encoding Setting:  GB18030

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

> Кого Вы хотите видеть в качестве VIP-персоны на форуме?

I will refer to that as the "PASTED TEXT", because I pasted it into this Rmd file.  You might not see Russian text above depending on the ENCODING SETTING under which this file was knitted and which output file (md or html) you are viewing.  If you are viewing the source Rmd file in RStudio, then what you see depends on the ENCODING SETTING at the time that you opened the file.

When the [Knit] button is clicked in RStudio to knit this Rmd file, an md file and an html file are produced.  The report discusses how the PASTED TEXT appears in those files as well as how it appears in RStudio.

### Knitted Text

The following code chunk renders the same text from the execution environment.


```r
cat(russianText)
```

```
## �0�4�0�8�0�4�0�6�0�4�0�6�0�4�0�6 �0�4���0�5�6�8 �0�5���0�4�0�6�0�5�6�5�0�4�0�0�0�5�6�5�0�4�0�8 �0�4�0�5�0�4�0�0�0�4�0�7�0�4�0�8�0�5�6�5�0�5�0�3 �0�4�0�5 �0�4�0�2�0�4��0�5�6�0�0�4�0�8�0�5�0�1�0�5�6�5�0�4�0�5�0�4�0�8 VIP-�0�4�0�7�0�4�0�8�0�5��0�5�0�1�0�4�0�6�0�4�0�5�0�5�6�8 �0�4�0�5�0�4�� �0�5�6�7�0�4�0�6�0�5��0�5�0�6�0�4�0�4�0�4�0�8?
```

I refer to that as the "KNITTED TEXT", because it is generated when this file is knitted.  The report discusses how the KNITTED TEXT appears in the md and html files.

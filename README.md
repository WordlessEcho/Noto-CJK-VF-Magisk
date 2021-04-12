# Noto CJK VF Magisk
A module replace CJK fonts to Noto CJK Variable.

## Requirement
Android 8.0 and above. 9.0 for serif and monospace support.

## Advantage
Compare to normal super OTC version, only 38.9MB for all weight.

## [notocjk Magisk Module] Differences
This module inculdes demi-light weight and monospace that Android developers won't use. Because Roboto (Default font of Latin characters on Android) doesn't have this weight. And Noto Sans Mono CJK only changes its Latin part.

notocjk use Noto Serif CJK subset to avoid GitHub file size limit of signle file. This module split it as two part.

## Try variable
[Variable Font Test](https://github.com/WordlessEcho/Variable-Font-Test)
![App Preview](https://github.com/WordlessEcho/Variable-Font-Test/blob/main/doc/pic/TRIM_20210409_190441.gif?raw=true)

## Monospace (half-width)
It adjust **Latin characters** only to half width of the CJK characters.

## Noto Serif CJK
Noto Serif CJK doesn't have variable fonts yet. So this module add super OTC version.

## Noto Sans CJK VF download
[noto-cjk/Sans/Variable at main · googlefonts/noto-cjk](https://github.com/googlefonts/noto-cjk/tree/main/Sans/Variable)

## wght value
Tools: [googlefonts/fonttools: A library to manipulate font files from Python.](https://github.com/googlefonts/fonttools)
See also: [fvar — Font Variations Table (OpenType 1.8.4) - Typography | Microsoft Docs](https://docs.microsoft.com/en-us/typography/opentype/spec/fvar#instancerecord)

```bash
# SC as a example. They were same.
ttx /mnt/c/Users/echo/Downloads/NotoSansSC-VF.otf
```
```xml
<fvar>

    <!-- Weight -->
    <Axis>
      <AxisTag>wght</AxisTag>
      <Flags>0x0</Flags>
      <MinValue>100.0</MinValue>
      <DefaultValue>100.0</DefaultValue>
      <MaxValue>900.0</MaxValue>
      <AxisNameID>265</AxisNameID>
    </Axis>

    <!-- Thin -->
    <!-- PostScript: NotoSansSCVF-Thin -->
    <NamedInstance flags="0x0" postscriptNameID="267" subfamilyNameID="266">
      <coord axis="wght" value="100.0"/>
    </NamedInstance>

    <!-- Light -->
    <!-- PostScript: NotoSansSCVF-Light -->
    <NamedInstance flags="0x0" postscriptNameID="269" subfamilyNameID="268">
      <coord axis="wght" value="300.0"/>
    </NamedInstance>

    <!-- DemiLight -->
    <!-- PostScript: NotoSansSCVF-DemiLight -->
    <NamedInstance flags="0x0" postscriptNameID="271" subfamilyNameID="270">
      <coord axis="wght" value="350.0"/>
    </NamedInstance>

    <!-- Regular -->
    <!-- PostScript: NotoSansSCVF-Regular -->
    <NamedInstance flags="0x0" postscriptNameID="273" subfamilyNameID="272">
      <coord axis="wght" value="400.0"/>
    </NamedInstance>

    <!-- Medium -->
    <!-- PostScript: NotoSansSCVF-Medium -->
    <NamedInstance flags="0x0" postscriptNameID="275" subfamilyNameID="274">
      <coord axis="wght" value="500.0"/>
    </NamedInstance>

    <!-- Bold -->
    <!-- PostScript: NotoSansSCVF-Bold -->
    <NamedInstance flags="0x0" postscriptNameID="277" subfamilyNameID="276">
      <coord axis="wght" value="700.0"/>
    </NamedInstance>

    <!-- Black -->
    <!-- PostScript: NotoSansSCVF-Black -->
    <NamedInstance flags="0x0" postscriptNameID="279" subfamilyNameID="278">
      <coord axis="wght" value="900.0"/>
    </NamedInstance>
  </fvar>
```

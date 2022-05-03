# Noto CJK VF Magisk
A module replace CJK fonts to Noto CJK Variable.

Sister module: [Source-Han-VF-Magisk](https://github.com/WordlessEcho/Source-Han-VF-Magisk)

## Requirement
Android 8.0 and above. 9.0 for serif support.

## Advantage
Compare to normal super OTC version, only 38.9MB for all weight.

## [notocjk Magisk Module](https://github.com/simonsmh/notocjk) Differences
This module inculdes demi-light weight that Android developers won't use. Because Roboto (Default font of Latin characters on Android) doesn't have this weight.

notocjk use Noto Serif CJK subset to avoid GitHub file size limit of single file. This module split it as two part.

## Try variable
[Variable Font Test](https://github.com/WordlessEcho/Variable-Font-Test)
![App Preview](https://github.com/WordlessEcho/Variable-Font-Test/blob/main/doc/pics/variable-font-test-zh-tw.gif?raw=true)

## Font
Both font had been modified with [subset_noto_cjk.py](https://cs.android.com/android/platform/superproject/+/master:external/noto-fonts/cjk/subset_noto_cjk.py). And add chws feature with [kojiishi/east_asian_spacing: OpenType East Asian Contextual Spacing Build Tools](https://github.com/kojiishi/east_asian_spacing).

### Noto Sans CJK VF download
[noto-cjk/Sans/Variable at main · googlefonts/noto-cjk](https://github.com/googlefonts/noto-cjk/tree/main/Sans/Variable)

### Noto Serif CJK VF download
[noto-cjk/Serif/Variable at main · googlefonts/noto-cjk](https://github.com/googlefonts/noto-cjk/tree/main/Serif/Variable)

## wght value
Tools: [googlefonts/fonttools: A library to manipulate font files from Python.](https://github.com/googlefonts/fonttools)
See also: [fvar — Font Variations Table (OpenType 1.8.4) - Typography | Microsoft Docs](https://docs.microsoft.com/en-us/typography/opentype/spec/fvar#instancerecord)

```bash
# SC as a example. They were same.
ttx -y 3 -t fvar NotoSansCJK-VF.ttc
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
    <!-- PostScript: NotoSansCJKscVF-Thin -->
    <NamedInstance flags="0x0" postscriptNameID="267" subfamilyNameID="266">
      <coord axis="wght" value="100.0"/>
    </NamedInstance>

    <!-- Light -->
    <!-- PostScript: NotoSansCJKscVF-Light -->
    <NamedInstance flags="0x0" postscriptNameID="269" subfamilyNameID="268">
      <coord axis="wght" value="300.0"/>
    </NamedInstance>

    <!-- DemiLight -->
    <!-- PostScript: NotoSansCJKscVF-DemiLight -->
    <NamedInstance flags="0x0" postscriptNameID="271" subfamilyNameID="270">
      <coord axis="wght" value="350.0"/>
    </NamedInstance>

    <!-- Regular -->
    <!-- PostScript: NotoSansCJKscVF-Regular -->
    <NamedInstance flags="0x0" postscriptNameID="273" subfamilyNameID="272">
      <coord axis="wght" value="400.0"/>
    </NamedInstance>

    <!-- Medium -->
    <!-- PostScript: NotoSansCJKscVF-Medium -->
    <NamedInstance flags="0x0" postscriptNameID="275" subfamilyNameID="274">
      <coord axis="wght" value="500.0"/>
    </NamedInstance>

    <!-- Bold -->
    <!-- PostScript: NotoSansCJKscVF-Bold -->
    <NamedInstance flags="0x0" postscriptNameID="277" subfamilyNameID="276">
      <coord axis="wght" value="700.0"/>
    </NamedInstance>

    <!-- Black -->
    <!-- PostScript: NotoSansCJKscVF-Black -->
    <NamedInstance flags="0x0" postscriptNameID="279" subfamilyNameID="278">
      <coord axis="wght" value="900.0"/>
    </NamedInstance>
  </fvar>
```

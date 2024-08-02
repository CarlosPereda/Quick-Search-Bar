<a id="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">

<h3 align="center" style="font-size:30px">Quick Search Bar</h3>
  <p align="center">
    A small and simple graphical application to perform fast search queries. 
    <br />
    ·
    <a href="https://github.com/CarlosPereda/Quick-Search-Bar/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/CarlosPereda/Quick-Search-Bar/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a>
      <ul>
        <li><a href="#perform-a-search">Perform a search</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
<div align="center" style="margin-bottom: 20px">
  <a href="https://github.com/CarlosPereda/Quick-Search-Bar">
    <img src="Documentation\searchBarsExample3.gif" width="800">
  </a>
</div>

With Quick Search Bars, any search query is just one shortcut away. Whether you need to perform a general web search, find a location on maps or translate text, simply press a predefined key to open it, type your query, and press enter.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Built With

* AutoHotkey v2.0.11

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

You need to have any version of AHKv2 installed to your computer. While you don't need to know anything about AHK to use this software, it would be useful if you want to create your own custom search bar. You can get AutoHotkeys from https://autohotkey.com/

### Installation

1. Just clone or download the repository
   ```sh
   git clone https://github.com/CarlosPereda/Quick-Search-Bar
   ```

2. Alternatively, you can include the Main.ahk contents into an existing ahk script that you are already using.
    ```js
    #Include .\GUI_GoogleSearch\GUI_GoogleSearch.ahk
    #Include .\GUI_GoogleMaps\GUI_GoogleMaps.ahk
    #Include .\GUI_LongmanDictionary\GUI_LongmanDictionary.ahk
    #Include .\GUI_GoogleTranslator\GUI_GoogleTranslator.ahk

    F1::GuiGoogleSearch().execute()
    +F2::GuiGoogleMaps().execute()
    F3::GuiLongmanDictionary().execute()
    F4::GuiGoogleTraslate().execute()
    ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage

### Perform a search
1. Execute Main.ahk 
2. Press ```F1```, ```Shift+F2```, ```F3``` or ```F4```  on your Keyboard to open the respective search bar (if words are highligthed they will be searched directly without openening the search bar)
3. Type your query
4. Press ```Enter```

<div align="center" style="margin-bottom: 20px">
  <a href="https://github.com/CarlosPereda/Quick-Search-Bar">
    <img src="Documentation\searchBarsExample2.gif" width="800">
  </a>
</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Add changelog
- [ ] Add a licence
- [ ] Test in Windows 11

<p align="right">(<a href="#readme-top">back to top</a>)</p>
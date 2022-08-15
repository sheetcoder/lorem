# lorem
[Lite-xl](https://github.com/lite-xl/lite-xl) plugin for generating Lorem Ipsum placeholder dummy text. Need 2.1 or above version of lite-xl.

# Installation

Drop `lorem.lua` file in the [relevent folders](https://github.com/lite-xl/lite-xl-plugins#how-to-install=)

## How to use

* Length and number of paragraphs can be customized from inside `lorem.lua`

```lua
 config.plugins.lorem = {
    para_len = 10, -- Length of a paragraph
    para_no = 3   -- Number of paragraphs 
}
```

### Sentence
* `Lorem:Sentence` or `ctrl+7`

### Paragraph

* `Lorem:Paragraph` or `ctrl+8`

### Text
* `Lorem:Text` or `ctrl+9`


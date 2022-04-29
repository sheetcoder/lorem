-- mod-version:2 -- lite-xl 2.0

local core = require "core"
local command = require "core.command"
local config = require "core.config"
local keymap = require "core.keymap"

config.lorem_para_len = 10 -- Length of a paragraph
config.lorem_para_no = 3   -- Number of paragraphs 

local data = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
local dataTable = { "Quisque vitae varius ex, eu volutpat orci.",
                    "Aenean ullamcorper orci et vulputate fermentum.",
                    "Cras erat dui, finibus vel lectus ac, pharetra dictum odio.",
                    "Nullam tempus scelerisque purus, sed mattis elit condimentum nec.",
                    "Etiam risus sapien, auctor eu volutpat sit amet, porta in nunc.",
                    "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
                    "Proin ipsum purus, laoreet quis dictum a, laoreet sed ligula.",
                    "Integer ultricies malesuada quam.",
                    "Cras vel elit sed mi placerat pharetra eget vel odio.",
                    "Duis ac nulla varius diam ultrices rutrum.", }

local function sentence()
    return tostring(dataTable[math.random(#dataTable)])
end

local function paragraph(length,first)
    assert(type(length)=="number" and length>0)
    assert(type(first)=="boolean")
    
    local temp = {}
    for i=1,length do 
        -- selecting random sentence from table and appending it
        table.insert(temp,tostring(dataTable[math.random(#dataTable)])) 
    end
    -- table to string conversion
    local paragraph = table.concat(temp," ") 
    if first then
        -- if true then append "Lorem" sentence to paragraph
        return data.." "..paragraph
    else 
        return paragraph
    end
end

local function text(length,paragraph_length)
    assert(type(length)=="number" and length>0)
    assert(type(paragraph_length)=="number" and paragraph_length>0)
    
    local par
    local temp = {}
    for i=1,length do 
        if i==1 then
            par = paragraph(paragraph_length,true)
        else 
            par = paragraph(paragraph_length,false)
        end
        table.insert(temp,par)
    end
    local text = table.concat(temp,"\n\n") -- table to string conversion
    return text
end

local function dummy(f)
    local line, col = core.active_view.doc:get_selection()
    core.active_view.doc:raw_insert(line,col,f)
end

command.add("core.docview", {
    ["lorem:sentence"] = function() dummy(sentence()) end,
    ["lorem:paragraph"] = function()         
       dummy(paragraph(config.lorem_para_len,false))         
    end,
    ["lorem:text"] = function()         
       dummy(text(config.lorem_para_no,config.lorem_para_len))         
    end,
})

keymap.add {
  ["ctrl+7"] = "lorem:sentence",
  ["ctrl+8"] = "lorem:paragraph",
  ["ctrl+9"] = "lorem:text",
}



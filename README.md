# mpv.nvim
a plugin to create shortcuts to play videos from neovim


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about">About</a>
    </li>
    <li>
        <a href="#installation">Installation</a>
    </li>
    <li>
        <a href="#to-do">To-do</a>
    </li>
    <li>
        <a href="#license">License</a>
    </li>
  </ol>
</details>

## About

a neovim plugin that lets you create custom shortcuts and commands to play a video in a separate mpv window on top of the nevoim editor.

This plugin is mainly for fun reactions while coding, not made for watching long videos.

DISCLAIMER: I am not held reliable for your custom shortcuts, it's on you.


## Installation

You need to install mpv player and [ytdl] (https://github.com/ytdl-org/youtube-dl) first.

Add the plugin to your lua file like this:

```
  {
    "The-Silent-One/mpv.nvim",
    --define your videos here
    config = function()
      -- example for user command
      vim.api.nvim_create_user_command("Lich", function()
        -- the mpv window and the local file name will take the second parameter passed
        require("mpv").play_song("https://youtu.be/Uh80C5cmkXU", "Lich")
      end, {})
      -- example for keymap, in this we are not saving the video locally
      vim.keymap.set('n', '<leader>A', function()
        require("mpv").play_song("https://www.youtube.com/shorts/_TXO4RB3nIU", "Prime", save = false)
      end, {})
    end,
  },
```
You can add your own config, these are just examples.

## License

Distributed under the MIT license. See 'License.txt' for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Force language

A [Hammerspoon](http://www.hammerspoon.org/) configuration which rests you assured that you will aways have a right input source in apps where you need it.

## Example use case

I'm Russian developer but want to always have English input source in some dev applications like iTerm, IDEA, Android Studio, etc. Unfortunately in some cases MacOS can't guarantee that (which is annoying), but this script fixes that issue.

## Installation & Configuration

1. Ensure that you have MacOS with the latest Hammerspoon installed.
2. Copy & paste the code from [init.lua](https://github.com/sv3k/force-language/blob/master/init.lua) to your Hammerspoon Config file.
3. Check `target_lang` and `target_apps` values in the code — edit them for your specific needs or leave as is.
4. Save Config file and reload it in Hammerspoon.
5. Viola!
6. You may also want to enable launching Hammerspoon at login in Preferences.

## Usage

This script only sets the desired input source when you switch focus to specified apps. You will be able to change the input source when already focused on the app. The non-target apps input source behaviour won't be affected.

## License

This project is licensed under the MIT License.

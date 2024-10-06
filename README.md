# Installation
Place the `literate` directory at `~/.vim/pack/plugins/start/literate`

or

```vim
Plug 'wolandark/literate'
```

# Testing
There are several tests under `~/literate/tests`. You can open any of them and press `<C-c><C-c>` over the `BEGIN` token to execute the code block.

# Demo for shell script
https://github.com/user-attachments/assets/d9572c9c-9309-4878-b3ba-1551e5bc2acc

# Usage
This plugin expects the `*.lit` file extension. Your code should go between `BEGIN [lang]` and `END` where `[lang`] is a supported language (without the brackets).
# Example in Perl
```perl
BEGIN perl

use strict;
use warnings;

sub print_pyramid {
    my $rows = 5;  # Set the number of rows for the pyramid

    for my $i (0 .. $rows - 1) {
        # Print spaces
        print ' ' x ($rows - $i - 1);
        # Print asterisks
        print '*' x (2 * $i + 1);
        # New line
        print "\n";
    }
}

print_pyramid();

END
```
Pressing `C-c C-c` (that is Ctrl+c twice same as in emacs org-mode) over the `BEGIN` token will execute the code block.
![image](https://github.com/user-attachments/assets/2a95aa0b-b453-4bd5-b20e-8271a90c705b)

# Extending 
You can add any language to the plugin by adding an `elseif` block to the `if l:lang` condition at line 22 of the plugin.

# Contribution 
Please follow the standards of code contribution.

# License 
Same as Vim

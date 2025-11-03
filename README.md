<div align="center">

# 📟 Ft Printf

### *A custom implementation of the C standard library printf function*

[![42 School](https://img.shields.io/badge/School-000000?style=for-the-badge&logo=42&logoColor=white)](https://42.fr)
[![Language](https://img.shields.io/badge/Language-C-blue?style=for-the-badge&logo=c)](https://en.wikipedia.org/wiki/C_(programming_language))
[![Norminette](https://img.shields.io/badge/Norminette-passing-success?style=for-the-badge)](https://github.com/42School/norminette)
![Grade](https://img.shields.io/badge/Grade-100%2F100-success?style=for-the-badge)

</div>

---

## 📋 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Format Specifiers](#-format-specifiers)
- [Installation](#-installation)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Testing](#-testing)
- [Function Prototype](#-function-prototype)
- [Learning Objectives](#-learning-objectives)
- [Makefile Commands](#-makefile-commands)
- [Implementation Details](#️-implementation-details)
- [Code Quality](#-code-quality)
- [Author](#-author)
- [License](#-license)

---

## 📖 About

**ft_printf** is a recreation of the powerful C standard library function `printf()`. This project challenges developers to understand variadic functions, implement format parsing, and handle multiple data type conversions while maintaining compliance with 42's coding standards (Norminette).

The function processes format strings and outputs formatted text, supporting various conversion specifiers for different data types. It's a fundamental project in the 42 curriculum that builds strong foundations in C programming.

---

## ✨ Features

<table>
<tr>
<td>

 **Variadic Function Implementation**  
 **Multiple Format Specifiers**  
 **Return Value Handling**  
 **Memory-Safe Operations**  

</td>
<td>

 **Norminette Compliant**  
 **Static Library Build**  
 **Efficient String Parsing**  
 **Pointer Address Printing**  

</td>
</tr>
</table>

---

## 🎯 Format Specifiers

| Specifier | Description | Example | Output |
|:---------:|:------------|:--------|:-------|
| `%c` | Single character | `ft_printf("%c", 'A')` | `A` |
| `%s` | String of characters | `ft_printf("%s", "Hello")` | `Hello` |
| `%p` | Pointer address | `ft_printf("%p", ptr)` | `0x7ffe5367e044` |
| `%d` | Signed decimal integer | `ft_printf("%d", -42)` | `-42` |
| `%i` | Signed integer | `ft_printf("%i", 42)` | `42` |
| `%u` | Unsigned decimal integer | `ft_printf("%u", 42)` | `42` |
| `%x` | Hexadecimal (lowercase) | `ft_printf("%x", 255)` | `ff` |
| `%X` | Hexadecimal (uppercase) | `ft_printf("%X", 255)` | `FF` |
| `%%` | Percent sign | `ft_printf("%%")` | `%` |

---

## 🚀 Installation

### Clone the Repository

```bash
git clone https://github.com/Adavitas/ft_printf.git
cd ft_printf
```

### Compile the Library

```bash
make
```

This generates `libftprintf.a` - ready to link with your projects!

### Clean Build Files

```bash
make clean    # Remove object files
make fclean   # Remove object files and library
make re       # Rebuild everything from scratch
```

---

## 💻 Usage

### Basic Integration

**1. Include the header in your source file:**

```c
#include "ft_printf.h"
```

**2. Compile with the library:**

```bash
gcc -Wall -Wextra -Werror your_file.c -L. -lftprintf -o your_program
```

**3. Run your program:**

```bash
./your_program
```

### Code Examples

```c
#include "ft_printf.h"

int main(void)
{
    int count;
    
    // Print strings and characters
    ft_printf("Hello, %s!\n", "World");
    ft_printf("Character: %c\n", 'A');
    
    // Print numbers in different formats
    ft_printf("Decimal: %d\n", 42);
    ft_printf("Unsigned: %u\n", 4294967295);
    ft_printf("Hexadecimal: %x\n", 255);
    ft_printf("Hex (upper): %X\n", 255);
    
    // Print pointer addresses
    int num = 42;
    ft_printf("Pointer: %p\n", &num);
    
    // Get return value
    count = ft_printf("This string has %d characters!\n", 28);
    ft_printf("Characters printed: %d\n", count);
    
    return (0);
}
```

**Expected Output:**
```
Hello, World!
Character: A
Decimal: 42
Unsigned: 4294967295
Hexadecimal: ff
Hex (upper): FF
Pointer: 0x7ffc8b4a5e4c
This string has 28 characters!
Characters printed: 29
```

---

## 📁 Project Structure

```
ft_printf/
│
├──  ft_printf.c         # Main printf function and format parser
├──  ft_printf.h         # Header file with prototypes
│
├──  ft_putchar_p.c      # Character output handler
├──  ft_putstr_p.c       # String output handler
├──  ft_putnbr_p.c       # Number output handler (signed/unsigned)
├──  ft_putptr_p.c       # Pointer address output handler
├──  ft_putnbr_hex_lw.c  # Hexadecimal lowercase converter
├──  ft_putnbr_hex_up.c  # Hexadecimal uppercase converter
│
└──  Makefile            # Build automation
```

---

## 🧪 Testing

### Create a Test File

```c
#include "ft_printf.h"
#include <stdio.h>
#include <limits.h>

int main(void)
{
    int ft_ret, std_ret;
    
    printf("\n=== Character & String Tests ===\n");
    ft_printf("ft_printf: [%c] [%s]\n", 'X', "Hello");
    printf("printf:    [%c] [%s]\n\n", 'X', "Hello");
    
    printf("=== Integer Tests ===\n");
    ft_printf("ft_printf: %d | %i | %u\n", -42, 42, 42);
    printf("printf:    %d | %i | %u\n\n", -42, 42, 42);
    
    printf("=== Hexadecimal Tests ===\n");
    ft_printf("ft_printf: %x | %X\n", 255, 255);
    printf("printf:    %x | %X\n\n", 255, 255);
    
    printf("=== Pointer Tests ===\n");
    ft_printf("ft_printf: %p\n", &ft_ret);
    printf("printf:    %p\n\n", &ft_ret);
    
    printf("=== Edge Cases ===\n");
    ft_printf("ft_printf: %d | %d\n", INT_MAX, INT_MIN);
    printf("printf:    %d | %d\n\n", INT_MAX, INT_MIN);
    
    printf("=== Return Value Test ===\n");
    ft_ret = ft_printf("ft_printf: Test String\n");
    std_ret = printf("printf:    Test String\n");
    printf("ft_printf returned: %d\n", ft_ret);
    printf("printf returned:    %d\n", std_ret);
    
    return (0);
}
```

### Compile and Run Tests

```bash
gcc -Wall -Wextra -Werror test.c -L. -lftprintf -o test
./test
```

---

## 🔍 Function Prototype

```c
int ft_printf(const char *format, ...);
```

### Parameters
- **format**: String containing text and format specifiers

### Return Value
- Number of characters printed (excluding null terminator)
- Returns `0` if format string is `NULL`

---

## 🎓 Learning Objectives

This project teaches essential C programming concepts:

-  **Variadic Functions** - Using `va_list`, `va_start`, `va_arg`, `va_end`
-  **Type Conversion** - Handling different data types and casting
-  **String Parsing** - Analyzing format strings and extracting specifiers
-  **Modular Programming** - Breaking functionality into reusable functions
-  **Static Libraries** - Creating and linking `.a` library files
-  **Number Base Conversion** - Decimal to hexadecimal conversion
-  **Memory & Pointers** - Safe pointer manipulation and address printing

---

## 📊 Makefile Commands

| Command | Description |
|---------|-------------|
| `make` or `make all` | Compile the library |
| `make clean` | Remove object files (`*.o`) |
| `make fclean` | Remove object files and `libftprintf.a` |
| `make re` | Clean and rebuild the entire project |

---

## 🏗️ Implementation Details

### Core Components

1. **Main Function** (`ft_printf.c`)
   - Initializes variadic argument list
   - Parses format string
   - Dispatches to appropriate handler functions

2. **Format Handlers** 
   - Each specifier has dedicated conversion function
   - Counter tracking for return value
   - Handles edge cases (NULL pointers, etc.)

3. **Output Functions**
   - Direct write to standard output using `write()`
   - Character-by-character processing
   - Efficient string handling

---

## 🌟 Code Quality

- ✅ **42 Norminette Compliant** - Follows strict coding standards
- ✅ **No Memory Leaks** - Proper resource management
- ✅ **Error Handling** - NULL checks and edge case management
- ✅ **Compilation Flags** - `-Wall -Wextra -Werror`

---

## 👨‍💻 Author

**Aleksandre Davitashvili** (Adavitas) - *42 Student*

[![GitHub](https://img.shields.io/badge/GitHub-Adavitas-181717?style=flat&logo=github)](https://github.com/Adavitas)

---

## 📝 License

This project is part of the 42 School curriculum.

---

*This project was created as part of the 42 School common core curriculum.*

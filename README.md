# Assignment 1: Volume Calculator (TDD with Bash)

## 🧠 Description

This script calculates the volume of a rectangular prism using the formula:

```
Volume = Height × Width × Length
```

This project was developed using a **Test Driven Development (TDD)** approach.

---

## 📁 Files

- `calculate_volume.sh` - Main script for calculating volume
- `test_calculate_volume.sh` - Script containing unit tests
- `unimplemented_tests.txt` - Tests we planned but didn't implement
- `README.md` - Documentation

---

## 🛠️ Usage

1. Make the scripts executable:
   ```bash
   chmod +x calculate_volume.sh test_calculate_volume.sh
   ```

2. Run the tests:
   ```bash
   ./test_calculate_volume.sh
   ```

---

## ✅ TDD Process

1. **Wrote failing tests** for expected behavior.
2. **Implemented minimal code** in `calculate_volume.sh` to make tests pass.
3. **Expanded coverage** with edge cases and input validation.
4. **Documented unimplemented ideas** in `unimplemented_tests.txt`.

---

## 🧪 Sample Tests

- ✅ `calculate_volume 2 3 4` → `24`
- ✅ Zero height → `0`
- ✅ Large dimensions → `1000000`
- ❌ Negative or non-numeric values → Should error



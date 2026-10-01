#include <assert.h>
#include <float.h>
#include <inttypes.h>
#include <limits.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#define SHOW_SIGNED(T, LO, HI, FMT) do { \
    T value = (T)7; \
    printf("%-20s example=%" FMT " bytes=%zu range=[%" FMT ", %" FMT "]\n", \
           #T, value, sizeof(value), (T)(LO), (T)(HI)); \
} while (0)

#define SHOW_UNSIGNED(T, HI, FMT) do { \
    T value = (T)7; \
    printf("%-20s example=%" FMT " bytes=%zu range=[0, %" FMT "]\n", \
           #T, value, sizeof(value), (T)(HI)); \
} while (0)

#define VERIFY_EXACT(T, BITS) _Static_assert(sizeof(T) * CHAR_BIT == (BITS), #T " width")
#define VERIFY_AT_LEAST(T, BITS) _Static_assert(sizeof(T) * CHAR_BIT >= (BITS), #T " width")

VERIFY_EXACT(int8_t, 8);
VERIFY_EXACT(uint8_t, 8);
VERIFY_EXACT(int16_t, 16);
VERIFY_EXACT(uint16_t, 16);
VERIFY_EXACT(int32_t, 32);
VERIFY_EXACT(uint32_t, 32);
VERIFY_EXACT(int64_t, 64);
VERIFY_EXACT(uint64_t, 64);

VERIFY_AT_LEAST(int_least8_t, 8);
VERIFY_AT_LEAST(uint_least8_t, 8);
VERIFY_AT_LEAST(int_least16_t, 16);
VERIFY_AT_LEAST(uint_least16_t, 16);
VERIFY_AT_LEAST(int_least32_t, 32);
VERIFY_AT_LEAST(uint_least32_t, 32);
VERIFY_AT_LEAST(int_least64_t, 64);
VERIFY_AT_LEAST(uint_least64_t, 64);

VERIFY_AT_LEAST(int_fast8_t, 8);
VERIFY_AT_LEAST(uint_fast8_t, 8);
VERIFY_AT_LEAST(int_fast16_t, 16);
VERIFY_AT_LEAST(uint_fast16_t, 16);
VERIFY_AT_LEAST(int_fast32_t, 32);
VERIFY_AT_LEAST(uint_fast32_t, 32);
VERIFY_AT_LEAST(int_fast64_t, 64);
VERIFY_AT_LEAST(uint_fast64_t, 64);

enum Color { RED = 1, GREEN = 2, BLUE = 3 };

struct Sample {
    int value;
};

/* void */
static void show_void(void)
{
    puts("void                 example=show_void returns no value");
}

int main(void)
{
    /* int */
    SHOW_SIGNED(int, INT_MIN, INT_MAX, "d");

    /* signed int */
    SHOW_SIGNED(signed int, INT_MIN, INT_MAX, "d");

    /* unsigned int */
    SHOW_UNSIGNED(unsigned int, UINT_MAX, "u");

    /* short int */
    SHOW_SIGNED(short int, SHRT_MIN, SHRT_MAX, "hd");

    /* unsigned short int */
    SHOW_UNSIGNED(unsigned short int, USHRT_MAX, "hu");

    /* long int */
    SHOW_SIGNED(long int, LONG_MIN, LONG_MAX, "ld");

    /* unsigned long int */
    SHOW_UNSIGNED(unsigned long int, ULONG_MAX, "lu");

    /* long long int */
    SHOW_SIGNED(long long int, LLONG_MIN, LLONG_MAX, "lld");

    /* unsigned long long int */
    SHOW_UNSIGNED(unsigned long long int, ULLONG_MAX, "llu");

    /* char */
    char letter = 'A';
    printf("%-20s example=%c bytes=%zu range=[%d, %d]\n",
           "char", letter, sizeof(letter), CHAR_MIN, CHAR_MAX);

    /* signed char */
    SHOW_SIGNED(signed char, SCHAR_MIN, SCHAR_MAX, "hhd");

    /* unsigned char */
    SHOW_UNSIGNED(unsigned char, UCHAR_MAX, "hhu");

    /* float */
    float small_fraction = 1.25f;
    printf("%-20s example=%g bytes=%zu min_normal=%g max=%g\n",
           "float", (double)small_fraction, sizeof(small_fraction),
           (double)FLT_MIN, (double)FLT_MAX);

    /* double */
    double fraction = 2.5;
    printf("%-20s example=%g bytes=%zu min_normal=%g max=%g\n",
           "double", fraction, sizeof(fraction), DBL_MIN, DBL_MAX);

    /* long double */
    long double large_fraction = 3.75L;
    printf("%-20s example=%Lg bytes=%zu min_normal=%Lg max=%Lg\n",
           "long double", large_fraction, sizeof(large_fraction),
           LDBL_MIN, LDBL_MAX);

    /* void */
    show_void();

    /* void * */
    void *address = &letter;
    printf("%-20s example=%p bytes=%zu\n", "void *", address, sizeof(address));

    /* enum */
    enum Color color = GREEN;
    printf("%-20s example=GREEN(%d) bytes=%zu\n",
           "enum Color", color, sizeof(color));

    /* const int */
    const int fixed = 11;
    printf("%-20s example=%d bytes=%zu\n", "const int", fixed, sizeof(fixed));

    /* volatile int */
    volatile int changing = 12;
    printf("%-20s example=%d bytes=%zu\n",
           "volatile int", changing, sizeof(changing));

    /* register int */
    register int suggested_register = 13;
    printf("%-20s example=%d bytes=%zu\n",
           "register int", suggested_register, sizeof(suggested_register));

    /* struct Sample */
    struct Sample record = { 14 };
    printf("%-20s example=%d bytes=%zu\n",
           "struct Sample", record.value, sizeof(record));

    /* int[3] */
    int numbers[3] = { 1, 2, 3 };
    printf("%-20s example={%d, %d, %d} bytes=%zu\n",
           "int[3]", numbers[0], numbers[1], numbers[2], sizeof(numbers));

    /* int8_t */
    SHOW_SIGNED(int8_t, INT8_MIN, INT8_MAX, PRId8);

    /* uint8_t */
    SHOW_UNSIGNED(uint8_t, UINT8_MAX, PRIu8);

    /* int16_t */
    SHOW_SIGNED(int16_t, INT16_MIN, INT16_MAX, PRId16);

    /* uint16_t */
    SHOW_UNSIGNED(uint16_t, UINT16_MAX, PRIu16);

    /* int32_t */
    SHOW_SIGNED(int32_t, INT32_MIN, INT32_MAX, PRId32);

    /* uint32_t */
    SHOW_UNSIGNED(uint32_t, UINT32_MAX, PRIu32);

    /* int64_t */
    SHOW_SIGNED(int64_t, INT64_MIN, INT64_MAX, PRId64);

    /* uint64_t */
    SHOW_UNSIGNED(uint64_t, UINT64_MAX, PRIu64);

    /* int_least8_t */
    SHOW_SIGNED(int_least8_t, INT_LEAST8_MIN, INT_LEAST8_MAX, PRIdLEAST8);

    /* uint_least8_t */
    SHOW_UNSIGNED(uint_least8_t, UINT_LEAST8_MAX, PRIuLEAST8);

    /* int_least16_t */
    SHOW_SIGNED(int_least16_t, INT_LEAST16_MIN, INT_LEAST16_MAX, PRIdLEAST16);

    /* uint_least16_t */
    SHOW_UNSIGNED(uint_least16_t, UINT_LEAST16_MAX, PRIuLEAST16);

    /* int_least32_t */
    SHOW_SIGNED(int_least32_t, INT_LEAST32_MIN, INT_LEAST32_MAX, PRIdLEAST32);

    /* uint_least32_t */
    SHOW_UNSIGNED(uint_least32_t, UINT_LEAST32_MAX, PRIuLEAST32);

    /* int_least64_t */
    SHOW_SIGNED(int_least64_t, INT_LEAST64_MIN, INT_LEAST64_MAX, PRIdLEAST64);

    /* uint_least64_t */
    SHOW_UNSIGNED(uint_least64_t, UINT_LEAST64_MAX, PRIuLEAST64);

    /* int_fast8_t */
    SHOW_SIGNED(int_fast8_t, INT_FAST8_MIN, INT_FAST8_MAX, PRIdFAST8);

    /* uint_fast8_t */
    SHOW_UNSIGNED(uint_fast8_t, UINT_FAST8_MAX, PRIuFAST8);

    /* int_fast16_t */
    SHOW_SIGNED(int_fast16_t, INT_FAST16_MIN, INT_FAST16_MAX, PRIdFAST16);

    /* uint_fast16_t */
    SHOW_UNSIGNED(uint_fast16_t, UINT_FAST16_MAX, PRIuFAST16);

    /* int_fast32_t */
    SHOW_SIGNED(int_fast32_t, INT_FAST32_MIN, INT_FAST32_MAX, PRIdFAST32);

    /* uint_fast32_t */
    SHOW_UNSIGNED(uint_fast32_t, UINT_FAST32_MAX, PRIuFAST32);

    /* int_fast64_t */
    SHOW_SIGNED(int_fast64_t, INT_FAST64_MIN, INT_FAST64_MAX, PRIdFAST64);

    /* uint_fast64_t */
    SHOW_UNSIGNED(uint_fast64_t, UINT_FAST64_MAX, PRIuFAST64);

    /* intptr_t */
    SHOW_SIGNED(intptr_t, INTPTR_MIN, INTPTR_MAX, PRIdPTR);

    /* uintptr_t */
    SHOW_UNSIGNED(uintptr_t, UINTPTR_MAX, PRIuPTR);

    /* intmax_t */
    SHOW_SIGNED(intmax_t, INTMAX_MIN, INTMAX_MAX, PRIdMAX);

    /* uintmax_t */
    SHOW_UNSIGNED(uintmax_t, UINTMAX_MAX, PRIuMAX);

    /* ptrdiff_t */
    ptrdiff_t distance = &numbers[2] - &numbers[0];
    printf("%-20s example=%td bytes=%zu range=[%td, %td]\n",
           "ptrdiff_t", distance, sizeof(distance),
           (ptrdiff_t)PTRDIFF_MIN, (ptrdiff_t)PTRDIFF_MAX);

    /* size_t */
    size_t count = sizeof(numbers) / sizeof(numbers[0]);
    printf("%-20s example=%zu bytes=%zu range=[0, %zu]\n",
           "size_t", count, sizeof(count), (size_t)SIZE_MAX);

    int target = 42;
    intptr_t signed_pointer = (intptr_t)(void *)&target;
    uintptr_t unsigned_pointer = (uintptr_t)(void *)&target;
    assert((void *)signed_pointer == (void *)&target);
    assert((void *)unsigned_pointer == (void *)&target);
    puts("pointer round-trip   verified");

    return 0;
}

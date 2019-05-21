int power (int base, int exponent) {
    int i;
    int result = 1;
    for (i = 1; i <= exponent; i++) {
        result *= base;
    }
    return result;
}

#include <stdio.h>
#include <stdbool.h>

// H�m ki?m tra s? nguy�n t?
bool isPrime(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) return false;
    }
    return true;
}


int main() {
    FILE *fileInput, *fileOutput;
    int n, number;

    // M? file d?u v�o d? ghi
    fileInput = fopen("songuyen.dat", "w");

    if (fileInput == NULL) {
        printf("Kh�ng th? m? file d?u v�o!");
        return 1;
    }

    printf("Nh?p s? lu?ng s? nguy�n: ");
    scanf("%d", &n);

    printf("Nh?p c�c s? nguy�n:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &number);
        fprintf(fileInput, "%d ", number);
    }

    // ��ng file
    fclose(fileInput);

    // M? file d?u v�o d? d?c
    fileInput = fopen("songuyen.dat", "r");

    if (fileInput == NULL) {
        printf("Kh�ng th? m? file d?u v�o!");
        return 1;
    }

    // M? file d?u ra d? ghi
    fileOutput = fopen("songto.dat", "w");

    if (fileOutput == NULL) {
        printf("Kh�ng th? m? file d?u ra!");
        return 1;
    }

    // �?c t?ng s? t? file d?u v�o, ki?m tra s? nguy�n t? v� ghi v�o file d?u ra
    while (fscanf(fileInput, "%d", &number) != EOF) {
        if (isPrime(number)) {
            fprintf(fileOutput, "%d ", number);
        }
    }

    // ��ng file
    fclose(fileInput);
    fclose(fileOutput);

    // Hi?n th? n?i dung file d?u ra tr�n m�n h�nh
    fileOutput = fopen("songto.dat", "r");

    if (fileOutput == NULL) {
        printf("Kh�ng th? m? file d?u ra!");
        return 1;
    }

    printf("C�c s? nguy�n t? trong file 'songto.dat':\n");
    while (fscanf(fileOutput, "%d", &number) != EOF) {
        printf("%d ", number);
    }
    printf("\n");

    // ��ng file
    fclose(fileOutput);

    return 0;
}


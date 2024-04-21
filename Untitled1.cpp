#include <stdio.h>
#include <stdbool.h>

// Hàm ki?m tra s? nguyên t?
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

    // M? file d?u vào d? ghi
    fileInput = fopen("songuyen.dat", "w");

    if (fileInput == NULL) {
        printf("Không th? m? file d?u vào!");
        return 1;
    }

    printf("Nh?p s? lu?ng s? nguyên: ");
    scanf("%d", &n);

    printf("Nh?p các s? nguyên:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &number);
        fprintf(fileInput, "%d ", number);
    }

    // Ðóng file
    fclose(fileInput);

    // M? file d?u vào d? d?c
    fileInput = fopen("songuyen.dat", "r");

    if (fileInput == NULL) {
        printf("Không th? m? file d?u vào!");
        return 1;
    }

    // M? file d?u ra d? ghi
    fileOutput = fopen("songto.dat", "w");

    if (fileOutput == NULL) {
        printf("Không th? m? file d?u ra!");
        return 1;
    }

    // Ð?c t?ng s? t? file d?u vào, ki?m tra s? nguyên t? và ghi vào file d?u ra
    while (fscanf(fileInput, "%d", &number) != EOF) {
        if (isPrime(number)) {
            fprintf(fileOutput, "%d ", number);
        }
    }

    // Ðóng file
    fclose(fileInput);
    fclose(fileOutput);

    // Hi?n th? n?i dung file d?u ra trên màn hình
    fileOutput = fopen("songto.dat", "r");

    if (fileOutput == NULL) {
        printf("Không th? m? file d?u ra!");
        return 1;
    }

    printf("Các s? nguyên t? trong file 'songto.dat':\n");
    while (fscanf(fileOutput, "%d", &number) != EOF) {
        printf("%d ", number);
    }
    printf("\n");

    // Ðóng file
    fclose(fileOutput);

    return 0;
}


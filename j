#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>


// Khai báo cau trúc SinhVien
struct SinhVien {
    char Masv[10];
    char Hotensv[30];
    char Phai[5];
    float Diemtoan, Diemvan, DiemAV, KQHT;
    char Xeploai[20];
};

// Khai báo các hàm
void nhapXuatMaTran(int m, int n);
void sapXepMangTangDan(int m, int n);
void tinhTongSoNguyenToChiaHetCho3(int m, int n);
void chuanHoaChuoi(char s[]);
int demKyTuGiong(char s[], char kyTu);
void nhapDanhSachSinhVien(struct SinhVien sv[], int n);
void tinhKQHTVaXepLoai(struct SinhVien sv[], int n);
void inDanhSachSinhVien(struct SinhVien sv[], int n);

int main() {
    int choice, m, n, n_sv;
    struct SinhVien* sv;
    char s[100], kyTu;

    do {
        printf("Menu:\n");
        printf("1. Nhap/xuat mang 2 chieu\n");
        printf("2. Sap xep mang tang dan\n");
        printf("3. Tinh tong so nguyen to chia het cho 3\n");
        printf("4. Nhap/chuan hoa chuoi\n");
        printf("5. Dem so lan xuat hien cua mot ky tu\n");
        printf("6. Nhap danh sach Sinh vien\n");
        printf("7. In danh sach Sinh vien tang d?n theo KQHT\n");
        printf("0. Thoat\n");
        printf("Chon chuc nang: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Nhap so hang m: ");
                scanf("%d", &m);
                printf("Nhap so cot n: ");
                scanf("%d", &n);
                nhapXuatMaTran(m, n);
                break;
            case 2:
                printf("Nhap so hang m: ");
                scanf("%d", &m);
                printf("Nhap so cot n: ");
                scanf("%d", &n);
                sapXepMangTangDan(m, n);
                break;
            case 3:
                printf("Nhap so hang m: ");
                scanf("%d", &m);
                printf("Nhap so cot n: ");
                scanf("%d", &n);
                tinhTongSoNguyenToChiaHetCho3(m, n);
                break;
            case 4:
                printf("Nhap chuoi: ");
                fflush(stdin);
                gets(s);
                chuanHoaChuoi(s);
                break;
            case 5:
                printf("Nhap ky tu: ");
                scanf(" %c", &kyTu);
                printf("So lan xuat hien cua ky tu '%c': %d\n", kyTu, demKyTuGiong(s, kyTu));
                break;
            case 6:
                printf("Nhap so luong Sinh vien: ");
                scanf("%d", &n_sv);
                sv = (struct SinhVien*)malloc(n_sv * sizeof(struct SinhVien));
                nhapDanhSachSinhVien(sv, n_sv);
                tinhKQHTVaXepLoai(sv, n_sv);
                break;
            case 7:
                inDanhSachSinhVien(sv, n_sv);
                break;
            case 0:
                printf("Ket thuc chuong trinh.\n");
                free(sv);
                break;
            default:
                printf("Lua chon khong hop le. Vui long chon lai.\n");
        }
    } while (choice != 0);

    return 0;
}

// Ð?nh nghia các hàm
void nhapXuatMaTran(int m, int n) {
    // Th?c hi?n nh?p và xu?t m?ng 2 chi?u
    int arr[m][n];

    printf("Nhap ma tran %dx%d:\n", m, n);
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("arr[%d][%d] = ", i, j);
            scanf("%d", &arr[i][j]);
        }
    }

    printf("Ma tran vua nhap:\n");
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
}

void sapXepMangTangDan(int m, int n) {
    // Th?c hi?n s?p x?p m?ng theo th? t? tang d?n
    int arr[m * n];
    int k = 0;

    printf("Nhap mang %dx%d:\n", m, n);
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("arr[%d][%d] = ", i, j);
            scanf("%d", &arr[k]);
            k++;
        }
    }

    // S?p x?p m?ng
    for (int i = 0; i < m * n - 1; i++) {
        for (int j = 0; j < m * n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                // Hoán d?i giá tr?
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    // In m?ng dã s?p x?p
    printf("Mang sau khi sap xep tang dan:\n");
    for (int i = 0; i < m * n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void tinhTongSoNguyenToChiaHetCho3(int m, int n) {
    // Th?c hi?n tính t?ng các ph?n t? là s? nguyên t? chia h?t cho 3
    int arr[m][n];

    printf("Nhap ma tran %dx%d:\n", m, n);
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("arr[%d][%d] = ", i, j);
            scanf("%d", &arr[i][j]);
        }
    }

    // Tính t?ng các s? nguyên t? chia h?t cho 3
    int tong = 0;
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            int num = arr[i][j];
            int isPrime = 1;

            if (num > 1) {
                for (int k = 2; k <= num / 2; k++) {
                    if (num % k == 0) {
                        isPrime = 0;
                        break;
                    }
                }
            } else {
                isPrime = 0;
            }

            if (isPrime && num % 3 == 0) {
                tong += num;
            }
        }
    }

    printf("Tong cac so nguyen to chia het cho 3: %d\n", tong);
}

void chuanHoaChuoi(char s[]) {
    // Th?c hi?n chu?n hóa chu?i
    int length = strlen(s);

    // Xóa kho?ng tr?ng th?a
    int i, j;
    for (i = 0; i < length; i++) {
        if (s[i] != ' ' || (i > 0 && s[i - 1] != ' ')) {
            s[j++] = s[i];
        }
    }
    s[j] = '\0';

    // In hoa ký t? d?u m?i t?
    for (i = 0; i < length; i++) {
        if (i == 0 || (i > 0 && s[i - 1] == ' ')) {
            s[i] = toupper(s[i]);
        } else {
            s[i] = tolower(s[i]);
        }
    }

    printf("Chuoi sau khi chuan hoa: %s\n", s);
}

int demKyTuGiong(char s[], char kyTu) {
    // Th?c hi?n d?m s? l?n xu?t hi?n c?a ký t? trong chu?i
    int dem = 0;
    int length = strlen(s);

    for (int i = 0; i < length; i++) {
        if (tolower(s[i]) == tolower(kyTu)) {
            dem++;
        }
    }

    printf("So lan xuat hien cua ky tu '%c': %d\n", kyTu, dem);
}

void nhapDanhSachSinhVien(struct SinhVien sv[], int n) {
    // Th?c hi?n nh?p danh sách Sinh viên
    for (int i = 0; i < n; i++) {
        printf("Nhap thong tin cho Sinh vien %d:\n", i + 1);
        printf("Masv: ");
        scanf("%s", sv[i].Masv);
        printf("Hotensv: ");
        scanf("%s", sv[i].Hotensv);
        printf("Phai: ");
        scanf("%s", sv[i].Phai);
        printf("Diemtoan: ");
        scanf("%f", &sv[i].Diemtoan);
        printf("Diemvan: ");
        scanf("%f", &sv[i].Diemvan);
        printf("DiemAV: ");
        scanf("%f", &sv[i].DiemAV);
    }
}

void tinhKQHTVaXepLoai(struct SinhVien sv[], int n) {
    // Th?c hi?n tính KQHT và x?p lo?i cho t?ng Sinh viên
    for (int i = 0; i < n; i++) {
        sv[i].KQHT = (sv[i].Diemtoan * 2 + sv[i].Diemvan * 2 + sv[i].DiemAV) / 5;

        if (sv[i].KQHT < 1.5) {
            strcpy(sv[i].Xeploai, "Yeu");
        } else if (sv[i].KQHT < 2.5) {
            strcpy(sv[i].Xeploai, "Trung binh");
        } else if (sv[i].KQHT < 3.5) {
            strcpy(sv[i].Xeploai, "Kha");
        } else if (sv[i].KQHT < 3.7) {
            strcpy(sv[i].Xeploai, "Gioi");
        } else {
            strcpy(sv[i].Xeploai, "Xuat sac");
        }
    }
}

void inDanhSachSinhVien(struct SinhVien sv[], int n) {
    // Th?c hi?n in danh sách Sinh viên tang d?n theo KQHT
    struct SinhVien temp;

    // S?p x?p danh sách Sinh viên
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (sv[j].KQHT > sv[j + 1].KQHT) {
                // Hoán d?i giá tr?
                temp = sv[j];
                sv[j] = sv[j + 1];
                sv[j + 1] = temp;
            }
        }
    }

    // In danh sách Sinh viên dã s?p x?p
    printf("Danh sach Sinh vien theo KQHT tang dan:\n");
    printf("%-10s%-30s%-5s%-10s%-10s%-10s%-10s%-20s\n", "Masv", "Hotensv", "Phai", "Diemtoan", "Diemvan", "DiemAV", "KQHT", "Xeploai");
    for (int i = 0; i < n; i++) {
        printf("%-10s%-30s%-5s%-10.2f%-10.2f%-10.2f%-10.2f%-20s\n",
            sv[i].Masv, sv[i].Hotensv, sv[i].Phai, sv[i].Diemtoan, sv[i].Diemvan, sv[i].DiemAV, sv[i].KQHT, sv[i].Xeploai);
    }
}

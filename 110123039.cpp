#include<stdio.h>
void nhapmang(int a[100],int n);
void xuatmang(int a[100],int n);
void timkiemtuantu(int a[100],int n,int x);
void timkiemnhiphan(int a[100],int n,int x);
int main()
{
int n,a[100],x;
printf("Nhap so phan tu n:");
scanf("%d",&n);
nhapmang(a,n);
xuatmang(a,n);
printf("Nhap phan tu x:\n");
scanf("%d",&x);
//timkiemtuantu(a,n,x);
timkiemnhiphan(a,n,x);
}
void nhapmang(int a[100],int n)
{
for(int i=0;i<n;i++)
{
printf("a[%d]=",i);
scanf("\n%d",&a[i]);
}
}
void xuatmang(int a[100],int n)
{
for(int i=0;i<n;i++)
printf("%d ",a[i]);
}
void timkiemtuantu(int a[100],int n,int x)
{
for(int i=0;i<n;i++)
{
if( x == a[i])
{
printf("Phan tu x xuat hien o vi tri %d",i+1);
break;
}
}
}
void timkiemnhiphan(int a[100],int n,int x)
{
int mid;
int left=0,right=n-1;
while(left <= right)
{
mid=left+right/2;
if(mid == x)
{
printf("Phan tu x xuat hien o vi tri %d",mid);
break;
}
else if(x > mid)
left=mid+1;
else if(x < mid)
right=mid-1;
}
}


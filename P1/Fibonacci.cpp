#include<iostream>
using namespace std;
int main(){
	int n;
	float f1=0,f2=1,f;			//初值f1为数列第1项F(1)=0，f2为数列第2项f(2)=1 
	cout<<f1<<" "<<f2<<" "; 		//输出数列第一项和第二项 
	for(n=0;n<98;n++){			//从第3个项起,输出剩余98项 
		f=f1+f2;
		cout<<f<<" ";
		f1=f2;
		f2=f;
	}
	return 0;
}

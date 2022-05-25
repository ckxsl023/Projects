int x;
int y = 5;
char *name;

int Fibo(int n)
{
	int p;
	while(n>1)
	{
		p = n*n--;
	}
	return p;
}

int main()
{
	int p;	
	int q;
	p = 4;
	q = p+y*4;
	x = Fibo(q);
	return 0;
}
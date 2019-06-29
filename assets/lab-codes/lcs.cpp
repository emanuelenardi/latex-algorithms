#include <fstream>
#include <iostream>
#include <string>

using namespace std;

string a;
string b;
int D[1001][1001];

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> a;
	in >> b;
	
	for (int i = 0; i <= a.size(); i++) {
		for (int j = 0; j <= b.size(); j++) {
			if (i == 0 || j == 0)
				D[i][j] = 0;
			else if (a[i - 1] == b[j - 1])
				D[i][j] = D[i - 1][j - 1] + 1;
			else
				D[i][j] = max(D[i - 1][j], D[i][j - 1]);
		}
	}

	out << D[a.size()][b.size()] << endl;
	return 0;
}
